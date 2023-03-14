Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840EDA939
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 18:44:11 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id ek18so34822914edb.6
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678819450; x=1681411450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dX/61Oavue+o3+oO8HANeoCLyyVoQ/bbCU3a8t7lgHo=;
        b=AqeMvcLOgpXAE1QCwYtotjQd5VIjFkg25rhw5E3x23CUlSG4uIaC4Gt5aq8iz4zwCF
         enm6jsMoUxqK7byRivsVK6DrRBqrgMHG/EYi/uKh8Ltb8DISzcWfASGrICQhPIlBacIw
         sUvT9Uq5edYcIN350R+OncDWmUvBcsw4rie/pP8rncfWQwHXsPKZAqd0nNnLEoAMsOi6
         XmFDY/OlcA6Hn0GM5afV/ko+tGeYqVP8EMGEFbKgBrRy9xJ64BDIW7I6IUlqi4epziS7
         VwpYutR3PMikDI5jRALsb+3vHNflp08A7FL6Tm197rwTCdZKYpw9QUcF+/f81+a+62LC
         pTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819450; x=1681411450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dX/61Oavue+o3+oO8HANeoCLyyVoQ/bbCU3a8t7lgHo=;
        b=Fl7TMrOj+NZaM5WjJSDKdUVpDKGf+04/KUzSG3JsBIwxC6rm8ObUSJhZgel8a6wykC
         r29s501lmJdMiKBpj4YLJagscRdsUEbcScxYzM3v3kyameowTbwifiX7XquHtmPOv21h
         suKt+PNypBSTd7icxU4nzd+RKW9PweMKXK/tD3sSMLgdrpPkzV+k6MKJYZddb5kDI6vc
         SzuTNwvwHQC9g5NQSxjCdsW+JTPoY/AtASBONYO7jNjtwV+UfjU/XPm42RietGKIYK6t
         Tyzu6FCOO9pbMRlLYvg1daI8dX2uEi8lTaf1G167Jg04G6aOmdGl4jkL/yaQjSo1BP2D
         c57w==
X-Gm-Message-State: AO0yUKUIj3ShsT/3OOX58l5pzjjU+nCmNXp1oLR+e+kQfSZObOo59CcR
	llZA0anDJk6lIn0MU1c0Fkg=
X-Google-Smtp-Source: AK7set+A1i7xFo2FTYFM1nHnN8PpvZpZemKGl8ZaNubUq1vQFhgeiKZik9WLyfjuK4KWSf8lLNpZsQ==
X-Received: by 2002:a17:906:738f:b0:8aa:c0d5:25b1 with SMTP id f15-20020a170906738f00b008aac0d525b1mr864003ejl.5.1678819449782;
        Tue, 14 Mar 2023 11:44:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id rq4-20020a17090788c400b00927341bf69dsm1467525ejc.88.2023.03.14.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:44:09 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:44:07 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] staging: rtl8192e: Join constants Rtl819XRadioB_..
 with ..RadioB_..
Message-ID: <59af481400d5f7633bcaf7fcd95b7e5f0093fd3f.1678814935.git.philipp.g.hortmann@gmail.com>
References: <cover.1678814935.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678814935.git.philipp.g.hortmann@gmail.com>

Join constants Rtl819XRadioB_Array with Rtl8192PciERadioB_Array to
RTL8192E_RADIO_B_ARR to improve readability. Fix spaces around '+' to
improve coding style.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 6 +++---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/table.c      | 2 +-
 drivers/staging/rtl8192e/rtl8192e/table.h      | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 49fdaacb788a..5b9a1b78c35e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -555,13 +555,13 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
 		break;
 	case RF90_PATH_B:
 		for (i = 0; i < RTL8192E_RADIO_B_ARR_LEN; i += 2) {
-			if (Rtl819XRadioB_Array[i] == 0xfe) {
+			if (RTL8192E_RADIO_B_ARR[i] == 0xfe) {
 				msleep(100);
 				continue;
 			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioB_Array[i],
+			rtl92e_set_rf_reg(dev, eRFPath, RTL8192E_RADIO_B_ARR[i],
 					  bMask12Bits,
-					  Rtl819XRadioB_Array[i+1]);
+					  RTL8192E_RADIO_B_ARR[i + 1]);
 
 		}
 		break;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 74c7850e514c..ee91d687de9b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,7 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define Rtl819XRadioB_Array			Rtl8192PciERadioB_Array
 #define Rtl819XAGCTAB_Array			Rtl8192PciEAGCTAB_Array
 #define Rtl819XPHY_REG_1T2RArray		Rtl8192PciEPHY_REG_1T2RArray
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.c b/drivers/staging/rtl8192e/rtl8192e/table.c
index 4f36a480f6f2..eeea01681e7d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -283,7 +283,7 @@ u32 RTL8192E_RADIO_A_ARR[RTL8192E_RADIO_A_ARR_LEN] = {
 	0x007, 0x00000700,
 };
 
-u32 Rtl8192PciERadioB_Array[RTL8192E_RADIO_B_ARR_LEN] = {
+u32 RTL8192E_RADIO_B_ARR[RTL8192E_RADIO_B_ARR_LEN] = {
 	0x019, 0x00000003,
 	0x000, 0x000000bf,
 	0x001, 0x000006e0,
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index 60917c95842b..3023440db58b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -16,7 +16,7 @@ extern u32 Rtl8192PciEPHY_REG_1T2RArray[RTL8192E_PHY_REG_1T2R_ARR_LEN];
 #define RTL8192E_RADIO_A_ARR_LEN 246
 extern u32 RTL8192E_RADIO_A_ARR[RTL8192E_RADIO_A_ARR_LEN];
 #define RTL8192E_RADIO_B_ARR_LEN 78
-extern u32 Rtl8192PciERadioB_Array[RTL8192E_RADIO_B_ARR_LEN];
+extern u32 RTL8192E_RADIO_B_ARR[RTL8192E_RADIO_B_ARR_LEN];
 #define RTL8192E_MACPHY_ARR_LEN 18
 extern u32 RTL8192E_MACPHY_ARR[RTL8192E_MACPHY_ARR_LEN];
 #define RTL8192E_MACPHY_ARR_PG_LEN 30
-- 
2.39.2

