Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEC8255E58;
	Thu, 17 Apr 2025 17:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744911229; cv=none; b=rryhZvk8y1QL9PW7E/KecQ0XtpKIiGT/S57w+N9zBPMGpk21RXVgnaVslGtai9tJfBkHIq44yIVhlAl9oTnUUqtKRNoT/VehsNjPQ4OxUopFwF+2fPwnyE9SOcFJfJBa5JUTMXAaZZrpUriZ9yXD/9OTosTzZF6KkWe61+I5nyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744911229; c=relaxed/simple;
	bh=B3oiwQ06L6toD7AGLQE3aUk9GxID3uGGOBMZ1m/kEz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=INeq+dc8klOOyOJjVr0mHITwDuB1Z2sg4uBUb90aZfj+9KSh21LSWj8UKzc0fvkzBe3vcdf0lluoI6mpznUME4nVwHy3c95YfXPxlAWz75SsBJxKxjZWaQn8p1ebBktbcN+D744mmJh/REWwebfZX/BqPKhr6ZQRVW16+3jqpoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niaevJ7v; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niaevJ7v"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ed16ce246bso6157026d6.3;
        Thu, 17 Apr 2025 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744911226; x=1745516026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G1UCgSsSJ9uUnGpJjZsHgiNtHFzddYOd1P3ndYRWxOk=;
        b=niaevJ7vSjvr7/Oqy2mi/NOHa2IYcf56ug84hnAXtvYOyzPjMtj765WDTjz73QU/Iq
         l+760SgdFeRO9B8srFbN3TImhifmtqanJy+iHc8SbL9e9+/qXxMqslEsYkOBQkvuIATm
         GMSBrNkHxQizal9ZofE0gwdcPeojBfMZ4s6nv2DgJ7XiYKKJSlCiW4h1FwdR5EWZSDa2
         dBN8F+WBA7Rg5hI+HXmyrH2AeSS0GgUwswEz3ImRgD/RkhxGJYjv6FGJ9Rln8Q5Ff994
         6ceCXv0E3jeTBSpvYrc2JIKbtMoWHQ44rnqxNHYCA8ucWM5IkHDNFaEi76rwU6DQI9mh
         Azcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744911226; x=1745516026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1UCgSsSJ9uUnGpJjZsHgiNtHFzddYOd1P3ndYRWxOk=;
        b=tANr0DdAFIVfRqZC/GMJTpdars9M6oTufA24ZWis8hvNrOBRlrKkX7CrXHaSFy5NAy
         Bp2+KHwMgH9/jVroVze5+5cKNvxrBmiZZwwBwFEVPydLKLfe8+rhi4HlXp3FokUlxV3O
         +yWxQXm2In89E+AmtXb/itBkO2BuV9ladLNiddxs3kU/mX7oAuyhNfCSWZIZz882rWcw
         xJm1t1gkI4LvxUmFr51TmB2Zb8IHPquKt7VZyd30q7o46lxmcMgmwnrQt3FzlQ51HT4X
         RfrTkpjDoHUQj9wGstVLt7CWUibeL3uIKOqBPrIl8fGYINpsQ2ShLoTWXNk61WGPquiy
         6Qqw==
X-Forwarded-Encrypted: i=1; AJvYcCWzOq6ohWkszfrade/abjuxT/XmF/ER772mxHtEcup+Xgow3IEXOQvU4hyZzH46QU9h2yahpT8Omkx832efzb08MjNeSg==@lists.linux.dev, AJvYcCXr62Z2BxGzsDMhFs+HWfvhbxzg1Y8nXTTsLe/1lrNHa7vT5L/x0jTwPOsDeRjTCGkcawE29vlJAa16mibmxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWrlg+NG7ym/roBYOn0rud0QXHKyaECuAPMGbnwOweuXqLr7Q8
	WWs3IIALAEPQ++C/UDl6iADYeiAPWezpMJNCtwsTThpq5hUk9g/e
X-Gm-Gg: ASbGnctI2C66LQ8+AtCYwRNOvD9SfvHKQfw761CxqezHfaAfUTe6+DJaQ0+sAAY8yY7
	d6EJIuuH8UCqKhC1ca2We21RbhOm2TBmKZrEd/ft3MXcnMTyc1gHRDdtjLhYNj4OC1Tx6Im6LEl
	AJv4U5WQN5zJL4KwkC12W4bO1nTRMKevHYCH+2BBa+pf20G3TGc+lAgV6dZYpjkO4Vi8vQL2YNx
	t+V8WC6suYZLjOBfoY8YmM7dG8JtIpql+gpV/crDMUcWecFFEVvgL6yZz6EHnYzYQUxZtuNF9GM
	U4kbRRl0AvrCaDgZx9ZxanqHFQW8ZuF4ITJXcZN7vE99TYuyG1VTZ1ON/lmEC3LKvw==
X-Google-Smtp-Source: AGHT+IGRC5CoH8reAVUroHZt/4NSL+Ssvd0PhZUbQ6lj1DRgpN5BrYRY0BCSdA4WUtaH5kleDzjDWQ==
X-Received: by 2002:a05:6214:e89:b0:6ea:d033:2853 with SMTP id 6a1803df08f44-6f2b2f306a3mr112410116d6.16.1744911226285;
        Thu, 17 Apr 2025 10:33:46 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c217casm1375946d6.99.2025.04.17.10.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 10:33:46 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] iio: frequency: ad9832: Remove unused parameter from data documentation
Date: Thu, 17 Apr 2025 13:33:33 -0400
Message-ID: <20250417173333.607844-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a leftover from the patch: commit 566564e80b0e ("staging: iio:
ad9832: use clock framework for clock reference").

The AD9832 driver uses the Common Clock Framework (CCF) to obtain the
master clock (MCLK) frequency rather than relying on a frequency value
passed from platform data.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes since v2:
	- Specify driver in the title.
	- Include referenced patch.
---
 drivers/staging/iio/frequency/ad9832.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.h b/drivers/staging/iio/frequency/ad9832.h
index 98dfbd9289ab8..d0d840edb8d27 100644
--- a/drivers/staging/iio/frequency/ad9832.h
+++ b/drivers/staging/iio/frequency/ad9832.h
@@ -13,7 +13,6 @@
 
 /**
  * struct ad9832_platform_data - platform specific information
- * @mclk:		master clock in Hz
  * @freq0:		power up freq0 tuning word in Hz
  * @freq1:		power up freq1 tuning word in Hz
  * @phase0:		power up phase0 value [0..4095] correlates with 0..2PI
-- 
2.43.0

