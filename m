Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1138526288;
	Mon, 25 Mar 2024 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388956; cv=none; b=BrX/FP+lcHmpGdCruq1glzXkRTeEweL5OQKhkocd2Ux7MIC0XSOWqSambP6nZnuvUSCFnENvMqPwX1s1HtkL4hP+l13s7A1s33jq8U3cMIaRFcFwcg9oc6Zj12esWpSFNmiDyT2U2gP6nunMilMDC+Z7qYSYVgcEqEYLKgvR0TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388956; c=relaxed/simple;
	bh=1O2i+z9ec5worg89eWFtLCmRb7aXmuCsagcLEDtkmCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPT0Nz0dsqk6JQ4TlOy3mic5XBWkDkfxbO377jLdYgHJDYqsqAwhByhCs6fcfton5vhHfqHn0pepoGMgTW/6cBVZbNcdmoWdI/ZwYnpIzkxCaLraLc6TsI76LmPQdsFc+n9Rhl7acU9Jucdie7iOEPhiB/SRvPDJFjrD0ugrkj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8QRzheS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8QRzheS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dee27acf7aso32236675ad.2;
        Mon, 25 Mar 2024 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711388954; x=1711993754; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3lnLG30Vz/3lGDQ/KrylGmjWUx6Db7eT1RcS7bbD5KE=;
        b=a8QRzheSKcXheE9hLe3TGJbyNi29nOcmjc0ixOhXSH49nuBpjgramzFtRaW6Q46yr9
         EMoU8e+/oOevXKxqBXtf+J/lVMAQnS7Whr70ZSCaAOwGM5XE5x71pzAzWL9+pQivyhVf
         giW9z1MGANC21ORkXIbzbXlxN124rbDk+Y8iGAjFuaiQga2NVm8WZA/Edai7oONBrR7A
         WENmSYPn/dKbv7HRlimNANFDMMEV3bkvjmwfx5PcxXZ2ocvzwCI6uXtNtFyMi9quVgPf
         IB6VBMh37W3TRwwdRANRR7GBL3N5gCYh11GOgfl6mjjYJu2kLaodIzBQL5fjD3bgd5Ff
         S2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388954; x=1711993754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lnLG30Vz/3lGDQ/KrylGmjWUx6Db7eT1RcS7bbD5KE=;
        b=Aowr4+kSJAU5En0QxAPgcDj49qFE8I1g+CzCB/MWQHeZZetN5Dcwkv3+Sh4JC3azZ7
         nj/wsh99iKm4BM4/SwPQJBXR4qCD6lu2X9/q1CveZkBPD7yuF2bPtFng8E10q4qJzIxf
         lStGAblLvtUyE87HltlTK2VD5nlGSKyz+M4sTLDpqrQg+aYfH9qrj6FDyyiBRog48/PH
         8yCdKnWwJGpy+T8wxwctHTGAewqRjXcj7W0OXo4z49wlUeUIZA5uBOqHBIKsJrCW/qe/
         pngKjtUkmgEcBFChprgAL2LAVmLNooA9RjhBUl6+MOl7ru+4TmHkNC4dTs60JwMRL9BR
         lewQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTQxLw8j1FPFNopTbzsACKanQ1yxjBvkqHjNb5uNMKswyIgY3rs+dczCx4h2k3DEMf2NylRd9HbQGiqb/QA/Hv9aEeWsstBPlrAJyzJQ==
X-Gm-Message-State: AOJu0YwgTpKcTKKaoM+YmMkSkiJ9FMu0u9SZzKsnq/M1i8MjCuDTctzA
	h8n8XJZXjVNEvMx/OInvaeuP3yoyS6HWzuLodbROOMSAFaSHk0WC
X-Google-Smtp-Source: AGHT+IGbL0wknT1iGzMMPJyvG9LJToHnRvRU96heKUlxYnKSn6NiyZtkDnGi7d8f/HExWMsAw4aLJQ==
X-Received: by 2002:a17:903:22cb:b0:1dd:bf6c:8973 with SMTP id y11-20020a17090322cb00b001ddbf6c8973mr9548449plg.68.1711388954182;
        Mon, 25 Mar 2024 10:49:14 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902ea0800b001db5ca97817sm4920410plg.68.2024.03.25.10.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:49:13 -0700 (PDT)
Date: Mon, 25 Mar 2024 23:19:08 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4 1/3] staging: rtl8712: rename backupPMKIDList to
 backup_PMKID_list
Message-ID: <5d3930cb847fd311afdd16c8fb947133ec49b55e.1711388443.git.ayushtiw0110@gmail.com>
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

Rename backupPMKIDList to backup_PMKID_list and remove extra spaces
between RT_PMKID_LIST and backupPMKIDList to address checkpatch
warnings and match the common kernel coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---

v4: Update the changelog to match revision history
v3: Update memcpy() param to match new name backup_PMKID_list
v2: No changes. Just a patch sending error.

 drivers/staging/rtl8712/mlme_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/mlme_linux.c b/drivers/staging/rtl8712/mlme_linux.c
index b9f5104f3bf7..a009ec1a5c11 100644
--- a/drivers/staging/rtl8712/mlme_linux.c
+++ b/drivers/staging/rtl8712/mlme_linux.c
@@ -84,7 +84,7 @@ void r8712_os_indicate_connect(struct _adapter *adapter)
 	netif_carrier_on(adapter->pnetdev);
 }
 
-static struct RT_PMKID_LIST   backupPMKIDList[NUM_PMKID_CACHE];
+static struct RT_PMKID_LIST backup_PMKID_list[NUM_PMKID_CACHE];
 void r8712_os_indicate_disconnect(struct _adapter *adapter)
 {
 	u8 backupPMKIDIndex = 0;
@@ -99,7 +99,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		 * disconnect with AP for 60 seconds.
 		 */
 
-		memcpy(&backupPMKIDList[0],
+		memcpy(&backup_PMKID_list[0],
 		       &adapter->securitypriv.PMKIDList[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
 		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
@@ -113,7 +113,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		 * for the following connection.
 		 */
 		memcpy(&adapter->securitypriv.PMKIDList[0],
-		       &backupPMKIDList[0],
+		       &backup_PMKID_list[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
 		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
 		adapter->securitypriv.btkip_countermeasure =
-- 
2.40.1

