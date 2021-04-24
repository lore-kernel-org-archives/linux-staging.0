Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0786371
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id a4so50703872wrr.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qN9q3YqqahsKFdZjoFQK7gigKnmNtZ3S2NITUyAA5T8=;
        b=jnXc3V8ksm7/O5oBKF2h2B7shbI+qGuf9E+P6RjMGwuOz7MHuRZ602hbyfU6ZAN3is
         I1g1cBRYSXj2/UhDcou7JRxH8r74vPibqgK5VRo+hQdfqRcqmPfdRNT1z5sTZGHVp3XX
         8p1KUEy5x0VvR9LBFb5yTMEThQHNuv6v3i5z2fLeJjxBqzv5HqAivbFFh9Ynb6YHg9Xv
         33Mbiv5vkoGIwp6oRMSpFvoTGkp1yWaWraobWyWzJCgRtqCZ3kbOcjBKv/z4BrWGC6CE
         qRZvcZgGWLi1/GopWkbo/1QbwMUFFXCJCtlOgkf+I1oZ0AGYwLyIsvd7P3O9cU/N7nmX
         +VJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qN9q3YqqahsKFdZjoFQK7gigKnmNtZ3S2NITUyAA5T8=;
        b=K3Ks9MtmhIOXsWlggySajq97asU9RosqMTp6sTsr3jplQPhtMp4s5LaKEDs4Lm2V+W
         dGihELmyFPhAEv4doFdMYTYr+2W9RyHuq296KgYn1FUfsJKIHKCZAbVIvQ54Pq/8y2wz
         E2uF7rY5v3FdTVE9vdgCxSGPLdW1kkCAlZi40IUJ59r8O/c2HvVGi953bXUJMqgWq9nO
         szUipbZp+cXkgqVMoHkrwTv4wrN7ON6iXXou+2//y8glfgJss6O/Jr/8gT3EdrOKL1C1
         ThrYwllS3aH3C1JGeJp3EJh+wUO9M+C1HP56Hwc78uUlCy8A+z32k7PVaZId+47Xn5Ed
         eHkA==
X-Gm-Message-State: AOAM530lDng+BpLId4QzjGXtV0d31PNqgpt3U5IRL81j8DZ5FtoZJIBB
	6ADrCnv6YKySVjx1yRbOnvlP3KtwyjmZQw==
X-Google-Smtp-Source: ABdhPJzgwv+3XIdVwZ96TjfU94t6uQNZFgkXvJN4jJbhmw3Hd/SYQyoej+X57WbOhmYvbuUoc01dOg==
X-Received: by 2002:a5d:5151:: with SMTP id u17mr10159432wrt.413.1619255027702;
        Sat, 24 Apr 2021 02:03:47 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id f25sm12292243wrd.43.2021.04.24.02.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:47 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 43/50] staging: rtl8723bs: remove unused macros tied to _RTL871X_IOCTL_LINUX_C definition
Date: Sat, 24 Apr 2021 11:02:26 +0200
Message-Id: <6c836355bb4a51a3f9925e0cc75cbce3c0b63df8.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macros tied to
_RTL871X_IOCTL_LINUX_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index a6c2956133ed..550cff9b1147 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_ioctl_os_c		BIT(25)
 #define _module_rtl8712_cmd_c_		BIT(26)
 /* define _module_efuse_			BIT(27) */
 #define	_module_rtl8192c_xmit_c_ BIT(28)
@@ -18,9 +17,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL871X_IOCTL_LINUX_C_
-	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_os_c
-#elif defined _RTL8712_CMD_C_
+#if defined _RTL8712_CMD_C_
 	#define	_MODULE_DEFINE_	_module_rtl8712_cmd_c_
 #elif defined _RTL8192C_XMIT_C_
 	#define	_MODULE_DEFINE_	1
-- 
2.20.1

