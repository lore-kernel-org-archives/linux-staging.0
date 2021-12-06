Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093962CA8
	for <linux-staging@lists.linux.dev>; Mon,  6 Dec 2021 13:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by comms.puri.sm (Postfix) with ESMTP id 60523DF382;
	Mon,  6 Dec 2021 05:13:15 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
	by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gOByUN2D2aqJ; Mon,  6 Dec 2021 05:13:14 -0800 (PST)
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 0/2] media: imx: imx8mq-mipi-csi2 fixes
Date: Mon,  6 Dec 2021 14:12:40 +0100
Message-Id: <20211206131242.2697464-1-martin.kepplinger@puri.sm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi Laurent and all interested,

these are fixes for the imx8mq mipi controller driver I collected recently.

thank you very much for any review,

                            martin


Martin Kepplinger (2):
  media: imx: imx8mq-mipi-csi2: fix system resume issue
  media: imx: imx8mq-mipi-csi2: remove wrong irq config write operation

 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.30.2

