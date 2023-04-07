Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126B05380
	for <linux-staging@lists.linux.dev>; Fri,  7 Apr 2023 13:40:10 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 090971BF205;
	Fri,  7 Apr 2023 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680874809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kUmFRT8Feq147dzZJ+UxUhEHuVDTM6lRC0Uxl+5isTk=;
	b=P1BHlCptoOBpfPSARHdqgL3Ju3Mdf4pm7N2XVSePnEwwERXbbNDV3KcdciwMM4O6PY9qvP
	MlgBBcj/+jn+pkfsDN+byAoiyaQVd9N7L6MGvLItzbA2yQOD13cQM7NiDBMzwfxTEY6ci+
	xbvL8vYD3gO9FyDJaO0OB4EnIIJgpb0XeIJbd524B07CmyC0ZbZ3j5SpPKu4/4km0xPWbE
	D0UQaKqitVK+/FwpEfUSW8IBM4saKddE8tMNBRu7Pod0Ma3BolEPfjdvfAeTudllxa6vvb
	Ijj9pzn7QvHLZIJ+HY1HuCEwG7Dr0pjPZXQ4B4Ep27orh/3cO+IfjkQZlHPbJA==
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
Subject: [PATCH v5 10/20] staging: media: tegra-video: remove unneeded include
Date: Fri,  7 Apr 2023 15:38:42 +0200
Message-Id: <20230407133852.2850145-11-luca.ceresoli@bootlin.com>
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

There is only a pointer reference to struct tegra_vi in video.h, thus vi.h
is not needed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

No changes in v5

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/video.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/video.h b/drivers/staging/media/tegra-video/video.h
index fadaf2189dc9..1e9be1474a9c 100644
--- a/drivers/staging/media/tegra-video/video.h
+++ b/drivers/staging/media/tegra-video/video.h
@@ -12,7 +12,6 @@
 #include <media/v4l2-device.h>
 
 #include "vi.h"
-#include "csi.h"
 
 struct tegra_video_device {
 	struct v4l2_device v4l2_dev;
-- 
2.34.1

