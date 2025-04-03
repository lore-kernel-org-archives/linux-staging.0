Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B275724E4A1;
	Thu,  3 Apr 2025 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686833; cv=none; b=bGso/fN8dXYW2UkvuSwRj1v4gIqSrpRZXzGpv2a7qzm9eR5sAHxn0Ig26cpWmw0NHFA3OXI+i6LUmYD7xLhaYQoe9J53Ng6mUcme6btkUalcRSfgjQ6p7BW0M1DFauj6OntzwfwtxBJh6tI8rYIZXuQCBSvjERjtoIX9yO2gFsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686833; c=relaxed/simple;
	bh=LT5EUl1KgBUB0sRy1MSkFDS5h6smZXz9z8aJXtPVrzg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l+Un1A3fWxUGP2zU8G6s50dYRE1iGt3EUuEFMYZhDI0nZ9M8tgm5JwAuY9aMw3qgzP3w2sZiSh4+R/Nhjf172H+f8s0KXpT1wUYWFDS/mygTto8ZEWG8wwy8SMG100VZcpJQ1yBD1CUXWR9nfYMskySxA87LaL325P8a47VZqNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deeCODQp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deeCODQp"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1262096f8f.1;
        Thu, 03 Apr 2025 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686828; x=1744291628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rav5U/XYai4s3/lq7oJH5ZZyWqdh1D+52He3pX5POpQ=;
        b=deeCODQpmkKbR3yrtQX7wPPXQoJxOZ5zo1ScPT9BlcWH/87H3TV8g+oJOmxVgTIC8b
         UBVqjZoHJmcEU2lAWcJQqk89cnWn+6C0RF+PyVUKlPVU3LTt4xPFdHl6Jw8JmOg2ohw7
         vbUj1QycNatOMjT+rvmYsXIvbPWp0dlTiK7sXH6OT9aKrM/+n3engHJBabrSUb6VyTG1
         1eEGJFaeVLbP4o0YEhaOV3z5dK5ghtFyUV5IVHCY5tuIxjfSi7brewMgvZSxKsJ7+a39
         nSXnh7SGP5qkCJkO3gytlnVjqjn5YgPZUkYmFwy3E/bC6YDjepHGCKaYn7+uC93Jg6Lx
         ImEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686828; x=1744291628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rav5U/XYai4s3/lq7oJH5ZZyWqdh1D+52He3pX5POpQ=;
        b=C2BGR7e9wqjBmIkXXBNAsUAwofMrCOH/+F/QQFKjNd5L3otEhEzKSabzCoMkRvW0wr
         BWe9SVHxVINNwLvvxmdBI6HsSK1XqS1U/ihDT6aR13fAXn7a6OiinvK1rbEIbxnOYRhh
         XxpX/iCBMmw1Kv2+QLc/i3SWygXIC4mNQHanQDa8urIxE7M5Cs/djQEAJ/DrMwSwUOD+
         Ayvux2LDS/kkUo4IdpRY+/oyApMHGHF/pBXI+o8Vfj4VWbfaniF5z+LfJ2aKVj4K1eDO
         DjZZzbtLD6Z4OT+Ks3+cRkGlODINErOuHHY49V9jQxlwo0NKjLIlaJGP7GfhiXcX+qNP
         gzvA==
X-Forwarded-Encrypted: i=1; AJvYcCX706rV8+937ii1vtPlat0BaLE9fG7fylv/lw3ulaJpJ3747F3PRWVSDOemKr0nyDvDN9Um0KSIXYuRV8Lc@lists.linux.dev
X-Gm-Message-State: AOJu0YyQd1wC1Qw0LWWv5nD2eeFV9jJi23rAjsr15XhaiS7+EFF43cKw
	/UueKWbgLuDUXwY6cJ1hXvIuKSyXcDMkmHEu4HG29eDyOEZJkIuL
X-Gm-Gg: ASbGncsP/Rjtj4ejOZtpySK8TbqAn8c7EpOwvxG3OeWrKlmk8R58wJ9srGDln33/3V7
	f7LLnnYkcmD0cPpjqDHdBYvb5QmLnxQWa6GVuFHBcvPMPXpuusGlP6xSxvAtDqrjTcA7amFhwTT
	FxDIGsW6W6WTrVg0vHSqtQmTxLAELU6i5iFuKc9YhedDVWvFuKfVHyDcF4Fd16O+7gL6lVK/Hxh
	LWPnm/tHSFbjLyz0QFcfceb1FVTDMfv9RvCfGx1yN31LrAZD3kO8hk7RA2iipjm5/FKfiI6marl
	C/3/GkY+hSfBy0wz5P4QRAgGKyWWmU7it5kR+ZPHFfA=
X-Google-Smtp-Source: AGHT+IFqI5Ac5ykSjJoBwT46Y7g9a1kRGUv9sNa/qYqSwDvnKzABww4yIbeD+mXoMmz/fgXNoi8Qbw==
X-Received: by 2002:a5d:5f81:0:b0:39b:fa24:9523 with SMTP id ffacd0b85a97d-39c2e6110dbmr2352432f8f.7.1743686827736;
        Thu, 03 Apr 2025 06:27:07 -0700 (PDT)
Received: from HP-650 ([197.210.35.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364ce6esm18267555e9.30.2025.04.03.06.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:27:07 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v2 0/3] Unnecessary code cleanup patches
Date: Thu,  3 Apr 2025 14:26:40 +0100
Message-Id: <cover.1743685415.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
- suggested by Andy Shevchenko

* Patch for drivers/staging/media/av7110/sp8870.c and
   drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c is split
   into two different patches in the patchset for use by the different
   driver maintainers.
* Added subject title for each of the separated patch
* Patch 1: Removed unnecessary curly braces {} initially inserted
* Patch 2: Unnecessary {} was also removed from v1

Abraham Samuel Adekunle (3):
  staging: media: Remove duplicate NULL tests on a value in pci
  staging: media: Remove duplicated NULL tests on a value in av7110
  staging: rtl8723bs: Prevent duplicate NULL tests on a value

 .../media/atomisp/pci/atomisp_gmin_platform.c |  2 +-
 drivers/staging/media/av7110/sp8870.c         | 10 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 56 +++++++++----------
 4 files changed, 33 insertions(+), 37 deletions(-)

-- 
2.34.1

