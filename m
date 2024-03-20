Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383E85653;
	Wed, 20 Mar 2024 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710969687; cv=none; b=C4DEOqr/DRKLfaW1gVAFhrviRLDoQx/XvFACDke0u5AiNlxMZRMH0GKfATJ7Vso3GVeSOOK0twMwRVaPjKbaXkjE5v9VkUMFGhPLT8s9hhNCwWaTujLeLwRdnL4og7gP5z6xWfmL35z0+SZKnrwD+EEMe3ELoya5o2rV8DZEIFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710969687; c=relaxed/simple;
	bh=vkzABc60DDDx4rXWD1NjB1beCB8+pLCXYepZAQvIp8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUtdPoHQmgOmNA3IVlsnn6CMBHAgOISrlfEzoFMecbvZDRFNiMhtHFlQECwm8izReZbkGuj9KQPrUEG6pQK/39yKXqtPd/VD+iwgQ1dbpWP7uwFx6NnAb61judO0He/24mbjENp9SjPfjIXmA61qAzpfhOJq0yhzRxmGqqKr0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbxITKSX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbxITKSX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1def89f0cfdso11145975ad.0;
        Wed, 20 Mar 2024 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710969685; x=1711574485; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=779Uj2F3PYn9kXcgRZutyeuSV4eghutXpu5LL+l0UEM=;
        b=WbxITKSXr8CNVJLyxv5BaBTpIiF3OP8OV97TVOrb/0vguYaiymuvznN4xX4HQKgW94
         591rwL1YTWl58+6+K4YGfOY6yNHlRfpyS1k3nBU4IjL8QAYlfIRVLBWKUPW60HFD8egK
         igvjkBTOgvIgDr+8b4Xz2ZUqwLdBVrEqzLS4KG7K9/K3I0n0PmEDVRnpOdy9OR2aFxS7
         FJ20mJGkY6Em0D0h7a08JlieGRfkGsc8xZGUkcFRtR6D/jVo0p4hU/yqd6ut8e0wBT+W
         ygOHX3n63jcz3AuF8OoSqyeCnJ4jfdGcXMWW/7ZRkUflozKl8+gnPo/a7MQsmfkYbW2B
         5E2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710969685; x=1711574485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=779Uj2F3PYn9kXcgRZutyeuSV4eghutXpu5LL+l0UEM=;
        b=vMIkGXYPh44xtgAJoKk1LkqQHJ1OkfbT7p2IjLhlsv2eivCnXRbwRAhALXUvIu0kfC
         V1jIk4SfEFtwnLFYD4K0fS/x+xp+QKUVrdNvCt+CovlA1Ly8wAN514CnjU+yaGzWpUXv
         xOlENvEV8U8BSH2UfWfxZzAaXjYA6y3dqr+Tx8PZte/3n4ny7uvXyy5YiszC6tjE9ntx
         O+z8/Qk2vs81xMJPQEfitSXNOEOnuMMWCJA4xJxV9Gu5mTkC3VQthm6DK9E9oy3OVbJx
         ySINOdF8Ar8p21Cry5TKeT7Khg2IToRjoh0bRywCxCaS54xkBfk/Pg7t5BKvRLtBuSDJ
         7E4g==
X-Forwarded-Encrypted: i=1; AJvYcCVuH0tGcRrjngqyLRH0jYza7ScaJaYxAu4heW45qCoNr+BKzaSx2UPV15bbpWLkPYhQ5BWPj3R9DbezY37jOiuMEZkI1gy8TYzs0RSLig==
X-Gm-Message-State: AOJu0Yyio2gXqEfpWAenR37mY2KDSQrAnfQns7uyqozzBqqBh/Jhpn2x
	g9Dn0BxC8SW3YCPdbb4sGpgL3uwAf1VSEWozJINUSUgOAy1kO2mBebm0ADDHWkc=
X-Google-Smtp-Source: AGHT+IEUU/ejkhFCzJrWhls+yceRl7vVx/Xll4bJinHES1RwcQ1KtqDXGzkTVzfkk/7wHoHjTqO8tA==
X-Received: by 2002:a17:902:b198:b0:1dd:8ed0:59d0 with SMTP id s24-20020a170902b19800b001dd8ed059d0mr970249plr.17.1710969684990;
        Wed, 20 Mar 2024 14:21:24 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id u16-20020a17090341d000b001dd3bee3cd6sm7930912ple.219.2024.03.20.14.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 14:21:24 -0700 (PDT)
Date: Thu, 21 Mar 2024 02:51:22 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v3 3/3] staging: rtl8712: rename backupTKIPCountermeasure to
 backup_TKIP_countermeasure
Message-ID: <3fd64e6671d3f86c49fd8c6ba9ef64c4f0e0b75e.1710965653.git.ayushtiw0110@gmail.com>
References: <cover.1710965653.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710965653.git.ayushtiw0110@gmail.com>

Rename variable backupTKIPCountermeasure to backup_TKIP_countermeasure
to address checkpatch warning 'Avoid Camelcase' and to ensure
adherence to coding style guidelines.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
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

