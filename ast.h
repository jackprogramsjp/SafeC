#ifndef HEADER_SAFEC_AST
#define HEADER_SAFEC_AST

#define SAFEC_MAX_CHILDREN 1

typedef enum {
    SafeC_DataTypeNode,
    SafeC_NumberNode,
    SafeC_IdentifierNode,
    SafeC_StringNode,
    SafeC_OtherNode,
} SafeC_NodeKind;

typedef struct SafeC_Node {
    SafeC_Node *child[SAFEC_MAX_CHILDREN];
    SafeC_Node *sibling;
    SafeC_NodeKind kind;
    int lineno;
    union {
        char *data_type;
        char *string;
        char *identifier;
        double number;
        char *other;
    } value;
} SafeC_Node;

SafeC_Node *safeC_string_node(char *);
SafeC_Node *safeC_identifier_node(char *);
SafeC_Node *safeC_number_node(double);
SafeC_Node *safeC_other_node(char *);

#endif /* HEADER_SAFEC_AST */
