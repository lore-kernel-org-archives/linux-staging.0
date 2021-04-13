Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA8471
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:10:55 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id s7so16502525wru.6
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uXx9LUIjVsmXNCgsOPYQWPc+fsuv7zkfU+hMAJWj5xE=;
        b=Xn3p3r977PS4h0KsOTaf5zXgkYdGHCsrVtwKoY4xz1Gq18hveixZLRoXPEkdvvEQw1
         PVIzRFY/lROV5qJREmDIhsmkwEiJkWGzNMTGFyIUXq2er3QTVOEmifBO42suR4WReE+b
         T2xoldIdhthDIEvjwxRgx67CxSKX4P1mz/WU1FprlFZprDRsgDjaMYWwYR4dcfhyQEZr
         wIwzPN192GUeNn07V4X4Ul49NXjIWeT6U4hlMZ3NMVVJ5ImLom5IDlRFQwx6OyHvKi1E
         dxhhPiGjPHCmFtrC1u1R8BhBCpyOd2Z+8ap+kNy9l/t6G4Z7f0p2BQ4cOOND24+72HGV
         //Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uXx9LUIjVsmXNCgsOPYQWPc+fsuv7zkfU+hMAJWj5xE=;
        b=Z/T8HM+gkOM3/9PS5/8VINpVrBVi+9vSY+aU/qA/hQW81LdRoYQxgagqmV3REOoY/l
         XIJ87XWAJEXpjzVxwHgbC6Kqivctc8Qd3j58DahGx2ipWNprQLRBZRzZ8CC0IUSYv0FV
         4DJbOOcaSEI2eU1u8UZgP3gu/jHZtvNJXuOt0BNox14Rwi42sWyzwd8ubaPuCSa5StyE
         q9SOLLYp6jfP074yETJnd/2VP0fJsQGKKcupzIDpr+BVjCfs+NzU8i6Vy6LmNaVOqqEZ
         hKl++KSwZeQikiS7l+c5SAxJ13Iq9L73g3U70S1uUrYvvjda5fEiOXCUxDC6fa8T7Sfj
         NS8g==
X-Gm-Message-State: AOAM533n6kZ0ontCAuLWDdLF9TVp9Yt0YN9A317afC9ws/+RA22shYn6
	o+0ysBnX6T/TH9fSdYltohI=
X-Google-Smtp-Source: ABdhPJzuo31nctLBPDq3bIIbrfjlIWxWew+kmiyvGSk4vEyjOwb9ZhCiTY8KDnB0i6iMFJrRtDAhig==
X-Received: by 2002:adf:e608:: with SMTP id p8mr20379184wrm.249.1618323053681;
        Tue, 13 Apr 2021 07:10:53 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id n2sm3115865wmb.32.2021.04.13.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:10:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: 
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] staging: rtl8723bs: put a new line after ';'
Date: Tue, 13 Apr 2021 16:10:40 +0200
Message-Id: <686dff07c78a1be994c56083a4640d1b66a1f34e.1618322367.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618322367.git.fabioaiuto83@gmail.com>
References: <cover.1618322367.git.fabioaiuto83@gmail.com>
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

