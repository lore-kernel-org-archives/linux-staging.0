Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049F1D502
	for <linux-staging@lists.linux.dev>; Sat, 15 Jun 2024 01:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718416700; cv=none; b=RgyUc3kx0ozECfgS0+BwNx5WAAaP0jPoDp6hIGwprZdJoubLrmYBy3AGVyArdQOQa3m+0H2ZJ4RFJ3xF6m9W50G+jucTFSzIm2rarHAKWCnzqe+6/bADx8hsv+02ZHJ5A9Z0kbfiEHvvdnG/AFuEHCn87/EeY0HZ2qLXyJi0clA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718416700; c=relaxed/simple;
	bh=0UTcYjd/8qry8O1pLuXm3l+KAOWonlHQZvdyiqU7/JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXikc5pSZp+Cf3mSUkDMNHWonzSYo4dU2tMgjf8Cs8zVwysdxM5Py86AHQo4f5+Mqaef2aE8ueIm7TvETNVnHJ4UpMqSeeyfXHi5g3IOFm/a5klzNtReUpDI+G70nsnjmWjf7wS94wJS1CDEzLK2NH8ph4q3F86+tRqz9mChMzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U671+UAD; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U671+UAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718416697;
	bh=0UTcYjd/8qry8O1pLuXm3l+KAOWonlHQZvdyiqU7/JM=;
	h=From:To:Cc:Subject:Date:From;
	b=U671+UADHvs8gQ98je0MEVzUl8WLvHhfyn4jmSIgM5ChBC38OyxBDhtjhBVqMTqyj
	 9w2dFHRBTOGM6O/GCVtZ2TviKFUnainsR+DPX7Ul5HhoOtce0KrCTz2yvfxrbaRhMi
	 aHOtaQlFkLLN3cKVr/FYhRpQJkufmFPzsw0VFVNxbCj07vj6f8nsScKQLfgRw0M4Tr
	 Izc/u77ruz2XCFRXCRf47l0eowOb6yzXPE7G0gIr8RKwZJU8jTfuwD7DZTcpHclBxg
	 a2yoChE4gg2S21jQZvSKgbHvoVFnwMThR0Bg8tppTz89VkSzEaeOTYQuIfPWacpLlB
	 DfccvweTBHjuQ==
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2CD263781104;
	Sat, 15 Jun 2024 01:58:14 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 0/3] media: rockchip: Add rkvdec2 driver
Date: Fri, 14 Jun 2024 21:56:26 -0400
Message-ID: <20240615015734.1612108-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a rkvdec2 driver for newer video decoder found on rk3588 based SoC.

See the first commit message for implementation details.

Detlev Casanova (3):
  media: rockchip: Introduce the rkvdec2 driver
  media: dt-bindings: rockchip: Document RK3588 Video Decoder 2 bindings
  arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)

 .../bindings/media/rockchip,vdec2.yaml        |   80 ++
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |    4 +
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |    4 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     |   19 +
 drivers/staging/media/Kconfig                 |    1 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/rkvdec2/Kconfig         |   15 +
 drivers/staging/media/rkvdec2/Makefile        |    3 +
 drivers/staging/media/rkvdec2/TODO            |   13 +
 drivers/staging/media/rkvdec2/rkvdec2-h264.c  |  899 +++++++++++++
 drivers/staging/media/rkvdec2/rkvdec2-regs.h  |  372 ++++++
 drivers/staging/media/rkvdec2/rkvdec2.c       | 1160 +++++++++++++++++
 drivers/staging/media/rkvdec2/rkvdec2.h       |  123 ++
 13 files changed, 2694 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec2.yaml
 create mode 100644 drivers/staging/media/rkvdec2/Kconfig
 create mode 100644 drivers/staging/media/rkvdec2/Makefile
 create mode 100644 drivers/staging/media/rkvdec2/TODO
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-h264.c
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-regs.h
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.c
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.h

-- 
2.44.2

