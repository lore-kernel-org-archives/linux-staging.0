Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B11E1C02
	for <linux-staging@lists.linux.dev>; Tue, 18 Apr 2023 08:01:24 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 45847240002;
	Tue, 18 Apr 2023 08:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681804882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFW43TGlDfYKqzfsHCpEy0ODtZ8ric12BDIS5XN/hY8=;
	b=lHz7u5KQQxMSJUhODl0shSb0rIRdo/007+0iqp0T9zxmwvFIfNDQNaWgTCGS7Nw0Zh9zLv
	bN0YRK9braSY3jokQchVqjV9lZhYY01I7ag8g2uuGozRICEZ09YoxVyvwMGJXRhwRPTFya
	ghyrnA7/Rga4N1rV+PNICiNB7Wi8CmqkFSTel9eQ5WQX91lfR9VVU5l2D7NZD6YKW/Ldzz
	YFdsqfswTAt/bCVWQiEK6jqv9F+tIIhJ65LRKPCeo+Gr5jrkw4S3Fr4o28S8JQM8Eblzv9
	Uwdj2XfUOuPKUpPxSIFeV6T2gh0DUtqFJB5voCkct59VUFbIPMDeWhtQOwrZXQ==
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
Subject: [PATCH v6 05/20] staging: media: tegra-video: fix typos in comment
Date: Tue, 18 Apr 2023 10:00:39 +0200
Message-Id: <20230418080054.452955-6-luca.ceresoli@bootlin.com>
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

Add "skip" in "so we can *skip* the current channel" or it doesn't make
sense.

Also add articles where appropriate to fix English grammar.

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
 drivers/staging/media/tegra-video/vi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 44c56dc85980..79dd02a1e29b 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1859,10 +1859,10 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
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

