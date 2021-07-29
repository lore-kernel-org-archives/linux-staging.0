Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C403483
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 17:09:49 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id x15-20020a05683000cfb02904d1f8b9db81so6546683oto.12
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IlFmYvL65EJ/K0zVzrAy+kcaagNB6BfLSJIY9lMTxMQ=;
        b=hXdFFJ64JtmyMm4DuJfIKi0cT+CIu3txpInHcWsVqbvaRg7KUiHw66Sb3uTLrveLx9
         DL3Ll41By9D1AOeMmQWKIlqqDXxEyefC6jxHxEkd1pHbxD6xl77h4BWedc+b71avu7IR
         y780XDjkOm5IbLZ6NvQaOsSxyRYSoVmZr3QfQt9x/WFvmk9g8fZQncNNxxrodZK4xxIc
         Lvjq9umw2pi5JGx2MJO/JltR7G5TYTt1RIx07GDtqkuUl7jFJd0/nz8ykHRwS9RXO6OF
         2gq35XtLqdknHx1s2hfyBqjXDmHulGxHhydde0YLIDheQwA1/6cuHK7MZxRcDPaqUhZN
         lJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=IlFmYvL65EJ/K0zVzrAy+kcaagNB6BfLSJIY9lMTxMQ=;
        b=J65cQLQ0gHO46olLWuCS03HNsajE12GPBKWA+BqcGYEHOzcTCjRV2MGII+NqdcyTny
         FwkzAXb4K+gEYfZ2LlcxUsAAM3j8jUSr7/615CAKa4RIbqLwk4c5sl3X5076MY+f9VNx
         begoKMwkkuM8S3L910U8snkOx8f+kQVzSyJvxDnrkIuILKJMaKxOSV39hCL2xQfAFLkx
         65nEiImqCO8TGQlI9foEZLPxu2nfsdQv/DXOCR7jPy2YARSzCURVCKwQpaEkgWFLXN2C
         xvhln74Kyh/hNIZTXubEKbLT/qIxDo1dDQtUyAYxQhdAhg8QOjG5Cyf+d8FT+ilvufsi
         lMwg==
X-Gm-Message-State: AOAM530s3LZWvgopKbO5j4nBqke2/N5LprUrCf673qW0OomFsZMWLlMy
	A+rs4U4GfbEOTl1ohzVISpU=
X-Google-Smtp-Source: ABdhPJzP7VtrOeRUWhdlbl1wJ1PY2NH/WRoWtPlGU5p4GikwKDK1IO0pHt2hbkXC6aV6m0PdqIpBzg==
X-Received: by 2002:a9d:4b02:: with SMTP id q2mr4198025otf.52.1627578589186;
        Thu, 29 Jul 2021 10:09:49 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id a23sm614358otv.79.2021.07.29.10.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 10:09:48 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 5/6] staging: r8188eu: Remove header file include/rtw_version.h
Date: Thu, 29 Jul 2021 12:09:29 -0500
Message-Id: <20210729170930.23171-6-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729170930.23171-1-Larry.Finger@lwfinger.net>
References: <20210729170930.23171-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This file contains only the definition of the driver version. This statement
is moved into a header called by all the affected source files, and the now
empty header is deleted.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/r8188eu/core/rtw_debug.c      | 2 +-
 drivers/staging/r8188eu/include/drv_types.h   | 2 ++
 drivers/staging/r8188eu/include/rtw_version.h | 2 --
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c     | 1 -
 drivers/staging/r8188eu/os_dep/usb_intf.c     | 1 -
 6 files changed, 3 insertions(+), 6 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/rtw_version.h

diff --git a/drivers/staging/r8188eu/core/rtw_debug.c b/drivers/staging/r8188eu/core/rtw_debug.c
index 522fd59c2d50..a0ca61d8c3b8 100644
--- a/drivers/staging/r8188eu/core/rtw_debug.c
+++ b/drivers/staging/r8188eu/core/rtw_debug.c
@@ -4,7 +4,7 @@
 #define _RTW_DEBUG_C_
 
 #include <rtw_debug.h>
-#include <rtw_version.h>
+#include <drv_types.h>
 
 int proc_get_drv_version(char *page, char **start,
 			  off_t offset, int count,
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 0acc5847a602..d407d9274a78 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -38,6 +38,8 @@
 #include <rtw_mp.h>
 #include <rtw_br_ext.h>
 
+#define DRIVERVERSION	"v4.1.4_6773.20130222"
+
 enum _NIC_VERSION {
 	RTL8711_NIC,
 	RTL8712_NIC,
diff --git a/drivers/staging/r8188eu/include/rtw_version.h b/drivers/staging/r8188eu/include/rtw_version.h
deleted file mode 100644
index 4ca74a9465fe..000000000000
--- a/drivers/staging/r8188eu/include/rtw_version.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-#define DRIVERVERSION	"v4.1.4_6773.20130222"
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 37973930845d..109389549435 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -14,7 +14,6 @@
 #include <rtw_ioctl_set.h>
 #include <rtw_mp_ioctl.h>
 #include <usb_ops.h>
-#include <rtw_version.h>
 #include <rtl8188e_hal.h>
 
 #include <rtw_mp.h>
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 34af5237d9e6..cf92dc2a4fcc 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -9,7 +9,6 @@
 #include <recv_osdep.h>
 #include <hal_intf.h>
 #include <rtw_ioctl.h>
-#include <rtw_version.h>
 
 #include <usb_osintf.h>
 #include <rtw_br_ext.h>
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 905a08ebd80d..7db33946e418 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -8,7 +8,6 @@
 #include <recv_osdep.h>
 #include <xmit_osdep.h>
 #include <hal_intf.h>
-#include <rtw_version.h>
 #include <linux/usb.h>
 #include <osdep_intf.h>
 
-- 
2.32.0

