Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59046A9
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 13:32:32 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id B0825FF80F;
	Thu, 29 Dec 2022 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672320750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSihM6Wjt78AkZJ7cO7U2XtTCOIBs2Jh3yvc+KsQGxk=;
	b=N7howy8iMtRhbikukCOsHdZDGVDGD42jrWpgooTf/2YbD0IMI+0hGRCEJoCi/8SEpjH+Iv
	UolNxWaFxO0LzzBrTtZRVwhYhRRJauYuIm4PBOjBiSRattAkNioGNZeCOGV+qhFnY2+oOA
	zKE9I2uSGACQ+EZuDYsVG7xRqSSYnflFPGK5nwU5S+umBtsxQsbTpG+4qCXTOuy4NF21g8
	tQ2+eLAz/dOcplgnWeJSHSzHtZMM3t2Qj1mZId2JLP+U2+QXhWfn6uUinoXxR1nCRprILw
	aCePAM7v38sIHteoPV12S8R57E2TkXsy/Tj9j4jzTYa78zT4iUjvWuhKFAdsnA==
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
Subject: [PATCH v3 06/21] staging: media: tegra-video: fix typos in comment
Date: Thu, 29 Dec 2022 14:31:50 +0100
Message-Id: <20221229133205.981397-7-luca.ceresoli@bootlin.com>
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

Add "skip" in "so we can *skip* the current channel" or it doesn't make
sense.

Also add articles where appropriate to fix English grammar.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 6aecdd28bd82..ae7adf640e76 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1762,10 +1762,10 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
 	 * Walk the links to parse the full graph. Each channel will have
 	 * one endpoint of the composite node. Start by parsing the
 	 * composite node and parse the remote entities in turn.
-	 * Each channel will register v4l2 async notifier to make the graph
-	 * independent between the channels so we can the current channel
+	 * Each channel will register a v4l2 async notifier to make the graph
+	 * independent between the channels so we can skip the current channel
 	 * in case of something wrong during graph parsing and continue with
-	 * next channels.
+	 * the next channels.
 	 */
 	list_for_each_entry(chan, &vi->vi_chans, list) {
 		struct fwnode_handle *ep, *remote;
-- 
2.34.1

