Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45541AACA
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919793; cv=none; b=qb0A0KlZYy4rRgmKHSbFjEOedcDbOWmQHC2ji5pEdPuB4r5FdMqc3qYeHAYCRT7UK13OR9IlhWx2C49szgCgAR1Jyh1+5fJqUznJVwfbs5IlTHkojCsCzoEXgc+f892jS1ZEanQdPGvnpzzGgPXBvEDJK1dN13ibQ78hklulqDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919793; c=relaxed/simple;
	bh=4QYfnCHT5IF0k+ZPFYR0XE5aULvE2R+dS6ZM00LhHhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MdsaiG9Wd4sr/Vcln3x92E7JSqe5Kmz6DSNqxc3qoTCyyCmaS6h72ZdQgUDDgv6ccXhO7jRf53eTj4NWbV8M+Tu8Z71bhb6d0eLjMgj5+nguGc5KcjVZQb3UKhEnTwffzhdtrGrDQRekLqB7JPs4c4jQzBk58/xZ1nt+dOv08l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=B6nlyHf7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="B6nlyHf7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dc09556599so22963485ad.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919791; x=1709524591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBKGzHk8InlkFKn1JmjT6uwa3TRy3S2Nn8Oc9mkuYiQ=;
        b=B6nlyHf7kf+kdpvQ8gQiQTNOeflRZii15OfSoiyBTOSz7UgiyKCoQbMhda7NbkUYQZ
         uO+YupoTZWlWSHP+DWsMM6wdjCKWwtghqJHCZb3ZmuX1QSZ5XAtEoQgt8QkxchscS+Tp
         pGGygR724hjZFHDCE2epGFgVApFbnLLuoEmgjuglyrlCWn9zDfBu3CXnCFpb0Q6KLpdN
         9DawO+S4fIO2u/+Ku9zoYfcQPirzViDOgmTxwhiKNBYVwD/tkHIj4S0+E+G3LgRCeOjI
         48zW2AKbFqXYc28laiACC2HcuAtfNELzk1V57HbFzWJgOq5THaBEtlTus3Sk5Q5nOqWN
         QJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919791; x=1709524591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBKGzHk8InlkFKn1JmjT6uwa3TRy3S2Nn8Oc9mkuYiQ=;
        b=u/Abf9SjDoY/Sjfe7j2M8bTTd10CxkFGEWNExQGxfdpY2WCqTunmKQSu0lfYb4XQsd
         Hs1asxGQzuetOAusIOfmwjgK0ITZ6ESf4D8haSq1HLitTAzepIsojtFqeEhkQhzbkyDT
         FUq7wC6XCpXGCOrtscslGYdyBy9iOWA3U1gzs5nXO9HOW/VrvyYlejIlD5D6P610dN7L
         5CuMOVLs0tgoM0ENXnzqb7RPX9+qbBKNyEGBTwB+BhWnVezMpxqDtiJ0J4ibNRfkdtth
         FPUayDWd/jkyuhJH+zToAzMosJYXAiIu6VKtG9fSDubTw4gzYg9MXIN59dAf2SOOvY24
         9jnA==
X-Gm-Message-State: AOJu0Yz/4Zf5tvGkI5tipS5IFc5BjI1ndjs15fR88csc3kZL5xrPbB42
	nZmPCtpI0xaevQ0HAXfUx11qq/eag/6yXvg7wbfi7yDKhykh3Sn2A4wEejLeyck=
X-Google-Smtp-Source: AGHT+IEuE+p8lr2qFRqJ7tnGYs20pVRaLD6XV1Rp+rB4gGWpR7TDkDqHq+FWmbUDJCoQdJAnb4XU1Q==
X-Received: by 2002:a17:902:d488:b0:1dc:8042:3b76 with SMTP id c8-20020a170902d48800b001dc80423b76mr8622073plg.2.1708919791021;
        Sun, 25 Feb 2024 19:56:31 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:30 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/20] Staging: rtl8192e: Rename variable PMKIDList
Date: Sun, 25 Feb 2024 19:56:08 -0800
Message-Id: <20240226035624.370443-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable PMKIDList to pmkid_list to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 30b9178071ae..a00db0d153da 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1281,7 +1281,7 @@ struct rtllib_device {
 
 	struct sw_cam_table swcamtable[TOTAL_CAM_ENTRY];
 
-	struct rt_pmkid_list PMKIDList[NUM_PMKID_CACHE];
+	struct rt_pmkid_list pmkid_list[NUM_PMKID_CACHE];
 
 	/* Fragmentation structures */
 	struct rtllib_frag_entry frag_cache[17][RTLLIB_FRAG_CACHE_LEN];
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 607122ab4b00..239ed95982ac 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -669,8 +669,8 @@ static inline int sec_is_in_pmkid_list(struct rtllib_device *ieee, u8 *bssid)
 	int i = 0;
 
 	do {
-		if ((ieee->PMKIDList[i].used) &&
-		   (memcmp(ieee->PMKIDList[i].bssid, bssid, ETH_ALEN) == 0))
+		if ((ieee->pmkid_list[i].used) &&
+		   (memcmp(ieee->pmkid_list[i].bssid, bssid, ETH_ALEN) == 0))
 			break;
 		i++;
 	} while (i < NUM_PMKID_CACHE);
@@ -881,7 +881,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 			tag = skb_put(skb, 18);
 			*tag = 1;
 			*(tag + 1) = 0;
-			memcpy((tag + 2), &ieee->PMKIDList[pmk_cache_idx].PMKID,
+			memcpy((tag + 2), &ieee->pmkid_list[pmk_cache_idx].PMKID,
 			       16);
 		}
 	}
-- 
2.39.2

