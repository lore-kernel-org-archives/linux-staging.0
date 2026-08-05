Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3D3C3F60
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785928874; cv=none; b=YZOzsnzEJhdg6PVUgdMIjuKpSGyzIjMT3o6aicYEECeT7tFXA78lv5IOKrLyeHJdahJ1/ymlZy3rprRwbwmJusO34kd8onE49opR8uLevric9ITvKNYBw36WnQtCI9yqoOWOdmDEVwZbT5cDPE/yr8bshzKwWgy9S2k+VnFw2r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785928874; c=relaxed/simple;
	bh=i7cJ3WItOXnznLVZRDOXLUAOINpUuL+YjVISTjP0qiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bhLxIdDteUvMuIstN5spxY9OmFnpCKyBLK80nhmdYQZx4G4uMnvh9LT3qUXct75FJjtNhyreDEULaCa/dLQ/2rCTKsEg5Rb9GTTpFUEouR4CuSGosrzK+9CZaiT0yLsbC3umXd4m8Can1gfjlm7auKXQ8TDXKG43ufdd6g6Gc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8bsJN1R; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8bsJN1R"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso827245a91.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 04:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785928872; x=1786533672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8URXW87BTcEyeGrusW01Botd2qLeyYetXeL00jvAgA=;
        b=B8bsJN1REEvxHkz8ckLVADF+mudUvYNNNTwd+NhiJR139T9V+PUYPpCx7qPS0ncH7+
         9SFVCiqxRQT/PHgTnh/qTumwGQ6OqBWHH8Nj7m+bolzqTTnxz2K08z8usEmpXw27GIrU
         B/uoP3jX+MRIqmTb5VtsIHAAAW1qShurOKtNT+sSBTZIZtVcmCym2tfrfztjtT9+zqeF
         dz4nWnvLeit5GULk7gRJKbRLKq3K5IP1sw+MNQYEUI1esGAmkAzdyMQD1mIi1jRkUvbE
         gBKvAWAnohQ+c7C9nqtqUh4LPv2YcXLg4A3HjYq3P3zuay5d13gfbUFPoC/f7P0CKxZM
         qGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785928872; x=1786533672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8URXW87BTcEyeGrusW01Botd2qLeyYetXeL00jvAgA=;
        b=mrWGseaH3llCZGmhgNeyQ1O8ZJ6GUPNQWLuld6YOWPoWrwbaemXMTy2Jvd7hfuMDZV
         6B8NCGD0D6urgT7pHJUd39EevbyXxUgJBz6CemANtZD0y/Abq17sa0r0w5FhUq9rSSQy
         xPgi7C/AHInfsPaE34Y0xzumchhCIwrcYYpVmZZ1ZyYtlvL0zPFiQ5oghryuTODFsIMW
         xIjGaJ/zIODIoGGxZS4xu9l9HGz+PdwqMf3bdhMhtp/mZbNNkjC0KapWq+PNZzn/k86r
         IyTvF5C0LsU+kT5o895cBPymwPGSgW1zo1oWDkhivhd54fxjM2ZNefpQMJ3q1JsOq/Z2
         76wA==
X-Forwarded-Encrypted: i=1; AHgh+RowwX913sY8YnX3WJ3Y/m3KP3ykd09W5fc/F4umNqI3ybQtFpsgJ37e2KIIEKGubQ+TQBA3viDO1MWrEg4l@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/XpqyL0ULJVHJaYIfYTgE+dlNLWjbKp0krnM0ncOL/0gxVLUT
	b/A00zyjFmuC5hFCEwnOJv29IcFcwfohzon5T8y7/24KVxJouRRRRH7h
X-Gm-Gg: AR+sD10ZL56cXFZkdQg7By+COdJn2CSPPsyi8bGF/KElnyMA4g3AnDCJguH4FQjYRwY
	FgsbnerhBG5l9yIfV5YZMCQI4LpB4FePfp4fO0PpMXBWEGHNsyJLLWFatb1eNQQT+Ve/RNuqJa2
	ZDf1L8dK898nG6RJE7jayCzKoA4XT+XEJw9dlUYuXLXsrnPMHPzYL5M0saMt4HQRV8AALbvkoB7
	ikdqZBQZjEJHaST8jt2rRVpTHtyzhwjRlzUdI6ftlcJcxiC2Tseaxqz62Y1mjcOeEbzFWJ5zT6a
	LVQakJvUoT2bDMcgjTmMqq9jC0KG/m+A1EOencb4RFwqsn+F+aB5PNizYCyaRSjy6foErxDwOt6
	sg0oK/o4EwieQvgzZl3DAtfn6/4buULW241xudLmOsYOh3u5ObYCYJ+lXsMnuIf0JUIKtjmGMyY
	3N85wfBxXl3zCednEh6DrK7eJsrnNX27qN3QwELm2P/0HmmrSCO0LH83mdIQ==
X-Received: by 2002:a17:90b:560c:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-3903c537991mr6370889a91.6.1785928872075;
        Wed, 05 Aug 2026 04:21:12 -0700 (PDT)
Received: from dio ([103.161.231.136])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863fd2b3sm16820648eec.7.2026.08.05.04.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 04:21:11 -0700 (PDT)
From: singh.supreet14@gmail.com
To: Viresh Kumar <vireshk@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Supreet <singh.supreet14@gmail.com>
Subject: [PATCH] staging: greybus: spilib: Handle SPI device types with a switch statement
Date: Wed,  5 Aug 2026 16:49:57 +0530
Message-ID: <20260805111958.114209-1-singh.supreet14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Supreet <singh.supreet14@gmail.com>

Replaced the if/else chain with switch statement. makes it easier to
extend support for additional device types.

Remove the temporary spidev variable since it is only used to test the
return value of spi_new_device(). Call spi_new_device() directly in
the conditional instead.

checkpatch was run, had no warnings and errors.

Signed-off-by: Supreet <singh.supreet14@gmail.com>
---
 drivers/staging/greybus/spilib.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index e4d1ae8308aa..53fc0c124754 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -444,7 +444,6 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
 	struct gb_spi_device_config_request request;
 	struct gb_spi_device_config_response response;
 	struct spi_board_info spi_board = { {0} };
-	struct spi_device *spidev;
 	int ret;
 	u8 dev_type;
 
@@ -458,25 +457,29 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
 
 	dev_type = response.device_type;
 
-	if (dev_type == GB_SPI_SPI_DEV)
+	switch (dev_type) {
+	case GB_SPI_SPI_DEV:
 		strscpy(spi_board.modalias, "spidev",
 			sizeof(spi_board.modalias));
-	else if (dev_type == GB_SPI_SPI_NOR)
+		break;
+	case GB_SPI_SPI_NOR:
 		strscpy(spi_board.modalias, "spi-nor",
 			sizeof(spi_board.modalias));
-	else if (dev_type == GB_SPI_SPI_MODALIAS)
+		break;
+	case GB_SPI_SPI_MODALIAS:
 		memcpy(spi_board.modalias, response.name,
-		       sizeof(spi_board.modalias));
-	else
+		sizeof(spi_board.modalias));
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	spi_board.mode		= le16_to_cpu(response.mode);
 	spi_board.bus_num	= ctlr->bus_num;
 	spi_board.chip_select	= cs;
 	spi_board.max_speed_hz	= le32_to_cpu(response.max_speed_hz);
 
-	spidev = spi_new_device(ctlr, &spi_board);
-	if (!spidev)
+	if (!spi_new_device(ctlr, &spi_board))
 		return -EINVAL;
 
 	return 0;
-- 
2.55.0

