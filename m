Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7255FC02;
	Sun, 24 Mar 2024 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711313579; cv=none; b=Ru8OBdJ+DBPYq4TSSL25YVnJqCTD39isC00CIRVBbV1J7JdumheKe7O/PUoyXawbrRnSia9fxluktZQwMAIE0DCvJPccZpgL2FWc2q5g528Z4aAe7mtCIC97k0QETB8K9XDMt1elogxZdbTAmwgmUaed5faY4EPm0WPT17mWicQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711313579; c=relaxed/simple;
	bh=22UiKubT7EHMviuwQMLIOURT7NpUUEkIVMAX95NvvkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3Whsr2qmnmoLkhxb0EYAwHCFPIl3ADvFpDXX1HyjtYCh1LZlNhFGGL8ArkYC3LU8iyR/GzdIQrSQWqSSg0kW0EXDu2s6felBauDbrw6L/1V5qxsokmf2SClJVG+WgnrrlYl7DCRRE122x108GNHyHjJV7ZniRTxzc2ShfP0g88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJicAQrn; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJicAQrn"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so515996b3a.0;
        Sun, 24 Mar 2024 13:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711313577; x=1711918377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TyRZutiV2/jtrRGuLfGpKmxuRIEsR8K1wS+EgVmrYBo=;
        b=fJicAQrn3dZZtkS44+dLmmSr/ZJ5vtAEpSB9+NwjCG8jAJB5BWyhjZORMJvy+LYqag
         dSt+78Lo1nrtDHxB8OIuu6NE+OJpFHxiRQ+vxQCGTlwuLnueHjH5L8fsYr0PN9ahrTn3
         Tx6gJbceckntTlarjnLfgnTiq9AUnnXAWkbdZRyDths07qRS8HbU9BzsqYzk9Y80SSLL
         poRqmC4OaNX9gVS4FzcVvCsMf1vvC3tZ/jQtpjBHr+m6B/KnOsVe2vAAmvZ/TQMs9wdA
         Uxy2fBOOfGLlqlrAdvpiiUrbTrRnxXAfj+tqWxBtDXRa/29kmXktwnyIJC3EDvW2UQPA
         D7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711313577; x=1711918377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyRZutiV2/jtrRGuLfGpKmxuRIEsR8K1wS+EgVmrYBo=;
        b=ZVzmEvAKSKdBU+9ON4+CH6PVNBvuBG0WIBn3pIiIP+nRjoPbP0EtLLYlCxh2hcSlhg
         kl3bQuApof3BMRQeXMGHclrkMlMm0Au48gnpDdGOkQRNhRirpqSb1HBod1UNnb6eX6PU
         WcbT4qbnRRx4BAEDEuecSv6MMRo8crlsZjr34hfFYflp6XrCGbxONbVA45i6dWhQ7MV4
         D1DkVtbMCi1bJU4nBf+psIJv0XKWYA6mBD6peIQRuDqA/RZezOm5K0nfZUHPG7/TN9Yx
         AG49hg3cGJVgggVtwM4pm+y0uXO1s1xqsDK2+qoBpJS1yrL8r4xz1fLpMAwTto/URoFo
         D72A==
X-Forwarded-Encrypted: i=1; AJvYcCU9Va2mA6gXR86mEWeX+ILxR91SatosfpiLLlXkgpaKS4rzzrfnro6D9QreXHdjZI3RrhXHZ7gzjw7+8NzKgVAw0Utcq8hzpG+9db+aPw==
X-Gm-Message-State: AOJu0YwPBnIbLDlxuOB0soGvSY1XqebtL9inuO2kOm0JxnzX01kwWMyW
	nsldtkg0n30h5uoxiCCeanTgp6mOKtwH9P4hCiDHJLGsA88jmkwM
X-Google-Smtp-Source: AGHT+IGo9kUNIqG9rOlXl78uMvmDQrMD0EhncC1dcQKVqlcNRKCinH5OVW0+8URwoFGWqJgDf705rw==
X-Received: by 2002:a05:6a20:3d8a:b0:1a3:a775:2588 with SMTP id s10-20020a056a203d8a00b001a3a7752588mr5653194pzi.31.1711313576962;
        Sun, 24 Mar 2024 13:52:56 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id 26-20020a630a1a000000b005c6e8fa9f24sm4776049pgk.49.2024.03.24.13.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 13:52:56 -0700 (PDT)
Date: Mon, 25 Mar 2024 02:22:49 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4 3/3] staging: rtl8712: rename backupTKIPCountermeasure to
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
Message-ID: <20240324205249.IYXsE_pTFGl5YOR7_wo1d7DXT6NyAmiZnoJ0V_dX_No@z>

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

