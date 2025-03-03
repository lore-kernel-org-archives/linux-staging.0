Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A131EE00D
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741040529; cv=none; b=rriYcw6QVJ4MdhciSFi0B7yX/zFXZegJm2i848XiVxFDLunapnCEk1SJ7beQtle8q36oSvjfKqsBRQuDdbnvW7po5vAF910glLE7eLZFRwuDp31sCKm1FbmA04IUveB65m5OLpmq4z9j3F63rh1Nkfbu6HEMWCpOuVkJEuGOOS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741040529; c=relaxed/simple;
	bh=EF42/1BAIp47aMNnPl3OsqsgIgk+NQtbFmxeddW0ImM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u7t0sM7eYWR8vJ0suMjbZnahXBtmyqLNYofSQ9jmE1lsMR9VIq215fN0YnY7ptxx53dC8Iqcwga5/dR4ZqbKOWFn/e3VeIDMTh2+bG7T9D0G3SfOOzSkF/KqTmCn/y2RhpwES6LOjh1NZpmHJZ0TlIR+IyM4B0VI++kshjhjn1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHZHKP3g; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHZHKP3g"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22349bb8605so95907155ad.0
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 14:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741040528; x=1741645328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VXQ7tGOydqTSote4qX7wPBoBmkDsJUvOOycr5KGfYPw=;
        b=JHZHKP3gPqQ8YmYpyRHZifxv1ZNd6oFwX83OHu0FJCVAs1Au35748XEcQxJF28Vaqm
         2KQeCzV58HT2KJTj+Iwhwsbz1BT8MBuFfsC6TLQglS0tWSRjiPfyIBSLSpf2+TcEds/V
         hYGHSpZg6YXncflQjfS+oBDtHqtv8xx+/v/dlN0WUe56Jig/pINqxjAByMlvX4wB+2An
         xSM+6nq0h4c3clhF/vOfGx2dJVGIHs6TBd9cjhAQ0HjvthAa1t+XNdXKUPEqIb82ln5i
         HcDQoPVP32ADcYDWwR4r4ZkDLdiilV6f09w7Gh95t93kIcGyNyBD1NhTvxYt9l/dmX5Q
         gwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741040528; x=1741645328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXQ7tGOydqTSote4qX7wPBoBmkDsJUvOOycr5KGfYPw=;
        b=k+6FRpNtWO6os1xVmwVFcLyYaPmy3wCRH6llJbs3IZ3bFmbGsq1cYtDFLGag3YDkjc
         1CpeAvctQBJwOuOiyY5w8TfZvxuuXzuYI43abZNz9p8j1rRYO+xe6Nw5mUcJLpLZmdTF
         9Nw3qhgcfw+fA0h8fWfEVm3lVJjcV2BFz/wXtqFlquWf721fwnmdFYIRsTXpiQSZhviK
         UeM12sWjnamEWuIxE26i/MOuGDCNrTjWqI83djmgNeJet3H5MJ2YWnCRTQLr2DlwetUE
         pTf+kz6PR7ocEW8XQ+9fMqPdtJdJUWsw4ScJI/jgjCOgrFof7IsHaKQeLm2DPA7yE5CP
         xxBw==
X-Forwarded-Encrypted: i=1; AJvYcCVwTG53HDEs2xT2hB/8/78EqGLL2a4T7Af5HAi/7LK6Ft5s9dUq2LkdElHlj/0LpTDRnlNevDT1R0+Ru+7E@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5m0q93f5iTpDJbY9pVU4bUYuJIt+3OjMG7Xo52s10y3dewpNg
	4eq2nH4zdWNukHv+OXPUi4JnvOYB/VOJAHPGjQIFtuH5UH1ayQh6J4pokw==
X-Gm-Gg: ASbGncuCfbGPU6gXkhOhxFlKOnp7huKSOfnJT02/CongdKCkGU8Md2cmzLzTAcut03w
	RTwch/T9ImhewEtba5sj+TKiIsDbNLJn6yryR+8A+fBHYX/e6js+sSNJxti9+obGuJkMwdGq0tM
	ZaHfU6+w7laxhzZi/6ddFxdSWwfDXUCvLc7saj/8+R63nIPs4lufNYRCoKFUtSg7kWs5YTGHXas
	MUQS49GuBpxWZfOZczDPcfJiXfLvrHAAiilx5xIPQGNH2nH5m3QKsrObCfSZuaw1sW/tNRLHNNl
	Ok4REapDKZB7r+pdTynCOREFOOKwzScsEafortyisY7RIUDRg1qs9PJn92HHKQR5WJNb
X-Google-Smtp-Source: AGHT+IF1JzJ+piCUX6XiUl3McqssRafqYyNaw+avOzvMq6yCjPwL6azcpCCODaHmn1A/ZRSEL7fVYg==
X-Received: by 2002:a05:6a00:4b53:b0:736:6ecd:8e34 with SMTP id d2e1a72fcca58-7366ecd8f45mr1155328b3a.18.1741040527595;
        Mon, 03 Mar 2025 14:22:07 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7b03:1e42:d492:fb71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73519c31931sm7047531b3a.20.2025.03.03.14.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:22:07 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH] staging: iio: ad9834: Use devm_regulator_get_enable()
Date: Tue,  4 Mar 2025 03:52:00 +0530
Message-Id: <20250303222200.34339-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_regulator_get_enable() to simplify code.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 6e99e008c5f4..5da2084c46c9 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -387,33 +387,15 @@ static const struct iio_info ad9833_info = {
 	.attrs = &ad9833_attribute_group,
 };
 
-static void ad9834_disable_reg(void *data)
-{
-	struct regulator *reg = data;
-
-	regulator_disable(reg);
-}
-
 static int ad9834_probe(struct spi_device *spi)
 {
 	struct ad9834_state *st;
 	struct iio_dev *indio_dev;
-	struct regulator *reg;
 	int ret;
 
-	reg = devm_regulator_get(&spi->dev, "avdd");
-	if (IS_ERR(reg))
-		return PTR_ERR(reg);
-
-	ret = regulator_enable(reg);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable specified AVDD supply\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(&spi->dev, ad9834_disable_reg, reg);
+	ret = devm_regulator_get_enable(&spi->dev, "avdd");
 	if (ret)
-		return ret;
+		return dev_err_probe(&spi->dev, ret, "Failed to get AVDD voltage\n");
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
 	if (!indio_dev) {
-- 
2.34.1

