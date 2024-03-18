Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4DA56B8C;
	Mon, 18 Mar 2024 19:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710791908; cv=none; b=g5ykN1pbqO1CkiQtD2hhGQGcCzPehGVj/Wm9EfU1yTzCYoTWJPDA7LRTw+lpJAC9Bw1+5XYvlW6+wPPXK5wU5Co52ijqE9gOYFHynVPqxA+lEWeLc26FU4STA4Xdum+A1JBxuCI88iA7VSFj1LPGsYeUi1l3EE5L6vXfMvdLoXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710791908; c=relaxed/simple;
	bh=imHre1WYkYJJvHeVYmQyseBXC1vErVr/dpt8t+8JCL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JViw4mUl1Ub78qMYsf+X4ZB7kQO5DaIalCpdVKcMr/1jMelP4Weu28sJW4GERt4MJQE0oWaDjqO4UZTA36gf3RXB6U8sHjK/mPgm5dChgLepevks6nrPejWUYZqx7WMhptd5fZ4C8gpbD/UlTRWjO+802sO4n9YEkBjud/Vl43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCgbfuY3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCgbfuY3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dde26f7e1dso33578165ad.1;
        Mon, 18 Mar 2024 12:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710791907; x=1711396707; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uhpWyfW3cSY9QR0atHoby5w0GIIMIXfenBRbMhngid8=;
        b=RCgbfuY3HUK1BTfnD4OBuATKTT6LLfpv4wv4HTSX1o1U12D1PRMAnrOvih5zHnmXg+
         A/uPvYsbLlQN8gBZWLXWNC7ybXGC8zAQU6puKE/E29qQKxvBGPAFN56hLn6hK4tjuBAc
         UsKuoqap1QOD1y8gMLoO1UaQSb4Y/6oxxA4iS9rRRHuYEBgG/xnXvCc2tgqIGYMeY6HN
         pbkUPQ6NUn9i9A5OZH2rB+fjX1SVkumVoVI8rnnxrhiDkyeYA0jAn4S/5MIamCjynvMx
         EVunzDOKWfaWEe0tHx+vQKXMvtHzmsDQDoA+YASoQOcdsc64W34UJqZSEMzshnKK7OQQ
         CGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710791907; x=1711396707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhpWyfW3cSY9QR0atHoby5w0GIIMIXfenBRbMhngid8=;
        b=GHF+fpCtOnclOv4p8cmZ4d5dZEL/GQgkvyOiqTRfXFYvGnYzsP+oTTkx+bUUo8pI+k
         Ce4YZPdKVP0Vvyl0a/0lZzTwnUpQPEadcebEkSKWuE9bvF0e33/+nWWJxVMThYKk1fS4
         M7UwS1/6IMFotltdc4D9/Ybeus0MehxAa6uS4VhCIgElJ49PstTxSTm3acSzc+tc9TGe
         18LEHQXNX6m0HcBkolfxaYVb0cDsuVICwDXEU5iUTOw9ZRMEOjMdbeLs/rssup7ktLWH
         AcFyYpTfXld83n0VQ22N1ryzZ3fqY4vR4xhhKZ6qjshBTa7F2zretaFMujzh0zmkkKY/
         gz6w==
X-Forwarded-Encrypted: i=1; AJvYcCX97ctPbfNPzMK3C8pzT/2brS4EpB5qCXMkrE8Wht0LHwlFaQRfbh2l+8safts+dDpkBZe5l+fc4eP67WsMdQWmqjlUDJl3OZgFW//G4w==
X-Gm-Message-State: AOJu0YxSDKLjj6qG6kTOFT+gicJBZ0iK88/3ApJLth60PDAj/e+OYmFn
	HPLzo2TQH0sBlzd4E7fpwcu/uisFi42gC1H6LnPFr4AQXnampDS22RWxLYZWl1M=
X-Google-Smtp-Source: AGHT+IHfOD+YTWMpzUuPz05rdC/gZaOPr4VZoVs4ZtW+a3K0l1NLSpccPzZ6c8y4xiwZzGJz71OCEw==
X-Received: by 2002:a17:903:2289:b0:1e0:e16:8cd4 with SMTP id b9-20020a170903228900b001e00e168cd4mr6593115plh.63.1710791905891;
        Mon, 18 Mar 2024 12:58:25 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.68])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902d51000b001dd091a4224sm7225607plg.61.2024.03.18.12.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 12:58:25 -0700 (PDT)
Date: Tue, 19 Mar 2024 01:28:22 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v2 3/3] staging: rtl8712: rename backupTKIPCountermeasure to
 backup_TKIP_countermeasure
Message-ID: <21c20db8d4ffdf914a3d91daa7860d1edec9f9e7.1710703217.git.ayushtiw0110@gmail.com>
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
Message-ID: <20240318195822.FKHxTV-lzIVQHgi7Ep8Pq4TryqimMxz9piSKB7ZPSrw@z>

Rename variable backupTKIPCountermeasure to backup_TKIP_countermeasure
to address checkpatch warning 'Avoid Camelcase' and to ensure
adherence to coding style guidelines.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

---
Change in v2: No change.

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

