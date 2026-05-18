Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BC9330D2A;
	Mon, 18 May 2026 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099931; cv=none; b=kxnrCFRU+C81Qfxdan6kaRf92W01WhOur+2IwbGc601uFf+TZGixJXT6qn3nq6ugOZoqWOfeqFUys0s4+JMy0tdGE5U85r5mkKYkBLHHZQ5lEs7+sl4cJACG1zZiuNun+4XoFwglDwEvQ+SY6d0ArOx52b46dUH64zu3FWlM1/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099931; c=relaxed/simple;
	bh=E1ZW9i0dYv/14hDo1SM4GZvuEWLlo3tOKSKIoH/g3qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKMfQbYczUFYKNWnGBoKO22GtabaH4M3XcpE9qBBVQdqcYO+ooLTQVwYWwbZUXRqXxHQHeUa5uJw1jQy/zlTA/n+p0pvePE/dFDPW4/l5AsJBzuoJEozrlw49aNsylhEFyNFHMvv6uz0LvlHobs/vkWbnQXq4OYXCtzYHM18yQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 80F401F80041;
	Mon, 18 May 2026 10:25:27 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 046C1B407FA; Mon, 18 May 2026 10:25:26 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 52013B407E7;
	Mon, 18 May 2026 10:24:52 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 00/16] media: sun6i-csi/isp MC-centric support and cleanups
Date: Mon, 18 May 2026 12:24:35 +0200
Message-ID: <20260518102451.417971-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series first introduces some fixes and new formats to v4l2 format
info, one of which we need for the sun6i-csi driver. Support for
MC-centric format enumeration is then added, along with cleanups and
improvements for both the sun6i-csi and sun6i-isp drivers.

The first 4 patches are already reviewed and ready to go and are
included here as a reminder that this series depends on them.

Arash Golgol (4):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-mipi-csi2: Use V4L2 subdev active state
  media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state

Paul Kocialkowski (12):
  media: v4l2-common: Fix NV15_4L4 format info block height
  media: v4l2-common: Add missing tiled format info block sizes
  media: v4l2-common: Add NV12_16L16 pixel format to v4l2 format info
  media: v4l2-common: Add NV12_32L32 pixel format to v4l2 format info
  media: sun6i-csi: Split format validation to a dedicated helper
  media: sun6i-csi: Add support for MC-centric format enumeration
  media: sun6i-csi: Tidy up and unify coding style
  media: sun6i-mipi-csi2: Fix parenthesis alignment
  media: sun6i-isp: Add dummy params link_validate implementation
  media: sun6i-isp: Use V4L2 subdev active state
  media: sun6i-isp: Add support for MC-centric format enumeration
  media: sun6i-isp: Add support for frame size enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 153 +++++++---------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 168 +++++++++++++-----
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++-----
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
 .../sun8i_a83t_mipi_csi2.c                    | 113 ++++++------
 .../sun8i_a83t_mipi_csi2.h                    |   2 -
 drivers/media/v4l2-core/v4l2-common.c         |  12 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  47 ++++-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  37 +++-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++------
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 -
 13 files changed, 437 insertions(+), 341 deletions(-)

-- 
2.54.0

