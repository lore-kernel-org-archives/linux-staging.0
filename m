Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5523A4F5B
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826196; cv=none; b=cwE/d/aLV0EGURL3FinIm8RqPO+KQpJnxR4NM+Au1bFCU4HxmbpFQaohp/Np00qlG+MHuE5enELs/R9I428Vm8gfFtFuFO9NqldubY8b3Aj2difscq40cuOEkmF6PrVPao0oFKGTm5XrJPT4WT5Ne3B9pczAf/GJItTwjbG59MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826196; c=relaxed/simple;
	bh=YeA5NTit+vRgO6O7UM7usIAyOEi9ktUs3te+RyJJPCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jxudkxxXQ1jUfBgU77trgqKYBZnXGC0AIzqZd5WXD4cbMCn+jmBZoc11n92zgrat4AKPofhHOZGw9O8pIVvZl3dPMWzHzndm+bEHxPjUbcDqepxxwSnecE3dEykFWl/rCyI8DzGiNCm3sips5XJJZSnbftEq4QHjJ4axPJ36GG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jh0kLqJ3; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jh0kLqJ3"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c7393536e53so2598243a12.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773826191; x=1774430991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7lW8LFGu1hdwVKAacX1pBoH1829SaNw1Lo72wdjeU4=;
        b=Jh0kLqJ3GmiD99kWBtO0z80K2pYr2C73HO1oAl4Sx1c4dIIDqBM7jRjW1Fn4hcdw2y
         46bM6Ue3CK0E912RHGx4nMWHwAoJTtCRoyngIJya0PQd+zLOZggpjy0n0GlMQdO0u7IL
         2u1GOrdLwq8smVMBYHqddKMR00rIVCKuNEPyQYl5zKpYstRFO5zkM8+ZRuu+sP3khGMJ
         nt8qAQFQ0XzgZx5vXA71Veu2SlJQVLm2/Wnkr4/3MGGTJsq1p2VkAYXd6EVC6odvCHM1
         6xixoXelEYlszksTCuujI7/1Loq3S0ii9Fx8RHR61LNPDvKEdt6mnFLRa9/h/qFkA1on
         NRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826191; x=1774430991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7lW8LFGu1hdwVKAacX1pBoH1829SaNw1Lo72wdjeU4=;
        b=GYMEVKwaazOnRIdL0D9+NIMhRO4jaZA029meDrLUB1ThXPMJ4CBH2lE2b+XvHFw/9R
         3GuNeB4C2F8gmqioFNRo3tMT3VLJrG+OT0gxwWcQTC70YEyoVrZYZV5amzAl/08Y+qop
         +P9zaHUbFili88OxlPMCf5zMPDdZbQhjCt5M1BGEkr2nzLSWV9BQ+Q5K7h+ME8QoURGI
         qqOTAo0tpAGjcUgdhCRjDWwWX3HQo4OE3BlEMqlYjzkYIJIde0mAVavuPQ72WsYGvpR5
         7lXsq29y4gb/OWldWhDNlp+zS/CjwsSvAibTMCSeJRvT1jlk0ipGPMwgRIr0C16+0r0d
         LcIA==
X-Forwarded-Encrypted: i=1; AJvYcCWd+U9JruVsPhaJt/IRxc4HM6LcXei5gLlguCaolrBMB69RuBDOWweop1at+FEKQp96y2+b8FOcc60uNVhl@lists.linux.dev
X-Gm-Message-State: AOJu0YzkQD+jmQh40dJuUNveadMdredijJPXUCeZw7bUOBZj4q9LKqNl
	7M6RlzZOdAla7gOmsbqo4EWpP4XIyFTBUevKUoxKt8AoMbdXFPlGmKXh
X-Gm-Gg: ATEYQzxjO1j24UHpiZ7t2R1ebpDi++0O1ozX7axLawcW8+9tDaOYPjWdelWOv/yVBTi
	vMnxsSianU7fdz4zb5eLbfnlWQQjxAGM/pUIrATpb9isfREhkGMbL2ddu4FHj5wq7KMZvzaXgDh
	BnmApMv+dco9vQmewVDVwlqHc70VaBIZKmrrwu2tI7EgClrlmHDz/qHgHH7+gRcpERbEzfcV34E
	c90FK9yufOA1LWJyLvvf8afGULq0QVC+7T9VpaCtagOpNfybqCD9KPNqB3jNVV4nJHkY8PHL/0Y
	GVMX4kFThECDHBKEaV+mqS6AOCFFW6IaGXegLuN++71vcEFC0Tswtxc0h4kLUhO8sfkPYxD3nlf
	1rqswsiAAoQAGNztJbnVqnhDkt0qjutJSystV088i/DcSMcqf2heyr69ynfnrCs7ziZAScGQBQs
	Hm9nUgvbN/fxOEBSyebp2LiTASVHu05paMp1ZJ+cY9JBcW2JLNtUs/qR/5Jvidne22yoCUI+6gD
	klFhvNtLOQ=
X-Received: by 2002:a17:903:1a67:b0:2ae:3b9b:db34 with SMTP id d9443c01a7336-2b06e41a91emr26532705ad.42.1773826190696;
        Wed, 18 Mar 2026 02:29:50 -0700 (PDT)
Received: from debian.ari ([152.58.182.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e616351sm21168315ad.67.2026.03.18.02.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:29:50 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 2/4] iio: adc: ad799x: use a static buffer for scan data
Date: Wed, 18 Mar 2026 14:57:13 +0530
Message-Id: <20260318092715.42538-3-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260318092715.42538-1-architanant5@gmail.com>
References: <20260318092715.42538-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, rx_buf is dynamically allocated using kmalloc() every time
ad799x_update_scan_mode() is called. This can lead to memory leaks if
the scan mask is updated multiple times.

Drop the dynamic allocation and replace it with a static buffer at the
end of the state structure using IIO_DECLARE_BUFFER_WITH_TS().
This eliminates the allocation overhead, prevents leaks, and removes
the need for manual kfree() on driver removal.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ad799x.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
index 9825abc9285d..7504bcf627da 100644
--- a/drivers/iio/adc/ad799x.c
+++ b/drivers/iio/adc/ad799x.c
@@ -39,6 +39,7 @@
 #include <linux/iio/triggered_buffer.h>
 
 #define AD799X_CHANNEL_SHIFT			4
+#define AD799X_MAX_CHANNELS			8
 
 /*
  * AD7991, AD7995 and AD7999 defines
@@ -133,8 +134,8 @@ struct ad799x_state {
 	unsigned int			id;
 	u16				config;
 
-	u8				*rx_buf;
 	unsigned int			transfer_size;
+	IIO_DECLARE_BUFFER_WITH_TS(__be16, rx_buf, AD799X_MAX_CHANNELS);
 };
 
 static int ad799x_write_config(struct ad799x_state *st, u16 val)
@@ -217,7 +218,7 @@ static irqreturn_t ad799x_trigger_handler(int irq, void *p)
 	}
 
 	b_sent = i2c_smbus_read_i2c_block_data(st->client,
-			cmd, st->transfer_size, st->rx_buf);
+			cmd, st->transfer_size, (u8 *)st->rx_buf);
 	if (b_sent < 0)
 		goto out;
 
@@ -234,11 +235,6 @@ static int ad799x_update_scan_mode(struct iio_dev *indio_dev,
 {
 	struct ad799x_state *st = iio_priv(indio_dev);
 
-	kfree(st->rx_buf);
-	st->rx_buf = kmalloc(indio_dev->scan_bytes, GFP_KERNEL);
-	if (!st->rx_buf)
-		return -ENOMEM;
-
 	st->transfer_size = bitmap_weight(scan_mask,
 					  iio_get_masklength(indio_dev)) * 2;
 
@@ -896,7 +892,6 @@ static void ad799x_remove(struct i2c_client *client)
 	if (st->vref)
 		regulator_disable(st->vref);
 	regulator_disable(st->reg);
-	kfree(st->rx_buf);
 }
 
 static int ad799x_suspend(struct device *dev)
-- 
2.39.5

