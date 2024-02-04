"""树具有根标签和一系列分支。树的每个分支都是一棵树。没有分支的树称为叶子。
树中包含的任何树都称为该树的子树（例如一个分支的分支）。树的每个子树的根称为该树中的一个节点。
"""

def tree(root_label, branches = []):
    # 构造树
    for branch in branches:
        assert is_tree(branch), "branch must be tree"
    return [root_label] + list(branches)

def label(tree):
    # 选择器
    return tree[0]

def branches(tree):
    # 选择器
    return tree[1:]


def is_tree(tree):
    """树只有在具有根标签且所有分支也都是树时才是良构的。
    is_tree函数在树构造函数中被应用以验证所有分支是否良构。
    """
    if type(tree) != list or len(tree) < 1:
        return False
    for branch in branches(tree):
        if not is_tree(branch):
            return False
    return True

def is_leaf(tree):
    return not branches(tree)

def fib_tree(n):
    """树递归函数可用于构造树。
    例如,第n个斐波那契树的根标签为第n个斐波那契数,
    对于n > 1,还有两个分支,它们也是斐波那契树。
    斐波那契树说明了斐波那契数的树递归计算。
    """
    if n == 0 or n == 1:
        return tree(n)
    else:
        left, right = fib_tree(n - 2), fib_tree(n - 1)
        fib_n = label(left) + label(right)
        return tree(fib_n, [left, right])
    
def count_leaves(tree):
    """计算树的叶子数"""
    if is_leaf(tree):
        return 1
    else:
        branch_counts = [count_leaves(b) for b in branches(tree)]
        return sum(branch_counts)
    
def partition_tree(n, m):
    """
    划分树。树也可以用来表示整数的划分。
    使用大小最多为m的部分的树表示n的分区的分区树是一个二叉树,
    它表示计算过程中所做的选择。
    在非叶子分区树中：
    左(索引0)分支包含使用至少一个m划分n的所有方式,
    右(索引1)分支包含使用部分最多为m-1的部分的划分,且根标签是m。
    叶子处的标签表示从树的根到叶子的路径是否表示n的成功划分。
    """
    if n == 0:
        return tree(True)
    elif n < 0 or m == 0:
        return tree(False)
    else:
        left = partition_tree(n - m, m)
        right = partition_tree(n, m - 1)
        return tree(m, [left, right])
    
def print_parts(tree, partition = []):
    if is_leaf(tree):
        if label(tree):
            print(' + '.join(partition))
            # .join可以用前面的' + '把后面partition的的元素连接起来
    else:
        left, right = branches(tree)
        m = str(label(tree))
        print_parts(left, partition + [m])
        print_parts(right, partition)

def right_binarize(tree):
    """Construct a right-branching binary tree."""  
    
    if is_leaf(tree):
        return tree
    if len(tree) > 2:
        tree = [tree[0], tree[1:]]
    return [right_binarize(b) for b in tree]