Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5A38397
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345277; cv=none; b=q2iZFB4BmQkoNpzMGiebIr0hpJa0IAFbc4dTOvmCCWMlV6x7ktL37QjWhDXNhefovJ/T+J08xAET2m7h7ucEDq1GY6OAIBb6Ow/8iwc4A/jJzKw5egnRdTOvV8Uiq6PGrJhgAqXEKzIU7gsuAOB/aejlRr3IAQoCTl6UzZmtH3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345277; c=relaxed/simple;
	bh=Pp+LTYw7MfK9fJBjiB4LL6+82CNUw+/goyRPJGU0+zA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t1Nat3quFJcWtkdtiewR9CLPuHWkgUBkzksVYipXCaUYOLpae9+rp1ct256anip9OPfGOZXZxPVrNL2Fh/wMojNVdp7k0ClGEO6/Vx8BMjwq4MgA57yO6HEt+8SQCrLTOPWOwZZ5dD75Ue7UHocLkV8iKdy291XE+yTKV1YpO7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Z9DpHZWX; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Z9DpHZWX"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6123726725eso623633a12.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345275; x=1714950075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwzZEo9OwzIG/MvP44mvBJ3CUqFkyPAD77eWhn0AhNQ=;
        b=Z9DpHZWXRSJgJrMKY/oas1Oiaac08M4YMAUfJPQeEIW0tlqr7GFWVfeGVnHnTISWOO
         qhDzZ1EIQunXhP+tuW1Ez1JMI9XLjmyJkhkPUjmxsEFKNq2eL11jWSvheVfDOPNLivsw
         uCuAnVppZxPdSA8eZN2d68nRPPy7a8tDYuUhAQ1BWjG6OD8D13S3C447/QXjjmHZm17d
         /BtEcil8bRIBNpwNJpkKVJcET6JzbhgV/r0i5KXJVkXAkudULkBpTssnzyy/WtyXmFYw
         msinGXDVzMsQR3n4/Xf/fDvVUEG6WzLRV2+nS2UpBEkJ4yHxQW6K0UUTXFPZ4bsNexKF
         +Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345275; x=1714950075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwzZEo9OwzIG/MvP44mvBJ3CUqFkyPAD77eWhn0AhNQ=;
        b=dQs+15+o9x4GifI6Ny+fLgYo4f1ziBFR6GCqB4VDbyPkzOivIS1EAMmEDwNAEPpVa3
         DzJUIfP0zD0dl/2I4osxlKizwsudDNhmidgSLaNEKJP7dHRRy/odpkxU0HNYhPvOFxLr
         pQnKgyhcWPAXsLBLb4y4xc1ZkmpAe94Z294BMyxQgNGsnqswkSDdV4NOkYeyfkTwJLoG
         YtHi4s3chRISzYxpLNwgfBn1OuGVmccyrwIc1qJl33+UmpfwF6IujLHg+7t9c8SF/6T4
         B8DAmxfQtrO59bdtyzcyZ3qbpjDcg65mL/BShppJNJIfwjIvLV1HCfGhGUMUZmqsmdj0
         AAfg==
X-Gm-Message-State: AOJu0Yy/Vc1ozVtCRlluhHOxtX2Pg7u47ItiyvAj1HEj8SUMfEEJQ9ZL
	sw7A8JlCcXBWmWZcoKa8ke4sMdCUrUu4HyJRoz8ethgeF1cDd+zmCD3HwjMF7Xo=
X-Google-Smtp-Source: AGHT+IGo2b8E4FR9pOUckrlUqhFBKfEOhw4JCf+7hbGpIRcreM93j+li7Nh8x1pawGybQ2RIWEkvcw==
X-Received: by 2002:a17:90a:2e16:b0:2b1:817d:9827 with SMTP id q22-20020a17090a2e1600b002b1817d9827mr1458165pjd.22.1714345275585;
        Sun, 28 Apr 2024 16:01:15 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:15 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/18] Staging: rtl8192e: Rename variable ShortGI20Mhz
Date: Sun, 28 Apr 2024 16:00:57 -0700
Message-Id: <20240428230106.6548-10-tdavies@darkphysics.net>
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

Rename variable ShortGI20Mhz to short_gi_20mhz
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 drivers/staging/rtl8192e/rtllib_wx.c      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 1b08507cab87..008611e3aace 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -28,7 +28,7 @@ struct ht_capab_ele {
 	u8	chl_width:1;
 	u8	mimo_pwr_save:2;
 	u8	GreenField:1;
-	u8	ShortGI20Mhz:1;
+	u8	short_gi_20mhz:1;
 	u8	short_gi_40mhz:1;
 	u8	TxSTBC:1;
 	u8	RxSTBC:2;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 6c557717d8af..3b1c6e24103e 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -259,7 +259,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 
 	cap_ele->mimo_pwr_save		= 3;
 	cap_ele->GreenField		= 0;
-	cap_ele->ShortGI20Mhz		= 1;
+	cap_ele->short_gi_20mhz		= 1;
 	cap_ele->short_gi_40mhz		= 1;
 
 	cap_ele->TxSTBC			= 1;
@@ -457,7 +457,7 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 	ht_info->cur_tx_bw40mhz = ((pPeerHTInfo->RecommemdedTxWidth == 1) ?
 				 true : false);
 
-	ht_info->cur_short_gi_20mhz = ((pPeerHTCap->ShortGI20Mhz == 1) ? true : false);
+	ht_info->cur_short_gi_20mhz = ((pPeerHTCap->short_gi_20mhz == 1) ? true : false);
 	ht_info->cur_short_gi_40mhz = ((pPeerHTCap->short_gi_40mhz == 1) ? true : false);
 
 	ht_info->current_ampdu_enable = ht_info->ampdu_enable;
diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index 71ecfd0c8ed7..fbd4ec824084 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -132,7 +132,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 		is40M = (ht_cap->chl_width) ? 1 : 0;
 		isShortGI = (ht_cap->chl_width) ?
 				((ht_cap->short_gi_40mhz) ? 1 : 0) :
-				((ht_cap->ShortGI20Mhz) ? 1 : 0);
+				((ht_cap->short_gi_20mhz) ? 1 : 0);
 
 		max_mcs = ht_get_highest_mcs_rate(ieee, ht_cap->MCS,
 					      MCS_FILTER_ALL);
-- 
2.30.2

