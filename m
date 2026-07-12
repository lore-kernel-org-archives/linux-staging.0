Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB13DCA52;
	Sun, 12 Jul 2026 03:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825221; cv=none; b=au6kpQkQvKB93z69Imc5w4lP4qpGTthRFWdbdG6xc2GxGLuUExjaAPeCaU9XTtnIYZyAqIqU7QFmn7zZXghWy03r/s/JdXbsnLQIAZJjyzeWYsyom9TtJrOmbAx1PoSYJMNNPr2YujRAdBbIe+cjjsbGrxcTiXZ2Dx0thxwC9Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825221; c=relaxed/simple;
	bh=A/ywmB7DXuB0nsapi5LzDPQVxCX9fGZDB1EHQ7pxL2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQF//rSyu9j9YUh6zqvJsAz6mBWyRyvyfrysZjFpJWgGEq52pmIaGTkZrIr7TPKlVxIAhNlOyNpNYcBU9cvQVqoqHhfdZRzJ4EX2Dgp9TbB3zprwqjJVwtWPznw4Bbx76seJPCtio94EUxHNTZ/UaFKFBk9s/I1AeAxv36dU35M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkVxiSuT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkVxiSuT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060991F00A3A;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825215;
	bh=pPMB1E9mxY98sJzlxRNQcBMbjxdnpUE7XN7dpLMKjA0=;
	h=From:To:Cc:Subject:Date;
	b=bkVxiSuT++4UcUJpwBGKoHrUTiEU37RsXgTTE0IJKdT48S2k9fExAiTIbQzTXllGr
	 ygvejOln/yhZalFw0kdMOnUH2iiCntFPT+m0pmdWCWEEVKitGFSmTIQV6kYF4VzWIy
	 RZ8kmiWRQFVScYk1KvR8xnXH+k2NftNUTgSuPE4q0zqp9ljWN6qRPxrVYOGa9vX3Xr
	 nyzUBHZlFvh7aNe55/C+IFfv+y43SqmMLuQQO1IyQy5hOZQyRD3i30w40TlvwwnC2A
	 c2/W9E9gcIes3wV7x1JBMbetmS3BxuVPRfGAGlRfaEFduRZvBU0OyXkPL2GvDuLRO8
	 UgY6zPYEDtyZA==
Received: by wens.tw (Postfix, from userid 1000)
	id CCC695FDD4; Sun, 12 Jul 2026 11:00:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] arm64: allwinner: h616: Support Video Engine
Date: Sun, 12 Jul 2026 11:00:03 +0800
Message-ID: <20260712030011.3778169-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,


This is v3 of my Allwinner H616 Cedrus series. The series is ready to be
merged.

Changes since v2:
- Dropped "drivers:" from cedrus driver patch subject

Changes since v1:
- Fixed IOMMU ports on H616 (patch 7)
- Updated comment about VP9 on H616


This series adds support for the Cedar video engine found in the
Allwinner H616 SoC. On the way, it also fixes some issues with the
DT representation for the Allwinner H6 SoC.

Patch 1 fixes the video engine's number of IOMMU endpoints on the
H6 in the DT binding.

Patch 2 fixes the video engine's number of SRAM regions on the
H6 in the DT binding.

Patch 3 adds a new compatible for the H616's video engine.

Patch 4 adds the new compatible for the H616's video engine to the
cedrus driver.

Patch 5 adds the video engine's missing SRAM region to the H6 dtsi.

Patch 6 adds the video engine's missing IOMMU endpoint to the H6 dtsi.

Patch 7 adds a device node for the video engine to the H616 dtsi.


Patches 1-4 should go through the media tree, while patches 5-7 will go
through the soc tree via the sunxi tree.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (6):
  dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count for H6
  dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count for H6
  dt-bindings: media: sun4i-a10-video-engine: Add H616 compatible
  staging: media: sunxi: cedrus: add H616 variant
  arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video
    engine
  arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine

Jernej Skrabec (1):
  arm64: dts: allwinner: sun50i-h616: Add video engine

 .../allwinner,sun4i-a10-video-engine.yaml     | 45 ++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  4 +-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 +++++
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  4 ++
 4 files changed, 61 insertions(+), 4 deletions(-)

-- 
2.47.3

