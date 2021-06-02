Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BA470
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 19:33:48 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id h16so2242742pjv.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Jun 2021 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=clV8iCTLerSA+uhtOpyH237rCLeDcyXNmEZLyd+4z+Q=;
        b=kf/+gH9oVIgL3ILSizKCz+HZdRZClUTwOrCyU0n8l6wEf0N90Ajh13hZ2CQGbu24MI
         +elYVqIJ3Iw2biVj7HLB37qpikW8/p3B4mPooAhOQLcJY8Adb6/xG6LkvIhdSyvZvwO8
         URt69+zxX3Gl6W8bKu9I0Hpn75NnjROkQVgzyIQTW9f1yPfA4eitgPUPpV9cTLZ+yXRT
         7/xNprggej3Xmipf0ZlfONv9lcZeoVWr2XnyOOh4t9MZ3WnNwizr3tP+w2nQb4XW0uvn
         oZira1fceX5zD8O36Vh43amB2evgMyNsymngzWbrOYyWOKjsSzziW39wzq2XdE0hnQEj
         nkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=clV8iCTLerSA+uhtOpyH237rCLeDcyXNmEZLyd+4z+Q=;
        b=LlAk0qJpcm1s4aXhtu9BE8qwEPTJs1nd1IY3UIg0DrOeHIA6xM3XBISuzdphjpKIfO
         mhngJfKt9VeNVwQtd2huIeSVPU9sYE618q/Bpo81wG+CD6HWFml4YJkjNw8qsLId2dAV
         qKM5a0U+Yv24AgG+ERBphXs4ShZGjLGJWLFPrywfQrFQpxs9ZX5iZUGpYguA8PB9ZHDl
         cp1wUpaO5g1kUt6duzdUqUIloD51GoOQxptIifvY54dKxnHOZI+AkP0SCdz97aFFTAyb
         5YYaoohGvRKE8z2GUUR7+VVRTu2MoQiG4GDu6eS5O/joJF24WwsuNO0EbYiYK0SBkl5t
         6bSQ==
X-Gm-Message-State: AOAM533+gE8ufz6zCzWtM8LlDrA5i1voiBlQQkOpn+//xZmwHtkAKwJG
	6kxftm5xTZhoTRRfxsd9Wm8=
X-Google-Smtp-Source: ABdhPJzW12MnzGGhD64Jod7TMEvRA7NFpQuFbWb0fNa/TnQCeNdoG0EGbP++5c7bOnE17ezHMCY9Wg==
X-Received: by 2002:a17:902:6501:b029:ef:8518:a25a with SMTP id b1-20020a1709026501b02900ef8518a25amr32575865plk.64.1622662428573;
        Wed, 02 Jun 2021 12:33:48 -0700 (PDT)
Received: from localhost.localdomain ([183.82.156.141])
        by smtp.googlemail.com with ESMTPSA id 30sm520570pgo.7.2021.06.02.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:33:48 -0700 (PDT)
From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
To: 
Cc: manikishanghantasala@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: rtl8192u: r8192U_hw.h: fix spaces preferred around that '|' code style error
Date: Thu,  3 Jun 2021 01:03:30 +0530
Message-Id: <20210602193334.11687-2-manikishanghantasala@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602193334.11687-1-manikishanghantasala@gmail.com>
References: <20210602193334.11687-1-manikishanghantasala@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix "spaces preferred around that '|' " checkpatch CHECK.

Signed-off-by: Manikishan Ghantasala <manikishanghantasala@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_hw.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_hw.h b/drivers/staging/rtl8192u/r8192U_hw.h
index 8d3a592f1c35..b72cef3871b6 100644
--- a/drivers/staging/rtl8192u/r8192U_hw.h
+++ b/drivers/staging/rtl8192u/r8192U_hw.h
@@ -159,7 +159,7 @@ enum _RTL8192Usb_HW {
 #define	BW_OPMODE_20MHZ			BIT(2)
 	BW_OPMODE		= 0x300, // Bandwidth operation mode
 	MSR			= 0x303, // Media Status register
-#define MSR_LINK_MASK      (BIT(0)|BIT(1))
+#define MSR_LINK_MASK      (BIT(0) | BIT(1))
 #define MSR_LINK_MANAGED   2
 #define MSR_LINK_NONE      0
 #define MSR_LINK_SHIFT     0
@@ -221,14 +221,13 @@ enum _RTL8192Usb_HW {
 #define	RATR_MCS14		0x04000000
 #define	RATR_MCS15		0x08000000
 // ALL CCK Rate
-#define RATE_ALL_CCK		RATR_1M|RATR_2M|RATR_55M|RATR_11M
-#define RATE_ALL_OFDM_AG	RATR_6M|RATR_9M|RATR_12M|RATR_18M|RATR_24M\
-							|RATR_36M|RATR_48M|RATR_54M
-#define RATE_ALL_OFDM_1SS	RATR_MCS0|RATR_MCS1|RATR_MCS2|RATR_MCS3 | \
-							RATR_MCS4|RATR_MCS5|RATR_MCS6|RATR_MCS7
-#define RATE_ALL_OFDM_2SS	RATR_MCS8|RATR_MCS9	|RATR_MCS10|RATR_MCS11| \
-							RATR_MCS12|RATR_MCS13|RATR_MCS14|RATR_MCS15
-
+#define RATE_ALL_CCK		RATR_1M | RATR_2M | RATR_55M | RATR_11M
+#define RATE_ALL_OFDM_AG	RATR_6M | RATR_9M | RATR_12M | RATR_18M |\
+				 RATR_24M | RATR_36M | RATR_48M | RATR_54M
+#define RATE_ALL_OFDM_1SS	RATR_MCS0 | RATR_MCS1 | RATR_MCS2 | RATR_MCS3 |\
+				 RATR_MCS4 | RATR_MCS5 | RATR_MCS6 | RATR_MCS7
+#define RATE_ALL_OFDM_2SS	RATR_MCS8 | RATR_MCS9 | RATR_MCS10 | RATR_MCS11 |\
+				 RATR_MCS12 | RATR_MCS13 | RATR_MCS14 | RATR_MCS15
 	EPROM_CMD		= 0xfe58,
 #define Cmd9346CR_9356SEL	BIT(4)
 #define EPROM_CMD_OPERATING_MODE_SHIFT 6
-- 
2.25.1

