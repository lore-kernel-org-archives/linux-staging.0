Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A4671
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:47 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id x5so384746wrv.13
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ko6Q/RilYLQvwkCUUa2QBQ+wUnQsOzFNJX5UmfxpZZQ=;
        b=ELX5E/FzI9JWSLjfEbbup8R8tjr6NC5HmCHn914GFPfJclTW6m43HcoVjU92Axu7yq
         jffFsGwXeQlQ6rZDkfP2E5rnzt7JbTV2b+DcZBrdSEaBW6j0N79Ympc5zRj5vZQAqQht
         Z1JqNCJeZH1Uyy06h+UebehBi9tQDD5CD3+PkWKdztI4ybtdh2Ep56gVOZiBBx5D6Ctv
         YEtM9TgnVOw0eZldqtCegd5Q838peAeHjRRvsLc39AOXPumtPz1vXtbd/rsXzzSGNEvI
         sgdEqvmszZ5CQRjVGXOPt15UnnvkRe7m5jXvwS5YbMzG1jD+lxbMKTJ35i4OjE2fBCMb
         dBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ko6Q/RilYLQvwkCUUa2QBQ+wUnQsOzFNJX5UmfxpZZQ=;
        b=sldNjmKNNLFbihh8nZMpu3qB2YHo/y4jORWtIfr6iAXfLa4xJLppq+yfgu/TGRyc8i
         vzJMSKHuot51ytttKRCUnm+vrQYRNRrqkIQtbt0nAVvTKYFF0hAfQIvSrwFreegokqYi
         tX40OwcG+k4GXwve8ji/fZEzn2DSz11oZew+4h11ec+zUwiOv41eJ+Ja0FEl3DXIF5zC
         jVErVmKVWITqBs9d4nijI79J3P5JuUV7ubNh/KrPVVGkiR0aUrMZKe/S8XOem3obD+ID
         zGPk3TH9qyveiSs/s8hqH10CoTQnwKZlleUAjfCTS6gz5imCmiiztHqNXf0nyYgr4jxm
         cHEA==
X-Gm-Message-State: AOAM530F97LDfQdjtpDPS4OrCv/K1Du9nkdbUi0DdhKkkbA2voW2CANy
	BdBpzO5hYbxwzocbaqEUmsTwgmObwCU0JA==
X-Google-Smtp-Source: ABdhPJz0AmwXVnHDjhBPl9tsO/8sGagnCXBDc3uDumDMvb/saPFlYjgUtq3lB9E2zpJme1xzd+FCWA==
X-Received: by 2002:adf:9011:: with SMTP id h17mr9784605wrh.384.1619255025914;
        Sat, 24 Apr 2021 02:03:45 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id h14sm14247409wrq.45.2021.04.24.02.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:45 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 42/50] staging: rtl8723bs: remove unused macros tied to _HCI_OPS_OS_C_ definition
Date: Sat, 24 Apr 2021 11:02:25 +0200
Message-Id: <8cddae8116da58df3f5a9be48e618418a4c686ef.1619254603.git.fabioaiuto83@gmail.com>
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

