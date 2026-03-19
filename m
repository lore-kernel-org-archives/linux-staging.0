Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F638F632
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 22:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773961055; cv=none; b=ucp0YZ0iVo+DZpwhp4t9qqevhi7lpOgcJjvUlHOHkS20dO4mwqJAmTdNsFh5kEmPJdBTwxaQY/cfvQpC3ihfSWIzmjL6ldAQqbJVrwN9QTKLZkPNn6rl9sqEIeZycIgAidA0O6X9IvI7gsayVflCydtfQlGdZSaPAS+qf8bIBWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773961055; c=relaxed/simple;
	bh=0FDCQ8Rn3JCnSeMVZApr8cnWZWJimAwKuukQ7Jmm4lA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hVnfAAaOl4TTXa8l4w25edgLMMj9DpAEBp3KzUXqpwjeM0+PJKH/dNd9she8Bw+IyEthHCSXgIfYJKz6E0f5yrKDBDFZWw2BdfxSNW430LgwH8QCOQ2UxspyG1vaukpRiVoOSQPjv4krSNqGYF/oV4NPubz8zyPl0ymSdylJ4cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+AHkal7; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+AHkal7"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94de664b541so8492241.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 15:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773961053; x=1774565853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VPtWeCoXA8KidyRGoiMe9TqsU64p1S5/S/aeBC6UNH0=;
        b=d+AHkal7Qzlijsa7altSVGNTPJkUrUWtO8lROVNQ0HYQle5YAqtdDu6XJ6ZcVThIrR
         Up7qMo8/OpY9rfeNghkuL62x+4mzmrk/v9k8fFsjgXxqsFDwUpMxM88iv38ZntXmEEuh
         hD7hWrBgH0DJ3aCXau906h0FIlb+LdzHfRFa4FxstR5DjGjQ/5z1dlIvzcFb9P7vo1J2
         pinNxEOXn4tF9YjhblhWA46hsLppdsBqO2kj6psPoXJVxP5VZQtVsvZtfzHvm/dz8qR4
         yAoS5PgePIZ9nDcZgoaPQE9iJUoC49E9OnAEFKWdz8wqeQnSQ/2IVeOd/4QK8BarJAKk
         92Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773961053; x=1774565853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPtWeCoXA8KidyRGoiMe9TqsU64p1S5/S/aeBC6UNH0=;
        b=YUILIB00ArmxY3TL4WUqoZ9cksSB0PAgmSJN1+tUya3awy9tfV7h3BxOcxka7srsU4
         K35u5JNClyzaMFJSblzXCQ/jH3zLYJaprhp4sk7C3LCSUwgHXAwq1h2u4I8tYhbP9st6
         2oQwnFx+eO4epjWj6JOzE4fntQZ+92IhkYtGiROnBaCEe+69GXf5nrFooKJf7GJygfC0
         bbvPU/puA6rWjyhzQpFM2//8OKwhDJJqDwdkD92FGeJiSOwNKqGnp067/ZZRwYbCmlj6
         4p5mU4ctbJPmIle3vC4Zg1EyZnx8AGr+ZctAqcH7j4nYNjf68FSrswj+oZBUiDS3aSwm
         A39Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhzUex5gdi86EMFWNy6HgbXtaPi6E2BAbsydQEMr6YSQHrcW/PaxYfHx5wwfYXNFI3MK2zdSU8Nk9You2v@lists.linux.dev
X-Gm-Message-State: AOJu0YxDoCk/rILs4CzA8H/R42CbuJffGvYe3pyrmTc0Uk0ldH5jljSy
	62DoaP9+0NJwAGTVAfanyJf1ztQEnjT5mpelF7FEodY80IJ70eA3LPI2
X-Gm-Gg: ATEYQzwaW932xSF5ZWaeyewkPIR+le4+9ZhBB7mERUcUNpgEbR/UyMisbzC9wg/pwWU
	jS73C51qJBNKnqyUwi0viueGQ0HJ/ZhXY5AE1jAfehBAQsnTiKPOE/GsWm/XEiCViu4xyuWxbCq
	r630SO69CfAZoDYPP+PX+SQiL4wfImmfXu5gJBmE8/EEeDj1NyUn3x6dufqhYBOByCTsT0/3PLo
	uvFzQYsjdYfzmwrorheF3+nDxiwqADnmk0ErAUw7fEWd1s1h+YI9R4z1dDvDpP9SXobfz1PuYYW
	Z73K4Sm4vumTGTo3gtP7hmU3KOu2ohxzRPdq4AIVVKdruYd+hIL+V0SCOtxyqvxz01Llrge0LAC
	T6frzTqmSyy/SkbtoCG8ybb7RRDNerbC7wehjWNxz+tVh1XRfxrJj/uGs4vFyAe27TRs1g04YJ0
	NCWKTzBJ8ul6ezn37CtoVC+NzZgRk21ckK4w==
X-Received: by 2002:a05:6102:38cd:b0:5ff:2569:cfe7 with SMTP id ada2fe7eead31-602aeb03336mr648279137.10.1773961053299;
        Thu, 19 Mar 2026 15:57:33 -0700 (PDT)
Received: from localhost.localdomain ([149.102.251.107])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136bd79c0sm204828241.6.2026.03.19.15.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 15:57:32 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: iio: replace sprintf() with sysfs_emit()
Date: Thu, 19 Mar 2026 22:57:16 +0000
Message-Id: <20260319225719.73587-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining sprintf() calls with sysfs_emit() in sysfs
show functions across three staging IIO drivers: ad7816, ad5933, and
ad9834.

sysfs_emit() is the preferred API for sysfs callbacks as it is aware
of the PAGE_SIZE buffer limit. These are direct replacements with no
functional change. Build tested with gcc 13.3.

Gabriel Rondon (3):
  staging: iio: ad7816: use sysfs_emit() in show functions
  staging: iio: ad5933: use sysfs_emit() in show functions
  staging: iio: ad9834: use sysfs_emit() in show functions

 drivers/staging/iio/adc/ad7816.c              | 16 ++++++-------
 drivers/staging/iio/frequency/ad9834.c        |  4 ++--
 .../staging/iio/impedance-analyzer/ad5933.c   | 24 +++++++++----------
 3 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.33.0

