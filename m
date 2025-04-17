Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE0F374EA
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849972; cv=none; b=UL8cy6i5prkVv0M5vcAN10Cs5A6c0H0zs+MKZRMxFVxaqMW4VR55YVabx3iXJ9xMgJJCgWLth/MWWJZUzlNjeF264gA5U8uKlrAZUuV5lGQQw6gu63vZibGEFwuBFTqzSmOAxkjKTKazCy0c4rpBCaJSgss0M2Q84pybhvXdj4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849972; c=relaxed/simple;
	bh=gZg7ExtwzVi8qHlxeB/XQGuWE8A6lNlGG85RQ6h6e+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwf1MhjnLBUTmd+lQHe3ui2JZCdsQTkLDxTnMZeZSmO02PMcUnEZQXzMOn/0DTBs59Xd3/St9w0qO23yXZdrdNYu+QtnBx/uKAP5h/8eomryELiXZMKtjZctCG+wjh2qx+AzZvmC8dCP8JQlVXF6wnEN5wiAlbodvx0QwiwMBSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=MHXb1aCI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="MHXb1aCI"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c3407a87aso3485655ad.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849968; x=1745454768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ak1ahp2Tq7ZyV+BSi9SIxZRZpMgOKt8zB/5bQj7OZwg=;
        b=MHXb1aCI7M85Ts5PxEi03qQD7JJo8va8yVEukOpJOrv8RjEhhJpD+vhoHyHIQVEEav
         fwK9iSufoP7LodaMkvNg6keW+lCfBuO1Jpa/rZchzNuPDc6OBgQ0bGExGizTb48/NDew
         YhtDmmQ1MIrPPeUKqIq1obSRGpCaC/HmV6+aY6TdxVMLRTx+itHJw/GMbx6rk+Lqehn1
         X9ZqHuGaDBsCcMS1fIagNsi6qfTikYaophtuS1Bdel35nU+44DSFs8vlbobguQMyctHF
         bgbVgKHyPcI5ZHBRuJTTgym4bjkTNw8x8BPWRW3yPxY3FOlP+9Kxr3XMB0cYYLfw0Rey
         l9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849969; x=1745454769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ak1ahp2Tq7ZyV+BSi9SIxZRZpMgOKt8zB/5bQj7OZwg=;
        b=bzf0jj5hbm4xy1HxjR/P5QNL1XblRcN774CoVZpFhzxsKUn5wCA2gnWFxG7a6AUrFT
         H+ISA43fRVYLjMnt/fUZIeJTTfqmplU8bBR4aVkVZkBojDgzi+X1qV4JJTZ4qW0TaiAQ
         2CVf3eIIjgeTYuBJMr7wa+hhUBiEfUS93SNBL3R9Q/2NkvsfXgACam3fvBW4/Nhmy1oI
         pmI+lOfFJQttO/IXh7mpyhkyJJ1OBKPbSvjO747R3DPUe9QClnAxIk/yIjiQ2EEfeBwm
         3ltSB8bNK4bmcrekdyChndEJD1c+k+ozsjotWy+xHhgV+AKZNGmQUkEEtH4UG3xSqmb1
         paWQ==
X-Gm-Message-State: AOJu0YwMqucU2Sr1ykOkXtT6gRrREU1k7hjBxqNVs8svEsfSVzTw8Hhz
	rLXV6GLmvYZdP50OlPEayVlJRY/VZl75lyQwz7cs6lk4g8D4dIy872QQnNUJTQ==
X-Gm-Gg: ASbGnct0yRTkZbE1xe5xVjiLblEmZAkqlfau3d2yM8UbsV9k9vstBryMmS2TqMYLkHx
	WMWRyJostwYsOD4ImUH4wkTpzF9ZRgLFarZnwEtW0Bc9zJw8/63I8krIlV2OO2tJfC9DyZUYGI5
	fT/BD96kfj21kTYr5dHyoMs30kd+aTmcNmrY7dSWmmpoEoZZmqAwwxcfbKx2LQVgzrsHYqA2dHY
	JncL2lOp9Jj1i63WwQ46O1fLF204ignLPIlJC2vyTNbfBsgu8ZyTCGxiDriBnITHCLhOteJyzkk
	pukh1e9kALLYR45Exoq0dm31RZGPgudJEE9kMxyWZhhliSkEkd4HylDlR7cwjeCIDgfnSuPRIQm
	cHNP35Q==
X-Google-Smtp-Source: AGHT+IGqOnhzpxzDOfpZ4MDlp3/8xKrBlwAoq9TNj+xd1FHD/d338q5V+HLL/ZJTbmo1XoZvRNdRVg==
X-Received: by 2002:a17:902:d50e:b0:220:f449:7419 with SMTP id d9443c01a7336-22c358c7fe6mr52801375ad.7.1744849968699;
        Wed, 16 Apr 2025 17:32:48 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe8ec6sm20786025ad.247.2025.04.16.17.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:48 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 00/18] staging: gpib: Removing typedef of gpib_interface_t
Date: Thu, 17 Apr 2025 00:32:28 +0000
Message-ID: <20250417003246.84445-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

* Patch 1: "struct gpib_interface"
	Having the word "_struct" in the name of the struct doesn't add any
	information so rename "struct gpib_interface_struct" to
	"struct gpib_interface".

* Patch 2 - Patch 17: Replacing gpib_interface_t with "struct gpib_interface"

* Patch 18: Removing typedef for gpib_interface_t.

v3 fixes a build issue in v2 "staging: gpib: gpibP: struct gpib_interface"

Michael Rubin (18):
  staging: gpib: struct typing for gpib_interface
  staging: gpib: agilent_82350b: gpib_interface
  staging: gpib: agilent_82357a: gpib_interface
  staging: gpib: cb7210: struct gpib_interface
  staging: gpib: cec: struct gpib_interface
  staging: gpib: common: struct gpib_interface
  staging: gpib: fluke: struct gpib_interface
  staging: gpib: fmh: struct gpib_interface
  staging: gpib: gpio: struct gpib_interface
  staging: gpib: hp_82335: struct gpib_interface
  staging: gpib: hp2341: struct gpib_interface
  staging: gpib: gpibP: struct gpib_interface
  staging: gpib: ines: struct gpib_interface
  staging: gpib: lpvo_usb: struct gpib_interface
  staging: gpib: ni_usb: struct gpib_interface
  staging: gpib: pc2: struct gpib_interface
  staging: gpib: tnt4882: struct gpib_interface
  staging: gpib: Removing typedef gpib_interface_t

 .../gpib/agilent_82350b/agilent_82350b.c      |  4 ++--
 .../gpib/agilent_82357a/agilent_82357a.c      |  2 +-
 drivers/staging/gpib/cb7210/cb7210.c          | 18 +++++++-------
 drivers/staging/gpib/cec/cec_gpib.c           |  2 +-
 drivers/staging/gpib/common/gpib_os.c         |  4 ++--
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  6 ++---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |  8 +++----
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  2 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  2 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      |  4 ++--
 drivers/staging/gpib/include/gpibP.h          |  4 ++--
 drivers/staging/gpib/include/gpib_types.h     |  9 ++++---
 drivers/staging/gpib/ines/ines_gpib.c         | 14 +++++------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  2 +-
 drivers/staging/gpib/pc2/pc2_gpib.c           |  8 +++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 24 +++++++++----------
 17 files changed, 57 insertions(+), 58 deletions(-)

-- 
2.43.0

