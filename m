Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586723;
	b=FpWXml0Fl6Ye2AYim+9xBeSMvGck43BKpcmoDB8Cu9yHBNTYzLHw6MHRAIAcrsFM/VPb
	 sc42/aBaZOufZYoN7o0DcXtemlqqIDZoDBFfrQfamk8QFGdfHXdeJr2/0CxVZukkocNzh
	 FonczWDrGDcgm5NXpXKDLzI+APwf8iFGhGNCwJxFrqelDXBeltVkx1bum71iIo0xsS80s
	 S7Jgi3HJFPQ/qevFyPnTdA+bGeLN03+CRlwiFNM3ZqkOqRG0fiR8OBsJrc8HWUw65EP94
	 +E5YfdfbjHhoP5fez2hiVFqPfXL7Z1sftmB2X51+LOXT9wiydW//C154bFqPPMuDF2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Eirh/4i1JKisBRrsumJjSRboncwjaisgQnevXkb1w8M=;
	b=AkUIKJKHgNtcBcAHM8AO2AXJu1mpqW5dsmNK5w0QjkD0eIQedKjAT4CONJYfYYJFkGaa
	 LEQxHZ9vc6jLz9jLo0KKVMpdZkHlgTgyeWte1HugHaaRrYp4309jKELTJYAmKWw97YfHa
	 p79VDIU9tQhs1bcWAOphCNcy1SBU8yP/iWzay7DfOQcysnPqxnjtqoSQJDwpECYR+X9f5
	 YWXuslR8WgXZO4/YhZmBqkNckmPIODpX9m2+NDhQfCwA4XU7+zHCtNOyriGMbpNf9y9rx
	 RQ9oEX7DoLufnlLo9ga6XYpF6qRG/TKecKkgyhV3K7GYB9MdUNPYGMQ6LhCSUZu0f3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FR+SENgx;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988AE606B5FA
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 16:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 988AE606B5FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FR+SENgx
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d581da0aaso191143766b.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586721; x=1795191521; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eirh/4i1JKisBRrsumJjSRboncwjaisgQnevXkb1w8M=;
        b=FR+SENgx+R6XqitNlPeQAzymHacA2YySzCaw2r3fLBRXh9Ky05RqZWHunk4jqyPtW7
         YzYgBan8KUd/P0JR2/No5KSkpKvG6o4UdszkvJ/B6fn3iN5Ny5497T+OH35h4BhyJjMm
         d24leZIZk2S1T5MoGi8jZNtTFNWMJkcGgrpbjtF86s+wywwePZQeUz93YpYhzDV5wjSk
         Zg7plffEOV/QRHi4tuASyy/1dJfKVZKMpBtueMPDGZAUZdVbMQcs4ZzBvMOwIB2fZPQz
         1F+22nmwo2k/zo8pBFM6+/nVPdaudgF2VQO2lZ/hswWdE6mCoIvkOri9BqngMcTplz2x
         ffsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586721; x=1795191521;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eirh/4i1JKisBRrsumJjSRboncwjaisgQnevXkb1w8M=;
        b=OsmYIi9Xe6EPx4Ah6AgFt3vnyXCbNrdeHvJh+PFtj8Hzn4Zq/Ms4i54psGcn7SJJ9Z
         aDf74LrB5GJn7WFojBgrMtP8hMaNIx8Oqr6yPrVlIxKcqMOHnxqSWWQY/yvxSWfe66Ya
         QwySzQp+Q/c2EteQRZo7B1ggkgN1ibGi2CvZ71pWQqOCBGM9W+YLcrnXUKhmZihCkr3/
         aiom1ZZr0bJ9wxHigyZsMwmG+QTJtiLn51eY9CHReYGRsp8MVcwhvyKAoIWtIb6h2N+c
         HxPbfPzwkvdaY5FEO5i6tRhMKwN9jSA6yhUFztePLF058HXWAW8kXRM+e/X3F+kmO7DF
         59qQ==
X-Forwarded-Encrypted: i=1; AL+hErEDANV8SIeBWHqdSoOMgkPRAyaiIGRXwqb9hBpeXvEBhduoixS9RVAsEYm4SsqEbwY1rUA1LO6viiZbDDEi@lists.linux.dev
X-Gm-Message-State: APuU4Z+kgAGiG09FQ5gYa4QOJsYDpY5aUrt6dyEQD9z5COnEw9apK2Xv
	5x40fZEjWkLRx1sQ45JmOmgAVeRbFCYYW+pEbt5LNqafClyL9cAtP4J0
X-Gm-Gg: AYBFou1kuW1BUyJB3IpaJfg8PJgHjJDP8EhbtzPZ5QK4QvKOf2eEBCqziTyy9tFRCuv
	iHIs6985j7/jRl1mIk8y6QRO0haVk2csbVkxt65Dq7dZNa8f8i4Rfj9lbtB69kA7jAj7A0PEqPA
	8a12C3ZzCpA3V0SNGSNyQpgitB9er2RjuT1R7KjIjzHI+gShWk6iXvH16FJo2YbZ0Sy59CxlIi9
	UwabtvA8c7/46yEYqIFZAwYCkJMQPG1jq7XiDcAyrUVc/bykhnj1Sc0HvVK3vHKRUuSN+C6ii7I
	+dwWoiKDyV3+ENHPwDfi/n5ZfmnMnFMmNR6o73sIGe+X4Ph1KDpsNCTpnSS52k7YI1qU/qoCZbT
	/ObCAUK7PxEMzoZAgi6JzV/5jxxN7E06z3F+lr7O429rvflF49uDVa713jFSbyKB/nXozbkt2/b
	PNrIMWRVoIXmllFtXuUqUAB0kYXXo7H5UvY8bZ/Fzn9bzlPHptYmK4q2VI1HKbDEWoBUESLDV4c
	DflMbKPNc6OSAWGdajqjqmsjmhibv7Z9C/jH7YkuVwHnWiBvd5NcoUIZokhBHmKWbbSqWqA3+CY
	cCQzyIKXaVYzfI1a8N4nfYYD8LN8/NJ9QDd4UP/lI5McTap4C9I/Q1jiCAJw6ZdaD5XSWBr8OeV
	44yrFUaVPbQ==
X-Received: by 2002:a17:907:930a:b0:c40:19dc:a24d with SMTP id a640c23a62f3a-c5096344fa5mr275778966b.9.1794586720616;
        Fri, 13 Nov 2026 08:18:40 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:39 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 00/10] Tegra Video Input updates
Date: Fri, 13 Nov 2026 18:18:09 +0200
Message-ID: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset contains various updates for Tegra Video Input driver:

1. Tegra Video Input driver is moved from staging to media since
   the driver is quite developed by now.
2. Fixes for Tegra20 and Tegra30 VI configuration (clock adjustments)
3. Updates and optimizations of VI implementation itself for complex
   media devices attached
4. Addition of Tegra114 CSI support

All changes were tested on:

LG Optimus Vu (P895) Tegra30 device:
 - MT9M114 front sensor with complex topology and irregular pad mapping
 - IMX111 rear sensor which has simple pixel array and a single pad

ASUS Transformer TF701T Tegra114 device:
 - same MT9M114 front sensor
 - OV5693 rear sensor which has simple pixel array and a single pad

Nvidia Tegra Note 7 (P1988) Tegra114 device:
 - OV5693 rear sensor

They all work and produce images.

Requires this patchset: https://lore.kernel.org/lkml/20261113145708.261530-1-clamor95@gmail.com/
("clk: tegra114: Add CSI pad clock gates")

Svyatoslav Ryhel (10):
  staging: media: tegra-video: Move driver to media/platform/nvidia
  dt-bindings: display: tegra: Remove Tegra30 fallback
  media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC
    descriptions
  media: tegra-video: vi: Switch to
    media_entity_remote_source_pad_unique() helper
  media: tegra-video: vi: Use entity function to check subdev type
  media: tegra-video: vi: Adjust pad assignment logic
  dt-bindings: display: tegra: Document Tegra114 CSI
  media: tegra-video: Add CSI support for Tegra114
  ARM: tegra: Remove fallback compatible from Tegra30 VI node
  ARM: tegra: Add CSI node for Tegra114

 .../display/tegra/nvidia,tegra20-csi.yaml     |  23 +++
 .../display/tegra/nvidia,tegra20-vi.yaml      |   5 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  34 +++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |   2 +-
 drivers/media/platform/nvidia/Kconfig         |   2 +
 drivers/media/platform/nvidia/Makefile        |   1 +
 .../platform/nvidia}/tegra-video/Kconfig      |   0
 .../platform/nvidia}/tegra-video/Makefile     |   1 +
 .../platform/nvidia}/tegra-video/TODO         |   0
 .../platform/nvidia}/tegra-video/csi.c        |   3 +
 .../platform/nvidia}/tegra-video/csi.h        |   6 +
 .../platform/nvidia}/tegra-video/tegra20.c    | 171 ++++++++++++++++--
 .../platform/nvidia}/tegra-video/tegra210.c   |   1 +
 .../platform/nvidia}/tegra-video/vi.c         |  47 ++++-
 .../platform/nvidia}/tegra-video/vi.h         |   8 +-
 .../platform/nvidia}/tegra-video/video.c      |   7 +-
 .../platform/nvidia}/tegra-video/video.h      |   0
 .../platform/nvidia}/tegra-video/vip.c        |   0
 .../platform/nvidia}/tegra-video/vip.h        |   0
 drivers/staging/media/Kconfig                 |   2 -
 drivers/staging/media/Makefile                |   1 -
 21 files changed, 281 insertions(+), 33 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (84%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/TODO (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (99%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (95%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (88%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (99%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (97%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (97%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (96%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)

-- 
2.53.0

