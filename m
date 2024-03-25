Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98FC182A0;
	Mon, 25 Mar 2024 17:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389030; cv=none; b=LWFZq6ZxxAqblvp4tpHrP7JEtbZbPGaGF6YqPZ70hScasR0l9VpwJiC88jjIsbQrL0UDBFC4UJl6HVbCJs0ui/ZZQ+VL9XIBuqwP5zFLxhIaVoEcJOmvKMGazVUupao9IISKWtjz2Urcm0Uwyn66UNpwTnd/NWVr6LJ5PjSPJxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389030; c=relaxed/simple;
	bh=mLOchj0+iWZlApmwpPHKFKADSoGovJwves4ASWPI97E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTiWx9YToweVOJ5Q2Sz/u/N6ebhDNikCkiD8IL0ZJk9K57IITkgjcxfCIN3cLJhm9+k1SPC05HH3s8xGNxBYRDwg5FnyVMnBh8nLkyMenXEbh/NW4fLp4+zjaw2QRyW30OP8e5ciJK6V4xMF+nUaBaWbrRa/LEWP5z7u0CIjWe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+3DqSIJ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+3DqSIJ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29fb7e52731so3382783a91.2;
        Mon, 25 Mar 2024 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389028; x=1711993828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zxB1ME9DNA2QAznLegn7G7zlIdrVB+x8IZEYE8rx6AU=;
        b=X+3DqSIJPijvdD39ONcjRgcGs1vuKdKmwB5MGknVDlgtMA//mCMxJ/760ELB+SWNQX
         QYPkmimKpC1mNAqYeeiLOqQH6bJw7IFqx6qZ69fQKHLG66YQ6wfmWhCTAlrgn5UOo1Rd
         PCOl4Oq7XQCPIdAhoFyH2D0OjSYw7xdxvitA1JDhkJxT4XwcUXeBSm6ZsB2mv/7DcXn6
         JwWm1hXL3DpMhOnJMg6wW5ApeoKzaI6glIfSpirtJMfDjM1D9Ii7zNi0MXwXwqhe/7sX
         bakrG1WdoJYrP66kOz45i/vUkJZrhmQl46NSsTVQslDO/VpWDAjwHtEiTM8srrU29V6M
         iwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389028; x=1711993828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxB1ME9DNA2QAznLegn7G7zlIdrVB+x8IZEYE8rx6AU=;
        b=Y/NB3gTevkYzpUJ8obZlkig5OUU9nHhP1lW9rLpGny+FkyR7sSN78qH1O8vXiXXZM2
         tuZfgVHprmUh8iofbwdi90LUCJ3TVZMnLYJIRMpe0nArpOfC3FBs5vn+4Me4WBQDeCTp
         /1GYj6oQ2q6J7S7gQtDd07IxL3mKReCC834vXW9Pqs6UVixekXihzV707UMZ70z7CgyK
         a4QqtxBOE7OJ/HWo0ao3zt0Jkm1Jxx3ztEPN0TI2CHT54LpeCKhDsyAwtB6RmSNyKWpc
         PGNd/3Dw/eCc6iP+SJCaH7b/rvO0TfFiIJzTF9OQHF3IEEoNO0MjxkdzYilbVdAR9dZc
         RLCw==
X-Forwarded-Encrypted: i=1; AJvYcCWIwukZ2DGkqGq9NMtvo1xa1QbWhFJmqrl6UsZ03IcEdBrL13Nh9HigC+NC8b3W9gsAAdRO37sMWKtW/hU7ABOpSLmYnb3VtHZXN9cZWQ==
X-Gm-Message-State: AOJu0YzipUD1A8POd7HF8AFGO2nGR4XikYVfjvi+2Pvfru/V/73WkIoI
	ppxqN+OhmMbkCmjGhirxEPLlEgW91Qsj0b/0Cd/AJ5CRgZFaQWAI
X-Google-Smtp-Source: AGHT+IEW8ixadyy7GPbDHnFI2/TLp+VcVncvNJpKaVXwmQo/2MNoRtcYPIgFJ6Ezm5p0Ijo0axf6lw==
X-Received: by 2002:a17:90b:3110:b0:2a0:5880:bf01 with SMTP id gc16-20020a17090b311000b002a05880bf01mr4871890pjb.28.1711389028062;
        Mon, 25 Mar 2024 10:50:28 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id f3-20020a17090a8e8300b0029baf768de6sm5915126pjo.1.2024.03.25.10.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:50:27 -0700 (PDT)
Date: Mon, 25 Mar 2024 23:20:22 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4 2/3] staging: rtl8712: rename backupPMKIDIndex to
 backup_PMKID_index
Message-ID: <2902ed6252d6773fecd32254383eefe8b0c465aa.1711388443.git.ayushtiw0110@gmail.com>
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

Rename variable backupPMKIDIndex to backup_PMKID_index to address
checkpatch warning 'Avoid Camelcase' and to ensure adherence to
coding style guidelines.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---

Changes in v4: No change
Changes in v3: No change
Changes in v2: No change

 drivers/staging/rtl8712/mlme_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/mlme_linux.c b/drivers/staging/rtl8712/mlme_linux.c
index a009ec1a5c11..ac8196d24ce0 100644
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
@@ -102,7 +102,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		memcpy(&backup_PMKID_list[0],
 		       &adapter->securitypriv.PMKIDList[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
-		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
+		backup_PMKID_index = adapter->securitypriv.PMKIDIndex;
 		backupTKIPCountermeasure =
 			adapter->securitypriv.btkip_countermeasure;
 		memset((unsigned char *)&adapter->securitypriv, 0,
@@ -115,7 +115,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		memcpy(&adapter->securitypriv.PMKIDList[0],
 		       &backup_PMKID_list[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
-		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
+		adapter->securitypriv.PMKIDIndex = backup_PMKID_index;
 		adapter->securitypriv.btkip_countermeasure =
 					 backupTKIPCountermeasure;
 	} else { /*reset values in securitypriv*/
-- 
2.40.1

