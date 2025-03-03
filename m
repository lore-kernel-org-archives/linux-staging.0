Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923923957E
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741040076; cv=none; b=AKXbHxG1RvVm3+zl0PYuErApjQAyq/fHmhxbVUjxXWJZOih7jS8p2sCkmuNMio2Y7OYtEwvQGrSJzPMtDNZj4aF46RuZEPLGQDbDqij3Uva+KDD/VOrqlhNedLqYsc0WNktiLYsXd4a0hUoKpUU00Z3UDIHNoOPey88qvKxzHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741040076; c=relaxed/simple;
	bh=C7JgVY4X8BAYahEsXuFW/tC9wcpQdzL2xqnGC2xijmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cx1pXiEQgNGKytsTbmWZQVKm/Ojc3eYSbsX/3wc7X3FFkJPRlW/ZIxvM1RvxU4GuwNCrx5238PU4klNSw41zR/c+eb+rPIPodHO0GE1yAOWaWLYOKrkujnlAj5aHqGyXwXLrJA4AiHrrCoVY5d+Fpid7dCRxSqhyP/Wx4QH+MAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isU8tR3k; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isU8tR3k"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22374f56453so82244255ad.0
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 14:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741040074; x=1741644874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AyT0D8McesYB9J+ldJKr6+O6ThsCItnUco/gp+p2zbg=;
        b=isU8tR3kp1cFY3VmJ+bnskUhqjHIMjrLyiuLtr1q8BCqXxK+UB9xlyHb1tnCHorQUn
         Ew2BEGdXjOtMMWHLJUcqXiqSNK4HsTWwFM5tBcOwcaDyg1uoVkWgawLrm3G+OrQcZbU0
         IHPVfH8dwxbbFLHzxB3fGIV6Im+Ej9OqGHSGa3UtdbhDJbCFUSXDyoFm0Z22U4zh0FOr
         U3qPelo/wtjmpaOzaTM4OSMFYsP0gzJwVVYsl6Hm4E3MSVi8EMinU0O2HNu84ip6j3rR
         U1bvhWE54OQYrKJ2ciFIW1Ic4WFLuiiezsTxFOGpDlJz1i+IXeIHRujCpkBdhz07rPnB
         zDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741040074; x=1741644874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyT0D8McesYB9J+ldJKr6+O6ThsCItnUco/gp+p2zbg=;
        b=Y1nvlKc81WSDkmdmZmIPYn7M0mbPObHBWSjb+/BHbvmbGbYHTYVgTytVWir2ItfK+N
         bXK7QC1C0syEpK3jwYloeFQOg+StBG3yCHrSs2ut9wTNRg0LZ+wIZTxWLH8//dqDIQYo
         mDVilhjE6B3tnDjcfckFVcLhQ2OSj/jaQGbm8zNoBjzQwQgDWhjjEbOkSBiz8SYQIfJm
         hak669OL9JS6d750hR8vv53KQVMYgg1T0Lb6uejhxzpFhKkklj5GnYkPeyoMhK16n1LB
         ZKGkBANvigOdEo9X712f3rbtsjVBtl42eTIPy6g5k9tHm0rLCflLwOIRgZPqadj5n30D
         gPWg==
X-Forwarded-Encrypted: i=1; AJvYcCWof/k+BW9Tj/mM67+i11rBOr3vzx9brLgFm8KS3bJT7iGII+mF2gVYj/4RS9YClIAc2UCQvIARjLEV3aI2@lists.linux.dev
X-Gm-Message-State: AOJu0YwJKn9eL8PtDWor20EX3SYvtLoWnJlmz4IG8upcEl/9rrRSR74r
	24qCSmwIHuCGKDvnwwIUnPsLlmctJi+3vGmhWzX7oMRovJrE2qv4
X-Gm-Gg: ASbGncuZTtqFW35spQgePBwTmy1JMHoLGKLv3GU/K4IDJsu2Aliy52L/Hb4p6R02/vv
	lFZ8WqAl9+BAOAuDdRcwIkpqLwoWZvLUWpzBoHw/i15AMo6p+4dO+o2xyheHZwBKlukqGfZ3moT
	piG96B6VCihmlhG7MLTuWTh91C2SzxC3i0AAC1Dj96xnBtWRxtU0ykW8JS539C8Fo/mSkoEKE5F
	vZUFwihtctnwyCD6vAwkzI7w4gksmBNPcK5Wroe8bsIF4itik2+oa36vtwDoASZvumSCQG9FCbH
	Y4Ce45O/F6CrsY0bJcISCLNzXWoho2CmWK7myNBI2gEC/zc4V9RE5HMMnunPeGiZPhb7
X-Google-Smtp-Source: AGHT+IHb3NjYrVANg26ZagShVdoKGIRlJuVLDWR+37VklX20Zc1R1eNF5zWcvKSl/YyGlsGRFAmRGg==
X-Received: by 2002:a05:6a00:ad0:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-734ac36d76dmr24341437b3a.11.1741040074184;
        Mon, 03 Mar 2025 14:14:34 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7b03:1e42:d492:fb71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7365e74d7a3sm1918182b3a.126.2025.03.03.14.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:14:33 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH] staging: iio: ad9832: Use devm_regulator_get_enable()
Date: Tue,  4 Mar 2025 03:44:27 +0530
Message-Id: <20250303221427.30964-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_regulator_get_enable() to reduce boiler plate
code.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 37 +++-----------------------
 1 file changed, 4 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 140ee4f9c137..a26d7caac131 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -74,8 +74,6 @@
 /**
  * struct ad9832_state - driver instance specific data
  * @spi:		spi_device
- * @avdd:		supply regulator for the analog section
- * @dvdd:		supply regulator for the digital section
  * @mclk:		external master clock
  * @ctrl_fp:		cached frequency/phase control word
  * @ctrl_ss:		cached sync/selsrc control word
@@ -94,8 +92,6 @@
 
 struct ad9832_state {
 	struct spi_device		*spi;
-	struct regulator		*avdd;
-	struct regulator		*dvdd;
 	struct clk			*mclk;
 	unsigned short			ctrl_fp;
 	unsigned short			ctrl_ss;
@@ -297,11 +293,6 @@ static const struct iio_info ad9832_info = {
 	.attrs = &ad9832_attribute_group,
 };
 
-static void ad9832_reg_disable(void *reg)
-{
-	regulator_disable(reg);
-}
-
 static int ad9832_probe(struct spi_device *spi)
 {
 	struct ad9832_platform_data *pdata = dev_get_platdata(&spi->dev);
@@ -320,33 +311,13 @@ static int ad9832_probe(struct spi_device *spi)
 
 	st = iio_priv(indio_dev);
 
-	st->avdd = devm_regulator_get(&spi->dev, "avdd");
-	if (IS_ERR(st->avdd))
-		return PTR_ERR(st->avdd);
-
-	ret = regulator_enable(st->avdd);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable specified AVDD supply\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(&spi->dev, ad9832_reg_disable, st->avdd);
+	ret = devm_regulator_get_enable(&spi->dev, "avdd");
 	if (ret)
-		return ret;
-
-	st->dvdd = devm_regulator_get(&spi->dev, "dvdd");
-	if (IS_ERR(st->dvdd))
-		return PTR_ERR(st->dvdd);
+			return dev_err_probe(&spi->dev, ret, "failed to get AVDD voltage\n");
 
-	ret = regulator_enable(st->dvdd);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable specified DVDD supply\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(&spi->dev, ad9832_reg_disable, st->dvdd);
+	ret = devm_regulator_get_enable(&spi->dev, "dvdd");
 	if (ret)
-		return ret;
+			return dev_err_probe(&spi->dev, ret, "Failed to enable specified DVDD supply\n");
 
 	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
 	if (IS_ERR(st->mclk))
-- 
2.34.1

