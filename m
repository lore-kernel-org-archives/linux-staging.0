Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC01395D8F
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 22:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773961069; cv=none; b=Vk/MEB26heckVqqeOteQqmUUMML+gX0JpkXy+iFKSXj3pxS7eo8iTJ+mzMokxu5D2m6nwf5dMY1/4kYY969EALugEh/mrcnj9gC6pKJ9iz9Zo2VG5+Uq/R8UG+nsS8qGHA/zq3J2N4ebY0ZrgSNl4Bzu0kWV91LueVDJ/rCQrb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773961069; c=relaxed/simple;
	bh=3DxMmMkkTJYuthcc1FWR63wttOEOetgZxkwVVvliXGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kgo6uhxcFHWJTmcJ0Vq7h8exY4cPXBfbMSNpnW6fi/iIRb5ViX4jl5R0CSeQ3p6db2gyXvf72UItZuxoOFz6FLjTEVGjl2nrD+mb/Jq5bGn4t1DUgNX/hjka1Wlf2Ed6y4vN0LsLvM+5LKSZvJg+OTkYas5+daDAJTLPgawV9eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qdz4zQoQ; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qdz4zQoQ"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94acf9ce1b7so820908241.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 15:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773961067; x=1774565867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9L3neA2+kvCOVzQBVY/s3bzaGGTddNGHKUrFDsFPQIc=;
        b=Qdz4zQoQPzy3WF56seO4fJxkStjEVnYuGZx1X9jObZHsWYlYLcY7rz6wsqMjki0SEt
         enIoTb9gcCFdXLWKCyxP+lxg0S8vVa5JBYrDVSwT3k9WktrTEWn5wVxaDmLzgt4keEYH
         n431Fb+IikAFqj1ZruqeupojIU/m4uecZu3NLaW6mzMRDdfI0gK5MLd6caOmqT/shG41
         ZY34l0Tlxp+Piiy9cGktY2jfLhbse9WKcNVtxHiItfEYsiqYQoHZbXKBG3k5KZCwUiAA
         dGIUKkmXkVoWBcq9tmsauUMqbf3HCfHjlwZac6xXEbRjBkr06+LzWSKoqoldwAxjGEGX
         FAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773961067; x=1774565867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9L3neA2+kvCOVzQBVY/s3bzaGGTddNGHKUrFDsFPQIc=;
        b=i3uwiR1XLLou4JG7xWHDNOiDk2B3NT8e7yGDJz31ijMDV9EW3XFalMVWPgFZ92KzY2
         kLBPpQ8T2pUtikrHMMEXL487Qk/vMYfkqXmNPuASoGWWDFu5kMLL6SXUaFTV23Q60LrM
         4OE44CHE3WCrGphWFhmNSNfjx4HS2ImXiHtsZP7H+CWeUs72hxehRZS7AGt6IXdoGoXM
         vyeUQlrWv2UGAf2AMdenkDDrNnC+uBPC2H2F6nbwGor/32R1w8hs/DTguo7DevYpXLLm
         d/mfzXphwJnOE8r6Xa2dvx0sbMa9nlHIMRGI3nMzs1XrllSh+7Xy9kV0CBa99vRQfkqU
         RG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwDY/+phVYCwRfO92UYu6WBBKwnonknwRvV/NTWcb2lyQ4k5ccQkXJDzVMmdzlLPmyH3awS07UlMoDAjEU@lists.linux.dev
X-Gm-Message-State: AOJu0YxKj887LcGdlewlDNp9n2SinvA8MZtiyeiQdahMrYMIqWoyTJMl
	2hoM2e03QeS0IuUmauP/tuWP5UP2lwxX1e/ZyTDgSNyQ469wFz7Po4/D
X-Gm-Gg: ATEYQzyBHpZUecSWJqHGU255I4BaIqq2jub3/NZh3C+GJnvQUOdC3xlTiK39qAO6s5/
	dBiiy/KwhpzKI4oKcnEnDPnoe1miEiNleT9RrU3RijZPf29TZmogcdk7C2YrXU1lvFTvBmjDnmk
	v8abnECKW52LZNRBCotyPMGVqWm5GpVUM9W6ITYXk5qfNpQAj/c0eGet7T/ZrlPgQsicnYywgOD
	MgKKsW0egyMDojY6+T9YL8VT/36P8vtBuZPhZLQPFPADRIp/71FsMKaKYk+Kw5Sk6Qg1c0MXQre
	3Nz6wpaDzeQem2MKdbZlDfktGCtq0AqWaOh6Q37ApVIw+NjEfQ20xqOG1OF2yUQ67uYCFYtVbWd
	oEcvWGWy0Lz2/FQZCri+LM3iti4kBwaciQ71iBB+5gOGhEBUBbu2f0ocMQuaYX3RKvqjwF4epgR
	eMclnKe2MQSPuBrz1+uEzSVfSEptZQyjVLbQ==
X-Received: by 2002:a05:6102:3910:b0:602:8cee:8246 with SMTP id ada2fe7eead31-602aeb3db5fmr754587137.16.1773961067458;
        Thu, 19 Mar 2026 15:57:47 -0700 (PDT)
Received: from localhost.localdomain ([149.102.251.107])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136bd79c0sm204828241.6.2026.03.19.15.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 15:57:47 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: iio: ad5933: use sysfs_emit() in show functions
Date: Thu, 19 Mar 2026 22:57:18 +0000
Message-Id: <20260319225719.73587-3-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260319225719.73587-1-grondon@gmail.com>
References: <20260319225719.73587-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in all sysfs attribute show
functions. sysfs_emit() is the preferred API for sysfs callbacks as
it is aware of the PAGE_SIZE buffer limit. No functional change.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 .../staging/iio/impedance-analyzer/ad5933.c   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 85a422329..f470d3966 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -285,7 +285,7 @@ static ssize_t ad5933_show_frequency(struct device *dev,
 	freqreg = (u64)freqreg * (u64)(st->mclk_hz / 4);
 	do_div(freqreg, BIT(27));
 
-	return sprintf(buf, "%d\n", (int)freqreg);
+	return sysfs_emit(buf, "%d\n", (int)freqreg);
 }
 
 static ssize_t ad5933_store_frequency(struct device *dev,
@@ -338,27 +338,27 @@ static ssize_t ad5933_show(struct device *dev,
 	mutex_lock(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD5933_OUT_RANGE:
-		len = sprintf(buf, "%u\n",
-			      st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
+		len = sysfs_emit(buf, "%u\n",
+				 st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
 		break;
 	case AD5933_OUT_RANGE_AVAIL:
-		len = sprintf(buf, "%u %u %u %u\n", st->range_avail[0],
-			      st->range_avail[3], st->range_avail[2],
-			      st->range_avail[1]);
+		len = sysfs_emit(buf, "%u %u %u %u\n", st->range_avail[0],
+				 st->range_avail[3], st->range_avail[2],
+				 st->range_avail[1]);
 		break;
 	case AD5933_OUT_SETTLING_CYCLES:
-		len = sprintf(buf, "%d\n", st->settling_cycles);
+		len = sysfs_emit(buf, "%d\n", st->settling_cycles);
 		break;
 	case AD5933_IN_PGA_GAIN:
-		len = sprintf(buf, "%s\n",
-			      (st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1) ?
-			      "1" : "0.2");
+		len = sysfs_emit(buf, "%s\n",
+				 (st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1) ?
+				 "1" : "0.2");
 		break;
 	case AD5933_IN_PGA_GAIN_AVAIL:
-		len = sprintf(buf, "1 0.2\n");
+		len = sysfs_emit(buf, "1 0.2\n");
 		break;
 	case AD5933_FREQ_POINTS:
-		len = sprintf(buf, "%d\n", st->freq_points);
+		len = sysfs_emit(buf, "%d\n", st->freq_points);
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.33.0

