Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A192C80
	for <linux-staging@lists.linux.dev>; Tue,  2 Nov 2021 18:58:49 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id o14so284796plg.5
        for <linux-staging@lists.linux.dev>; Tue, 02 Nov 2021 11:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=rw2+jppmEG8+xYFbgMk4zzuKAgUjtKoICSlJrVbvbzc=;
        b=mGfpd85go01bUhj7UdXkoCDOhz0tkSysFfwkJFSfpNLemuSmCovhg7qP51NVdjVyJA
         4eMgaw8N9cqJUvBV3ph8EGlUeIHxYCh2XVMcDJKko5fvRzkAPjMCrzFaE8y/d6+7fFEx
         s781Ob5a9opj4f4/MpTpBlaPxGgvrq/z3qRF/0T669TWkPQzZ8YeEacISMCFKrDtHbYh
         Ywge4Bmc7A5fns/hJJe774cJhxemhNtH4WMpe/TJvB9tyg06atR+Y5H/ZlXhII6GfGR4
         ZvXca1pD8iw/7JK+31e4YakCnsEnPp0EKqAH5z3paing0vO8y2VOl2sggX1WICGf3do0
         VcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=rw2+jppmEG8+xYFbgMk4zzuKAgUjtKoICSlJrVbvbzc=;
        b=vALEeoV1JN0ZYUZwPg8kBYyZ9WbXHXKTmZLrqu8qqxw8/jcZEJQJ9ejO5SPN6vxoVx
         iKfrg4/qDsoCrWay1COnRFD0im4DatfNBKtRYndW0v0Q4ZxCvVmk/8S5NOjR7RjsYy6u
         R5u2t96pOfDMTMGXuUnkH7y3BOt9O/uTkRvlaO5wte6yjHgwiXvLCacN4YYKiHNk/HYW
         Sylwi/pT2INy3Ur58Pf4TDfkHMH23RQvaRIPTs//JfCkgyYEAql8Lpw5kxB8KWbrecLr
         m22If3hpu6RZ1M6btSGmDA+IDX8erG5CwAL1IwZo0lC+Fd7KST44aposiGZMT+lQ73fe
         8sJg==
X-Gm-Message-State: AOAM532BPuYKFlKt5XFr+eeg0OtoURjkjj/u040dUsDv9kEKhQbMrHpb
	65MvkczuYKGIeveRy6IxKSVsNCYOTIM=
X-Google-Smtp-Source: ABdhPJxbaV9cdQZ/OXNfYO+VYGzkuk41JZn20sFG9HAH2+PWbSlnZOp8jCsM7bPNHSTQ+R1ts9K9og==
X-Received: by 2002:a17:90b:1293:: with SMTP id fw19mr8941437pjb.155.1635879529061;
        Tue, 02 Nov 2021 11:58:49 -0700 (PDT)
Received: from ankit-pc ([2409:4063:6c0b:8490:4e31:80c4:cb89:46eb])
        by smtp.gmail.com with ESMTPSA id z21sm4511260pfk.31.2021.11.02.11.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 11:58:48 -0700 (PDT)
Date: Wed, 3 Nov 2021 00:28:44 +0530
From: Ankit Kumar Pandey <itsankitkp@gmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.or,
	linux-staging@lists.linux.dev
Subject: [PATCH] gdm724x: add SPDX License in gdm724x drivers
Message-ID: <20211102185844.GA94400@ankit-pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This work ensure SPDX-License convention is followed. License is taken
from file gdm_mux.c present in drivers/staging/gdm724x.

Signed-off-by: Ankit Kumar Pandey <itsankitkp@gmail.com>
---
 drivers/staging/gdm724x/gdmulte.mod.c | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 drivers/staging/gdm724x/gdmulte.mod.c

diff --git a/drivers/staging/gdm724x/gdmulte.mod.c b/drivers/staging/gdm724x/gdmulte.mod.c
new file mode 100644
index 000000000..6ddc19dcc
--- /dev/null
+++ b/drivers/staging/gdm724x/gdmulte.mod.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2012 GCT Semiconductor, Inc. All rights reserved. */
+
+#include <linux/module.h>
+#define INCLUDE_VERMAGIC
+#include <linux/build-salt.h>
+#include <linux/elfnote-lto.h>
+#include <linux/vermagic.h>
+#include <linux/compiler.h>
+
+BUILD_SALT;
+BUILD_LTO_INFO;
+
+MODULE_INFO(vermagic, VERMAGIC_STRING);
+MODULE_INFO(name, KBUILD_MODNAME);
+
+__visible struct module __this_module
+__section(".gnu.linkonce.this_module") = {
+	.name = KBUILD_MODNAME,
+	.init = init_module,
+#ifdef CONFIG_MODULE_UNLOAD
+	.exit = cleanup_module,
+#endif
+	.arch = MODULE_ARCH_INIT,
+};
+
+MODULE_INFO(intree, "Y");
+
+#ifdef CONFIG_RETPOLINE
+MODULE_INFO(retpoline, "Y");
+#endif
+
+MODULE_INFO(staging, "Y");
+
+MODULE_INFO(depends, "");
+
+MODULE_ALIAS("usb:v1076p8000d*dc*dsc*dp*ic02isc06ip*in*");
+MODULE_ALIAS("usb:v1076p9000d*dc*dsc*dp*ic02isc06ip*in*");
+
+MODULE_INFO(srcversion, "EBCF613A4FE4F4BD3A2C60F");
-- 
2.25.1

