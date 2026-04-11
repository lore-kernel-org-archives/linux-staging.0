Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE3E2CCC5
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 12:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775910950; cv=none; b=NCgIeTEM2daC78/Pk98TRHUHNHRsPlvgRxDIDCsIp+znBHOzYu+O8abgz/HfH4NJJY9WaXQbGtjQJIF55yBQeBRQO8G4JskFw9hJeAS/gXbZH7avwxYpiftnm8kbTunkqWcFk2OKwb//A6p3Jfc265MHvYfjNszforwNz8IUJ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775910950; c=relaxed/simple;
	bh=4qyS8AXP226ng4M/DR7SLK72qDQ0z6wT8RLQ5Lpb7Yo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xjk2775Aelg1+zSbmtIUY/dqmW5PeF34IkV0DPhoKMvKfELK8sNYOf3zOVHgePUHUl3rYQ4xgt9Bhy9tQ+4/xw7jB8n6I8JWA5OAE6dw5Ppfr+t2sZES36cvXTmk5G4XatypdiFH0QvZJSs4NZiay3XdSB+jMa1zfDrfODktVVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJiQMp5L; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJiQMp5L"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so46093195e9.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775910948; x=1776515748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+q1XPaT9Ilg5jI8qJu180EK5Pt+3o6WGYBdxcSoMcaY=;
        b=PJiQMp5Lu47v2cx3RSX47CtcIxHeN5k/VCOCsxmxiCC/SA1MFWnka9jiN/ZYeV0iLJ
         xlkZ0kFwY4toj4FEWeZymx8PjBTgxEw56j7s073VRFsQcqpBwKoq0gCf0ZWe4Z2Q8wbT
         IMKaGRl4h4+A7m0gjRIwUuRFyS4/8EcWP4+9ZPmLCGyfSWzd6xa5xZMVsfFeUHFrjRKo
         COw3Io1n+Da8Dcd1L6n3s4Fa82oajAr+vcr7PvCtGInwo2SCUqV92tewraYzK3XSukqj
         sOH7OWzQ+0QyinABnFy3J3V86/lAFJB8M6vjJOkLlJIk+MnewF1Tov2m1ORI5sXWxS+l
         SbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775910948; x=1776515748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+q1XPaT9Ilg5jI8qJu180EK5Pt+3o6WGYBdxcSoMcaY=;
        b=mwiWuZ1wsEL2dLq/7be4tmXOgBKYo4qtSgoMdiz4VwVTCp4UkKaGfP7HoQDinV3pMs
         vxDau/fxmD2BujclfDd9qSWIqi8hJCibYbPwcJUwy+n7TnwVjAorlfavGNYztxraD6P7
         pro7UG8Qkldj2yalycHXYd0GmULQdLlfMcHNq28XgwYxoUyDTHklWNUfGm+eLY/UFutm
         5cBafAi4vTK6LKFl2pId08tWldFQgu0DfS0Mc1jCZkESR8S+rKFfvWQWh14mt8K7MdzN
         bR2pvx4OByx5Zp1MJOciFFqS3Q6yxwVfj39TC8WhxVK5QMcJBiPLHz8afIWS+6AcE29n
         gooQ==
X-Forwarded-Encrypted: i=1; AJvYcCW21HgYieoxECIDQY3w79eRJdq0CiQIBubR1MPmlMVHER/M+Q+IxC+kqVbXjk0HqJzRXqsBTH6yIGLVjcIV@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6QXfDhrXW2wW6p46Zc2RTZdVp9dGQpB3sRaQFS9Q0JFBB8FVX
	TfMxaqLsUly+PJ2u1qHRiJqiUeanTPTmwOxGxLQPcjIk+cXdEDztnO+N
X-Gm-Gg: AeBDiet761xlFhEolXykNHsPL5cr6KeKSgY9ghcbODSZezfjV6tlW/frCQTk82dSEIu
	601qjx+WyKK523oQqqA2Lau6ipHJ1wt5y5xUwgrv4xotP8UUzWLdwU//bDp37+Ao2WFszzHG7+5
	V87QjhLXOpCpwuH8iDC4EpNCZ8BJpS213K1euOQR6qPkYd53twi1NWjAWKTCteI40QlnCIWJUfK
	pQjJtWmf8tq3XAtvjudMuSP4O7ygoIrGcilmLI+xbaqtad44FIDYeSkjmGoctOuV4/sLy4devgu
	CJq9o1EI4huWxe1XcScz4aKJ8jLk7vrnhPiMS7ta1lttgvdIeYi20V78ynbCCIt9Zp7/+Ei/XZ7
	P2iqyYKxx8/9bO3jY6pdBTXgwgu3G4F9aGb5RdYaQZRv0mzRLDKa5TC4gAS2cr/ftKu9G4QWLAw
	Pb5bdEaW62oeO85BELUtZBzo8c5xVDnuJKs6eXepVUpnGiTlpzvtB48wslg4u57oaT1zJKvTHFO
	prWz/dAyjK2QH4LiEwMm052r+elWZoCwsd2LNsmqJ/ChMgvLuV6XvYD/BZ9uEZWuW+XiWqqSzey
	62/U5liaxd3z7fAQvCJdXi89YzafGadpeaZ74FlH5+fLvGmIRtp7HUN9Rf/UVpODxYvud77wWWA
	=
X-Received: by 2002:a05:600c:5298:b0:488:c014:34da with SMTP id 5b1f17b1804b1-488d688687cmr96158745e9.26.1775910947430;
        Sat, 11 Apr 2026 05:35:47 -0700 (PDT)
Received: from localhost.localdomain (ip-86-49-246-182.bb.vodafone.cz. [86.49.246.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67ce3e4sm103104385e9.5.2026.04.11.05.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:35:47 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v3 0/2] iio: frequency: ad9832: cleanups
Date: Sat, 11 Apr 2026 14:35:10 +0200
Message-Id: <20260411123512.84739-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up issues in the AD9832 driver,
including proxy header removal and bit math
simplification.

v2:
 - PATCH 1: removed redundant bits.h include as it
   is implied in bitops.h
 - PATCH 2: changed ull to u64 type
v3:
 - PATCH 2: remove rogue vim typo

Joshua Crofts (2):
  iio: frequency: ad9832: remove kernel.h proxy header.
  iio: frequency: ad9832: simplify bitwise math

 drivers/staging/iio/frequency/ad9832.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.34.1

