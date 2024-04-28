Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E718C4AEED
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345281; cv=none; b=nRhUc6XiEGFh8MfJwsx4t8RA1Dq8gsbDTZhVt2C8A3QRNIfmL8tI1dVpYB0wt2EuigIoqYxg/COaiZb99+yyTtHZ9S1n5cc4jkojbw9QxRIow/foVWdXfAm2lrNv7k45hvaPcl+fsMxB5wPi+3mfs6S7A4G1R1qzSU2ghtp132Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345281; c=relaxed/simple;
	bh=5Y3rMOfmPj9I5oo9SIOrDTqUJHDHqOhOLjPzdtcs9vQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tg+fJY+rRZI1lvxl7PS06pU2U4l0tdGE3dESWLkuHJQTU/s2Jty1QhL7gPYBTrsuIkre3S7CeF/d+s8gSax4kE9axx1mghYo9amSV6TdNLtpLvjQ6HPqyeW2N4L8yTgMVYJHlGCKBa/m5e99xNUngAWKFx0eEHWlGv8jtpO/U90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gKBZRMJm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gKBZRMJm"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2b1cfae51a5so144813a91.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345279; x=1714950079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaX0yMsXS4twHiF6maUrciZQmjJPvFyuY1/pgw0/zBU=;
        b=gKBZRMJm0sZmooB0BOXqSKC/F/fbfTGC0TchiUtVmK4osN+ZhdBtL0jpftSdAdehUO
         AAyXof2O72q3FwwH3Ari6q5SBQnU4PiaW+GkZ6Y64Gb84hvFDrlRsWiA152hlouF73Ez
         zNt9AG0SMkqFgcki/yFmZK4eqgyslVBJBqI2IRJV2K0ZYTeXwXg6qOaGOlAGm32M5mRk
         BnE44cKLdVzGSi96eHn+4qjRv7PnRkjBE6XrGHENoAbx+eomyDodW625P1pY6916f6KX
         PDL04kA2/JLeK9nq/F8f993NAfV0QbV8VLFNt2oJ1+L1oQpngmiVy3tZZnYw5uCmz2dS
         Lp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345279; x=1714950079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaX0yMsXS4twHiF6maUrciZQmjJPvFyuY1/pgw0/zBU=;
        b=BLGwdaTPUkG4glQXOAaPdBHY3mCExOGBiQwrHc3M2Aag8waovnNpaSfnpSC3oraJvY
         9P0m+QqAdUTi8mom1EOlW9LhsAHTZ5ZOvAGpIdU2i0A/8+gV1UvjGWAUPl+QQUCEAJ3K
         RxQw0bH2Zk+ms7Vu+HW38qATZ0DnnrCvlOBzGVoasfoABtKCdNUgOt3G+VHaVJ7UFIMk
         nrdUYLkqUX2v4POAyzy8QRZmAQAGRQBhSbc3WpSe0r0D6G2glUrN4Sv+Nax5cNYqvcC0
         HPpjcyRxkU5+GtWFzqRb9amH4DCd8jN87RNhvT8PiMx7pn//056My7wMsO95mg56untp
         YvWA==
X-Gm-Message-State: AOJu0YzAdmT2L5cAf3/ztDxXZywB6XsyY/Ydz72zzU/JdRsV7i8cJmtj
	Myc3AKy80catx8tUeXjxNZUlu2ONvE9o/Vay9na+IEIWnvXarzRGqMAA2BAdL6s=
X-Google-Smtp-Source: AGHT+IGlUPh7Zl+7QcgueIGd9sfz8pquCRemizZTa+v6Pa3rQpQ+0/znBpeo6eWIy5FZ4ZblL1BDQQ==
X-Received: by 2002:a17:90a:fe10:b0:2ae:6e16:da91 with SMTP id ck16-20020a17090afe1000b002ae6e16da91mr7779149pjb.29.1714345279309;
        Sun, 28 Apr 2024 16:01:19 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:19 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/18] Staging: rtl8192e: Rename variable MaxRxAMPDUFactor
Date: Sun, 28 Apr 2024 16:01:03 -0700
Message-Id: <20240428230106.6548-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable MaxRxAMPDUFactor to max_rx_ampdu_factor
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index e0906e4588c2..425df93486b3 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -39,7 +39,7 @@ struct ht_capab_ele {
 	u8	Rsvd1:1;
 	u8	lsig_txop_protect:1;
 
-	u8	MaxRxAMPDUFactor:2;
+	u8	max_rx_ampdu_factor:2;
 	u8	MPDUDensity:3;
 	u8	Rsvd2:3;
 
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 7b08e549726b..516e48073dc7 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -276,9 +276,9 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 
 	if (is_encrypt) {
 		cap_ele->MPDUDensity	= 7;
-		cap_ele->MaxRxAMPDUFactor	= 2;
+		cap_ele->max_rx_ampdu_factor	= 2;
 	} else {
-		cap_ele->MaxRxAMPDUFactor	= 3;
+		cap_ele->max_rx_ampdu_factor	= 3;
 		cap_ele->MPDUDensity	= 0;
 	}
 
@@ -471,12 +471,12 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 	if (ieee->current_network.bssht.bd_rt2rt_aggregation) {
 		if (ieee->pairwise_key_type != KEY_TYPE_NA)
 			ht_info->current_ampdu_factor =
-					 pPeerHTCap->MaxRxAMPDUFactor;
+					 pPeerHTCap->max_rx_ampdu_factor;
 		else
 			ht_info->current_ampdu_factor = HT_AGG_SIZE_64K;
 	} else {
-		ht_info->current_ampdu_factor = min_t(u32, pPeerHTCap->MaxRxAMPDUFactor,
-						    HT_AGG_SIZE_32K);
+		ht_info->current_ampdu_factor = min_t(u32, pPeerHTCap->max_rx_ampdu_factor,
+						      HT_AGG_SIZE_32K);
 	}
 
 	ht_info->current_mpdu_density = pPeerHTCap->MPDUDensity;
-- 
2.30.2

