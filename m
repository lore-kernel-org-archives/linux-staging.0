Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B7246A9
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 13:32:38 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 476C9FF805;
	Thu, 29 Dec 2022 13:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672320757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsmhIDmSSfH619hRw6C44IlZdoLkr++cNYpPRM0qeT8=;
	b=bINMhtijHQXwSNYJl+84GZHHzEQtngyD0Ylkserq7dtkBOZvIdhn/O7XAbm/V7vHOPi6xZ
	Usu+/V2wW4TvKHHPFczFi66RoToaLtclBzZn6LBe6HFK09a3tml7UNABtJOTNtFT2a0Nmn
	ROAg9WQWPd0Qh4ooZjgNeIxeEgVrN99yyRGQSsQl/amX9ETq+ddGVBg2P04Msx7ilAY0cb
	DkPfgF3ez/DuhVwGXsO8bliwHH7q3t1O4G2G0A45tLcacMNNh8UbeKB7fNoxzEVYO0IS4t
	T8gPPH/v1s8XeZLZ1N+TJN9pHW3nisAm2c4+YOkxpsF/FQDWtjFqrlHIZr3kEg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v3 08/21] staging: media: tegra-video: slightly simplify cleanup on errors
Date: Thu, 29 Dec 2022 14:31:52 +0100
Message-Id: <20221229133205.981397-9-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_put(node) does nothing if node == NULL, so it can be moved to the
cleanup section at the bottom.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 0e5067a7986a..c2724e1ecafb 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1263,7 +1263,7 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 	struct device_node *node = vi->dev->of_node;
 	struct device_node *ep = NULL;
 	struct device_node *ports;
-	struct device_node *port;
+	struct device_node *port = NULL;
 	unsigned int port_num;
 	struct device_node *parent;
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
@@ -1286,7 +1286,6 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 			dev_err(vi->dev, "invalid port num %d for %pOF\n",
 				port_num, port);
 			ret = -EINVAL;
-			of_node_put(port);
 			goto cleanup;
 		}
 
@@ -1309,13 +1308,12 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 
 		lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
 		ret = tegra_vi_channel_alloc(vi, port_num, port, lanes);
-		if (ret < 0) {
-			of_node_put(port);
+		if (ret < 0)
 			goto cleanup;
-		}
 	}
 
 cleanup:
+	of_node_put(port);
 	of_node_put(ports);
 	return ret;
 }
-- 
2.34.1

