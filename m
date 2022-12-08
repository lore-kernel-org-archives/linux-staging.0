Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCE82F3D;
	Thu,  8 Dec 2022 13:56:01 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DB6182000D;
	Thu,  8 Dec 2022 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670507760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o81YP8iaZF1sop9pwY0IwP4XTu0ePsqSN3S/jSq8oYA=;
	b=NfylqO5/yCL99QdgCyudiwPSAqArXO2czHvBiFyPnDz+NRlFssMSKJfxYaOcVT1VNt+xu4
	I7/RFD0vFq42Y6fpwcEdQNpvuhYeqzX4pxhuhftpTaXeTNmgBz5MymKAsqMPFKh08Vw9rI
	yKcJkqtHNc8oEhh9XSTiOl3PqbJiMaF/JXsqaoqPHWSM8f9GX/wCWGwtUjf6PWiThQ291t
	i0KslkXUH6u7IRLVKsBAcIrYU4CYNuiYkND5QzOkPaRMbveioscDeDvgmfzCC5GbtH1khS
	33hKW1UR8N4FT1X8RxScBLNLjrpNXrgWAcVPi2Rb62484pXcZHl5jA+iVQAphg==
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
Subject: [PATCH v2 11/11] media: sun6i-isp: params: Fix incorrect indentation
Date: Thu,  8 Dec 2022 14:55:12 +0100
Message-Id: <20221208135512.421903-12-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208135512.421903-1-paul.kocialkowski@bootlin.com>
References: <20221208135512.421903-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a heading whitespace that results in a smatch warning.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 8039e311cb1c..7b41a13162b9 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -183,8 +183,8 @@ void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev)
 	if (state->configured)
 		goto complete;
 
-	 sun6i_isp_params_configure_modules(isp_dev,
-					    &sun6i_isp_params_config_default);
+	sun6i_isp_params_configure_modules(isp_dev,
+					   &sun6i_isp_params_config_default);
 
 	state->configured = true;
 
-- 
2.38.1

