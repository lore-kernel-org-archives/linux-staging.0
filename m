Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7B43FB24;
	Tue, 17 Oct 2023 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grRivgXp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4079ed65471so3436055e9.1;
        Tue, 17 Oct 2023 03:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697537580; x=1698142380; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8E7YoxZ2av3orSrcaFfg8f95nyYUaTpAzrG7yxUAnU=;
        b=grRivgXpladx9PwYIYVNv//h2pg9A/Ozbd51Dcqx+S2aFk+tz7eXtOK1d9/cHKN8lf
         qJYmLAu1RPlrEqQNBAy9kSzgclmyjtd0RSmohhErFDBn/u66kkYUozabW5ftPe2TXTUF
         ecx0nJZ/PUzwjsR8Yv3teUawxZFlq8KOhokK/oBfvKCgTHNMeV3uRgNMh/0tDHuyQSeA
         MsbhE5J/F0MCFbx8tn/SSzX7TJ/3NDc/ewec4c+H8vleaMe695sKL2inXpDBGeljHkLd
         BOydrh+NlcF28iRkuYqqFycppmAFu64S2RKDnnb4avcx9Fon6j+iaA50NwhGfvBB++Pk
         KOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697537580; x=1698142380;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8E7YoxZ2av3orSrcaFfg8f95nyYUaTpAzrG7yxUAnU=;
        b=nKWKdEj1Svlgt9n8lQlC6yAztSjx2NnHryj3MQhqZP6p67AeRH/ree4WPs7lNeMPyl
         YMs0k9GLmogjVOBNpsKnZMgeviKoHiIaCWIiK4vRAKNIpCy0mzKHkXsnJSmq1eaCVk3T
         3a2aIOdhGyxvR/R8v4k9Vx4Shy0gUPj3mCbGg0Y19KWZK9I94u6v6qAnfaigeW0ADjEo
         PVh5GmjvWjd3G1QlCXT/I6JWx2JamGTI3PvUK+DiEtGgc8pMzZ3UVfVk2hP/oViqIKvV
         swRysiiCI79LENdNzdoaOTezfxHscwcH+qQnRnkflTKtU4V7w9MKjcoNVy+vwgv6R3tV
         +j1w==
X-Gm-Message-State: AOJu0Yznnm13mlhWvGjoevMLo1z5uq4u3NJczoVMdozEY3rXIBQ9+xtT
	KgWRpu4NJRGDu1KSZWd34bM=
X-Google-Smtp-Source: AGHT+IGC29aSwArOWKsG/fAbXePFt9Io7X0exKliBc79JW4dCiH8sjHjUReO3UOWvvCrFfLau9VPWw==
X-Received: by 2002:adf:e504:0:b0:32d:b7d4:b90 with SMTP id j4-20020adfe504000000b0032db7d40b90mr1560360wrm.39.1697537579751;
        Tue, 17 Oct 2023 03:12:59 -0700 (PDT)
Received: from lab-ubuntu ([41.90.67.11])
        by smtp.gmail.com with ESMTPSA id y7-20020adffa47000000b0031aef72a021sm1323918wrr.86.2023.10.17.03.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 03:12:59 -0700 (PDT)
Date: Tue, 17 Oct 2023 13:12:56 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Calvince Otieno <calvncce@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Deepak R Varma <drv@mailo.com>, Simon Horman <horms@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: wlan-ng: remove function prism2sta_ev_txexc
Message-ID: <ZS5eKFCfu7sGOCHL@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The function prism2sta_ev_txexc() is called by the function
hfa384x_usbin_txcompl() to print the transmit exception event - a debug
information using netdev_dbg().

The debugging utility function can be called directly by
hfa384x_usbin_txcompl().

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 drivers/staging/wlan-ng/hfa384x_usb.c |  2 +-
 drivers/staging/wlan-ng/prism2mgmt.h  |  4 +---
 drivers/staging/wlan-ng/prism2sta.c   | 24 ------------------------
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index 3e8c92675c82..35650f911ebc 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -3194,7 +3194,7 @@ static void hfa384x_usbin_txcompl(struct wlandevice *wlandev,
 
 	/* Was there an error? */
 	if (HFA384x_TXSTATUS_ISERROR(status))
-		prism2sta_ev_txexc(wlandev, status);
+		netdev_dbg(wlandev->netdev, "TxExc status=0x%x.\n", status);
 	else
 		prism2sta_ev_tx(wlandev, status);
 }
diff --git a/drivers/staging/wlan-ng/prism2mgmt.h b/drivers/staging/wlan-ng/prism2mgmt.h
index 8c3f1ac35913..17222516e85e 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.h
+++ b/drivers/staging/wlan-ng/prism2mgmt.h
@@ -45,9 +45,7 @@ extern int prism2_reset_settletime;
 
 u32 prism2sta_ifstate(struct wlandevice *wlandev, u32 ifstate);
 
-void prism2sta_ev_info(struct wlandevice *wlandev,
-		       struct hfa384x_inf_frame *inf);
-void prism2sta_ev_txexc(struct wlandevice *wlandev, u16 status);
+void prism2sta_ev_info(struct wlandevice *wlandev, struct hfa384x_inf_frame *inf);
 void prism2sta_ev_tx(struct wlandevice *wlandev, u16 status);
 void prism2sta_ev_alloc(struct wlandevice *wlandev);
 
diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
index 964164bb4165..cb6c7a9fb8f3 100644
--- a/drivers/staging/wlan-ng/prism2sta.c
+++ b/drivers/staging/wlan-ng/prism2sta.c
@@ -1748,30 +1748,6 @@ void prism2sta_ev_info(struct wlandevice *wlandev,
 	}
 }
 
-/*
- * prism2sta_ev_txexc
- *
- * Handles the TxExc event.  A Transmit Exception event indicates
- * that the MAC's TX process was unsuccessful - so the packet did
- * not get transmitted.
- *
- * Arguments:
- *	wlandev		wlan device structure
- *	status		tx frame status word
- *
- * Returns:
- *	nothing
- *
- * Side effects:
- *
- * Call context:
- *	interrupt
- */
-void prism2sta_ev_txexc(struct wlandevice *wlandev, u16 status)
-{
-	netdev_dbg(wlandev->netdev, "TxExc status=0x%x.\n", status);
-}
-
 /*
  * prism2sta_ev_tx
  *
-- 
2.34.1

