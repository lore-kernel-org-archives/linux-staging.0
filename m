Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90DA54BFD;
	Wed, 20 Mar 2024 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710969629; cv=none; b=S7u6d0/Ivokx7OoysL6wpRiTLDNsmqf8l13uZq0QTZKUYTQPKjxcTXGmgcGgOxwHJXm++F6pK2quk+f8gk3pqowig2CxtTyV+ylg5Gooe0dGwDF5zcqNCBx8u9ILPkThkJ5HuQd6Y5kTrTUyEWT+Td1YSDDRFzfzkW/PlkNvMzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710969629; c=relaxed/simple;
	bh=NFVEItHG5lM1U16FUnCoPHMmr2sd19WHClYJ6LrT7hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPWxHaGG8b+cOxbCC/wme2+tZ4pboW4/+KEnPmHCl5YMGdSq+hB/No9GKxJJsOUO8Ka1s9yzBNV8FtG+w9Im1VR1n8/Aief40QV2TFJJ6xo+/oEVuhIi6O7BHEsoNl/1gWnVWzg6XcGPedUvyhd7R4S8vLkZOFBLvXYmGpI5oZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaBmgS37; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaBmgS37"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e0679b1562so2596535ad.0;
        Wed, 20 Mar 2024 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710969627; x=1711574427; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x0FLJZ2j2x4/r+XyOiwEvTZzCfcrETa+/DL0dHt9m/o=;
        b=FaBmgS378D0sQMwshDrxkbwwhBpl+84qGymfvn3t0xzZLsKz6cLrBU0l23YCWUYpFh
         RvX1ubGygQArZhrLyLsnIxAzcmlmz+y+HPYjTCRqM4RlW9dspU3jmrdhpdYHGh4BFCdd
         3Z3CKndumXm7JY+jC+UgwWA/IlAUuprcsG21+w2+krgOqU4lGbNUGOHU2rYp/VWPfr0w
         /sAIuVAbhYBesOKBI9lHKp5Yqj0s6O1+4eJe8W6JmK2bcMcbA3mGhjg3/mDg14ti7Wgp
         TvjnqAVtCfcQO5pB+DhokQK/zj2nlRmtFQpnogGLymOPvOvB59bYBuyMeS9bDJ207gxO
         C4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710969627; x=1711574427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0FLJZ2j2x4/r+XyOiwEvTZzCfcrETa+/DL0dHt9m/o=;
        b=Nfzik3UxRLaWCPrOlxZ8D1NTR/NMpYBLWbKz0V+bhkvYWCqG1dJgRDIm8+BAQ5V3Ky
         yeAxy5v3u1Znt+PI8FtOdadc6gMqLEQ6Bup9htD98OsWkzdm77ysvOxMNA9BmitYA1zf
         3SEzajDIPllManAHKZFwL0hjfMMatigAGp4VTGf9fkRjPo8FkjnPKppFjBiO7XlUdLsj
         1AsawRYB1/uWD7lZISVi566PEjmvC6h3Zq+Nh1k/6OG78a5iM4Lb0z12Ez8DQ5zX0tqX
         /iypbb1dnHtzRUY+P+N+3ATlKGtWHNR92rXMqZzS3Qhg8UA/wbzBtKDynzZKtXb446UJ
         SMLg==
X-Forwarded-Encrypted: i=1; AJvYcCU9wkRkfZyeHTSgPmIhQLE2NQicajIbUpevrNpz/T+XV2MEZfhhAVYAZ9p1TuCWTSaAZcPFb8Z/TiwRZGa1am/CKCtSeCpgiKiNx30bFg==
X-Gm-Message-State: AOJu0YzfHfQwSaODOwbco0tK/SlB9/Puk+3R7mr/Dkp+e2kyBA6D8xTU
	XeavD4srK/xsmkbT3ptZ5zZevke/vPCCeILvXBb/irezcePIIojPigoxp7ZBIPM=
X-Google-Smtp-Source: AGHT+IFxZpDs8usQm8L7cuu08LIijmZbjTKdkWB5e/bS3IjVW7XUCB/JBzlNxkBjwENALeDWXRh/hw==
X-Received: by 2002:a17:902:9f8f:b0:1e0:3f65:f503 with SMTP id g15-20020a1709029f8f00b001e03f65f503mr287059plq.39.1710969626873;
        Wed, 20 Mar 2024 14:20:26 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902ea0e00b001dbac604e4dsm14140586plg.146.2024.03.20.14.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 14:20:26 -0700 (PDT)
Date: Thu, 21 Mar 2024 02:50:24 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v3 2/3] staging: rtl8712: rename backupPMKIDIndex to
 backup_PMKID_index
Message-ID: <2902ed6252d6773fecd32254383eefe8b0c465aa.1710965653.git.ayushtiw0110@gmail.com>
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

Rename variable backupPMKIDIndex to backup_PMKID_index to address
checkpatch warning 'Avoid Camelcase' and to ensure adherence to
coding style guidelines.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
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

