Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C224EF6F;
	Fri, 18 Apr 2025 20:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745009435; cv=none; b=A4ZYof/JAcmuGX+Npzr0AmYf0B+JmHCmXgWtjt2GuD9scg8Yo9Wq2ITMthfPnu4Zd9+39ekd9FEv7fUiYxatyqyiMGu8HDONFFbbXMqXFpC9p4BN7edyYg+mOfID0JnkxkvkinxPOUB66zkgX4KqqLfuFQas+PqOsTme37ZFSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745009435; c=relaxed/simple;
	bh=IeGkgU0YBXtfAvHiWobFFEYEFFchmZKYlSuvetJAaME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLFTpe72vzxMOPPtmz96dC1wV8ouRmBox5UOWreMlqObsQ0lSasSpt24Q4HI5pqK4mWxYI2ADT8muucHICdPDtJyrmv+cqRiLoeLREEfAY0YOJbwV95R9Og9p3+qAyVGcfVHnTCtSbe4g9uM20mbBHDsmDYdIe4fGxl1zZCh6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuQBmE8c; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuQBmE8c"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso10070216d6.2;
        Fri, 18 Apr 2025 13:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745009431; x=1745614231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWMbB3RCjLtzIka1EeVCBu0jLU/YK5i3+0Q0+aZfr+E=;
        b=WuQBmE8cqFIzymvmIQw6/XVAmCPNZqPZknZIjzVp2u2g9M6szLpuqI7CZiwjS9MAzS
         bgZJyzyaE1e0qrv84Nk0LP5ZmXsO873ofPqhnpgqvLTIurrHLIRRVxIuJkM9jntxzMGE
         qy3juhbF8jRoYEr9YeGgw+ZQFDmKYSNdGz7Eh8HKqZP9XkKEmxOu9zOtmn4htc/wA+L4
         lYsT8mhSk4d7bKnabde7JohUin+qoGvZXzGZzY1YjrVP5F3TrjvWn+hDsSF4gOrOeo79
         Lcz46DygcROEWGcoN/1HarL0clbuGxkeXVazYL8FKvqLPoQ36OKdpufAam74/Sy2/XRo
         fwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745009431; x=1745614231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWMbB3RCjLtzIka1EeVCBu0jLU/YK5i3+0Q0+aZfr+E=;
        b=bvoz3wSdD8wH0TmIAhoRe4brFEhydE/bnxwkZPzCHH5Jg4ctkc7/C67zjRFNDryrfk
         Nh2a2lY2pQ+LHCz0gq1mPpdQujdXZilQPLOyS4winxu/chjN+PerdHRDHRXXlSOy5ipz
         rEGFTcXqFr3LfaXwGzdqrFVyu8FxHkdTMU9jIeBh1P1LZ8l3iT6kBiv/Nc6qZaJuDZam
         SpQjc/Tr57olE3hdA97UvfCmXE5UCL+GtV84KTmQo+IuaunZy2QQfH6cBOYoB807co5G
         DGw/GBLb+mfLy0U2rPMqu/xy7m42B/A+tQY0xstdndU64efhpofYyK7ktRrjHzSdXwrY
         7Vhg==
X-Forwarded-Encrypted: i=1; AJvYcCUcxZn4eugEnmUIMIkd1aPCFHCamo1qnyD/T11VFP1emsjt2bCx7fDAbFM3GuF7FDMS9oFnnNiZqEen5rsylA==@lists.linux.dev, AJvYcCXni42OO2vDfmMxsq9LYv0KJ/n2GpU1p93I9+Vq52U89tnQwEA24OCKfEY8shg0AV3vgBUJ1CthXHrmUsHviTGzh+7CFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWtQsInnPk2SkQDBVQPHaIZUzM2rkNzqt62Mn7TYYX7Lhh0Qly
	4AoJnTNKQPQ9mjUWp4EIOW9R3KRca68m9UKgfvoW9HNu6ReD1ox1
X-Gm-Gg: ASbGncs7CsxD8NzXhkgvel1pTRWkSFhpESnHNjzVQHgPR7Cj5lQXjQyHqE6SidnlP93
	ETk8uHL/5wZynCVeY7yrEYq4JAftbIiF+hainTG1CRlKLPdfuL5z3lG/S1YwXPeHnPu4FB+kBoX
	oeBfT90GUWU70pgYU6uTfukuGrkDavfKhiHBdA+4+AP6ZuESzZlWG7mCIDeraH6MsMtqUE3+qM+
	xmzOlDzgnzIokvDPUXLAgX9be/vomYUYLtqBxVbKVDm1/hSl62sJapnVepabSLurP/FYXYFEhEh
	sGr4Bfj7qFwmusgfIHYSTE3Bzy2nCu0KstnvOcJ0RtNzgE2PVuHub2xY+r6X8NLloz/Z/uqkd5Y
	AbCWuQYswJFmpOBZgGXLi4mZerlRoeQ==
X-Google-Smtp-Source: AGHT+IElU1Yd0E+W2DyTMMcqARRpEtHiEHdV9D+YUDYwkXUwZpUeb/KR+3XphmY5lzjyf9I57bJbgg==
X-Received: by 2002:a05:6214:21c1:b0:6eb:2e88:d47b with SMTP id 6a1803df08f44-6f2c457c2b3mr62600776d6.17.1745009431639;
        Fri, 18 Apr 2025 13:50:31 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af11d7sm14355906d6.6.2025.04.18.13.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:50:31 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	sonic.zhang@analog.com,
	vapier@gentoo.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 4/5] staging: iio: adc: ad7816: Use chip_info for device capabilities
Date: Fri, 18 Apr 2025 16:47:38 -0400
Message-ID: <c7866788ff981077c092aaf53bdb0d905df8bc64.1745007964.git.gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745007964.git.gshahrouzi@gmail.com>
References: <cover.1745007964.git.gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move device-specific capability information, like the presence of a
BUSY pin, into the ad7816_chip_info structure.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 39310ade770d0..ab7520a8a3da9 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -44,21 +44,25 @@
 struct ad7816_chip_info {
 	const char *name;
 	u8 max_channels;
+	bool has_busy_pin;
 };
 
 static const struct ad7816_chip_info ad7816_info_ad7816 = {
 	.name = "ad7816",
 	.max_channels = 0,
+	.has_busy_pin = true,
 };
 
 static const struct ad7816_chip_info ad7817_info_ad7817 = {
 	.name = "ad7817",
 	.max_channels = 3,
+	.has_busy_pin = true,
 };
 
 static const struct ad7816_chip_info ad7818_info_ad7818 = {
 	.name = "ad7818",
 	.max_channels = 1,
+	.has_busy_pin = false,
 };
 
 struct ad7816_state {
@@ -98,7 +102,7 @@ static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
 		gpiod_set_value(chip->convert_pin, 1);
 	}
 
-	if (chip->chip_info == &ad7816_info_ad7816 || chip->chip_info == &ad7817_info_ad7817) {
+	if (chip->chip_info->has_busy_pin) {
 		while (gpiod_get_value(chip->busy_pin))
 			cpu_relax();
 	}
-- 
2.43.0

