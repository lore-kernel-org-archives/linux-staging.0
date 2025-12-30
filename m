Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C7B246782
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 20:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767126926; cv=none; b=ZzlCmQiYq4otb2NmEsueeuOQl8bQDV4DKH0xZi/njWySD3mptLQg8dmeyE3w3SJ/fWV7JO93SVqp1j9ygsyRd6DO2TREhwnPXW4/+KzoJV2gL+muaQzRco0Tn3dB0hk4Z9tnlB2h6HIZyRYp2p1vW6W9ArEiKi+OdZo0anQMS4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767126926; c=relaxed/simple;
	bh=CbItiog4aTyaR66/Bi0CyZs2xrK8CcY9DaAkws1e7Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pE1sL0qyXr2/HrcDgBFWBomzku4Err4L0DpdTnb64joOQ5UvL8sZZmF/XaNaD/P3VDF2jDq5CmAuxaqmFv7vo+DwHktO6Cj4uDvi7oRVaYyArCpJi1m2K50LxuPYsiEQsBeR3MgXrwrIpLG4g5zMM/YHBpKexpN+sH3qHVNYnyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFoZ6C1u; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFoZ6C1u"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f0f875bc5so148396015ad.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 12:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767126924; x=1767731724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2rBxETRpqLD6kWS1oH6536/f0tgd7mu7KA/9ELTSvE=;
        b=RFoZ6C1usOSsNZ3TtSx92SsMPOQb/lgzDlztqZUtmXJjok5nqnGBCsFCbcahpDErPz
         kB1zy7hUBX5GyAN3u/Md6LS5i7WdXMQLhplK+7+THATDT8GZkRMa1sv7yoGCMR1wbypV
         oSrnP3gIp+DQFJVSHZdMado65WsiDbUAQiIrk8fusKNfJALjF/UNeWE2opQioWLdpREm
         50fW6O2Cfmt6+XHZsj/T/VQ+a8TK2rnaeMCWic9yGRZISXDQUY6EIUVf3W5iY42KehbU
         7ig0cbimorMJkIReWrWHSC1Oyjpd7Vv2yqocVt0BdfH7SeBD8/KQcArO3K5boiJ1/j50
         FGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767126924; x=1767731724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2rBxETRpqLD6kWS1oH6536/f0tgd7mu7KA/9ELTSvE=;
        b=bb1GAy/hS1Q+9wa6EspUvTQN2p+NG4Hy4I5JuSSq818RBmO/In3hqRreIcEtzlA0rS
         oHVh6jVB4UWC3OczcbIe0EjRNc9ZmroeLZ11vVLA07DSwgtwMCpPIslw0CuFZ20zQDle
         7YbGN7i5c0ctYGcAMGelS/9bziXyCuequx65j0C2cnmN46EjCZNpXuXmgRu2/vzHjy3a
         RVU7hFFLEUYXuRLFGkL7vVR9bh9xZqTyva/gvNdGoVi2SGW6zCbsk5/9e9a1X6AcgRRa
         jUryB08lJxrD8ULbOUas2RMnNTF0+KZNK9oR5we6v1hJ5RgjMbmt862uKjhqwz5gCbyN
         cugA==
X-Forwarded-Encrypted: i=1; AJvYcCUXLX8hQ36W2qgIGdS3e/kYgTaXbX1j5qUWZ1QI5JAFPgiycOhW4qkyR5NXBQcs2vi4u4mls5dx/S901YaS@lists.linux.dev
X-Gm-Message-State: AOJu0Yydlju1uEFvL65BpcT4tGzZlO82taq2ySByWqnu4FExDMJh9PeU
	EJU95EjdnJJ6hDVaLXKMR1ekOr4rK68TcIifDTeuKAahRdBh365nQLCx
X-Gm-Gg: AY/fxX6PAC4a4h4TmLUFQo3jtd7uwqi7nAuVapR7t8ZZSiSaCk/2uQYxh3wFJKySMi9
	iVa9DRcTlW6WdcLjpqZimDv1HJhhAl87GupP/dBW8wlee6A1FEfJdGfo7aA2kIaXd3ZhJbDunpA
	12y8vxyO1J7gRGV8xRumXamTRpajr24R+VLv0zY8LI8tyLS+mMuAl4gDwtyWDS6izaH/csSWjk1
	2PeVTfFid3YDIQ2JakbjacakPcQPNiFrYRodgLZQZ3nx/hj6AKYg90bjBwY/PIO1XYn+LHhHKki
	u3ECJOAELPligLaALn2ezobd5+DMG7d61x1ls/s42sSOyEKCMWN8xmX89nJW9Pftb0j40c3ZHwd
	6k9t20IyhOA13TzOOx35D123uJjXw2OVys0cKIiGgDIopRXMB7jQ8zUtg7kD/YFIFdu2K+p3Wrd
	FfetzQFab6trUdtYscqyQXSbwP5Rm2ZHet3hiTB4RBw7aMjkSywhLRULL71KOsalgtLpgcSO2ZO
	W7h4Uee204bjeTR11AY7jIkwTx8b1zF0zIddEUPAOeosUoz4WP4yR0jUbhOp+d7AOX5sa3o
X-Google-Smtp-Source: AGHT+IEGL2XYMAsNK4VpRBoc9NwepNxFvNhHj/SDESLAKzn3GV8wgXPvi4ENCyD+EXPUrxmAHJzigw==
X-Received: by 2002:a05:7022:7e87:b0:11b:9386:8261 with SMTP id a92af1059eb24-1217231479emr30088641c88.46.1767126924010;
        Tue, 30 Dec 2025 12:35:24 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm128074981c88.9.2025.12.30.12.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:35:23 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [PATCH v2 0/6] staging: ad9832: driver cleanup
Date: Tue, 30 Dec 2025 17:34:53 -0300
Message-ID: <20251230203459.28935-1-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the ad9832 driver with the goal of (eventually)
graduating it from staging. The main change is converting custom sysfs
attributes to IIO channel interface and adding sysfs documentation.

Changes since v1:
  - Reordered patches: moved dev_err_probe cleanup before guard(mutex)
    conversion (Marcelo)
  - Split channel conversion into two patches: 
      - dds.h removal
      - channel interface conversion (ABI change) (Jonathan)
  - Added devm_mutex_init() conversion as separate patch (Marcelo)
  - Used MICRO macro for phase calculations instead of hardcoded values
    for better readability (Marcelo)
  - Fixed FIELD_PREP usage in pinctrl_en for consistency (Marcelo)
  - Renamed ext_info macro parameter from _channel to _select since
    it represents register selection not channel number (Marcelo)
  - Ensured patches apply cleanly on top of IIO testing branch
  - Made sysfs ABI documentation generic using capital letters for
    channel and symbol indices (Marcelo, Jonathan)
  - Changed attribute naming to hierarchical structure 
    (out_altcurrentY_frequency_symbolZ) (Marcelo)
  - Made descriptions hardware-agnostic and removed chip-specific
    implementation details (Jonathan)
  - Renamed documentation file to sysfs-bus-iio-frequency instead of
    chip-specific name (Jonathan)

Tomas Borquez (6):
  staging: iio: ad9832: cleanup dev_err_probe()
  staging: iio: ad9832: convert to guard(mutex)
  staging: iio: ad9832: convert to devm_mutex_init()
  staging: iio: ad9832: remove dds.h dependency
  staging: iio: ad9832: convert to iio channels and ext_info attrs
  staging: iio: ad9832: add sysfs documentation

 .../iio/Documentation/sysfs-bus-iio-frequency |  40 +++
 drivers/staging/iio/frequency/ad9832.c        | 327 +++++++++++++-----
 2 files changed, 279 insertions(+), 88 deletions(-)
 create mode 100644 drivers/staging/iio/Documentation/sysfs-bus-iio-frequency

-- 
2.43.0

