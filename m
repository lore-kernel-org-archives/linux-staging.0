Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADDA33A019
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605805; cv=none; b=JC5gpXsMM2XOF7/Q+jvN+FvhPDi8WKZZWu9F+7SwOzI42dNDn17rcaU4HoWHt573KpHrIwtZqIJcuoSojyMXOkPJ+9+Z1TP6eZRZHRRb6Cboj/EXwVcJRb5HAh+PR5LIwoqtXnx4dh2OcBrRdoD6vC2JD+68RmLMliQY3HBOir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605805; c=relaxed/simple;
	bh=SJJL1hsjRl5/WRv/ON5a7qMwezRcNYQJsaRc0g+WDXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b3P98A2twj0/tI4VMWmM9r0cBqrbVmrtMku4rDKREpN2y+zBWBcYa+oCDOL6vNmLVvX55XtJ+MjiGecc8NuzJ0kUvYNE/GFBRnFvBIX5BvmiR1pISYBSpav4ZRAR7WKCgcTA3PGpvP1vuIEvQnbAASDWLJdkaJudCBqsTj4wmYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGSBq3pH; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGSBq3pH"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb78c77ebso843690966b.1
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605802; x=1756210602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTZBF2cKOGdV37BgNxVIad8RxVSZEEHpIkQVHokH8Wo=;
        b=bGSBq3pHaPQBqnUrJUkJ2xmloTz1jZFQsQzbEXSUQn+l1X3EaUzZ38tz+sB53nfrVa
         3QAOT2z9L7+ny8AWhp3uiL3obt5NFRo34qF14Clc3ck3KqfNBNU3r/HdCf0dbV+S0smK
         8IUT7wSO4Nk+Lych09X4CD79Z+VSsztRpJyI+xunUDizcx2t+KhdP5xU6K3s4JBbUSSz
         hUVYQrG9mCCzIw0JjMs6EooMZaJDJ+vRq09N+2Ll0986Hte3zyPWnNKHk+JVqeSuYrlq
         kmuqreyn5AgWrgLHCX5juxxVgHoGXZQbK+5610VTlLffF07jcpJaimmJ6wI7Bd0Oe1q/
         ZMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605802; x=1756210602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTZBF2cKOGdV37BgNxVIad8RxVSZEEHpIkQVHokH8Wo=;
        b=BfZI7RhARVqP608OEwfnFO5Od3aAoNEKTGvBjItB5NNWfvCX2QZOmKxxtuG8qsO8A+
         Odsn2oHW/Wg4PuA/B7spdP+7jprIn8tsgDglEOsQJFeE92dj5cnV71+SBOLE/BFi+EP1
         NfRyzRABhQ0nqIYO12Lr3d9b5hxkNPcYESqrplIpFHZ7Q+nZTqIvAP37TRq5HeucVvkf
         Nk37nPDGNIlGaWteqKgoq/54AN+Edhb2+uHCJ0xXNrQqdx0mHxEeTY6fiBrQKUGqqVT7
         n/M/MikMbjS9v3+fxzLsGSK96x1VS4mcy/Rij7VNRWxi0Q7hvDD7SGuGYjDEeYXUKi5A
         Tf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEssqgpPxF0hmCpOu/T6pObiO8/fpsPYoXol5Sk1XKPKAUlFHtDs4gbTOJ3xvgWMUIeaAWz5IWqfKsk6Jz@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwx1KyKawLFrSHC/7lzwooc8dgENwfEomNYsUYcrquE8F1E/6k
	Pv9FhGfsjtsf/75IaeBx2z3FkEgfaJqQQ5bKIsEBUFjvKA55njNnGBFd
X-Gm-Gg: ASbGncvGXn+abrYySmuTQq/H1ndAiS5SQp/J+qD7ClHic2v+lWh+7veiFqD7b6dHAt2
	529TXMLpb9RUmUbb+IAVolRds1AFLrfUHGshTFbpPXV6xr8DFxJC3vCRBVw/2o14Cnxza14F8He
	acF2uAWh0/Dex43MWF7vkVEeMz9dMUFPKw6PkDH/hrb24k2/t0CCTQ823BQIjR/CSUns2f/hatW
	JmbHWZ+nUem+WZOQVWkc/FWAvPnTObp+22DPMy2a1pxPLpfcqemQ4qMFRY6s9Uwfa3Ux5xKvSmI
	YSAEPkZU2C9gGvPk3vcnxwtfol5FWJ4PereZ3m8WAsopJj0KOsnQI+q4zBKQCXNLmOY2CKrDDh/
	tBmrHSFa2TgecDg==
X-Google-Smtp-Source: AGHT+IFOn/TJHFwwAXjt/aa4+DjS3IYy277UAXO/A/XxXv0w3obUkySSlcaEnmlY0FxNsalKHy8ajQ==
X-Received: by 2002:a17:907:971d:b0:af9:44fe:dea1 with SMTP id a640c23a62f3a-afddccd40afmr224499366b.23.1755605801830;
        Tue, 19 Aug 2025 05:16:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:41 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 00/19] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Tue, 19 Aug 2025 15:16:12 +0300
Message-ID: <20250819121631.84280-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
with a set of changes required for that.

Svyatoslav Ryhel (19):
  clk: tegra: init CSUS clock for Tegra20 and Tegra30
  dt-bindings: clock: tegra20: Add IDs for CSI PAD clocks
  clk: tegra30: add CSI PAD clock gates
  dt-bindings: display: tegra: document Tegra30 VIP
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: csi: move CSI helpers to header
  staging: media: tegra-video: csi: parametrize MIPI calibration device
    presence
  staging: media: tegra-video: vi: adjust get_selection op check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: tegra20: set correct maximum width and
    height
  staging: media: tegra-video: tegra20: add support for second output of
    VI
  staging: media: tegra-video: tegra20: simplify format align
    calculations
  staging: media: tegra-video: tegra20: set VI HW revision
  staging: media: tegra-video: tegra20: increase maximum VI clock
    frequency
  staging: media: tegra-video: tegra20: expand format support with
    RAW8/10 and YUV422 1X16
  staging: media: tegra-video: tegra20: adjust luma buffer stride
  dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
  ARM: tegra: add CSI binding for Tegra20 and Tegra30
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 .../display/tegra/nvidia,tegra20-vip.yaml     |   1 +
 .../display/tegra/nvidia,tegra210-csi.yaml    |  78 +-
 arch/arm/boot/dts/nvidia/tegra20.dtsi         |  17 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |  19 +-
 drivers/clk/tegra/clk-tegra20.c               |   1 +
 drivers/clk/tegra/clk-tegra30.c               |  16 +-
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  35 +-
 drivers/staging/media/tegra-video/csi.h       |  11 +
 drivers/staging/media/tegra-video/tegra20.c   | 771 +++++++++++++++---
 drivers/staging/media/tegra-video/tegra210.c  |   1 +
 drivers/staging/media/tegra-video/vi.c        |  20 +-
 drivers/staging/media/tegra-video/vi.h        |   4 +-
 drivers/staging/media/tegra-video/video.c     |   6 +
 drivers/staging/media/tegra-video/vip.c       |   5 +-
 include/dt-bindings/clock/tegra30-car.h       |   4 +-
 16 files changed, 842 insertions(+), 148 deletions(-)

-- 
2.48.1

