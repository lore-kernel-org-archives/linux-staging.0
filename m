Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC15A5D;
	Thu,  8 Dec 2022 11:48:10 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 653F5240003;
	Thu,  8 Dec 2022 11:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670500088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcI0CE2vpt8M7xlyKhWsNrg5u9xwZtrv/Ts2Ew1lIMc=;
	b=j/CgJV8VPsYt7NneQB0+ZoLdhthaIF5W1Ou+PGIwRuksgooZvVI5DdWSosR97KskYOF4m0
	cIDkQUEpD8K0xnbfTWtnWHpGhhK0tFGE/iWmP4+OgIyEWSqAutpiiTAS1mfvToAVVfDAv1
	Wti8vVTku4ZHWymGk7hr9h5+ZnLgX/O/obyC3MP378wZtxEYw1RX4t0z2CF/qwnli9LvjN
	gLpOuSI5u1sr13cGHmlXYTiHGXVDpPnmJ8Us1snHPmcK6cx7VEiGH/wSzLuZ/GY+IYwOpc
	YoeUyXkrHIHRattvifx9KcQqtRatYxxsTKBca9mEwL1YHlsM9nml2LHiV/pIpQ==
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
Subject: [PATCH 4/9] media: sun6i-mipi-csi2: Fix return code handling in stream off path
Date: Thu,  8 Dec 2022 12:47:37 +0100
Message-Id: <20221208114742.399461-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208114742.399461-1-paul.kocialkowski@bootlin.com>
References: <20221208114742.399461-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicitly set ret to zero instead of assigning it and overwriting it later,
which is a bit confusing to understand.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index 484ac5f054d5..a220ce849b41 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -188,7 +188,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 		return -ENODEV;
 
 	if (!on) {
-		ret = v4l2_subdev_call(source_subdev, video, s_stream, 0);
+		v4l2_subdev_call(source_subdev, video, s_stream, 0);
+		ret = 0;
 		goto disable;
 	}
 
@@ -280,8 +281,6 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	return 0;
 
 disable:
-	if (!on)
-		ret = 0;
 	phy_power_off(dphy);
 	sun6i_mipi_csi2_disable(csi2_dev);
 
-- 
2.38.1

