Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73285380
	for <linux-staging@lists.linux.dev>; Fri,  7 Apr 2023 13:39:25 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id CD5DD1BF20F;
	Fri,  7 Apr 2023 13:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680874764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/GjZm5PPxLztBEpj4lMVnSCCudcNgYBjQRLkBLEI30=;
	b=WxtWIMPtddf+2FUa/a0HVHnY4euAeiVs6YXyQlQN3Wp7nq72Qtshwh1LTxkH2aEt88dC5g
	OqwWxNTHNO2W9wygHUT2X/SiGChF3YqRSRc9Xy5/2qlIJDVkF8aID7z0YOTMojij9z/0UX
	I+277d/0pMyFF8hMDwH6HlH3VcTuujRQ0r3/K6rbHs41729G4W9dRY3CSDvezgibDZGwtb
	eRwd3EPS8m569Uc3tkP10//ZWmNEoybtrU+sBuoCqacDmCRT7YHFfbE/6g8F3lTT0l5LVD
	CrYWGmUxd9kCzf/4hlrtLnb03MeAihlMas++UGvuYSndmhgfH6Bdlv2b4S39CQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: linux-tegra@vger.kernel.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Richard Leitner <richard.leitner@skidata.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 03/20] staging: media: tegra-video: improve documentation of tegra_video_format fields
Date: Fri,  7 Apr 2023 15:38:35 +0200
Message-Id: <20230407133852.2850145-4-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
References: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some fields are irrelevant for Tegra20/VIP. Add a note to clarify that.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

No changes in v5

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index a68e2c02c7b0..5396bf53ab75 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -260,11 +260,11 @@ enum tegra_image_dt {
 /**
  * struct tegra_video_format - Tegra video format description
  *
- * @img_dt: image data type
- * @bit_width: format width in bits per component
+ * @img_dt: MIPI CSI-2 data type (for CSI-2 only)
+ * @bit_width: format width in bits per component (for CSI/Tegra210 only)
  * @code: media bus format code
  * @bpp: bytes per pixel (when stored in memory)
- * @img_fmt: image format
+ * @img_fmt: image format (for CSI/Tegra210 only)
  * @fourcc: V4L2 pixel format FCC identifier
  */
 struct tegra_video_format {
-- 
2.34.1

