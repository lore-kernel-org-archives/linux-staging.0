Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14BC71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:33 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 26-20020a05600c22dab029013efd7879b8so548031wmg.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmVSxO1mcykbvIqMdlxGXo0H35C2W5D9ZAmsoCB0GTI=;
        b=eGsRIazwxE9PPw733zFs1WSsnYKobx9lOk/iubnZnP/fnjpOpewj2btyT6Rs78NSl0
         jig8ul2kZD7E3Z/aq3LGFIQb3Lenzq2xZ5JoxNV78eRV+VEPxCUoCSOuloM5ifeteRlF
         pTCXTymDm82Ck5XnaTRj8wcFp5W4R3KcXMXIypQmNIh+v/G/KDhXYt5mHazo/7Fm5NqJ
         BlbZubns2ONDIXc2OKRGfrlLdzx4LBYhIcwIK23iXK0ZeSIds4pQuhuTKf5ZHMDdVYQF
         2oV79ZuA2eyR8KVoFX/0V9k9kAerxbTNmvZNATN1JDOAw4251bV4DzXKGdJIEH1ZZkb4
         mSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmVSxO1mcykbvIqMdlxGXo0H35C2W5D9ZAmsoCB0GTI=;
        b=beKDe++gKV4H/V8OKMx7LpsVLs7KonekmUt43Tz9mo9ZAshoPv9I+st3YtFe7/cB6w
         WJtCV8HUCz+TpdyzQs0MPOkJasqvDTTcc2nCdqtnBh88o1FrWsCBf2ZXrk0uM44zpnTN
         1a1lh7ZKT0fEfQdkMM2dk9GlMeEJ6oOvaAEpexoozK8PZmq8MgdFDU195retwtUjZSz/
         2S+0F3+jZlRRcj4I5BvYkXQzrLl0b07ntmPT3Y/+taAjRXvYQzA6r778gM9SG5mr+gxk
         v4SZpt/jH3wqHMT7vu9NSlYddhm9I2X0HvWtAy9RWLcl4dKrCus553Sul0mbdUpUEzK8
         qd0Q==
X-Gm-Message-State: AOAM533Yrn6W8PZFoEgQVq+I2XzXBDwg6TKxUVPSKwQdxbCC2et7fujf
	S5P/9DUqShphhNWn7+hsdCw=
X-Google-Smtp-Source: ABdhPJySmWJlYPB+tgfzn92lmHsWeHMHIN0TgQBNsRgMYcLb0Doroi3hhXRWSFOIQr31xTYWy2h1xA==
X-Received: by 2002:a05:600c:3790:: with SMTP id o16mr6024325wmr.155.1619255012626;
        Sat, 24 Apr 2021 02:03:32 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id h17sm12007428wru.67.2021.04.24.02.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:32 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 34/50] staging: rtl8723bs: remove unused debug macros tied to _RTL871X_IOCTL_QUERY_C_ definition
Date: Sat, 24 Apr 2021 11:02:17 +0200
Message-Id: <9157d4b219072ef48e5e91814718d2b19d0e3b77.1619254603.git.fabioaiuto83@gmail.com>
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
_RTL871X_IOCTL_QUERY_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 7f84bc03e9c7..be44d72599d3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_ioctl_query_c_	BIT(18)
 #define _module_rtl871x_pwrctrl_c_			BIT(19)
 #define _module_hci_intfs_c_			BIT(20)
 #define _module_hci_ops_c_			BIT(21)
@@ -25,9 +24,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL871X_IOCTL_QUERY_C_
-	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_query_c_
-#elif defined _RTL871X_PWRCTRL_C_
+#if defined _RTL871X_PWRCTRL_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_pwrctrl_c_
 #elif defined _RTW_PWRCTRL_C_
 	#define	_MODULE_DEFINE_	1
-- 
2.20.1

