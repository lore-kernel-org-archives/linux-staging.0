Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E890D2F3D;
	Thu,  8 Dec 2022 13:55:44 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D58BE20012;
	Thu,  8 Dec 2022 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670507737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D72yUqu7m48k5zBuzbm447wtIHbUMxzdY7+zPY816tM=;
	b=Ki39pHvrZGR1tB37rKL2j2WxQxZcVVgHLXL7ZfngRZ2bhy5vGzHnmHcUDFAXIPnAggYEGd
	HR/e09BIj91eRIAslhIxuACBNk/rmCl9GyIckvVtp4FiTZu5NrWM+CiprqDynhcGo5zj0W
	4/zal0uXw5CgLPiFYWneJzBvTfsEleZlPA7eIub49nMz6854/l/8DNwHdN14QUyX8PQQMe
	AI1CUSjRjk5sVQSYyjljYN6M0AFIUw+3LDk+2yJHS3pJS7QpWIHIQQtQ6gAtyjLErgwH7p
	tpl53YYMUeb7M/mXN36Z7qtLSFATwyGIFvKIQi9img8reIU6omcDpN4QoyHqzQ==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Conor Dooley <conor@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 00/11] Allwinner A31/A83T CSI/ISP/MIPI CSI-2 media fixes
Date: Thu,  8 Dec 2022 14:55:01 +0100
Message-Id: <20221208135512.421903-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series resolves reported smatch warnings against the recently-introduced
Allwinner A31/A83T CSI, ISP and MIPI CSI-2 drivers.

Smatch was ran again on the updated tree and no longer shows any error or
warning.

Changes since v1:
- Added fixes for static struct declarations;
- Fixed ISP commit titles by replacing bridge with proc.

Paul

Paul Kocialkowski (11):
  media: sun6i-csi: bridge: Fix return code handling in stream off path
  media: sun6i-csi: bridge: Error out on invalid port to fix warning
  media: sunxi-csi: bridge: Declare subdev ops as static
  media: sun6i-csi: capture: Remove useless ret initialization
  media: sun6i-mipi-csi2: Fix return code handling in stream off path
  media: sun8i-a83t-mipi-csi2: Fix return code handling in stream off
    path
  media: sun6i-isp: proc: Fix return code handling in stream off path
  media: sun6i-isp: proc: Error out on invalid port to fix warning
  media: sunxi-isp: proc: Declare subdev ops as static
  media: sun6i-isp: capture: Fix uninitialized variable use
  media: sun6i-isp: params: Fix incorrect indentation

 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c | 8 ++++----
 .../media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c    | 2 +-
 .../platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c      | 5 ++---
 .../sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c     | 5 ++---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c | 4 ++--
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c  | 4 ++--
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 8 ++++----
 7 files changed, 17 insertions(+), 19 deletions(-)

-- 
2.38.1

