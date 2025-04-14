Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6944274641
	for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644793; cv=none; b=YV0hs0HnRX0riedgy3wJGXEDH5IS+m2eiTc+M6Vg5RW7kbnfd3ueFveEP1sTsUI/b9xxDcNjn1tTc4Vg8edT+fuT84JsR8YRrFuhzWWMYKWSGVzFiExtr8YPtwWHPfwVPFvqG/zu5W79sepUXSrBvi5uuYNPhzEcvIkA08HfwxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644793; c=relaxed/simple;
	bh=Shx9w5ToVCi4sff7w0CjLM7Z/phSkqNv+tYwUPKOOTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nKshjovJexVIS2/YhQP7WZAXFgI166t9yKLuqKfp5cAtwU8nYR5vLjq3es0cPzKmnD95TrIJrvw28NTd6ivY/bWOFmU7m2Itq2M4WH9kXyIzAwBns19VAY4DuaA5GpQbiREF44UWCX9MA3R49cPAL+WHq+XjQ4ZuE72FuJZHMtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIfOAHFe; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIfOAHFe"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47692b9d059so58256111cf.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744644790; x=1745249590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mqOeOTVBHYK93IJiadkRz71/O+ouQlq6IAs4FzVsl24=;
        b=AIfOAHFezBihjdtpwjGeGRJHjPcnKMrSpowX89E0MbXEEEiHwdTS+JQbkGlAvLLjKC
         vk17gYyDJeajBHxhLL+bM5G2IvNSgeET+saaVzuDmYMoWYoTJPTt/BRaNAdFh0lm7aB7
         G4insEzZVpF/ixEgz3FbrewSDa9h+Ia3nd1LzXDIydokkKQAURWq91KFrfKMQsaBEa1x
         NdTbDCKFROOKE8uLLdvbHl/++eeDsugE9q98g/pG5cydYnF5BJ75iYWZRYDNpoorfEii
         +e/gJh6OqyVtZDDt3yVdrNDYwiS9hdgjYCxwa3D0tU8YSX3lIvJeuz594/H+i0WH0nDC
         zTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744644790; x=1745249590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqOeOTVBHYK93IJiadkRz71/O+ouQlq6IAs4FzVsl24=;
        b=hY8IOa3dP5vukcD6UObRMDGS/k8VElILjgBKFWouqan01GqcUNUJNIOdfdlKZHkpnW
         QG6OA15SJO7LVQmWehwswOi8hlXDFmYzVJ3nx+i+p5bm9QfWEz+HmK6LegbhPBS+IUWV
         r2IPbAx5PhYIg8uyZkYHy6efw/8oXPvBR6OSxjdODPWS54v3tdFT8f0kl3A7h9aXVRaz
         VhHqh7Mg/V9ck56X+kwRmuh5eANNbxRW7BoJykvcQvDrRx06wO/PB6WoYxGnkY3jQZtJ
         H+ZHx1w1LZyIompMI5tvBzkCROlmWRYyaI9MksTt5t/Sczf5bCQCtTa1UKBIXSf/wnPV
         3H2w==
X-Forwarded-Encrypted: i=1; AJvYcCWcF/ry5X5XgNclTW5sW5eoagC5WPkIk34RI97wesyKnt6/FUBc0LD7XbIYwWPsvC3IR3TrUVJOS1Vctwef@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3yFHWMm2cFdIiyvncrHaMDfCtJATBVoWbBfa938MQtbFnUUIH
	1lnSpG14UkoVhJ77QZs2laJOAnSGU88yVHnaX1aVyAxkTgmVCilC
X-Gm-Gg: ASbGncuiPQbL3VCbwUGn6xZCJ49YXsHRNGcUS/HMEzIqCSrfhmOQvjBMbLslRAtw3p3
	oasx0JJGB/hDziSVNjN+dYxv9MPMzKp8V1vfiL8ajF8iEKvUW54eSA9ltaM7IXXT4MMhPhPaTjI
	sLETTVFmQ9Xqe5FIqXq3XCTSBqdJLuW9THuNMkqvXzzqbOo1g0L0OLe/mQC/Q/6BbnkR9PCOwgW
	1eYOPiZNNBk/FGPE0di3KbRLp+xddwRvhTmbOfFbWafMOIuvai8OXBKR+3GeOshj5FRMdQmHMll
	o5cm7fuPNa4asLYf2iBwYyFSX6FfEMM+evaf/LdApbk2zdIEXIUx3RuA8aZ7/LKg+37jAGMWcht
	KibW2PkwK/Gn/oEycBro=
X-Google-Smtp-Source: AGHT+IFCLt0ApqsTq3XSso3U4ONT+jE0KrQ/fisUlyIY/KK1qUJCT+C3nq/DixG4n6Rq/m74n33oeg==
X-Received: by 2002:ac8:7d43:0:b0:476:91f1:9e5 with SMTP id d75a77b69052e-479775e989bmr229803901cf.50.1744644789837;
        Mon, 14 Apr 2025 08:33:09 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b26fsm75956541cf.1.2025.04.14.08.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:33:09 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	kernelmentees@lists.linuxfoundation.org,
	stable@vger.kernel.org
Subject: [PATCH] iio: adc: Correct conditional logic for store mode
Date: Mon, 14 Apr 2025 11:29:20 -0400
Message-ID: <20250414152920.467505-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mode setting logic in ad7816_store_mode was reversed due to
incorrect handling of the strcmp return value. strcmp returns 0 on
match, so the `if (strcmp(buf, "full"))` block executed when the
input was not "full".

This resulted in "full" setting the mode to AD7816_PD (power-down) and
other inputs setting it to AD7816_FULL.

Fix this by checking it against 0 to correctly check for "full" and
"power-down", mapping them to AD7816_FULL and AD7816_PD respectively.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>

---
Changes since v2:
	- Add fixes tag that references commit that introduced the bug.
        - Replace sysfs_streq with strcmp.
---
 drivers/staging/iio/adc/ad7816.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 6c14d7bcdd675..081b17f498638 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -136,7 +136,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
-	if (strcmp(buf, "full")) {
+	if (strcmp(buf, "full") == 0) {
 		gpiod_set_value(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
 	} else {
-- 
2.43.0

