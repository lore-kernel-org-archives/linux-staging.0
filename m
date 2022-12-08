Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9291FA21;
	Thu,  8 Dec 2022 11:48:03 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C5A41240002;
	Thu,  8 Dec 2022 11:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670500081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EmSSWfmAQotsz56jadZuCs8HLkx1/zaw7zypFRHxTzA=;
	b=JLwMm0zCVgvV2F7IT+WF6yPqCD5i5Q4ZRDawrLicalqRo8RcSI6PVjkD8shzhnHVJgo/+h
	AHgoDlJFKU5+BiaDWVWyA+8cKAVxUTSnW4vas492QTYn9clMdpyIphIpSDImQAntlBvy/+
	LG/lMHaEgSXohpxQwIPnW7ITScOWZfmbWE3YXnoOSWHMlJ/kvVTqqbMcUaWrK/YwPUTMJn
	ltT8Gl3WswWOw+8F0yBr4BaXOLWY4ScBskJpLbw72bfFpcuoVXzRaJl+94TICWExn+ydoP
	4iSAucvreDOidYTIud1saqEI7Qky0Ad6PlsE8D6JeQNqWNR15XEMOQ6Z0/E5Ig==
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
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 0/9] Allwinner A31/A83T CSI/ISP/MIPI CSI-2 media fixes
Date: Thu,  8 Dec 2022 12:47:33 +0100
Message-Id: <20221208114742.399461-1-paul.kocialkowski@bootlin.com>
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

Paul

Paul Kocialkowski (9):
  media: sun6i-csi: bridge: Fix return code handling in stream off path
  media: sun6i-csi: capture: Remove useless ret initialization
  media: sun6i-csi: bridge: Error out on invalid port to fix warning
  media: sun6i-mipi-csi2: Fix return code handling in stream off path
  media: sun8i-a83t-mipi-csi2: Fix return code handling in stream off
    path
  media: sun6i-isp: bridge: Fix return code handling in stream off path
  media: sun6i-isp: bridge: Error out on invalid port to fix warning
  media: sun6i-isp: capture: Fix uninitialized variable use
  media: sun6i-isp: params: Fix incorrect indentation

 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c   | 6 +++---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c  | 2 +-
 .../media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c  | 5 ++---
 .../sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c       | 5 ++---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c   | 4 ++--
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c    | 4 ++--
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c      | 6 +++---
 7 files changed, 15 insertions(+), 17 deletions(-)

-- 
2.38.1

