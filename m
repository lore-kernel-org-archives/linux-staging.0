Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B562FB7
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:22 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id z4so14322447wrv.11
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d0Nbs2vmcFJXEerAnkAy24smDLy8w+T8wOrXCoqMSqg=;
        b=aPCtI+PJMs9bboSSaIICklzFdl0NMWKMIEZxYA1C37D9PSSEuaF9Wa8LgkysgONaQi
         2gKghmzxsWB6MLVfT+bnVqhzyiWUboGlyVcSwm3SeUyJ5RxHKTh6/ad2vwzL68CRJzx/
         d08UHFPGYdtPLaltqGQdswKCeLaXW4VAvgNsSKEqOE3r7tvu+qSdqQT4cbZ8uchXIf+c
         JAF+DZhlF5FCmGKzfQXVMHNqcerQtPhY7grmXq82ayG+/Vt4z037/xSflSBllhbu961V
         KgzFrATffUm/3b5ACAR3zZYuMoq3i1Vw/9Vq57+jj7iwKdw+1pDPUBY5Dtx+Gr1rpOvG
         X3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d0Nbs2vmcFJXEerAnkAy24smDLy8w+T8wOrXCoqMSqg=;
        b=A7ygcbvYu2FYIZ1H4q5EISLoEyCP3+UPD8NIyHD6M6sVX52dfx5NOlQNXRFjmhEey4
         QfUmGsDs3/WS6TcvGwBSHUNDN2uyWJcWeQ99V9x/YikNQ6owUyun0q1inCBM3NOSW6Ik
         u8y6EsGb1CyEqhoi2CikuyEZX84szYc3IOMLfhMVhis9wM23UKdRRvdQrHkKN//lh3Ts
         NEDi8HQQE/QWGlWSztz4chWxrTeeRU2lX7/1zKQiC36B8CQpD2NYmLCR4m8BuCOH+LkW
         sA3gu+23XbHqj46BWfiUDOY+x8OiezODq21lmsnzlN9UI+Y60taTwm5fBhtBBKU884iK
         cEBQ==
X-Gm-Message-State: AOAM531g2k64OeiU/Xxdt2nSdV/QN78WC91wX1pS1Uz13OYqgLZ30kOV
	8x3BIuJBarGfgX6/GpAkyyo=
X-Google-Smtp-Source: ABdhPJwaJILn5gMj31zcvfSKxcI4B1veL2ug4dDqYsPwREdpZ7sQZkPSzlT9Sx4Cb/HXUyF8JtCM/w==
X-Received: by 2002:adf:f889:: with SMTP id u9mr2623307wrp.3.1628329700514;
        Sat, 07 Aug 2021 02:48:20 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id 140sm11706543wmb.43.2021.08.07.02.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/21] staging: rtl8723bs: move function to file hal/odm_HWConfig.c
Date: Sat,  7 Aug 2021 11:47:56 +0200
Message-Id: <c2bb14c3d32d3a654df95288751f0bc8cd6566b0.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628329348.git.fabioaiuto83@gmail.com>
References: <cover.1628329348.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move function odm_cck_rssi() to hal/odm_HWConfig.c.
As it is used only in this file turn it to
static.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 27 +++++++++++++++++++
 drivers/staging/rtl8723bs/hal/odm_RTL8723B.c | 28 --------------------
 drivers/staging/rtl8723bs/hal/odm_RTL8723B.h |  2 --
 3 files changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 6d7b34fd595e..2d4d8d57ceeb 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -71,6 +71,33 @@ static u8 odm_evm_db_to_percentage(s8 value)
 	return ret_val;
 }
 
+static s8 odm_cck_rssi(u8 lna_idx, u8 vga_idx)
+{
+	s8 rx_pwr_all = 0x00;
+
+	switch (lna_idx) {
+	/* 46  53 73 95 201301231630 */
+	/*  46 53 77 99 201301241630 */
+
+	case 6:
+		rx_pwr_all = -34 - (2 * vga_idx);
+		break;
+	case 4:
+		rx_pwr_all = -14 - (2 * vga_idx);
+		break;
+	case 1:
+		rx_pwr_all = 6 - (2 * vga_idx);
+		break;
+	case 0:
+		rx_pwr_all = 16 - (2 * vga_idx);
+		break;
+	default:
+		/* rx_pwr_all = -53+(2*(31-VGA_idx)); */
+		break;
+	}
+	return rx_pwr_all;
+}
+
 static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 				      struct odm_phy_info *phy_info,
 				      u8 *phy_status,
diff --git a/drivers/staging/rtl8723bs/hal/odm_RTL8723B.c b/drivers/staging/rtl8723bs/hal/odm_RTL8723B.c
index 325f2a7ae337..66bda505c01e 100644
--- a/drivers/staging/rtl8723bs/hal/odm_RTL8723B.c
+++ b/drivers/staging/rtl8723bs/hal/odm_RTL8723B.c
@@ -6,31 +6,3 @@
  ******************************************************************************/
 
 #include "odm_precomp.h"
-
-s8 odm_cck_rssi(u8 lna_idx, u8 vga_idx)
-{
-	s8 rx_pwr_all = 0x00;
-
-	switch (lna_idx) {
-	/* 46  53 73 95 201301231630 */
-	/*  46 53 77 99 201301241630 */
-
-	case 6:
-		rx_pwr_all = -34 - (2 * vga_idx);
-		break;
-	case 4:
-		rx_pwr_all = -14 - (2 * vga_idx);
-		break;
-	case 1:
-		rx_pwr_all = 6 - (2 * vga_idx);
-		break;
-	case 0:
-		rx_pwr_all = 16 - (2 * vga_idx);
-		break;
-	default:
-		/* rx_pwr_all = -53+(2*(31-VGA_idx)); */
-		break;
-
-	}
-	return rx_pwr_all;
-}
diff --git a/drivers/staging/rtl8723bs/hal/odm_RTL8723B.h b/drivers/staging/rtl8723bs/hal/odm_RTL8723B.h
index 752f180ebd46..12b3ca90a43d 100644
--- a/drivers/staging/rtl8723bs/hal/odm_RTL8723B.h
+++ b/drivers/staging/rtl8723bs/hal/odm_RTL8723B.h
@@ -9,6 +9,4 @@
 
 #define	DM_DIG_MIN_NIC_8723	0x1C
 
-s8 odm_cck_rssi(u8 LNA_idx, u8 VGA_idx);
-
 #endif
-- 
2.20.1

