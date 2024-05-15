Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E520381B9
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748757; cv=none; b=M9I1EuIeIta3evNa/PytajCkk/DW3G+OdbP/AUICgZ8cW9r3ht6bZ0MJ8I8ZlgT2Mw7JzHCDH4JjtXDkyPaVciDc3X0YBjS5yHY6owC8t7AQEMoZZqtuqjfxKec+WeGQRZl13BByU/eMWbRB02G2R0DsDLXkr6nw1y1gH+i5CdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748757; c=relaxed/simple;
	bh=MaYgk11V9VdrTP8z2Dr0C6mU8sKFgydduukab/SqPpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bB1BpAEy5GujN51oU82gdt+HOu+uUuhb6rOf1g71AGHAPvXcWkkQjUfPQ9MrxB2ISPQjWkt8HJ5UW4JzlIBv4F2SRwU4KSIM6mQUvbASVU1KjZvVfbbFHHTtXIt+CDuZnW9fVkYs2MxrB+PgfhO3YND7nXhOtUb+sHTcUnwuSnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=KeOS7u6G; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="KeOS7u6G"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f4603237e0so4475872b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748756; x=1716353556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxfiITVjEz5smO5GO/pbEdvc3HEsMTAy+JAImqMp9NE=;
        b=KeOS7u6GeuzbkMbTkNyxG3LqsrW7ufqTy8hJft9RRTEoAWOrV4CAx873+rRQCN2zU2
         o1ZWo53vDla0KoQD98lQW0go9rpbO8xrXqaXMcWxxMX4OmxBjpym5YEiVTqovJQU1DdW
         OVgAAbd3pB2M7viW1JYC9R50efELX44ZmwUeEGuCfV9cl+7rq6yEZL0tMeKV4gmjk9DN
         aWUK6lCvAg7zWRDyPYgvptkjyewT5l3fi4O6mRScBfs3R8zALYcdQVODyHgvASm+Ksan
         M13UGaVSvToQGH1orYrEqg1HYKWDgxatZ14ErETi0WVxfADvcn3oFApn+wxKw4OlIKoj
         YXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748756; x=1716353556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxfiITVjEz5smO5GO/pbEdvc3HEsMTAy+JAImqMp9NE=;
        b=Q/NPuyfJoCGo4Cni1ELBy1jE/HdMbFjow1WEaiiJAobFvUxyUto2X+024MkRIrKba9
         5GouNBgpxNV4zHUb2pHUMUQrmGIj7NG8rOByTdalU46MqEEB7+KUp5opXG3B28VzLlU6
         OpPFMS7M4qynxHT3/ZF2T4Z+RE8Fj8AfKcyu+jfM4j+CHWzW7QmZzzV3st2D3mWr4eMF
         V7Egw+hEg8loid/7itmqPoM/jPLkTaEMBF68v8c82rg6nXhzyPyhJy+vW6aXYi3g//U4
         4BLGmoep9uxNvpV5cThrU9QQy8LLZe6lNSQAL0V4DHIHNg899IyRo5603lmVkZ6FFajc
         ADcw==
X-Gm-Message-State: AOJu0Yw+JeurYnvm+RMkQ7rZN6gTrHqpTTJt07wMVaqAHiLAtQdgUdvy
	4sBf0y6U29KZd1rAD8WWkkm36v8zfVf/fDA9nbia+GFaPAJEQQsEnO0SMl5olnY=
X-Google-Smtp-Source: AGHT+IHHb2FezJuQyY60eDi4sVFJ0+3TzoYSFsoj/FhdPtZ4lKhk+GL3rxC4BlodqXuqsF7xUWbM3w==
X-Received: by 2002:a05:6a00:3d15:b0:6f3:eb71:af90 with SMTP id d2e1a72fcca58-6f4df3ba92amr24104738b3a.4.1715748754987;
        Tue, 14 May 2024 21:52:34 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:34 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 02/31] Staging: rtl8192e: Rename variable CountryIeBuf
Date: Tue, 14 May 2024 21:51:59 -0700
Message-Id: <20240515045228.35928-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CountryIeBuf to country_ie_buf
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0809af3fd041..8a84d61e6912 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -950,7 +950,7 @@ struct rtllib_network {
 	struct rtllib_wmm_ac_param wmm_param[4];
 	u8 turbo_enable;
 	u16 CountryIeLen;
-	u8 CountryIeBuf[MAX_IE_LEN];
+	u8 country_ie_buf[MAX_IE_LEN];
 	struct bss_ht bssht;
 	bool broadcom_cap_exist;
 	bool realtek_cap_exit;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 4a0db2dfd5e9..dc0db6fade0f 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2184,7 +2184,7 @@ static inline int rtllib_network_init(
 	network->SignalStrength = stats->SignalStrength;
 	network->RSSI = stats->SignalStrength;
 	network->CountryIeLen = 0;
-	memset(network->CountryIeBuf, 0, MAX_IE_LEN);
+	memset(network->country_ie_buf, 0, MAX_IE_LEN);
 	ht_initialize_bss_desc(&network->bssht);
 	network->flags |= NETWORK_HAS_CCK;
 
@@ -2343,7 +2343,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->turbo_enable = src->turbo_enable;
 
 	dst->CountryIeLen = src->CountryIeLen;
-	memcpy(dst->CountryIeBuf, src->CountryIeBuf, src->CountryIeLen);
+	memcpy(dst->country_ie_buf, src->country_ie_buf, src->CountryIeLen);
 
 	dst->bWithAironetIE = src->bWithAironetIE;
 	dst->ckip_supported = src->ckip_supported;
-- 
2.30.2

