Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567A71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:50 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id p6so44012274wrn.9
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DSLHJhjopzWcP47W8szCHSpkYXOdx6ZRmSWKH8NfH8Q=;
        b=YnvoyRaoyo4VVzB6PqIf+ji0QQ3ClXrPQp3BAO2MNVgNDpkAHm5xsWfHjuIuUDUXuB
         bNRaBCzXYiyyiESdBGjRNyaBZoJYd6r/InlfEIJj22GYb7AoPBhxruoqer8Ftdx5ZXFD
         yhcPLKmBo438BoFtOxhF8pVxtxfrbAYxmbiw78PX4wYd1IMEutmpeo5PkDEHHs3Mi+ox
         Xr0DEtfyekkqNleExfBWdRYiGuKquDLviKkVbNHt89cq++6l581QSw0RWZuoRU/8he5p
         +TxXrZDCNb1dpdIrf1OAoudph3QCotehU4OIUchBCK1wcCVFu92mkFrw1TtbR6/AD5Nk
         HfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DSLHJhjopzWcP47W8szCHSpkYXOdx6ZRmSWKH8NfH8Q=;
        b=Vl5Nz7wYWxwlMaDQG44z5FY9yZ0X4i2oIhxYGeetRVT44TJIRPnzQ5S5Qu7S7sPWS8
         rSHP4FiRFc3EBNZXbz+Dtho2ueawPj5yba5kD4m1kNrZ3v2S8NxDoLOCT4Xkq7lEB8Nq
         zpkXjIw17BAhlZIJrel4j59RELSz1/R7zAAFm1xxve0q4bkS896wRI5g4RunRf0MtWKD
         ql72RPLw2+6vdwck1m/vk2Qk+h5I5zYJp6j7KiEWtPMUOzEaf+xoJSj2WMoiar3bFehQ
         B8eHBJONlJDDK08CaPBDV5AlM47vgXsrjgmA+n+JPG4s8rWwRzWB5B4nIjGgu1cXFd1t
         gDbQ==
X-Gm-Message-State: AOAM531/83W6Y+YAWJSEDnq5iGnF4jQm6FduD5rmIR4g/t/TjIrQuaXC
	z2XmQNoNcGGe4RVKgXIzNd4=
X-Google-Smtp-Source: ABdhPJzvHaEmaMmOVAlrJAXcj1/lNsViySWTkGoQgcH3byHb1Na7txV/jIidHZxERp3D3QOM5MtL3Q==
X-Received: by 2002:a05:6000:2c4:: with SMTP id o4mr9621897wry.232.1619255029383;
        Sat, 24 Apr 2021 02:03:49 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id q17sm12225226wro.33.2021.04.24.02.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:49 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 44/50] staging: rtl8723bs: remove unused macros tied to _RTL8712_CMD_C_ definition
Date: Sat, 24 Apr 2021 11:02:27 +0200
Message-Id: <5e4a8015eaca090e8a4df872760c9a1556ff551f.1619254603.git.fabioaiuto83@gmail.com>
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
_RTL8712_CMD_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 550cff9b1147..1a52200e525c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl8712_cmd_c_		BIT(26)
 /* define _module_efuse_			BIT(27) */
 #define	_module_rtl8192c_xmit_c_ BIT(28)
 #define _module_hal_xmit_c_	BIT(28)
@@ -17,9 +16,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL8712_CMD_C_
-	#define	_MODULE_DEFINE_	_module_rtl8712_cmd_c_
-#elif defined _RTL8192C_XMIT_C_
+#if defined _RTL8192C_XMIT_C_
 	#define	_MODULE_DEFINE_	1
 #elif defined _RTL8723AS_XMIT_C_
 	#define	_MODULE_DEFINE_	1
-- 
2.20.1

