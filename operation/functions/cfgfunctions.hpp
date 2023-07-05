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

    class acre {
        file = "functions\acre";
        class acre_setup {};
        class acre_channels {};
        class acre_babel {};
    };

    class log {
        file = "functions\log";
        class log {};
    };

    class misc {
        file = "functions\misc";
        class skeet {};
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