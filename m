Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B60147DFB8;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988901; cv=none; b=ien0yzTvNU37xcaAzWVJE3nZS5ntv5P+VWFc09KzEtK6HdvOM0J6nA61Xwszx1ShX6RC7kr7QOd6pNr5chRyTXXLWaCqzFClwrku3stNbVQ7j5Hn8lgJzb6vvNbDs6wnkvOrxHEhm6DmztR8XWXRj92RssUGKdEz4iuP3nOw3qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988901; c=relaxed/simple;
	bh=AG0oKwGOLP7O1AKKR+FpbgNj0bCG/wVgOoeQV3TqI0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BK8yjgdAQRuW2vZWts6FBM7t98xuRufDG083tHkdFB10l1+it8YuQtKEiiptBQGUI1Tsh8iQV8sMKl8TBG3IYqtVXxBzYDFn/t8kaGNiu1zqJo2Nty1QoMH7ZVXVeTl0efmPVoRySBo1kj6yHKkICzmP44IfPThgzvC+MzB3vBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQQymP0J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQQymP0J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D42C2BCB4;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988901;
	bh=AG0oKwGOLP7O1AKKR+FpbgNj0bCG/wVgOoeQV3TqI0c=;
	h=From:To:Cc:Subject:Date:From;
	b=qQQymP0JMuJLCD/jYY8/0Y0PKc2gOEr7Jedi1Aw2st+I2JzEGvC709NwpL+YHivz2
	 tkYlQSW4xCrOBj+TorwBIVmIXDz47Ym519qG/rR18hdeQvKOSa4Mwy0pjmVw69hcKb
	 MR12+5n2hof8yV4KH8xa6Ho9zLe/ydUU1JNUIa4BpzsF6TR7tzAJ7vdJ03cCJF1dj6
	 GTwoASfa78iolU9CsZOWqozr2ibFTyeim3b7V+V08Y0+xZfjRkMf3mQTG9izHJp9qf
	 JBtIPDpGnZ+MgicoeFDLfNwVwfqUFtOgNVKzAKKAxAtlQh71knfVtl9JW6tHa0askv
	 Baj7+Hj25B+Sw==
Received: by wens.tw (Postfix, from userid 1000)
	id 2B4DD5FEF9; Tue, 05 May 2026 21:48:19 +0800 (CST)
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
Subject: [PATCH 0/7] arm64: allwinner: h616: Support Video Engine
Date: Tue,  5 May 2026 21:48:04 +0800
Message-ID: <20260505134812.408316-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

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
  drivers: staging: media: sunxi: cedrus: add H616 variant
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

