Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525EC6EB76;
	Mon, 25 Mar 2024 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389174; cv=none; b=FPqD41gsEnbsgpn7zoRu24Qf4DXalrZxuOUbfwvPQyRDgsg9qjxwp7EcV9q8sGoOvY+EiMac7HmnkOxztQprbUEOMkb0cnKSqL5XtNNxL8jgJnlE99D3UPyG9k0Vc4myHdrR4vO2It+OZ8y29+FIbAfuByDcCwYWD7PF9Xy5vz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389174; c=relaxed/simple;
	bh=+e0it607tIg+b2rZM2w/eJragbno58DdtfRWyRwQ1f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDQ9O21jncp0CQ/RofJwSHPnNAqBTv6GJA4+d74ulvLRrKYA89ZcHXLgM6WNGRqzCGft1BMW6y0jfZl3jFb6zu2YTAdLV1GkUK6hFKwVzD1xZuFrb/xaN+7ooSXYTYEHdn16Il9Xkp6Nc7y18C4p0yuSiNynldnDU6uWKkMBzBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+CPpMfq; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+CPpMfq"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29f9bffaa3bso3115007a91.0;
        Mon, 25 Mar 2024 10:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389172; x=1711993972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gdkP92/Ym8fhO2N2bPQUMgG774O7zzPSnF71mNNVTm0=;
        b=N+CPpMfqyg25DFfY5BjRTG55djtel3mkclRLQjbWQnUPh1/SfkXLA3w78b7QdcQDF0
         jwH+orpXr4pIpDcLRi6ZcbcJvLbQ1ieYabzF6kn8TTd8IAOGupTCRw/6NXOWEtzhQvyX
         DGWl/sV4QohFU9u+CVBSF7BgQJanv54+fExhr2fmmTAi78mFpzhEAAHyoBON16V+IAaM
         mfrEWSQIs5umzL5HKvLZhSos33pEkvUPDuxSutge3y/o3cL+GBombAEjKDksRGJqMVnC
         70h/RUEkbzy+V4RtlmffbDnmPDxQOKkxk07+Nj1N8BgBZA8sBihYzXzaTRFpJkXux4oR
         N9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389173; x=1711993973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdkP92/Ym8fhO2N2bPQUMgG774O7zzPSnF71mNNVTm0=;
        b=cZ6bb9R5rkPbE947phf8ZizJPXKISFNz9bBhQgg+Hmtsf22e72BikpYaeB/wb4zNNY
         CFV0GN5Fc0+k75Bgt9+/HA+0BQqDbPqWaTRo8g597HVYPl2U42OMlFWagg2+8GJVLdND
         yS/KbPcCXRxqxQ6M2ujeoJMD6f9/6bN50JT8aagMezK5Raw4wkTqgIdUlUIZlHRo7C4w
         Yst3TXTACQMf3AsqhGTTftAz4AnO2cuZJTGi9xoBm/LyPnBbCMqqeg/zvSO/rW6l7yKO
         JWufa4MsBqnEYR9L+GbreW892xsRbSKiZB+/gtMevobfhZjfWJ3C6MXY8pse1lmf2dTp
         C9hg==
X-Forwarded-Encrypted: i=1; AJvYcCUkEqDWDNklB+4HqXuGd3C6iPX4quAgugcfpwaYKWMN7Sd361dEX1TLV4LrkdrgxTzLUBFB1JK6ii1pZmGQciHMq+y8sHzBIAlzRz3ldw==
X-Gm-Message-State: AOJu0YyQq2iBbKeWsW45w7kFuReNo3xTicnbD8xAU16sLERR0eu1NzSy
	h7DCdjxUHSFBsUK9Q411VDqKfWv9UGPW6JF7h0LJx6Q+47C8ILsZ
X-Google-Smtp-Source: AGHT+IH7l6Nr3jgLuzR+uEEpfWCStVS9T4WpcYVGab+dpXtZY5JWh6SKJ3eaUaCdiYBw58Jmk6rK9A==
X-Received: by 2002:a17:90a:e542:b0:29f:ce37:50d8 with SMTP id ei2-20020a17090ae54200b0029fce3750d8mr5423211pjb.17.1711389172525;
        Mon, 25 Mar 2024 10:52:52 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090a9a8100b0029e077a9fe6sm10348086pjp.27.2024.03.25.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:52:52 -0700 (PDT)
Date: Mon, 25 Mar 2024 23:22:47 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4 3/3] staging: rtl8712: rename backupTKIPCountermeasure to
 backup_TKIP_countermeasure
Message-ID: <3fd64e6671d3f86c49fd8c6ba9ef64c4f0e0b75e.1711388443.git.ayushtiw0110@gmail.com>
References: <cover.1711388443.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1711388443.git.ayushtiw0110@gmail.com>

Rename variable backupTKIPCountermeasure to backup_TKIP_countermeasure
to address checkpatch warning 'Avoid Camelcase' and to ensure
adherence to coding style guidelines.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---

Changes in v4: No change
Changes in v3: No change
Changes in v2: No change

 drivers/staging/rtl8712/mlme_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/mlme_linux.c b/drivers/staging/rtl8712/mlme_linux.c
index ac8196d24ce0..436816d14cdf 100644
--- a/drivers/staging/rtl8712/mlme_linux.c
+++ b/drivers/staging/rtl8712/mlme_linux.c
@@ -88,7 +88,7 @@ static struct RT_PMKID_LIST backup_PMKID_list[NUM_PMKID_CACHE];
 void r8712_os_indicate_disconnect(struct _adapter *adapter)
 {
 	u8 backup_PMKID_index = 0;
-	u8 backupTKIPCountermeasure = 0x00;
+	u8 backup_TKIP_countermeasure = 0x00;
 
 	r8712_indicate_wx_disassoc_event(adapter);
 	netif_carrier_off(adapter->pnetdev);
@@ -103,7 +103,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		       &adapter->securitypriv.PMKIDList[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
 		backup_PMKID_index = adapter->securitypriv.PMKIDIndex;
-		backupTKIPCountermeasure =
+		backup_TKIP_countermeasure =
 			adapter->securitypriv.btkip_countermeasure;
 		memset((unsigned char *)&adapter->securitypriv, 0,
 		       sizeof(struct security_priv));
@@ -117,7 +117,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
 		adapter->securitypriv.PMKIDIndex = backup_PMKID_index;
 		adapter->securitypriv.btkip_countermeasure =
-					 backupTKIPCountermeasure;
+					 backup_TKIP_countermeasure;
 	} else { /*reset values in securitypriv*/
 		struct security_priv *sec_priv = &adapter->securitypriv;
 
-- 
2.40.1

