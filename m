Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669271
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id x7so50645167wrw.10
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XYEtVs71demyjHNP7zVoWDRnn91iokd22i1cMtV03Xk=;
        b=HPkFZKGgcktPko92dumwE/neEKyXDQ9xtpDzqABNXwMH31yxZrA4RXGHoWXVoQT5kq
         hbp6bjnZ/rOqOqvlQIB+49oL4t/HlTCR6P0QHzmg5Ys6aaah82nL14NzKYZzE3hJLCi9
         h9CaA2o+z56XMJtJS63ttY22WY5D/4kl4qK8Ic5p8CwpGLk5SOwHmtXH6nEHeFR/2RPg
         lNVSOrLcsfBc8isBSftwWJjPXbejGyN4Je8+iNu8/YDpW12ERfJqVBhs7/Vl93qPEQHI
         hkgbh/OEZfVFT5zQmHeoENs7MolDWvRbhDACl5+iD67ynqmdGV7jsNDxUfNwc33CJW3i
         T02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XYEtVs71demyjHNP7zVoWDRnn91iokd22i1cMtV03Xk=;
        b=ENJ/Sr5DvWeynFzrm47XB20IMhvbSYyC1O0T7yulO60brEkZ+u/RakVIs4S83omnaz
         OXDn46x/B5rdLbY9xhgcsB03RWzNZYqnC8xSsUHwbNj/DbEn88CQvH2PntkzEVOXnmfU
         4hVDQtCefszqh7/voHeOL3FuSE2m3gndHic6O3JE2ufi+DRdNNRMS6sBeouoffFl5kIv
         P/LIs/PLJKVqXY4bH9QkpWmeo9XKHUlyt6CwMjGB3503yC07RLbnMRFcVHGPJX0cHHV3
         Ewg+ArIL5YROyMoSHFuwJx/0A0lsLsSia56rUDQEQKQ8Rqfz3t6nvVz5vtdK9UMZiLoF
         VGzw==
X-Gm-Message-State: AOAM533hxYzIJVYwCtfUPdWjyTvlSl8BiUEjLZCZlb5QMWj8ccA+wt92
	6pgo1yo/SJVWj1T9IToBlPg=
X-Google-Smtp-Source: ABdhPJwQsNEsLqjVGOR6jNrfBoCVRQhm0vc4vDpSbrcgY8TkNMmvJeQ4Hcp6zDd5sn2i4sC84tnoFA==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr10071130wrt.0.1619254998911;
        Sat, 24 Apr 2021 02:03:18 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id o12sm13481444wmq.21.2021.04.24.02.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 26/50] staging: rtl8723bs: remove obsolete _IO_OSDEP_C_ debug macro definition
Date: Sat, 24 Apr 2021 11:02:09 +0200
Message-Id: <ba3b9ef9a999f6039f204f5b06be45584c267af2.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove _IO_OSDEP_C_ debug macro definition
untied to any tracing component.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 7206fdfbe12d..470edb0b655b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_io_osdep_c_		BIT(10)
 #define _module_os_intfs_c_			BIT(11)
 #define _module_rtl871x_security_c_		BIT(12)
 #define _module_rtl871x_eeprom_c_			BIT(13)
@@ -33,9 +32,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _IO_OSDEP_C_
-	#define _MODULE_DEFINE_	_module_io_osdep_c_
-#elif defined _OS_INTFS_C_
+#if defined _OS_INTFS_C_
 	#define	_MODULE_DEFINE_	_module_os_intfs_c_
 #elif defined _RTW_SECURITY_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_security_c_
-- 
2.20.1

