Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC46D0E
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:56:45 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id p6so10065932wrn.9
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uXx9LUIjVsmXNCgsOPYQWPc+fsuv7zkfU+hMAJWj5xE=;
        b=ccHwQ6zuzZGYRDZ1tmjcqXpBWQMH8dtQiXGPOJuDssVxRrZ8P0YjuW51NG/rXeHOCE
         2eiyOPx/qqOC+saqyoSi/ruLZkuECMSRBkT+opwhBNE9pHPdBIFKXp2+5/4/XpetG09f
         0p882RPrsheRB8ZMprHM9+R+zP/8Stb6YGaBHrrumcTEt77PAyoC8l6miehTxYrULpHk
         6UO1rUFkWfHw4t9uoolcTa2Z80QNiPuZh74KEKnRTrgQTBoSZJy0PQ5lclZvbzyseY7l
         SmTpEp91ER5JdulezSWiqqoe7dJVxBSaP/ihyxHICVNDT307uUUth6SMReo96FgSwnoR
         4vKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uXx9LUIjVsmXNCgsOPYQWPc+fsuv7zkfU+hMAJWj5xE=;
        b=jwerq6dGpgKoj+JHjhvN19q/jsUDEMUFa0MiZZb8QQBy5zR7lWFHkagZQtUSMUYSSi
         l9FCGQEeaY6pcXFhl3kUcSVi419QMLuRWBS9jp+M/+sqQSnL1Q0CDzbCpgr5D7HkqmWn
         Yma+2TdOJ20sXLNb52XwwDp6cRpch/URSNAL3ChAUkJ6LeEerJt+lHdypy+jQy0/tY5d
         VKw6I/QMHe9p0A4dttlBwF8OYQU+b127J1NfkAN4B/6Li47dQtA0lhorbanvVBE1E+8R
         W2yZHlPw8j3DpZSgpr2OxKDF0/zV5xWtTqhpW0q4NMagJ0wjqtD/hK3mfrsw32ANdE1m
         ZWfg==
X-Gm-Message-State: AOAM532XZhU1GyqzTCVTmKaxeB9Z7Jd96tEvMUZbiIzk35YDpIj/fKQQ
	5jciXpLp3lfa8i8T66b7u8Y=
X-Google-Smtp-Source: ABdhPJxHVHoPDCjWVTD9p9hWWDvQxPH8Mw9K7NxbPUBXEo9wiUIohDz5iapxfPHZGcmJTdkclUyD9w==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr36804602wrw.256.1618325804511;
        Tue, 13 Apr 2021 07:56:44 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id c131sm2761809wma.37.2021.04.13.07.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:56:44 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] staging: rtl8723bs: put a new line after ';'
Date: Tue, 13 Apr 2021 16:56:33 +0200
Message-Id: <7e796fe7a5a370d055be201204dcac14f09c974a.1618325614.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618325614.git.fabioaiuto83@gmail.com>
References: <cover.1618325614.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post commit hook checkpatch issue:

ERROR: space required after that ';' (ctx:VxV)
232: FILE: drivers/staging/rtl8723bs/core/rtw_odm.c:160:
+		   "AdapEn_RSSI", "IGI_LowerBound");netdev_dbg
			(adapter->pnetdev,

This was coccinelle script output coding style issue.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_odm.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_odm.c b/drivers/staging/rtl8723bs/core/rtw_odm.c
index 084f6ae040ee..f4a0ef428564 100644
--- a/drivers/staging/rtl8723bs/core/rtw_odm.c
+++ b/drivers/staging/rtl8723bs/core/rtw_odm.c
@@ -157,14 +157,15 @@ void rtw_odm_adaptivity_parm_msg(void *sel, struct adapter *adapter)
 
 	netdev_dbg(adapter->pnetdev, "%10s %16s %8s %10s %11s %14s\n",
 		   "TH_L2H_ini", "TH_EDCCA_HL_diff", "IGI_Base", "ForceEDCCA",
-		   "AdapEn_RSSI", "IGI_LowerBound");netdev_dbg(adapter->pnetdev,
-							       "0x%-8x %-16d 0x%-6x %-10d %-11u %-14u\n",
-							       (u8)odm->TH_L2H_ini,
-							       odm->TH_EDCCA_HL_diff,
-							       odm->IGI_Base,
-							       odm->ForceEDCCA,
-							       odm->AdapEn_RSSI,
-							       odm->IGI_LowerBound);
+		   "AdapEn_RSSI", "IGI_LowerBound");
+	netdev_dbg(adapter->pnetdev,
+		   "0x%-8x %-16d 0x%-6x %-10d %-11u %-14u\n",
+		   (u8)odm->TH_L2H_ini,
+		   odm->TH_EDCCA_HL_diff,
+		   odm->IGI_Base,
+		   odm->ForceEDCCA,
+		   odm->AdapEn_RSSI,
+		   odm->IGI_LowerBound);
 }
 
 void rtw_odm_adaptivity_parm_set(struct adapter *adapter, s8 TH_L2H_ini,
-- 
2.20.1

