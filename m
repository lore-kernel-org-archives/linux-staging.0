Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB054596B
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345280; cv=none; b=dZiCOZu/emECfvQQYLf0MpKEVEcjrPnLY3wsLhzJGR/wXyOaZdRnEU+0QU+sEd5+QM+ZkmWGTRTtLRxHEjLXzPIdOyve9CbU+3zBwkBnuKqahI2d9Aifcf7lYXMAAbjriaYusI82MBzH5Epy6V4R/Ewe89PTcHkJpPNdHpQLJY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345280; c=relaxed/simple;
	bh=vb94GfA1JvNoE6vUPfEwtkUDwECrX6lvUQ0dq8p/b4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XAGtmAEqimZO7qYazl+1SoOawM930E6L970Rb2ZiYIg/q/96RROvxR/VCO1oHHNP8TNjG8/fk3GyxVghhNynuB5QA0W6+r7+izeA1sOdZimJ9fC4M2vxDrUaI4yzcgpCwDG9VoyDgnz6iABXwVPPdYBPpkEBPj8Hh4U/Q7XEFKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=E3OjLdVw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="E3OjLdVw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e8fce77bb2so29560905ad.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345278; x=1714950078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LiXQYKGf9PWs2c05STiuIP9UOdO9VQJ7oQke7MHzLw=;
        b=E3OjLdVw9SfB34R0o9+kvMy0iOilAZmjBsiwnRaHsxOSYxNp/m2xNZtz6vu5b497fV
         Ccsfx/4z0/2+UqRRCkZWa96Y3+ze0MeWrbvh4j0j778R84HwCWsN86sKhVRGYoV1zTuv
         UNlfpK6y1wcwifh/fYWEmdKjYgFVAyjFjuZlJBgltThWPsXlwSKAuCH1FdHhwzD8VLlm
         V5rjGkqhSFVQrb3//rxw4rp57n+Nlyl8zcWavP/GZp/f6QJeBqFz9xvfIup/pfLHb0LZ
         7vwNj6/bZIbgNkzeTt0ge4ualWRSRn6JK33CnLu1QAB6T9mOupEwRrLsTk/znI8dHkuz
         rU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345278; x=1714950078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LiXQYKGf9PWs2c05STiuIP9UOdO9VQJ7oQke7MHzLw=;
        b=t/q6K4Qna+FBsyTS2G5SXpXfUpwJQEzZFVIvr6GIJ+wi6tNe11nIQp1+J/oRkuHO2u
         zUj6aFT7Ss8l73MLQScJzfQcUkuqpYmsONPcUp791RQaWssLpyCW0WwX7dHmEN1YiVJq
         PfLacapm8KryHMIOsEcwoTHNOI/l6ZUvJWBcLHtIwtZ6ePPJBPa5mGw/rzf/2KnktDXu
         IpO4+CE+zxw7ZOLB5QsvTOyMEZbkB6f7vFpHB5mefP6JMYNekdq9teldarH2Re9KMugD
         AN00Cuzd/5lVpTVdI+Kk4UK6fitnnAc2ovK4g1m5PnNd6rH06OB3A/WR2gq7mALwlj2N
         j92Q==
X-Gm-Message-State: AOJu0YxdpXds9vkS1P+xsbtoh1PlnZ+MkLxGA751hBUu2HHcuqZsUSN1
	iDqFGmYkTkCapHtihAKWAauUTeYiot/2kQn3/MAtUB+qY2QZUG82fY6+08QhO+I=
X-Google-Smtp-Source: AGHT+IFWTQICE5G3tTJSfFP5EMqzPtQVSRfF0pUynaGhoUqNZbA7gjk97Brp/TuOUfUk8FzOOV0l/Q==
X-Received: by 2002:a17:90a:bc89:b0:2a2:7a00:f101 with SMTP id x9-20020a17090abc8900b002a27a00f101mr8178859pjr.47.1714345278692;
        Sun, 28 Apr 2024 16:01:18 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:18 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/18] Staging: rtl8192e: Rename variable MaxAMSDUSize
Date: Sun, 28 Apr 2024 16:01:02 -0700
Message-Id: <20240428230106.6548-15-tdavies@darkphysics.net>
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

Rename variable MaxAMSDUSize to max_amsdu_size
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 96973c744cd0..e0906e4588c2 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -33,7 +33,7 @@ struct ht_capab_ele {
 	u8	tx_stbc:1;
 	u8	rx_stbc:2;
 	u8	delay_ba:1;
-	u8	MaxAMSDUSize:1;
+	u8	max_amsdu_size:1;
 	u8	DssCCk:1;
 	u8	PSMP:1;
 	u8	Rsvd1:1;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 5c920a0089c9..7b08e549726b 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -265,14 +265,14 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 	cap_ele->tx_stbc			= 1;
 	cap_ele->rx_stbc			= 0;
 	cap_ele->delay_ba		= 0;
-	cap_ele->MaxAMSDUSize = (MAX_RECEIVE_BUFFER_SIZE >= 7935) ? 1 : 0;
+	cap_ele->max_amsdu_size = (MAX_RECEIVE_BUFFER_SIZE >= 7935) ? 1 : 0;
 	cap_ele->DssCCk = 1;
 	cap_ele->PSMP = 0;
 	cap_ele->lsig_txop_protect = 0;
 
 	netdev_dbg(ieee->dev,
-		   "TX HT cap/info ele BW=%d MaxAMSDUSize:%d DssCCk:%d\n",
-		   cap_ele->chl_width, cap_ele->MaxAMSDUSize, cap_ele->DssCCk);
+		   "TX HT cap/info ele BW=%d max_amsdu_size:%d DssCCk:%d\n",
+		   cap_ele->chl_width, cap_ele->max_amsdu_size, cap_ele->DssCCk);
 
 	if (is_encrypt) {
 		cap_ele->MPDUDensity	= 7;
-- 
2.30.2

