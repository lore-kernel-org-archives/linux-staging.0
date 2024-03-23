Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC98372
	for <linux-staging@lists.linux.dev>; Sat, 23 Mar 2024 00:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711153034; cv=none; b=Igdy6icBu+p6Xk8TJZkSQit4h96WQS8XS0WsnBG1w8YCCwZkWSklRmMb5UA+QDRMvBQNpe93gKtXhagXEINU2paISV6Nbbmiw1QIBzMKAY4bRlxMg4UrwnYhKCujF7bHezI44EIAaubJmhLo8zZydyz+eE7Phlb0csh0WzYJUDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711153034; c=relaxed/simple;
	bh=0OMZcwDFr1Fjm7wwtKdnzOE9QDqpNrV2qZeBlfAl5KM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Is+/aGyTHEtAceZFsSu5jzMBoB9ovfvrooshEjHsB5ovSDSPQ9I1D6o3r8TTCvf3DA16b/0f1dU9dmwJpEZ4KEo6ysAMB+8YUrOYzI8NhVGnkI609gx6v0sfNXKHKWRNjIR3oMH8OIQYHzx7fOyO37nJGJQab8RLo70yZ7cIkg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljfp.xyz; spf=pass smtp.mailfrom=ljfp.xyz; dkim=pass (2048-bit key) header.d=ljfp-xyz.20230601.gappssmtp.com header.i=@ljfp-xyz.20230601.gappssmtp.com header.b=hSusPex9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljfp.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljfp.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljfp-xyz.20230601.gappssmtp.com header.i=@ljfp-xyz.20230601.gappssmtp.com header.b="hSusPex9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ea838bf357so783480b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Mar 2024 17:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ljfp-xyz.20230601.gappssmtp.com; s=20230601; t=1711153032; x=1711757832; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtUcaHyseUXweyRYaiTqqu2kRbS7Ms0ptzh1c3Y3PjM=;
        b=hSusPex9rXLEgpNQzGgVHQiGtmwsbvnUxAw2ta8PETB13+YpgfVlDqmtxfknScmYjg
         i4eZGtoJI/MFLEEIEwO0iy4hn24pDs/XZJHdhld8aG2NEbneituZl5b35QbAYwwDv6ZX
         FcYuMtM7OV1beFjdMGg5G0ptHJ/CKzICh6d+HzI/Wkxi4qx6XFJKSHYv3iZs9lFJL89I
         CbRHYqDKP5e45GEMfydFljuq8KjAyWRZ1X6PjzCCxXDXOxgIy7QMaXl1e7cD/Mh0pDV1
         ilTwZRScD2UDiZSfuFancdnMS5Tg5JL3MXI/stavbEopmkyZQv3etztJjcJrjZlMgE3m
         8NQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711153032; x=1711757832;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtUcaHyseUXweyRYaiTqqu2kRbS7Ms0ptzh1c3Y3PjM=;
        b=R/UkJdXlFBpCgW92Gn7GjhwAlEv3wlv5G03bYuhSLmdOkYFbqWxXLkkxJdWgdQcuhK
         W7DlMn/nQ8c73R6HaHwRqgEeW+Tn7ZF+iQzIUt4CiC3DB342mJ9xvtWOlnFup8IIMaLA
         aI7nleZ19xvAh/nlhGG7TzFLjGMM9l5govvPPdKGHhn0H+1uh4b/JzAEVYeV0BULHAu6
         PvMMjsheqNmdkBWyHvq3nyD+Ba6re6gOlFnH9eLyI2JZiWYiSt2XxFJz6iCh26b0EZ9O
         vyKHcG8JvjWcJm+DPeywTdyO170jBl8mnuiGJ/vY7zf4ZKz1qHzOrg3m+LgbSpSuaJk8
         G4Sw==
X-Gm-Message-State: AOJu0YwRU9kAtUihlIQREzi4EFCuyd30r4U4lByEF0h3qlaHGno2/7zd
	V/qfR0ljGXn3U59iW8E1w96lYjtH9ueRH3BA2AkX8MUOmgW5n5c1wsIamZaJPLk=
X-Google-Smtp-Source: AGHT+IEulyMqJNDwt9n7rnNCCuupAErROONRLeyTl37B4SE9RBJwh5qXKcW3cENlPSAMXwEAA0oedA==
X-Received: by 2002:a05:6a00:2305:b0:6e8:acde:85c8 with SMTP id h5-20020a056a00230500b006e8acde85c8mr1436134pfh.8.1711153031810;
        Fri, 22 Mar 2024 17:17:11 -0700 (PDT)
Received: from pop-os ([181.165.36.123])
        by smtp.gmail.com with ESMTPSA id gr6-20020a056a004d0600b006ea7d877191sm345584pfb.2.2024.03.22.17.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 17:17:11 -0700 (PDT)
Date: Fri, 22 Mar 2024 21:17:09 -0300
From: Lautaro Javier Fernandez Pricco <ljfp@ljfp.xyz>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy <outreachy@lists.linux.dev>
Cc: linux-staging <linux-staging@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: rtl8712: Rename variable bw_40MHz_en
Message-ID: <Zf4fhSomoYzCE4gW@ljfp.xyz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The bw_40MHz_en variable triggered an 'Avoid
CamelCase' warning from checkpatch.pl. This patch addresses said warning by
renaming the variable to bw_40mhz_en.

Reported by checkpatch:
CHECK: Avoid CamelCase: <bw_40MHz_en>

Signed-off-by: Lautaro Javier Fernandez Pricco <ljfp@ljfp.xyz>
---
 drivers/staging/rtl8712/hal_init.c        | 2 +-
 drivers/staging/rtl8712/rtl8712_hal.h     | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712/hal_init.c
index 1148075f0cd6..efea4f97488c 100644
--- a/drivers/staging/rtl8712/hal_init.c
+++ b/drivers/staging/rtl8712/hal_init.c
@@ -98,7 +98,7 @@ static void fill_fwpriv(struct _adapter *adapter, struct fw_priv *fwpriv)
 	/* todo: check if needs endian conversion */
 	fwpriv->hci_sel =  RTL8712_HCI_TYPE_72USB;
 	fwpriv->usb_ep_num = (u8)dvobj->nr_endpoint;
-	fwpriv->bw_40MHz_en = regpriv->cbw40_enable;
+	fwpriv->bw_40mhz_en = regpriv->cbw40_enable;
 	switch (regpriv->rf_config) {
 	case RTL8712_RF_1T1R:
 		fwpriv->rf_config = RTL8712_RFC_1T1R;
diff --git a/drivers/staging/rtl8712/rtl8712_hal.h b/drivers/staging/rtl8712/rtl8712_hal.h
index 66cc4645e2d1..3df687fce79d 100644
--- a/drivers/staging/rtl8712/rtl8712_hal.h
+++ b/drivers/staging/rtl8712/rtl8712_hal.h
@@ -85,7 +85,7 @@ struct fw_priv {   /*8-bytes alignment required*/
 	unsigned char rsvd025;
 	/*--- long word 3 ----*/
 	unsigned char qos_en;    /*1: QoS enable*/
-	unsigned char bw_40MHz_en;   /*1: 40MHz BW enable*/
+	unsigned char bw_40mhz_en;   /*1: 40MHz BW enable*/
 	unsigned char AMSDU2AMPDU_en;   /*1: 4181 convert AMSDU to AMPDU,
 					 * 0: disable
 					 */
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index bfb27f902753..0e5b07ad5a8f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2331,7 +2331,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		}
 	}
 
-	/* to disable 40M Hz support while gd_bw_40MHz_en = 0 */
+	/* to disable 40 MHz support while gd_bw_40mhz_en = 0 */
 	if (channel > 14) {
 		if ((pregistrypriv->bw_mode & 0xf0) > 0)
 			cbw40_enable = 1;
-- 
2.34.1

