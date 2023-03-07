Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7944AAD49
	for <linux-staging@lists.linux.dev>; Tue,  7 Mar 2023 15:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by comms.puri.sm (Postfix) with ESMTP id D11ABFDA7F;
	Tue,  7 Mar 2023 07:01:26 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
	by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zk4AQkC5ppIp; Tue,  7 Mar 2023 07:01:26 -0800 (PST)
From: Martin Kepplinger <martin.kepplinger@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
	t=1678201286; bh=G4oLX3QKgPPsLbIKc+SYmXlS7UOyLkBBHTW6vmCxneQ=;
	h=From:To:Cc:Subject:Date:From;
	b=FkvgUUhIWpx2fCXAGrJIVT3XReSAH7qd0NU3RVYcS3RmOUqou1whWIVVH9imfRVpb
	 B/iKw0oxTk2gRKH2tG0hnbFZLZzOe7sm4phXRlaMvuRKLpk55HLp1/jn251SHeDgzF
	 lbXqh2OkGHgtDFzIH593rhRuuq2FhRXtoeh4w70xT0DoxlYL73zettJGej8WdJ7ml0
	 Y5dXfr7eA8kwllSEd0eTuXa5eMPT/yA2yeSOwUxQ+fO7eW0yi6a3u1NsTWgCTGaHBq
	 KB+p8hiT22W5NU5qPQMOOAMQRAktoHLMoZAdPt8EaOoC+OkuVvLppC4gLvNP46DiUG
	 I7jQn/cX0eLpg==
To: laurent.pinchart@ideasonboard.com,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@puri.sm,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v2 0/2] media: imx: imx8mq-mipi-csi2: Use V4L2 subdev state
Date: Tue,  7 Mar 2023 16:00:45 +0100
Message-Id: <20230307150047.1486186-1-martin.kepplinger@puri.sm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi Laurent and all interested,

this is driver simplifications and cleanups for the imx8mq mipi csi receiver.
Remaining TODO is:
	* moving the driver into media/platform/nxp
	* getting rid of the internal "state" variable
	* autosuspend at the end of probe()

thanks for your time when looking at this,

                               martin


revision history
----------------

v2: thank you, Laurent:
 * properly unlock the subdev state
 * fix pm hunk in probe()
 * add patch to "inline hs_settle"

v1: initial patch:
https://lore.kernel.org/linux-media/41417ffce644975b3be0d52fb7ac584b3a7c3b1b.camel@puri.sm/T/#t


Martin Kepplinger (2):
  media: imx: imx8mq-mipi-csi2: Use V4L2 subdev active state
  media: imx: imx8mq-mipi-csi2: remove unneeded state variable and
    function

 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 153 +++++++------------
 1 file changed, 59 insertions(+), 94 deletions(-)

-- 
2.30.2

