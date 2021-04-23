Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AFC2FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id o21-20020a1c4d150000b029012e52898006so1413959wmh.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ko6Q/RilYLQvwkCUUa2QBQ+wUnQsOzFNJX5UmfxpZZQ=;
        b=RHdeWqAbybvxppCP/ujb3JcIGK/WuIKPTjmg0F/35ebt2w/h64OFEq5cJwHt0ALagq
         AtIOes9p1wDxAVEm5kZvUGY5fpP6uV+VriCCSKZC+QfGbKke7dJCR4cx9CVNVIHS66EP
         TfVZYzdqmU137NULWzItrn8/ZRrAIRs8Inw6WA3oDFrsgX6t6W7BhT0sjgUx368YskHq
         Es6Nw5m8YWIWbdPvOv8nhQ4zJxqtA67H01itXzHVFv2GGy14xlND3SiUkuN68hyfyczo
         IJ4LuJOKkGxvGZA6+xaRgqLVzZRNnauBls/mztgcPm4mLFeNxkSsutSH78kkTbY8hUmH
         iFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ko6Q/RilYLQvwkCUUa2QBQ+wUnQsOzFNJX5UmfxpZZQ=;
        b=NDfHFZxiBps13LFjZAewAHek/qqVPABxc9DoKyJlc4T8aVIXCIyceeS6lGnjUwmYaj
         voO9TgJBUDQow6mixQ7aPxql8EG/i1KvUa+rvHwxzXCMU93PAE5+z3hNFOetCdy1pg5V
         jtE1Qino6rw6WHVBDkVBXHEz5aBib0cgL9SBH1Y+VLW7smqpeS3q2e/slb0ZBUbalUSF
         QXit6ZghdnHoUMRxePmAynFGqQWv/09LwsoIFMPyy1JS8XxMGRYmeX7IjYoc4J2flI+l
         WDAfKaRyrbSQ4nhz7mMiXw2WpcQvyG2iL5OkHrusNhS1gnJkqgBm0Mz957BypLxbEH+n
         SjEA==
X-Gm-Message-State: AOAM53155rVqIiWPbTTOQCHce7KITOmJwnYTL4IXSXH5ni7BSF5CKZ/W
	IAfyF1EK5mcE5APf0bpDth8=
X-Google-Smtp-Source: ABdhPJyWwgvVm2yGDZ7EuZevkdToqFYrF+fyAPE2s3eIDCMHL2iYY5AVmbYE2BVAiqcEkQrr/lkB1g==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr4770215wmj.125.1619189989975;
        Fri, 23 Apr 2021 07:59:49 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id c16sm9229866wrm.93.2021.04.23.07.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:49 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 41/49] staging: rtl8723bs: remove unused macros tied to _HCI_OPS_OS_C_ definition
Date: Fri, 23 Apr 2021 16:58:32 +0200
Message-Id: <361d91e6e853d33517ad557b9730e5788aa9cd6d.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macros tied to
_HCI_OPS_OS_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 261317b07635..a6c2956133ed 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_hci_ops_os_c_			BIT(24)
 #define _module_rtl871x_ioctl_os_c		BIT(25)
 #define _module_rtl8712_cmd_c_		BIT(26)
 /* define _module_efuse_			BIT(27) */
@@ -19,9 +18,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _HCI_OPS_OS_C_
-	#define	_MODULE_DEFINE_	_module_hci_ops_os_c_
-#elif defined _RTL871X_IOCTL_LINUX_C_
+#if defined _RTL871X_IOCTL_LINUX_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_os_c
 #elif defined _RTL8712_CMD_C_
 	#define	_MODULE_DEFINE_	_module_rtl8712_cmd_c_
-- 
2.20.1

