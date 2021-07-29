Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A170
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 16:49:20 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id n1-20020a4ac7010000b0290262f3c22a63so1726032ooq.9
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ouL2NOsjVgIOyCXGfArFf7SPiQKH3/QqWsj1F7bOII=;
        b=D9kri8eCAS6oNnrDTd/sCTMWk31QI7cOIRA+LCN06G2PuzCIVNPynlQvD+eumxM4Iy
         Sp0NYWjd1TECtzw7qyTKpOkfDjlWYefVpSIF9EzdV9drYIXMUtkPxgeIWjx670pS8pnN
         FBqCIk++sgO4wy9J1d4sLE1UpgEUM2t1syWrD8eDHoL6TswdXK8vQLb+JWgglU86ypVQ
         v3ZpY/We/WI2gkEzWo5PF4la9VHjSmOvXpeDBmqyx7k0pTRmSAwHj59kwZpHTZX83PHT
         OjUdJ2OAGvxjQRiBi0H77RiIq2y/A8rhNGHDEaqwemaXAEOjbjCn169o0dfj+uuFhbS/
         3+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=7ouL2NOsjVgIOyCXGfArFf7SPiQKH3/QqWsj1F7bOII=;
        b=VJeC9YwD0GRUbFGRD8NCyGK9nmKJxxO56WrOUoIrYRvSB2J92Tjv/D2Mg2S/LrzRRo
         OUkcyMZHbwXuoczgQJ3hMbWY4cNHGdgt++fP0bIopQLj+l2/y8H8CVmJO9KZoi/8bWhr
         OU+hU5PRuA+/dsmwPHAxjW06aLmbrOENrk1bAbsfwUcIATIO6/AOMi8CNzRBp9HkvJQo
         tTKoa2pwQdUkOK1aszO20J4nPKHvdqPSb0SM+9NMay4RPdfwwcrm/S5MLA6BCOezNwTf
         FqgENoGLjjPomdznJ+veHp40vava4McmA05EaB1dmQ9mEorkZKlvt4s/ppY7DAZUSOQE
         hyGg==
X-Gm-Message-State: AOAM531cDr0lPctg/yd7/hDSlBmRmV+JNUsf0VBPkNCF/CMJn3fHBAB6
	/kyEXAhnQKONLelLa1VcYCY=
X-Google-Smtp-Source: ABdhPJxhB+BMSx/FFHVe+kAfePuYRL6B61k3GMWFxuaapJRsCIyuHEfvUcgWCsbLyAVw8NmBBXwx4w==
X-Received: by 2002:a4a:d6c2:: with SMTP id j2mr3651273oot.66.1627577359347;
        Thu, 29 Jul 2021 09:49:19 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id n202sm694066oig.10.2021.07.29.09.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 09:49:18 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH v2 5/6] staging: r8188eu: Convert header copyright info to SPDX format, part 5
Date: Thu, 29 Jul 2021 11:48:13 -0500
Message-Id: <20210729164814.32097-6-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729164814.32097-1-Larry.Finger@lwfinger.net>
References: <20210729164814.32097-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before this driver can be incorporated in the drivers/net/wireless tree,
the copyright info in all files must be converted to SPDX notation.
This patch converts the 9 C source files in os_dep/.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
v2 - Added public mailing list
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 22 +++----------------
 drivers/staging/r8188eu/os_dep/mlme_linux.c   | 21 ++----------------
 drivers/staging/r8188eu/os_dep/os_intfs.c     | 22 +++----------------
 .../staging/r8188eu/os_dep/osdep_service.c    | 21 ++----------------
 drivers/staging/r8188eu/os_dep/recv_linux.c   | 22 +++----------------
 drivers/staging/r8188eu/os_dep/rtw_android.c  | 21 ++----------------
 drivers/staging/r8188eu/os_dep/usb_intf.c     | 22 +++----------------
 .../staging/r8188eu/os_dep/usb_ops_linux.c    | 21 +++---------------
 drivers/staging/r8188eu/os_dep/xmit_linux.c   | 22 +++----------------
 9 files changed, 24 insertions(+), 170 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index faced0d0af1d..37973930845d 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1,22 +1,6 @@
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
- *
- *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2007 - 2012 Realtek Corporation. */
+
 #define _IOCTL_LINUX_C_
 
 #include <osdep_service.h>
diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index 97c2b62f8fd4..22d37e994101 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -1,22 +1,5 @@
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
- *
- *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2007 - 2011 Realtek Corporation. i*/
 
 #define _MLME_OSDEP_C_
 
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 8c8ef9063b0c..2cf91516d739 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -1,22 +1,6 @@
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
- *
- *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2007 - 2011 Realtek Corporation. */
+
 #define _OS_INTFS_C_
 
 #include <linux/version.h>
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 541af56515ac..bec784dda81b 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -1,22 +1,5 @@
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
- *
- *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2007 - 2012 Realtek Corporation. */
 
 #define _OSDEP_SERVICE_C_
 
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index 44c5fcbafa6a..558050c62bb1 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -1,22 +1,6 @@
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
- *
- *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2007 - 2011 Realtek Corporation. */
+
 #define _RECV_OSDEP_C_
 
 #include <osdep_service.h>
diff --git a/drivers/staging/r8188eu/os_dep/rtw_android.c b/drivers/staging/r8188eu/os_dep/rtw_android.c
index a20d900d85ca..56fd19138218 100644
--- a/drivers/staging/r8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/r8188eu/os_dep/rtw_android.c
@@ -1,22 +1,5 @@
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
- *
- *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
 #include <linux/module.h>
 #include <linux/netdevice.h>
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index fd16afa1de33..9be70ed65072 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -1,22 +1,6 @@
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
- *
- *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2007 - 2011 Realtek Corporation. */
+
 #define _HCI_INTF_C_
 
 #include <osdep_service.h>
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 9cce79d412b9..399d7d91eb4a 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -1,21 +1,6 @@
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
- *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2007 - 2012 Realtek Corporation. */
+
 #define _USB_OPS_LINUX_C_
 
 #include <drv_types.h>
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index c6c5b2aabefb..622735148efb 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -1,22 +1,6 @@
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
- *
- *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2007 - 2012 Realtek Corporation. */
+
 #define _XMIT_OSDEP_C_
 
 #include <linux/version.h>
-- 
2.32.0

