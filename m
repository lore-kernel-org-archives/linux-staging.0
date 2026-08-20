Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63824415B68
	for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 10:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221980; cv=none; b=ad1dK8IE1s+7GrtfYvFAZCuJ2uOz1JOXfaRebQ5VwoJ1mgD/irjWzfiWFeTFd1ruT3mIMrmfVvCpPWGhhhd7Qit6qm9gLPDH/OKMR/iTtANSR8EvQ7xtGyb6hWuvAVMK5Pv4v38QEF9dK7EL4x3BjsRCUHBoxLeId/1YoiaDrdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221980; c=relaxed/simple;
	bh=rU0inurGfuVNqiivnFFxonhbpYxf2IoFX7ZqKOZ6q6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUQ3iGCbPN0eCJVEb9LHOfjvFlFdk8zR10h0dPzbGg/j5Ar4Jfe6WdXaCnXVLMAqJZyEhZTF0I7+XH9j1pN07hF5Iyu2tRDs96zXsactxI2EhF/src954G0s80A3v86KiQ81NSYbEeG8ClP3/yJhLp6xmgV07j+zSqhh8Z7bQWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZeFYkgR; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZeFYkgR"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e08baf860so2098896a91.2
        for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787221979; x=1787826779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJMXBFUIIiKJNcYXXTC8I0y6i6qk6AHSMlYQbxaA2yA=;
        b=gZeFYkgRhks1EsrIhxCTbMmMXtlt4y0v0KjR5umdowFUvGoapZGjr6QhF1QXDTevpx
         VeOzSn5k/UUaWUnFs5jSwTUKZG7UI+f6PrSgaaS32GtpKbU5na/TNR+N8NHhAAjP7abe
         zA3g/uxerqp4xCLignDZuBvfC70ejpjdNsYzwe6awzvPNai4M+2uP0agVlbr4xT4GdsN
         3vs9I0is0GNsPCup5LEmW0qFkLDjObgUsHuLLPyTb4x44/mGeFY0zDWQ5ZtLEwJhPoev
         bJGuxu9pStZFyqOEWvgJSX0T/H7pEgaTS5gIQg9+8za/m+Pa3qKjhP//d+gGfCRN6KLk
         96Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221979; x=1787826779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJMXBFUIIiKJNcYXXTC8I0y6i6qk6AHSMlYQbxaA2yA=;
        b=ERPuXwuyox+I0n+Ta65V1lQ9ZTDPOcR49shaYNcpx6YrpjpHoYGtPuifxRZ4Qycur/
         /XS9fTP1Yw53g6bLte0QhAZF77WMS+EeGE/4ZNzlU0HkFC2sJARzIZMDBXty6bqlM2gi
         InDbneE7CVyhiwUV1L7YItiFyyQTkROeXX4b7gVUVChVGiWRhJO6mf00lw2wgFNop9Nc
         s/Yxlrb5KYuABYQBUdR/Eere1bFeQTB5l+05m3q+VdiWjWGF1wUZvDpJk2EKG0PdWANh
         miaeOClezn02AHW+tYq/RnRxywuu8LshOTUXd1Womk/6tGtdH4fkMkoAdGTLeQGpk0XU
         mjkA==
X-Forwarded-Encrypted: i=1; AHgh+RqprwZF1gVNrdnsHKaZ6Gb7CeuYoSj9/r2fhjr6PV6DCkwVyy7U7Ce24bLgimOONOL/9/uuMo8BjqY1WxjM@lists.linux.dev
X-Gm-Message-State: AFuF++kdy3j5WFLarf8DtYXPD8O2fo1K7RmvOPYQJshOcDdgvCHQDRlL
	vynPpCO74P5bLuDzdME4GkPWn0YvZ7I1A4CDp47hA74aUVquz5tWnwL5
X-Gm-Gg: AR+sD11ndll+KtrWljOMGtGF0X0GivWnZgwjl0rNtPKT8Ndya8JCvpBfHyTTOIpoT7a
	NxBkagXz25ZzDgUYki2PxcvimPGmnc+6gbR/PU9wRRNh71GUQCeSLXJhDYDC7xdk6jvNJS6mGdN
	C6kj5WtDxhRuwWlnPmWkR+vzUa+4rRXGE891L7rqE1hasGrRyCK1VqAfxJMn25BUGHPOGbusRkK
	yRBn0cKjtrhTU8PvDtS+rMU9BNyG2mCSEG3kY+ekS23/fBMNa7t9fmHcKs/0ghaULy+7i+JbzHm
	DTutoIqLTvc+kWTTW/J3GUWd/xfDA3oQqUcwpH88FbLXdmKpgpXeKJtCwUarhirdbeB77FAEknJ
	ysCJEd+7kBoQFPmUmRmIzjLf5qFzOVlXkES32KhIgOzLiXggZWKV9UUKBuqKlX4jS7TgckucRFu
	e7Qzo+zxKu8TvfcDD5YeQcpSb867g9umeDqJjNSxbrhe+cUdP45H1vhzyFiA==
X-Received: by 2002:a17:90b:5250:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3958125375amr23371093a91.14.1787221978516;
        Thu, 20 Aug 2026 03:32:58 -0700 (PDT)
Received: from dio ([103.161.231.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad3dd15sm14130550c88.2.2026.08.20.03.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:32:57 -0700 (PDT)
From: singh.supreet14@gmail.com
To: Viresh Kumar <vireshk@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Supreet Singh <singh.supreet14@gmail.com>
Subject: [PATCH] staging: greybus: spilib: Remove the local unused
Date: Thu, 20 Aug 2026 16:02:35 +0530
Message-ID: <20260820103235.12306-1-singh.supreet14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Supreet Singh <singh.supreet14@gmail.com>

The return value of spi_new_device() is only used to check whether
device creation succeeded. Remove the unnecessary local variable and
check the return value directly.

Signed-off-by: Supreet Singh <singh.supreet14@gmail.com>
---
 drivers/staging/greybus/spilib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index 39d5bf234c61..0e8711fdc429 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -444,7 +444,6 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
 	struct gb_spi_device_config_request request;
 	struct gb_spi_device_config_response response;
 	struct spi_board_info spi_board = { {0} };
-	struct spi_device *spidev;
 	int ret;
 	u8 dev_type;
 
@@ -480,8 +479,7 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
 	spi_board.chip_select	= cs;
 	spi_board.max_speed_hz	= le32_to_cpu(response.max_speed_hz);
 
-	spidev = spi_new_device(ctlr, &spi_board);
-	if (!spidev)
+	if (!spi_new_device(ctlr, &spi_board))
 		return -EINVAL;
 
 	return 0;
-- 
2.55.0

