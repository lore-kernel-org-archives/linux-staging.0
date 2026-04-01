Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7B543CEE4
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060746; cv=none; b=JqgWaRKdvR3uPc1s2HOujBcS5MR6zysS6UpbiiP7Ux1iFatqXfgPCglNajWSgwH3lGH6MYARN0cYzguQgpqF6FuXPFtBfc5cq/vgFaPL6bUSiNyRojHuHUfA9jVz1e9CJLcIeJTNQEwmMZGne/wIM1Bx508RzhjXgM0zv7ZElNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060746; c=relaxed/simple;
	bh=JHZaomVmYY2I/XkWsxtkjS8/76dzEdRMGcPYxXG9t6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPvOw8OW4a8FFqWREIlrbirVuttJuiOV2e8bUhSvQiPQxRWNST6a3GYt2o00D++FW8CqfM0YGjs5CHh84+rmasmOtdvDq7d7CTpXvDvQYhwbSTN89ijEp6ivQc2K3e58AYq/3ZvgbQIuWQC01q8gWDOmZVLwrWR+3BU5db4i/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai; spf=none smtp.mailfrom=mirrorstack.ai; dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b=tnv6s1d0; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b="tnv6s1d0"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso4459760a91.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mirrorstack-ai.20230601.gappssmtp.com; s=20230601; t=1775060739; x=1775665539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdKWlJC7fiD6nBYqrx/pcO9OeCyCqC2Lwr6JIyiolS0=;
        b=tnv6s1d0ZE3IeTW82rYESiUUB+VoYIYKF5xwPVb4jnhtbdkFtxVqZGRSpjJk1zWZRu
         pb7xUQhrpvGcWvXbOv5QhL4VW5qXFwELNqUQ80HTdFErXH1pTHWbgl8QE/GY+A228Fml
         Bu3w6PR+K6YwjpUP74BooCSqYP8xrdZ+SpqU0gtkcjOlQ+CgKYigYbT8VrScGyeTRH9b
         PvTcEDLzBT7QVe54SaEWFFOcum1Dm5MRbJe2XHGoS7jlM0opIfm1goufQL548nACyEYo
         MM2ty9YwbbKFFcQoN9pR4NL6s1IbmkhBhuSdYuS78fKvI+2uI1qX4F7NVVw0ApQfG8H6
         d4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060739; x=1775665539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdKWlJC7fiD6nBYqrx/pcO9OeCyCqC2Lwr6JIyiolS0=;
        b=cDIrBFrmWM3CIcdeT2AYjzUHw2qzT79JTZmc6nYOjAuCFAedFoBj6S4HpFPGdB5ohv
         QUdSO8wjhDXBmIfbjoJLsUY7yfKjjKWvkh0UbGF3mxfolCl8+T93qo+fwVGJY8CfmQuw
         bUpbtXgZfK8Vu8YV7JZZOI01mVtBPlmDYdMdnzjpvifhaVTaxi1HPX1oqqIvpH3FwxQV
         pdZYbdgVCPhruYdhQt+KuWW+x5Chr0xMs7DqADEEpHzx/XbUpzT07Bwi4h7wpogIZLH5
         qV0CpPb4is15EMsGQF30mIRYNXK3nRtI98lHWH4BmmKdF+11vhL35h6Re0llnxLLYDSl
         26bw==
X-Forwarded-Encrypted: i=1; AJvYcCWilERf88t5gE0Ida7UEOjqsZo26Q37N1msUZvIN4HHfVtC1nrFMLkQ10MWVjugT6vduDBo6wWdF/Ol+IC9@lists.linux.dev
X-Gm-Message-State: AOJu0YxdDb7C/ag2Fpq/nl6zKbJGT0pf6R4WV4lGm3pAB9265PUttTM8
	fTYZcO/juXWCSn8SMcy7lrDjAci3ogXbxdudiI6tjCth/9uEZXutF0+f8RbWomTaQP9u
X-Gm-Gg: ATEYQzyDSIVYjm8Xr+kLx6ETpI5iBmd2oB0voY+MBh9wnfELqeFrKNYLcAPYFjxh4jB
	zAHAPQXoo6KwshJqTLE3t2n/l8n7bTEEpb+RnAi330QvAutSESoSsnL69GW653ihlyvJ26/8Ue1
	VE3PnXpth2G8gg3QEnmggEPCCuUAcKpECF1VEnLCjlbG3m4ik/m9uJQlwU5QEx1AdsYOeWd1xwm
	tLIXquTIe8Ql9OyIoVaAHXVFmRqsuguLGXHcf8CAii7aCtSXbXWE1ncIkfmfXcQH0qcFd56hjKh
	rfUh7n1/Gx+7LDa7KjOkv4/Dw9JZixZvu+URFc7/BkHCdd4DP2KJHmaL9ZAx8UD5tWg19V8ML59
	YPE/eriSQMEvcfDbA7pckC6e/wbSVsg2pvLL6xpK0M9hegWQpTtpcMeXdmgou0yiF6MTRXEoGwi
	MWFi53dHx6I1kzcaCDnfn4a+XRxnkwp4nK6wZSUUoUHCGPJ46GJHUwkSrNWwn5Iy+O/dEOzcVXR
	+jBxktNcI/zqaf/MTzEMe6UwL4TUfGzPFKK6oQNvZdN1bX29ZAJ
X-Received: by 2002:a17:90b:3f4c:b0:35d:8ea1:62c3 with SMTP id 98e67ed59e1d1-35dc6e43b1dmr4400337a91.3.1775060739077;
        Wed, 01 Apr 2026 09:25:39 -0700 (PDT)
Received: from ip-172-26-8-186.ap-northeast-1.compute.internal ([2406:da14:e8:bc00:e546:17ee:7142:6d05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34eesm281813a91.2.2026.04.01.09.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:25:38 -0700 (PDT)
From: Sheng Kun Chang <nothingchang@mirrorstack.ai>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng Kun Chang <nothingchang@mirrorstack.ai>
Subject: [PATCH 0/3] Move adis16203 inclinometer driver out of staging
Date: Wed,  1 Apr 2026 16:24:54 +0000
Message-ID: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the ADIS16203 Programmable 360 Degrees Inclinometer
driver out of staging and into drivers/iio/accel/.

The driver already uses standard IIO channel interfaces and devm
managed APIs. The only missing piece was devicetree binding
documentation, which is added in patch 1.

Patch 1: Add devicetree binding documentation
Patch 2: Fix MODULE_LICENSE to match SPDX identifier
Patch 3: Move the driver from staging to drivers/iio/accel/

Sheng Kun Chang (3):
  dt-bindings: iio: accel: add binding for adi,adis16203
  staging: iio: adis16203: align MODULE_LICENSE with SPDX identifier
  iio: accel: move adis16203 out of staging

 .../bindings/iio/accel/adi,adis16203.yaml     | 52 +++++++++++++++++++
 drivers/iio/accel/Kconfig                     | 12 +++++
 drivers/iio/accel/Makefile                    |  1 +
 drivers/{staging => }/iio/accel/adis16203.c   |  2 +-
 drivers/staging/iio/Kconfig                   |  1 -
 drivers/staging/iio/Makefile                  |  1 -
 drivers/staging/iio/accel/Kconfig             | 19 -------
 drivers/staging/iio/accel/Makefile            |  6 ---
 8 files changed, 66 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
 rename drivers/{staging => }/iio/accel/adis16203.c (99%)
 delete mode 100644 drivers/staging/iio/accel/Kconfig
 delete mode 100644 drivers/staging/iio/accel/Makefile

-- 
2.43.0

