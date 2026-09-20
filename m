Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC2D28CF5F
	for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895745; cv=none; b=olI2Lu7Hnfofob1c08nzcWf0FY9Fa/Kh9abWZnZcdJHXOBeU1vy/+WucR/S425HmqwUbpNCmEKwYc2GCYh0EVksvxkaSBTrH1xNdVsD8lsth/kmRzqyQcCiIhMsmU7L6pLhdFW+EvCRqNvcjDItScnrs3fr8yeSJcx0gm7tTd5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895745; c=relaxed/simple;
	bh=pNEWE+topqr1rhpsk0SHV4F0J9u5bipTgTSisRc3TTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BaLzOFPwVtJK7KGSkhdcTjM/lQDTCoU05gUllXNK1A9Jt3e0rkG5Ou+6jJY0XZoYxMI54IwePadcFh3fD/bzS8W6KUfbOGjQGKWQypL8IiQzHSgS4rOoTUv66FCAUY4z+7W12ppDaZeLGXunRtaRPzWYJwdFvvgTQ23ExcsAn+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohCeyArN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohCeyArN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso17200605e9.3
        for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789895743; x=1790500543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E1cW/zqFKr4VTXcMiUtx8FkhmYjSXHe8PhD59Qq3qEY=;
        b=ohCeyArNpX8wd5yr3nFBuuqhnJEF4hgyZOEL+xmxn67eso6/X3X1pGhnUoXwcvh4dD
         TC+s/4+z2wSfZHwh8quy6yq3xk84dM8GWiBRmQ8OJb5NpDqVMZ1ra7nYxUTNgoOz0QBN
         pui1SyEl05K2WcAVbsBVfYVxSOgG/A2NT4ca91gRzn4zSabt/5hByjyI/HguJYho9loe
         Ziwwv2Yse3L0gC61ooiQkEB/hITKbfnWHLfTHqAYzPKtxZJBYFD23UNfcVUDZo0ZDxdn
         ZwFSur0kpzSr/xNcRGnvUEm9NKltMk7K4/ehVpUnWX1JB6mF5U/bCBolatwNXXIgrprA
         l3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895743; x=1790500543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1cW/zqFKr4VTXcMiUtx8FkhmYjSXHe8PhD59Qq3qEY=;
        b=MtHsHbFXWVOwJ9OhKCMaKtFodTbHE5UB9K/of+QDgz3RcX2K8jPMwTmLDbp3O9r4Yc
         oPV2h/wyEthf6jxTSnvCU7g98+AGuHc8X6ZfZLFW/t/9kQgrM6Tir6xZWR6AyctBA4o4
         Co7iwBIEjeGwktP0uPRiWlfomJIYW6QKp5JhFfKQoKG8d+yVl6/wybTaKcXwDkvt4hC7
         7xOyw9jrlmNbNZNbDtnuSOwWuAJN436Hd1Ec/eUDMFf/UMvLGU+2Dx2B+BmbCprMt8mP
         EdVC6sjA53ldlBxUV1w2AkA9iNYERnUxBUNck0ACH9ciQfPTXKc2KSWUzOqo5Y+5sJuJ
         qIpw==
X-Forwarded-Encrypted: i=1; AKwUvBzGCFI47lfMcwLKTPf5ixO/RJK3sLytfsFj83bB2Hwy2//wliTltFDBLgsIzMM1akW1N3xQee9DuSRi9Zsp@lists.linux.dev
X-Gm-Message-State: AFuF++nA20xDeY+jnVdRa6CTGgmlKoryelBH0O4ALqcw2izVjVSZqjG5
	zimLNbHUnAN/C2nMxg+bBb47bUk7TE9cgyyHEjr8Z0SFZV4q/mZlvPOd
X-Gm-Gg: AYBFou1LSjZnUv75hAsW2lYaI2APKINkdsbc2vtV49QGyynbi/9IMovgKr1SbGRfkxT
	EkTGiZ5nY+xa61gUJ431OqQ6j5fIpZ9SNa0SvB/q6d0mnIcYEGY1o094CivUfVL1i2u3rEMORlq
	QKGNtFjCizAlXaKo2cHMqiafxJtydtAnhITmExcPAQBN9d3d4oPWxmRzYuKOp0l0POd8whhotpm
	pmfLs5WfImHVlWhZA+yTt2yhNlsrrljtBtSgPNOEVvVfvhJvfaAMjukC2F977ZgGZipM6Waniqd
	krJPlvBxCzP1fzmxJuZzsLTF0wvMG4MTWF/8T8x+qpCEevS+3911FM5ZqoiJ0YPMgQwyhMbIaEF
	Ah0/wUyZyzSx7di1g8g8ABR36od8X57Kw66T9SYozsZ7ZU+PaJQ2y61o2N7F/AyHuPzXnZYsLw3
	sOq8u3sAHe8nXxBYQZ6GsTIXPItwNw07K3EDFlpD114+0rhrvM8lJF/iwtnlncFGOptnTNYhAlL
	a2YZqBC9suCyUAnG6aByA==
X-Received: by 2002:a05:600c:3586:b0:49e:7d69:83b7 with SMTP id 5b1f17b1804b1-49fc56f7376mr130239775e9.13.1789895742442;
        Sun, 20 Sep 2026 02:15:42 -0700 (PDT)
Received: from fedora ([154.182.123.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0ece6esm185953065e9.2.2026.09.20.02.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:15:41 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	error27@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v2] staging: iio: adc: ad7816: Protect sysfs attributes with mutex
Date: Sun, 20 Sep 2026 12:15:22 +0300
Message-ID: <20260920091522.15507-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs store functions (ad7816_store_mode and ad7816_store_channel)
modify the device state and toggle GPIO pins. If accessed concurrently
by userspace during an ongoing SPI transfer, this could corrupt the
SPI transaction.

Add the existing chip->lock guard to these functions to serialize
access and prevent race conditions.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v2:
- Added a blank line after guard(mutex) statements as requested by Joshua.
- Added Fixes tag as requested by Dan.
- Collected Reviewed-by tag from Joshua.

 drivers/staging/iio/adc/ad7816.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index f76f0215119a..2a15d7598abb 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -143,6 +143,8 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
+	guard(mutex)(&chip->lock);
+
 	if (strcmp(buf, "full") == 0) {
 		gpiod_set_value(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
@@ -207,6 +209,8 @@ static ssize_t ad7816_store_channel(struct device *dev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&chip->lock);
+
 	chip->channel_id = data;
 
 	return len;
-- 
2.54.0

