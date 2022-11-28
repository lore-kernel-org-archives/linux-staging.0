Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DCE8F42
	for <linux-staging@lists.linux.dev>; Mon, 28 Nov 2022 15:25:11 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id DE242100019;
	Mon, 28 Nov 2022 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669649110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GBrmkxGUxB90OXm4GjTfStVLla9ZUuwuKwKG2o+/lk=;
	b=NXeyMEmbp4qKoa/ZO0xNT9bueu0uHpG7m9N/wxlNvQx7rXHiM/b2a1/Nplufw8q4rHIMfB
	A/7onnKi+/WXuoxBPDZ7rMnD0UnGH+6kJPwiHGHRfm1vPjJztl8hcnFDPD0+aN49H7jCW2
	cMvxGuGUmkZIaEu5bkD4+1IQIhTvEDiQUCGEPuMUuD1pGaHAK4O/FD2RfoFgKV8UODeLNZ
	kj+Y/sUiZG0G0KsYU69qyghSXBYIiY2mnetog3tsK8B4M5g6q22wMNVQVJFfBDdHgJuth1
	IqxSKqUZWjTy/6Go+b9r+q2IyuCnwRIxDl7QsMjwwdyiA9rEaBJH8gwaSNSYdw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v2 11/21] staging: media: tegra-video: Kconfig: allow TPG only on Tegra210
Date: Mon, 28 Nov 2022 16:23:26 +0100
Message-Id: <20221128152336.133953-12-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are about to add support for the Tegra20 parallel video capture, which
has no TPG. In preparation for that, limit the VIDEO_TEGRA_TPG option to
Tegra210 which is the only implementation currently provided by this
driver.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v2
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

