Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3BA56464;
	Mon, 18 Mar 2024 19:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710791849; cv=none; b=T43qscPeRwuicpIMyPneXxTfEAgz0tggsvM3mt5/6/RCGWA1SWAnrt28IrBuHaf2u8O+zIcyAWHgAVuliBBJvPsCAi5yKTspPQstdwWj5X65oliq8HUBIjgng3WjcJpJGMucjN3oy3AvWBqHcLG2tNl4xfJxS1IBMqYk4Rd+OU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710791849; c=relaxed/simple;
	bh=3GFESOC+U6VEmUnYs1sG/rzktq3h3JAUICyyo3XBa7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0QNNlShvQeKj9s2ZRuy+43Zk0QBaKshxNm/g9PY4rFvPPFBKvxHNpXSx5IUdkMQbSERon/sjb3HlyW4yvJnt67+P3TtKj4tdvRFl2UIRajneFeKtFVegIrfZZWJ8NZXKWCTeJLPwigFMIiBbGFVyT4+gO06zCzWQ42lkUrxMDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5ufAMpA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5ufAMpA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dd10a37d68so38744035ad.2;
        Mon, 18 Mar 2024 12:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710791847; x=1711396647; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lbYK9mYkaokSAe4HO8g3voutIt00vEa0yBv9vB7tmuM=;
        b=a5ufAMpAHUcalra2eAxPz/tpazv/ebEvByBxY5l3zoglda5PCZw+92cmbeqgjvh7w5
         RBLhBcpOgWwK9dV7XU+7QcxlM90o1vGy8bytD185rB6YcYBFTX2pFleN011uQgvH7EOw
         4tr4gWNVyAP+9mBxQe+To5C2tYpJxKaa2FbItJ+i00yyJ/mXaYVBq6T0dBE2vf5KLZ8g
         /eDPRnlBhRpuEQKDO+q6h4xkXNRIXxZYyTAnpsikwULOtPG8docIJwSkXpfBfGUgHKk9
         uQ6oHd+MxxhnKdxeyfGl4hJVbjCOJKa/tXod+egL56r2QBQcxpj/JZXcQ2vMUrcwZDjf
         NWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710791847; x=1711396647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbYK9mYkaokSAe4HO8g3voutIt00vEa0yBv9vB7tmuM=;
        b=PjZB2O68A4yyCft0DL63ju0Cg5IsbjvJJQU4O0ZG0Anrsu+DZtuqLNI0HFf4yuDiSq
         5oPO60gOxDaSUjOptPGMXXZGdb5UkGZqIA5IACVeG0CMvKxJDVSz4JHt56J6gFMWFpr1
         qYCmH+F6ESp6Pd7nBp8G7qqX0EUzE2v85x5JpTFJvNeXDftj6nn/oBU+aCufXz8ldQ2M
         GUlg5HvphUtEhxDIIX1ysVfOwHljeKqjkJiSfEqMlzgMZn2nzfFsu7pBTsLB7gdliu+z
         RslMUBWOon9GaheRhogr+XZ2f9Ke2fPBBy7r+xUwBy7/TX7LNXotitNr4yAxVlaJwCHA
         Dm9w==
X-Forwarded-Encrypted: i=1; AJvYcCXWHD7Ry+25i+BxWq0BVqLB4RlAXH9zHrHJ3fTIQS7WOP/fY+01vQxJ0IrwnDdIKUR7Qstg6PI6fU4ugrfRvaIOa7LysnyK9OjlNiRecA==
X-Gm-Message-State: AOJu0YyNhMYriaYRZmMCaE9mSpzoS5+cDU+3IBiXJX36y5M6io/SVq6D
	pviS8tS/uCoMGW4ferUDDx8iDle8M1lDC56IS2/Hx3abX74Hjtst3Xne37YoXtw=
X-Google-Smtp-Source: AGHT+IGQAkwsRpc7yBEDg0Wp445e5klRgnbqazGAXFpUiXVpnwcolTFnqYajqLAteciM95WV+CM2Ow==
X-Received: by 2002:a17:902:d489:b0:1e0:342b:af6f with SMTP id c9-20020a170902d48900b001e0342baf6fmr2410411plg.16.1710791846891;
        Mon, 18 Mar 2024 12:57:26 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.68])
        by smtp.gmail.com with ESMTPSA id jx18-20020a170903139200b001dcc2847655sm9689962plb.176.2024.03.18.12.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 12:57:26 -0700 (PDT)
Date: Tue, 19 Mar 2024 01:27:24 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v2 2/3] staging: rtl8712: rename backupPMKIDIndex to
 backup_PMKID_index
Message-ID: <279456b8fb09414316e626663d70650f4a3c1d98.1710703217.git.ayushtiw0110@gmail.com>
References: <cover.1710703217.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710703217.git.ayushtiw0110@gmail.com>
Message-ID: <20240318195724.q1kOFsilnG0qxxENy2mMMpgdR7kt3JcoSF4mgvfneZI@z>

Rename variable backupPMKIDIndex to backup_PMKID_index to address
checkpatch warning 'Avoid Camelcase' and to ensure adherence to
coding style guidelines.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

---
Change in v2: No change.

 drivers/staging/rtl8712/mlme_linux.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/mlme_linux.c b/drivers/staging/rtl8712/mlme_linux.c
index a8cda81f4240..ac8196d24ce0 100644
--- a/drivers/staging/rtl8712/mlme_linux.c
+++ b/drivers/staging/rtl8712/mlme_linux.c
@@ -87,7 +87,7 @@ void r8712_os_indicate_connect(struct _adapter *adapter)
 static struct RT_PMKID_LIST backup_PMKID_list[NUM_PMKID_CACHE];
 void r8712_os_indicate_disconnect(struct _adapter *adapter)
 {
-	u8 backupPMKIDIndex = 0;
+	u8 backup_PMKID_index = 0;
 	u8 backupTKIPCountermeasure = 0x00;
 
 	r8712_indicate_wx_disassoc_event(adapter);
@@ -99,10 +99,10 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		 * disconnect with AP for 60 seconds.
 		 */
 
-		memcpy(&backupPMKIDList[0],
+		memcpy(&backup_PMKID_list[0],
 		       &adapter->securitypriv.PMKIDList[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
-		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
+		backup_PMKID_index = adapter->securitypriv.PMKIDIndex;
 		backupTKIPCountermeasure =
 			adapter->securitypriv.btkip_countermeasure;
 		memset((unsigned char *)&adapter->securitypriv, 0,
@@ -113,9 +113,9 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		 * for the following connection.
 		 */
 		memcpy(&adapter->securitypriv.PMKIDList[0],
-		       &backupPMKIDList[0],
+		       &backup_PMKID_list[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
-		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
+		adapter->securitypriv.PMKIDIndex = backup_PMKID_index;
 		adapter->securitypriv.btkip_countermeasure =
 					 backupTKIPCountermeasure;
 	} else { /*reset values in securitypriv*/
-- 
2.40.1

