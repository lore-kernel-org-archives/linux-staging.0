Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8BE1C06
	for <linux-staging@lists.linux.dev>; Tue, 18 Apr 2023 08:01:20 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 748B8240013;
	Tue, 18 Apr 2023 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681804879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zEr0+swVK3WMZ0u3R6JdAyAw0vxa2R9V1YYMnBRXmiM=;
	b=VlArBWYO0GHWM0tVuD++le8G/QfyLoXa+QN+akk3JTrNqZq233IkarBTNAViSky0sFnME3
	hGuSU4HbeSinWCRXm7PQf2WY4sm8ye7luOu5SPOIaHsW8b93f9CtHau7sT/O6cj/5Et5Kg
	ukuUsXLQ0omoSQGMbBdKESNZXDfk1yOvNNiwtbLFs07rY5Vkqs3hkBk5HCVMZnSPfcfopx
	R7TEFkPp7LRZOXlDCIqtKUp97boWOKxTrAEoq5lhP0jKZ1TCjd5wP+0BoxzphuWwacnPOa
	/lnYXXmFE0gi5ZB/eq6sCuuYW3rX2iv7jT3t9efHUQIDUSmH+Z+dpEY9ZFtQpg==
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
Subject: [PATCH v6 04/20] staging: media: tegra-video: document tegra_channel_get_remote_source_subdev
Date: Tue, 18 Apr 2023 10:00:38 +0200
Message-Id: <20230418080054.452955-5-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418080054.452955-1-luca.ceresoli@bootlin.com>
References: <20230418080054.452955-1-luca.ceresoli@bootlin.com>
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

No changes in v6
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

