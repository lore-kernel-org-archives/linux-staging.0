Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F0F17CD3
	for <linux-staging@lists.linux.dev>; Wed,  9 Nov 2022 14:19:48 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 3E45AFF810;
	Wed,  9 Nov 2022 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668003586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1MfEY6qNJmle8dG3mVnv/FdB23DDX5FGvXt/PgtRbi0=;
	b=EFRdtXEFhEhia1JbEDNKzAwCB9Mh+yP6b4KjqO4lqyA2HbNmAGzMByMAiDqMOXS1ueUluO
	PWumd/t60Oh3NdRsm0rCUdtc5XHCxGQrEyml82bS/b/0oZAFq14Ce3aMwJ2Brd+68GdR2G
	Oyp8hY/RQz+lE71RibbuIhjfevqZkIr9VOWmZVlOQDV1jdwQE1BmbPgzk8PPytXC4W6cRw
	AKaQTUcpWHBrUDAORmfyhX2tljzxmsysZJEcD6l+ljZIhr9MbV3B/yji3VL/cCN7hMejaA
	0l+Olv6wYYRjXDtKe5urnbxXIObp77ERXqeiiIz1vw9WWgCeIz1qTiwSIQ/xpg==
From: luca.ceresoli@bootlin.com
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 11/23] staging: media: tegra-video: move private struct declaration to C file
Date: Wed,  9 Nov 2022 15:18:40 +0100
Message-Id: <20221109141852.729246-12-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

struct tegra_vi_graph_entity is an internal implementation detail of the VI
module. Move its declaration from vi.h to vi.c.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/vi.c | 13 +++++++++++++
 drivers/staging/media/tegra-video/vi.h | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 2657207e5b7d..55a135bef1a9 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -31,6 +31,19 @@
 
 #define MAX_CID_CONTROLS		1
 
+/**
+ * struct tegra_vi_graph_entity - Entity in the video graph
+ *
+ * @asd: subdev asynchronous registration information
+ * @entity: media entity from the corresponding V4L2 subdev
+ * @subdev: V4L2 subdev
+ */
+struct tegra_vi_graph_entity {
+	struct v4l2_async_subdev asd;
+	struct media_entity *entity;
+	struct v4l2_subdev *subdev;
+};
+
 static const struct tegra_video_format tegra_default_format = {
 	.img_dt = TEGRA_IMAGE_DT_RAW10,
 	.bit_width = 10,
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index dd35c3ac992b..dfd834a69848 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -98,19 +98,6 @@ struct tegra_vi {
 	struct list_head vi_chans;
 };
 
-/**
- * struct tegra_vi_graph_entity - Entity in the video graph
- *
- * @asd: subdev asynchronous registration information
- * @entity: media entity from the corresponding V4L2 subdev
- * @subdev: V4L2 subdev
- */
-struct tegra_vi_graph_entity {
-	struct v4l2_async_subdev asd;
-	struct media_entity *entity;
-	struct v4l2_subdev *subdev;
-};
-
 /**
  * struct tegra_vi_channel - Tegra video channel
  *
-- 
2.34.1

