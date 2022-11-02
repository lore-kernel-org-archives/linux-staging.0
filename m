Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643EB801
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 11:11:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 74DA2CDD1D
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 11:02:24 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 21E19FF81A;
	Wed,  2 Nov 2022 11:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667386936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AIWP8hCG3H8802+ZOuJvt5Vl5+0UlGU9wyMe8L68JX0=;
	b=il6dEg4V1FoLPtn1gLJiTHTPHNENeF9bzb58WJ1zQuz2JTaOA2NIyarOSIrsc3xmXKiCiL
	Nn1Nn+uwyVC39P7pdBs+56MGUX9ac6tCHwu8QqQQI4vVQ/Cf913yJa28Ve4/J2/8zwSZll
	xOvQ9/HGzov3hy0WiEwVwTuvgEXKknj1OXO7fDh0+yiyfSWG52xp452qr2s5kCP40MIYpG
	W/6GNcYmsCaih1/I3yBfG/VnxWgnNrKAm3zUn3/6cSJVgxSh518GIQSU6NSP9guwDSlwZt
	+8NRQ2dA+nN/hz7oMOZn9HDB0vwiHSvMyYfb4rqltdrpk9ozXIAwKsdHb5wqfA==
From: luca.ceresoli@bootlin.com
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	stable@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2 1/2] staging: media: tegra-video: fix chan->mipi value on error
Date: Wed,  2 Nov 2022 12:01:01 +0100
Message-Id: <20221102110102.25050-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

chan->mipi takes the return value of tegra_mipi_request() which can be a
valid pointer or an error. However chan->mipi is checked in several places,
including error-cleanup code in tegra_csi_channels_cleanup(), as 'if
(chan->mipi)', which suggests the initial intent was that chan->mipi should
be either NULL or a valid pointer, never an error. As a consequence,
cleanup code in case of tegra_mipi_request() errors would dereference an
invalid pointer.

Fix by ensuring chan->mipi always contains either NULL or a void pointer.

Also add that to the documentation.

Fixes: 523c857e34ce ("media: tegra-video: Add CSI MIPI pads calibration")
Cc: stable@vger.kernel.org
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v2.
---
 drivers/staging/media/tegra-video/csi.c | 1 +
 drivers/staging/media/tegra-video/csi.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index b26e44adb2be..6b59ef55c525 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -448,6 +448,7 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 	chan->mipi = tegra_mipi_request(csi->dev, node);
 	if (IS_ERR(chan->mipi)) {
 		ret = PTR_ERR(chan->mipi);
+		chan->mipi = NULL;
 		dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
 	}
 
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 4ee05a1785cf..6960ea2e3d36 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -56,7 +56,7 @@ struct tegra_csi;
  * @framerate: active framerate for TPG
  * @h_blank: horizontal blanking for TPG active format
  * @v_blank: vertical blanking for TPG active format
- * @mipi: mipi device for corresponding csi channel pads
+ * @mipi: mipi device for corresponding csi channel pads, or NULL if not applicable (TPG, error)
  * @pixel_rate: active pixel rate from the sensor on this channel
  */
 struct tegra_csi_channel {
-- 
2.34.1

