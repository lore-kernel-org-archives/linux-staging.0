Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6734617CD8
	for <linux-staging@lists.linux.dev>; Wed,  9 Nov 2022 14:19:53 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 70A7AFF80D;
	Wed,  9 Nov 2022 14:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668003591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jipryZ7SK5OxbJXJ4X894J5+2GVN2YC9kvIJJr1YcE=;
	b=aOnpvol8ufqql9DUeHYkTlfTAYTBw8/04Sv75/xiRvolKFZyljn/aSKAsPImycJUjj8RZ9
	wWkuBByAME+D/OFFaZx7C3dawiOxBlpCiw11va2xyycqyLl2VFWWpHymVs2i+NgWYB3AuG
	Go4HWQa+u9WGMHlwPBwiHVvuL/ZZwop24DOE2Iw/cqfkjcg/x9EO91I70cjeluBmghQC6u
	O1MAUqngYUR4Yxn31Ak787Msbwo6GHYNTXDIcRR1ays4Vjok6skGIgBObfwS3jxTAubLoR
	MFWbijMlsJVMPf7cQ/z6YfPwqK1bVjEPvho4cY8Clcjbn7NIU97gzFVNn2fSMA==
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
Subject: [PATCH 13/23] staging: media: tegra-video: Kconfig: allow TPG only on Tegra210
Date: Wed,  9 Nov 2022 15:18:42 +0100
Message-Id: <20221109141852.729246-14-luca.ceresoli@bootlin.com>
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

We are about to add support for the Tegra20 parallel video capture, which
has no TPG. In preparation for that, limit the VIDEO_TEGRA_TPG option to
Tegra210 which is the only implementation currently provided by this
driver.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
index df1b2cff2417..c53441822fdf 100644
--- a/drivers/staging/media/tegra-video/Kconfig
+++ b/drivers/staging/media/tegra-video/Kconfig
@@ -15,5 +15,6 @@ config VIDEO_TEGRA
 config VIDEO_TEGRA_TPG
 	bool "NVIDIA Tegra VI driver TPG mode"
 	depends on VIDEO_TEGRA
+	depends on ARCH_TEGRA_210_SOC
 	help
 	  Say yes here to enable Tegra internal TPG mode
-- 
2.34.1

