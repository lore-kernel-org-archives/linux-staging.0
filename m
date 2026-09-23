Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE50437130
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161683; cv=none; b=UvIBmgA+w91w3gN4P39gOgLB7iGf8AReu2ep28fUpjU/9Y40iRyg4apo+sUVPQa6gkuGIBJJk3H4YekAeskFQHLS4Eb+f+tNqilvgyKunYMu2E9vfSpUNi6m9c5i1i8ngFS8H2WOa2Y6TMH48OALwMgzYtVbf/EV5Yl7Wy7ZyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161683; c=relaxed/simple;
	bh=uR9Z3Kd1DdLjQLugXepfRWORJuTo6E/tpSeDtpl+3q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ty0xpmCP2IxuJqiqTgva3FiNNJhlZXjP7GIEnnHmRNRSfGHevzvLpGsHXDqZWaNI4YxRUs0hqH1QKCKBps9vWn4TC6OIHZ35NoD2MYMq8vDh0stR2kri8dnoE17DRvfk87ddRbzLpsHgMF0ylW1+mZ6/0abCJOCvZYHAH8j4FEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnJAMmqi; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnJAMmqi"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so519253f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161680; x=1790766480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EH3XZfcX8POgQQ7VhCMA6/ybLgk3CMK1ox0kamnJcns=;
        b=fnJAMmqiGcyREn/hVQ6YR3fvJkw0p87sOqM7m8MrwY3BFAaCNr4LQehNIhVh+s6HhI
         vh3pZcP0E4+whqSKKs7W2CEQiyzQ/zqi9nvuZovobbuaXCyOVMwRKwHYeUIabOywgKKG
         1L65+RpZ//jB4eXTBl1g3WAtm+YR3luXOCMXWzehAdkRITu9wCBOxv4fGK2RwZ1duUHG
         Zr4mBh7u82yfcWYVczTNa+I3aY0WM0aKu3gDdF9ZvJrolEM8PD82bUHjnJHprBmkMgcq
         PsktvprzuTBYnymGSk4ZXzv2brx6kyPUEmzdqy84OU5EI+YrjcWd0WdEYoXYH9ULcERl
         hpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161680; x=1790766480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EH3XZfcX8POgQQ7VhCMA6/ybLgk3CMK1ox0kamnJcns=;
        b=vhm5mJUrm2BjIh4XRrs0YsLa1Ns/LFXTUogpT9JSmY3QamZWCtaW+IwJBJyhZsjYkM
         P1fhHzj7fYQqn9p9YlJhQnuNBSL6QwCGvaooPiRqjSJ3Ku44rg/VoApL/bqGuZUPX8Pa
         HaqHeBgbJnikZumP7g/tf6tgGYjAuHNnuXUKWZupG6bCwOSsWqypba1+Y5NuKM43FRTC
         HXHr78TT2KRxymGABfTHZsf/CZpCk2NP6YHvCfNoI41qQ0OqL94mlMADokaYy7p8DbKq
         Bz5sMb5aGRBNTDr0Cg9WJjlHqHsRq+Hh7/SoiJwRSxtqXjxNwPYEq1+nqdKFDTnl5YMb
         V4Gg==
X-Forwarded-Encrypted: i=1; AKwUvByqUNAth/UBrVUi6cJJgq2TL00yZPYb1Rd36B2VbEc834CWfR7MjdpaJtwE1A+h07DudMxi/p+7V4o4okqT@lists.linux.dev
X-Gm-Message-State: AFuF++lEHDn4hmpHICNcKbKHfmIelHnsgkLhdR/uDDLkz27hl/U/aFWS
	huLoaOCN7gIUUIFssg0ql3geB+NdPabSWiONo74bLZ/KaRO9+aYlA4kV
X-Gm-Gg: AYBFou1dDV339X7zD1tIv3pklrYvO0cOj6UB9LWvc1oD4I7MvkFpRQM2LKMa1yFsDYi
	mca9TM4QPUay+xDrLMqYBlwhN55fglzKJMY0LDQXOS/ZzlaNraZuuo7Eun8k3YX1/AedRFwOOY3
	XjXKJaUWB3aTeFdriUwkVxpTjO7uooxkVX+qIFhhizFGR7NLTtuJc51e8HQVJr1Bo1387uRnTHW
	NjWOvlc+E0mjuINgVpjH4DZx23/9gf44U6P2UCfpfF8VZW4BJzXYxW62t9pV1BqUa6Fc1Yf6jd8
	R7MAlTx1d6UwBNecAOnHYuvQmDweXRh8aJc9Dm8oludjBBqZdo0TcIxsQzcZt1N4YQXZfeWCVfs
	NLmH+ZSklCHP8S9zTv1h1kpn2Hs27KuExo6cs/1BklWavJY7JPqajLoeQV9K6rzsZjoAK0k61fp
	v9OEmnlvoOY+bJ7HozsUU1/DBTPIFHE+rVNzdNn9Hctz4cD7BEDYkjch4/nUXmiRVv8Ktng4uNP
	UnqEhibB95Hd3mTJypwaA==
X-Received: by 2002:a05:6000:144d:b0:487:342:d142 with SMTP id ffacd0b85a97d-48867099f4cmr4203461f8f.44.1790161680282;
        Wed, 23 Sep 2026 04:08:00 -0700 (PDT)
Received: from fedora ([154.182.121.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682676c7sm5892418f8f.3.2026.09.23.04.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:07:59 -0700 (PDT)
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
Subject: [PATCH v3] staging: iio: adc: ad7816: Protect sysfs attributes with mutex
Date: Wed, 23 Sep 2026 14:07:45 +0300
Message-ID: <20260923110745.3836-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs store functions modify driver state that is critical during
SPI transactions. ad7816_store_mode toggles hardware GPIO pins, while
ad7816_store_channel updates the internal software state
(chip->channel_id).

If these are modified concurrently by userspace while an SPI transfer
is in progress, it could corrupt the hardware transaction or cause the
driver to communicate with the wrong channel.

Add the existing chip->lock guard to these functions to serialize
access and prevent these race conditions.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v3:
- Expanded commit message to accurately explain why ad7816_store_channel
  needs locking to protect internal state, as pointed out by Jonathan.

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

