Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8568373C1D
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788201956; cv=none; b=mErgcCrjy4+/zaq9rWsDiSDyxD9lByrxK7IgWJB957vu/sp/v21TYVjgHTuLPYkjC0lJUkGtIFc8gh8LdyZxJFKtxqdhUcGJ+Em67EM6nUAxz6tB5S08mY+9nbcqwNlOOnjDBpaMSI+dbFqMb45xdB3xD9krdqRZXQT9pVjB5qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788201956; c=relaxed/simple;
	bh=gOdMOlsXmXX38oBAS7XFGOJoRmhlChqbGSNBwd2N6Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IXo0t2JTdZuQONbkOjlIghGpkcuoKn7BN1mvkMfcY1fmulWoKitsdvHnUqsyq3WZgNBPoZmSCLHxqfwQhr8AL4ddVm5cowa/v2s6bpaWqURwM5Mm0JOUrS4TQ8fK69oHmSy6Z5Qh1XTg1WIifvVp1XYTEa0erWN8YYOvdSMdXRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3Buanfy; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3Buanfy"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396d27bb2beso79544a91.0
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788201954; x=1788806754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ibz8/jF/Lx7KPFMOOYUTs3vW1cvNeIhgyAw0sqrv9B8=;
        b=D3BuanfyicH81TsPDfiBkZ3oRheZaG5H0bh58EBHHCRAo4c5pZKZzgPBuqkmKtvxjD
         ZSKFyMlAaR9EPL7dgnj6Bd9hjti3L1IkZ2LeTt1BiBjWrXXiTefxb5g4BdqBZ2lJgTk3
         O/KLgzZh22h7Ax4srSOF/78Xhfobm42CRTV19CSvsAPvX/pDihS6hWzYaWSu88XUTPhP
         iuyNbPzZKjBLAvOY8qksm0aXLsyUE+hf3e3xqzXuyeGM1cVgT+hyQqpYKrYAZBMFvGD+
         PdNLWSL/XaQfRivZUuP3mOFxI7quDTu7o6SiqafL6u5JH1ivhPVbWsPoxTNypbS46jak
         AF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788201954; x=1788806754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ibz8/jF/Lx7KPFMOOYUTs3vW1cvNeIhgyAw0sqrv9B8=;
        b=nSPPIvsNc4qwvs6WS8aC+8baroq2DUJaIfyRZ2j9ucVmTUbeB84kMYu2nn0AAz7+P7
         KxtS7EgiJAR205yDESGBR2VTPE3ZKfUCNn2npgpF3n8z5/gvKeccH0CqV4ClwjRxggip
         rFyW9RPEf/jTzxw86SEqAGyy3elRRLbv327T6roWg4mPo5gVKsa41OtoSaFKq4DPGe4C
         TbexYuei+fz9vhI1kGirYsNEREMPfo6ENFBpgGLosEC9RW/paJzEByudYkhf4qOGsX4s
         3+omN996G2ehPptYpKLYQVtu68KmiyUJfigHjpiJh6wdQUD9fepEgNHqPv0CPXeMzxOT
         tWFg==
X-Forwarded-Encrypted: i=1; AKwUvBzmwKx1DzesWuoZwpBAsGOlNDoCvOZPaq/hKAqtUgJG+MGR1jd1Ecf0Ph3KzCR9wTDWxLDyd6anbhsWhEVi@lists.linux.dev
X-Gm-Message-State: AFuF++l5f2oUFZn7dz07xovs+KRMHyvRjzz7UquOgNwCyQuyhfrod4JV
	eDHlkvYY8+gzTakVFZNK1ef+5ExlHio0xzxiLXA1SKlifr/GVFkMLJAB
X-Gm-Gg: AYBFou3L7EM46WLuFjOqFsZVJxhc+Gz2/5KJJ+FNlyOsklMhEwBkcupfeAl5fYunMMk
	iHwNUEnppZ2E42DMT9J6+nc5GiIxwlMfg3QVvBgty9X2I/OUM7lVx/UG25pjOtMNAHLi3cann0J
	Is68H/JU/HpWOMjze9psvnLftyAHAbzDrPP8kLQCB58M9V9Mo8j0v27NVFamyyos8u6MH6Z05AW
	WorHLGBi0Uau+wPj+n/G8MLNaw0UqTOrSVonet7ZkzM9K0d59BmIm3R2pQvLxUB/qXM++9cwHAi
	EbalkIIZtUQazGUVRstPT2VkQ/xPMTen87kmG7dZ44Lsq3dYfIoBGQNhzE5FuDphTOioMEUN4x7
	vULv7Aa13uqnD2oJa4YVSGPRNbRQRrcEqM3EtJD3SaF3agogKdxoFbOTBFata2NcGMbVHV3X+Wk
	lkLCB3HcX1MEajzA4Zg6xRtf+eDyhsmvWVm0xEvaCA/8mV6+aCm2WGS1vnEvEf6pMv+m45LkqpN
	2ShWhuc
X-Received: by 2002:a17:90a:4cc2:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-396d27bb20fmr21407728a91.10.1788201954154;
        Mon, 31 Aug 2026 11:45:54 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm29459223c88.10.2026.08.31.11.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:45:53 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	marcelo.schmitt1@gmail.com,
	danascape@gmail.com,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH 0/3] iio: accel: merge adis16203 into mainline adis16201 and remove from staging
Date: Mon, 31 Aug 2026 23:41:58 +0500
Message-ID: <20260831184201.34416-1-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series merges the adis16203 staging driver into the mainline
adis16201 driver and removes staging copy. Following discussion at [1].

Register addresses are identical between both parts (SUPPLY_OUT,
AUX_ADC, TEMP_OUT, inclination regs all match). Pin config is identical
too, all 16 pins, same names/types (Table 5, both datasheets). SPI
protocol is identical as well (Figure 3, both datasheets, Phase = 1,
Polarity = 1). adis16203's second (180-degree) inclination channel is
dropped, since userspace can trivially compute it from the first channel
anyway.[2]

Differences between chips selected per-device via a new struct
differ_info, picked in probe() off of_device_id match, same pattern as
adis16475.c, similar thing in adis16480 but different mechanism.

Don't have hardware for either part, only tested locally with KUnit that
the sign_extend32 and SCALE/OFFSET paths of real read_raw behave
correctly for both chips. Register read/write and probe aren't tested.

Patch 3's binding content is unchanged from [3].

If this isn't the right direction, guidance would be appreciated.

Link: https://lore.kernel.org/all/20250308144239.0442f1a7@jic23-huawei/
Link: https://lore.kernel.org/linux-iio/20180204163124.67234ae5@archlinux/
Link: https://lore.kernel.org/all/20260812043506.456ced6d@jic23-huawei/

Shehryar Ahmad (3):
  iio: accel: adis16201: merge adis16203 support from staging
  staging: iio: accel: remove adis16203, merged into mainline adis16201
    driver
  dt-bindings: iio: accel: adi,adis16201: add adis16203 compatible

 .../bindings/iio/accel/adi,adis16201.yaml     |   6 +-
 drivers/iio/accel/adis16201.c                 | 289 +++++++++-------
 drivers/staging/iio/Kconfig                   |   1 -
 drivers/staging/iio/Makefile                  |   1 -
 drivers/staging/iio/accel/Kconfig             |  19 --
 drivers/staging/iio/accel/Makefile            |   6 -
 drivers/staging/iio/accel/adis16203.c         | 315 ------------------
 7 files changed, 178 insertions(+), 459 deletions(-)
 delete mode 100644 drivers/staging/iio/accel/Kconfig
 delete mode 100644 drivers/staging/iio/accel/Makefile
 delete mode 100644 drivers/staging/iio/accel/adis16203.c

-- 
2.43.0

