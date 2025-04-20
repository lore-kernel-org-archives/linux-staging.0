Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FAB35961;
	Sun, 20 Apr 2025 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745171250; cv=none; b=K59YFjFMGG3lkc+Uo/GvEHQZ1919NV2aNMLnEy37qZ8DgUcF4bQfKWGSSFxjGckVfuC/pbSx0nsKkurmVQiu8AOinjl9EK+nM9Lg8nzkQbahi3SBUEF0P7ZamQoWLGtlA2/LF4uZTx8ZoUQH3F7RnWBTd9LNQpU21UQ5uoV8FmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745171250; c=relaxed/simple;
	bh=mwayp67UQUi3tBtf1siPMVZZvxax1y3PF6ay8Ji+lDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tnbm9ZlCxotcuQpJ/2jjhh1ZNAfG5tMSHQhXF9F5J8MwiM8HjdX5BbYjPzDzjs0ZnKPDEqjRg3JVO3UdarN9QeKMISPxCvhIPtGHz1DKQJT/DJMboLxGW28pfD+mbxJ9gpHxFjnhZ8oXVk+dnVcw3Lb6XinETRkiqMlWHMGnFIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUPzIDUn; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUPzIDUn"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so46329756d6.1;
        Sun, 20 Apr 2025 10:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745171247; x=1745776047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tx05U+vRg2gsgwyrSqUs9+tOlnrgkTrKgqo5ZO2arI=;
        b=OUPzIDUn+/XijN3aqT2uRwRRAxSG6oNccKeOgmFluEA0pQAkWSIeoqmKm9vtoQMTPU
         vs6HwcowGTg7sACuB8YhJfKPbBdkAnMlHDBkygWxVQK/cCCulRcU5H/VrW/shFmwGHAN
         e7dcX7Cl7ccTc8i44LpTStvLHov8WL8VGdRxVjjB+L427T2C9Ta795BG1dhUyvDxHExL
         t+d27uH7c+52B75Y1SpKExHmcBEjuDV6O5id1H/zbTyfANqU0ozOwSwXeJfLEeCd2J4T
         d3RkMUovpJcy6V8irNkr0gVEIZ0sMcsIe4Fgjomv1PL1c7sSKQrf/7lKAcEnXmyHNMmT
         MkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745171247; x=1745776047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tx05U+vRg2gsgwyrSqUs9+tOlnrgkTrKgqo5ZO2arI=;
        b=FHwmh+foGOPIcH/TZv8uEnsw2L97oMTMJZklYfmk+2DzPUWtp66vPnvRXWEecuLS1G
         JDzeXRb1Y4ySaBZlOioTwYE4knGEENGFRxgztvnDoncaMDhm3lc1tr5Gfnj0KvuD9j58
         F/ACc8ck6ikzYiE9SV1kYxZU9QpYfN5yasVobT+QVGzSuT7c7Ck74EZztBdVlahkE2ge
         vDau2a0KHbbMFa2sqRojLi9iSz6F/Qx7CZBZgDJkp85HB94UArvEzdoTKO7wOo/UPb4/
         LoWPLljf3fkzJQuw7nbC0pdn56iovvbZvixfAHNoXEl/rrxgRgzrGMXY+lCH3jPwFFDT
         IBtw==
X-Forwarded-Encrypted: i=1; AJvYcCUOBnMCbRhFApP5asIrRXmw5rBT7epgoGFPBjjbhI06bIeyNJ21qVbopJ6Ejow11OTB0Ktd44eCUV7wZomKEQ==@lists.linux.dev, AJvYcCWPx/+B1RbAmiezAE52z7gaklFTvTWv14oNn3ffblVEJJTBJY32CEW7sJ2Z7M4kIxzSOFBQV8l0jBsF2BCDoPsa/X9flQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+VNXRzgOahnsoioPs9PZ19d2Asby2W3W/T3waN1AYMHu+GjRG
	3d5o5fPbPTocP6vBZHQq4cOpJsQ6CKBkrlS2768bobF+Os9XnzZn
X-Gm-Gg: ASbGncsYJH4jCDbbQG82dOyExahEJVJV1ZG4m4LaE+qfAAHlJMh5/hJMVRNBMyw1Wzc
	OJefwQ9RVPJNCcvhIPv2anGrSShnmIlK3bx7c0/ALVS7rWCajifOWuO3ckUuvMLsR94JEav8vKR
	43jkuD9DXx2iOGAW4tyKO53NZN54h3+j1dHvhEJxhKAVOMyqfVKCl4/XWTDUZnMlCyvu16kUBjN
	mlnuDNiOTuzmzcOMgon8dm+C9JR10DPPMqc5uA9Y0HSSpyqlGi8temcn354pz3hz6pHO/8pKHuS
	CLz/dwU/eXnQPaWSgKNRFk/Vv4yVdQmLsfLbfv6d5ArU7NBANpQP12o=
X-Google-Smtp-Source: AGHT+IEnyJl//74fr/3CZDnEkerEttve36zVMQWD1LxhiTpbg+os+741RgNwWYFQDOk1ykb48TGRfw==
X-Received: by 2002:a05:6214:3211:b0:6ea:ee53:5751 with SMTP id 6a1803df08f44-6f2c27d0d1cmr176445176d6.21.1745171247400;
        Sun, 20 Apr 2025 10:47:27 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd3e4sm34110156d6.85.2025.04.20.10.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 10:47:27 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Fix and refactor output disable logic
Date: Sun, 20 Apr 2025 13:47:22 -0400
Message-ID: <20250420174725.887242-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 includes the initial fix.

Patch 2 refactors the code to use the out_altvoltage_powerdown ABI.

Patch 3 adds small improvements by minimizing the size of types and
doing a redundancy check. 

Not sure whether to include a read function for powerdown as well since
all the other attributes only had write permissions. I can also do this
for the other attributes to help modernize the driver.

Gabriel Shahrouzi (3):
  iio: frequency: Use SLEEP bit instead of RESET to disable output
  staging: iio: ad9832: Refactor powerdown control
  staging: iio: ad9832: Add minor improvements to ad9832_write_powerdown

 drivers/staging/iio/frequency/ad9832.c | 50 ++++++++++++++++++--------
 1 file changed, 36 insertions(+), 14 deletions(-)

-- 
2.43.0

