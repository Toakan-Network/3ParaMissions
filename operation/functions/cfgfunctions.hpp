class tcz {
    tag = "tcz";
    class admin {
        file = "functions\admin";
        class adminlog {};
        class createAdminChannel {};
        class addAdminChannel {};
    };
    class functions {
        file = "functions";
    };

    class log {
        file = "functions\log";
        class log {};
    };

    class misc {
        file = "functions\misc";
    };

    class zeusFunctions {
        file = "functions\zeus";
        class updateEditableObjects {};
        class getEditableObjects {};
        class assignzeus {};
        class addToAdminChannel {};
        class zlog {}; // Zeus logging
    };

};