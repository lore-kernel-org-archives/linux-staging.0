Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915C371
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:35 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id i129so289921wma.3
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pSvvraOsyd4MG94jxJh7UJBUTaYacvAPHYnMkIY3E2M=;
        b=EXI/LACw4X+Jx6IsVtogqMzZTDSOGGmXw4RK1qBZFSdS0R0P8c7pxmWQrQdEl0fGPE
         A7pEroP1SbFu+m4/OQm4EfTEC1TPYVyQAbM6oBNWTvrcyHC3+sasl/Svb435TEctslZX
         sJwY8kezDk7i3+kUjWrKQrvgY6aim5w7GDfcEUKkqjCDg/sirW2ZN7vojECaLoAuW25w
         +/rEnE9TeAwIUPFozd11pXUSHUb3Pd5GrR6wQ3biuJVHyejkL8oz/9mPhpW41CkjUIdN
         dpG2583uEkS/g+xC6P+OZG9QBX/GiYgm7lgflKHXLvcQYSBZK0cn+kQYlYKRdFz6H40T
         rpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pSvvraOsyd4MG94jxJh7UJBUTaYacvAPHYnMkIY3E2M=;
        b=auv1nEeeAI6nnTfGRdYOugX8rsKAVmXiROaD0+WG4HdPf3yb4FFe1w5uRg4UNI9caK
         0vD6c7xABSiSCnk4UwEHjZjjldiE42kX7WWvScOoOZzS1uq+fFTu8zAV98tLmWJwfERr
         +GKhGGE3ntGdu8rt/7HI55TyEaVbBAuMyf0eUXbssMBMpV5TYeggoHFBlAySvaWdwTOq
         /BmHfWWQCf+x/2xSUpP5LTBgRDOyaWS5Wvo2yGVdQBMYpKE+ZyL7m9ngD3qUtX5Qnnyb
         Gnn71KLhc7aTFTvVV01h2XTNPrAwuehioBqrX94Yio5qUmCZ7qr8xuh/Gw1uarjyDk3m
         395g==
X-Gm-Message-State: AOAM531oQxqYIGNnuSOmrzf+RihwllVX7lNvopvd+Vr+Gf9LdIabPsHK
	JCJfkwsv/z3SGpz0m0k1wXY=
X-Google-Smtp-Source: ABdhPJwUHAkJhhmexmTtc58uRBDfeiZMo+2Mt9U8jKy64XMIp44G3NNKeFC1H1rQ9iHqeFE+rVkP5g==
X-Received: by 2002:a7b:c348:: with SMTP id l8mr10149054wmj.152.1619255014234;
        Sat, 24 Apr 2021 02:03:34 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id c15sm11973133wrr.3.2021.04.24.02.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:33 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 35/50] staging: rtl8723bs: remove unused debug macros tied to _RTL871X_PWRCTRL_C_ definition
Date: Sat, 24 Apr 2021 11:02:18 +0200
Message-Id: <97a5e6be392933da40c4c31cebe7ad2d8d21cf33.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macros tied to
_RTL871X_PWRCTRL_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index be44d72599d3..8e324313ebf9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_pwrctrl_c_			BIT(19)
 #define _module_hci_intfs_c_			BIT(20)
 #define _module_hci_ops_c_			BIT(21)
 #define _module_osdep_service_c_			BIT(22)
@@ -24,9 +23,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL871X_PWRCTRL_C_
-	#define	_MODULE_DEFINE_	_module_rtl871x_pwrctrl_c_
-#elif defined _RTW_PWRCTRL_C_
+#if defined _RTW_PWRCTRL_C_
 	#define	_MODULE_DEFINE_	1
 #elif defined _HCI_INTF_C_
 	#define	_MODULE_DEFINE_	_module_hci_intfs_c_
-- 
2.20.1

