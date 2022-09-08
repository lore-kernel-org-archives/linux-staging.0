Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C07C
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 07:28:28 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z21so12955630edi.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=vuhmu3F0jaTxCxUBqDq9ansY7YEJgI2Tl8qNwAo5zTw=;
        b=GzFubFpegeTWnNvLOdoNXF//j4IE46JP1vv14HGWw2/l5Iqzhl+1z2UrrNp9HryQcQ
         6WK9i+7Hd6k79Yl95qr0wa/P+nNHKdkM5rZg+3uosawdsqvHVxZ+pabWVtER+EQfdOiP
         jmx31HDx/LUn2E7ntIzRJGbd3lZ8f4cTiDQT5amvQYgUyZbvsKQJ3qvSPAOQL6pT1ynD
         oOzcLKDcO6x6pamJig+hKtSeO42LzYGT42r8ApfnYmFHjKteKf9j7ijlwk29Au5kbXIE
         qoZHqb+3G9qt4b/xtbwAJqdMj40Z9DCcHacYCE8UbEcEh5Q/kxi7Lvbk60ZvwB6sCYQo
         D85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=vuhmu3F0jaTxCxUBqDq9ansY7YEJgI2Tl8qNwAo5zTw=;
        b=bi6RRnPgzj8scSKoAOJHiqbyTLd8LZrRy7FJ+cmft4/YcGQioolPQeH29aKlZUeVjn
         VIVSQpmirPH+aIuChlLdGG3groRyVQTwrdfGp1+uy6W7ig1jEqDpq3q0NNMlUopfLSm2
         KiRpk0/Ugk2dzgrS6XNUUXhzAMx/K7nmyA7gEBgWWVecoZuQNMJfHElONkpAOXpdjade
         YV28qrg0T8HbGWJJwwoPtOdvBM+SQzyZFrDErtQBgynMt8pCCk7b3CKu+mLUe3JBK+Di
         OTnlTfWCplAimmPeDy/g96cO+ZwWTrmEMZS/MCBtSXahu7/HbTAAv3WQdhBPTlZY7DMv
         E9WA==
X-Gm-Message-State: ACgBeo3r2gKs7fREzdf4C9WzNLCtQ2dV9rElXf7Sqerv/TGTBozzWOEI
	2sC0uN6QVNl2651i3Hmx8ec=
X-Google-Smtp-Source: AA6agR6sUZRDc7ZVueuMscukkjlqHXwUm+XJohwTWyicYjfprtFG61mEXlsW3x1jmrpYtFNA5Ym9EA==
X-Received: by 2002:a05:6402:3507:b0:448:b672:55ee with SMTP id b7-20020a056402350700b00448b67255eemr6023810edd.107.1662622106496;
        Thu, 08 Sep 2022 00:28:26 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id t25-20020aa7db19000000b0044e7c20d7a9sm7724389eds.37.2022.09.08.00.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 00:28:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove some unused enums
Date: Thu,  8 Sep 2022 09:28:15 +0200
Message-Id: <20220908072815.31002-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused enums to clean up the driver code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtl8188e_xmit.h |  6 ------
 drivers/staging/r8188eu/include/rtw_mlme.h      | 11 -----------
 drivers/staging/r8188eu/include/wlan_bssdef.h   |  4 ----
 3 files changed, 21 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index c69fed23ded9..6db7fabebea9 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -83,12 +83,6 @@
 /* OFFSET 20 */
 #define	RTY_LMT_EN		BIT(17)
 
-enum TXDESC_SC {
-	SC_DONT_CARE = 0x00,
-	SC_UPPER = 0x01,
-	SC_LOWER = 0x02,
-	SC_DUPLICATE = 0x03
-};
 /* OFFSET 20 */
 #define SGI			BIT(6)
 #define USB_TXAGG_NUM_SHT	24
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 5dc2fe74b7b7..a959e2100c3f 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -63,17 +63,6 @@ enum rt_scan_type {
 	SCAN_MIX,
 };
 
-enum SCAN_RESULT_TYPE {
-	SCAN_RESULT_P2P_ONLY = 0,	/* Will return all the P2P devices. */
-	SCAN_RESULT_ALL = 1,		/* Will return all the scanned device,
-					 * include AP. */
-	SCAN_RESULT_WFD_TYPE = 2	/* Will just return the correct WFD
-					 * device. */
-					/* If this device is Miracast sink
-					 * device, it will just return all the
-					 * Miracast source devices. */
-};
-
 /*
 there are several "locks" in mlme_priv,
 since mlme_priv is a shared resource between many threads,
diff --git a/drivers/staging/r8188eu/include/wlan_bssdef.h b/drivers/staging/r8188eu/include/wlan_bssdef.h
index 9d1c9e763287..81bda91a4136 100644
--- a/drivers/staging/r8188eu/include/wlan_bssdef.h
+++ b/drivers/staging/r8188eu/include/wlan_bssdef.h
@@ -133,10 +133,6 @@ struct ndis_802_11_assoc_info {
 	u32  OffsetResponseIEs;
 };
 
-enum ndis_802_11_reload_def {
-	Ndis802_11ReloadWEPKeys
-};
-
 /*  Key mapping keys require a BSSID */
 struct ndis_802_11_key {
 	u32           Length;             /*  Length of this structure */
-- 
2.37.2

