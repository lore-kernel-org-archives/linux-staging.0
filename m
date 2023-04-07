Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065CB5380
	for <linux-staging@lists.linux.dev>; Fri,  7 Apr 2023 13:39:31 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id AA3A91BF203;
	Fri,  7 Apr 2023 13:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680874770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4M+3Ec5aqFaKvdFzu+ibwr6LsVG/WUQeKXGIcBKEyq8=;
	b=kHdbmHKEkLdndA6YmBETpnHiHmKKpkrKJc9fAUc8/zymm/vY9DPOUmiKBJykm3Y4rkn+a8
	f4aWaINB6ofjnEUP2sY05C9RAV//KRZb0eM885AoBY7bTuYiiefBjctz3uCnlY86E6kipv
	mOIYVaRLXcecCuuQ1BuEMThuVsKbLe9bqalUSgxH5ZIAhKa2bPiOpVbYJ21q/JmwQTJZbS
	kjtDBk6d0+tjoyisxSCkOiZ959stNGEEL+affK9BbT0qKliWX8hTPOWhU5/SBo35GguEuq
	qQWRdD+EEu1MQJHKExQS/HguwjjEadbLG8tzGZG97p9wDUQ3xVgY2m8tGRsl5g==
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
Subject: [PATCH v5 04/20] staging: media: tegra-video: document tegra_channel_get_remote_source_subdev
Date: Fri,  7 Apr 2023 15:38:36 +0200
Message-Id: <20230407133852.2850145-5-luca.ceresoli@bootlin.com>
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

Clarify what this function does.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

No changes in v5

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 11dd142c98c5..44c56dc85980 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -164,6 +164,9 @@ tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
 	return media_entity_to_v4l2_subdev(pad->entity);
 }
 
+/*
+ * Walk up the chain until the initial source (e.g. image sensor)
+ */
 struct v4l2_subdev *
 tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 {
-- 
2.34.1

