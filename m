Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9042FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:40 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id z6so8398345wmg.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2ZqN65XK5OLpZsVVr1uV7MpQbBGCFzPUcE3WgPQfd8=;
        b=LU6fG8LK5Nq/hu42LHl4OviF94U0MEb0Sl10IkPPqTO0r6LlES2WyC+wZfLXGeb+eh
         PE7b5xphwJREZBCe9PQTFwFZWyN2V62Kjre5D29TD10ZRRyC4Ndji9MeWSd4db5ihU7d
         Kmo5n3I06Po2pidoIcB3bXCLQb6JF2BarffmjigqLobXNLVt1IYTentnIHdvBN/Bh7l3
         rely0EpbUtfPe67IZ18VWBIljD6ZzZCStANNt6ZP6DNNS7eFtUcc7nBtGdvgXffJ4IdD
         WCROW02n+x4Rjnq75l9UoK/aibH5W32m3i0h1Ki/BG5xYSuGek3Nd5Nw0iZSrdEiUern
         9HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2ZqN65XK5OLpZsVVr1uV7MpQbBGCFzPUcE3WgPQfd8=;
        b=uMV0Njiydh5zlaZXf2eu9NamCpRDXL6BYiK/7Zpg4BJqBHEYfof2Otc2lJH2TY4gyd
         K9VIXySbfFD/ldCc6uMUyeFU5Sh0er4z2yj96wzIKr6Lll4y/CarT9cE/L0LR5bCpb03
         QQ8OwO/9Q3t46lCVPdQRFNnlMII6Oe4WHUoDiGrBP59IEwP84ExEo5lGj8ACdsRZOt8e
         BtbdZbL1ubuoNGGpRgYGazuRFVE8VGWYj6FwzjWqPwbb+/tJ3BhEm/a2aO9pA3B89FZX
         zQYmr+ZA3Z+9eC4JfsL1ZOAjFdE5i8wWbPB90TAQfRic6TKfd5hHMt+RLDXvz28O/nuP
         FO2Q==
X-Gm-Message-State: AOAM5331zGvPX6uTb01j4bY0sCeAZtHnwEwiMq4p1pHxBvqr8FqR4QSR
	b7Q99QfMhmpZBaYdI2wMCt8=
X-Google-Smtp-Source: ABdhPJyIsuH1zpUltFbE6JMtTB0sdJtKZ7cysrosmMsM3pcILp1rVlX98IUQugXQbCkYCxvx8tzK1g==
X-Received: by 2002:a7b:cf38:: with SMTP id m24mr6103496wmg.148.1619189979455;
        Fri, 23 Apr 2021 07:59:39 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id h14sm11169749wrq.45.2021.04.23.07.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:39 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 35/49] staging: rtl8723bs: remove unused macros tied to core/rtw_pwrctrl.c debug
Date: Fri, 23 Apr 2021 16:58:26 +0200
Message-Id: <f237c8cd3c81b652d73e56f9be3557488234d0c6.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macro definitions tied to
core/rtw_pwrctrl.c debug.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 251b9abdf591..a392d5b4caf2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_PWRCTRL_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <hal_data.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 8e324313ebf9..a7f6827c282f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -23,9 +23,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_PWRCTRL_C_
-	#define	_MODULE_DEFINE_	1
-#elif defined _HCI_INTF_C_
+#if defined _HCI_INTF_C_
 	#define	_MODULE_DEFINE_	_module_hci_intfs_c_
 #elif defined _HCI_OPS_C_
 	#define	_MODULE_DEFINE_	_module_hci_ops_c_
-- 
2.20.1

