Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F94085947;
	Wed, 20 Mar 2024 21:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710969563; cv=none; b=LQzqE7spVGhASHR/E9nta6qOpluj0iTfCMMpr8tH4Tv6vMlwwQXKlIjjRfhf9w0FF4wNHfjH631fVeTjryC9XE5iQew/CTnEFlfBFbFA8wU3ODRJuhXj/UNwCjUqGJ5OR82fHHbPCG/thaFhq2JZ+7YnK4ulz0godEq6xv2Um24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710969563; c=relaxed/simple;
	bh=GDUK059pKBZeHrxYHmKfn+74LCF9FZgSA5vmAJNvPi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXMy4gFtLlSE0ehaIVotnlacZ9vCRisbt4AFt1vJ5wAXBlsEmaJyiANXxXupQg1kTFY9y0EiAJ4NandIV93CNzgIpZLZ/aboIg0Li+bEBfsVBOQmerKv14AnS1fFL2hvX6MTcNQwM4652XMA4YNJHAzh0qzFPzQ47KI96S+d4x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDU4W1Xa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDU4W1Xa"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e0679b1562so2587125ad.0;
        Wed, 20 Mar 2024 14:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710969560; x=1711574360; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h0B2zlqbREuHKOh+t9O0ebnJVeZkcILT08w8oULXcsk=;
        b=hDU4W1XaHC1j53DcPjhZJ9Wf8YeQhAkTTA8QtLBCDWeSTtJuZtukxSxKtQKxSUW6tT
         t0vbW8k8aZtBnkmLeYY1utl3ddqNOGDYjM6d/VQNOZmdDiBXwXPmKoz+fXuY5mIi72vF
         lSODqZshbFR7U1aDBN47YKeMA7yBNvPhcHgiFz44X2LKcp4UKu2h3YFrABwxEt/NeCMB
         Ye5Xodu6t2zLfrKI2oqaWIcWOGYJ70UhfKtK5iVAThGQ456bXcu+vNrkCPbHI13+T6nj
         19q7cVnWyjC7UqKk7dHbuGQevIcAO71DxdC9Sh3E+fCDrZxwkyLZ+hKkn9xg83lwDgCK
         nesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710969560; x=1711574360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0B2zlqbREuHKOh+t9O0ebnJVeZkcILT08w8oULXcsk=;
        b=rwqNuX4GBzc/Bl7FWCnfL3BeiHfMRN8RiNatFYVZdOFUHWxp5d1awp184Ye8A4ztM+
         7MKFrL2dVGAcNRXWkYbfdJZQ0SCSnZAgHhTOXUZdDuql7sWI6m0pC3bT1WA+viPFkOl9
         whqZ9LnDBnck68AySy3VI7iWMEwj2nTBzIOLXL3p6M8f9j1HlprVtOxsxfHgRDDX7KKH
         Fkr3jk1Yje0LVMlbP5xsRGDTaJGJ0KUrx2oxEezeCtRZjTR5NPFdd2sXkgZNDVHIICL1
         Xk2OGoCGvKR5Oy+KO2rn8XxZ32w2J8lKA+4/pftI0YDqmPMiTC2fb82LMnMrNdPEEywm
         qeMA==
X-Forwarded-Encrypted: i=1; AJvYcCW95h1KqWK7HHMJFKMulgJloIS3tMH+yBOUChbtxJtyYGPN9FZ9Lz9fnqupMVB6c4EVxPS9Vs/+9fqX1+t7hr6OLht9gM1AQHXRL2CF3Q==
X-Gm-Message-State: AOJu0YwpnDx2JqA1RMKfu/Tqsb34aY2pwhPwC4utxgYf27xJOvmPDnmb
	d4BbN/FTBlDEy+L7PrvaMr4pJ6Q8pfh2w7nC8BVNLKWQ6/RVMd31df9bRqNo6VI=
X-Google-Smtp-Source: AGHT+IH+gkKiUOeFd5TiUgmcx2l6m+eiPE2XIe8uQh/+n91aD2xhd7pGMWQ9YU2OfQElPcvETHjaxQ==
X-Received: by 2002:a17:903:41ca:b0:1dd:b728:b8d8 with SMTP id u10-20020a17090341ca00b001ddb728b8d8mr253646ple.45.1710969560324;
        Wed, 20 Mar 2024 14:19:20 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902f54500b001e009717560sm7090751plf.232.2024.03.20.14.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 14:19:20 -0700 (PDT)
Date: Thu, 21 Mar 2024 02:49:17 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v3 1/3] staging: rtl8712: rename backupPMKIDList to
 backup_PMKID_list
Message-ID: <5d3930cb847fd311afdd16c8fb947133ec49b55e.1710965653.git.ayushtiw0110@gmail.com>
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

Rename backupPMKIDList to backup_PMKID_list and remove extra spaces
between RT_PMKID_LIST and backupPMKIDList to address checkpatch
warnings and match the common kernel coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
Changes in v3: Fixed the errors in v2, built the kernel with
CONFIG_WERROR set.

Changes in v2: Checked any possible reuse of backup_PMKID_list 
manually and rebuilt, rebooted the kernel and loaded the driver 
with modprobe. 

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

