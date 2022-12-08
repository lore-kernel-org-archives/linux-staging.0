Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7D6ECE;
	Thu,  8 Dec 2022 11:48:06 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 763A8240005;
	Thu,  8 Dec 2022 11:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670500085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9WP6UuK09ZiFFwZrEctyWpBf9jdRvt9QAuYsYKrf9k=;
	b=ao4e4f7P+lJKy9qfYHzHIF7eAn1YDeHe1Wt9uSb6KhpWzuCq1/jRdfb3iZPDFpxMdzLmHx
	yfpvtKpaDZyfOWneurQREbwg5Ws1BqT4kIlOvTaGIH7H2YbSl4SX7otgyx9JwfUtfpq7aU
	ixeElXx6iV2GawAbAyjpO7G5UJtDPTJmh3gWG7gug/fbYZKD9nbl6qRvBv/GZ7kxGu5UNl
	vTl5RtQoSYITURDbmRHAq9BZpfZT0Jzy9zwc/cJihzhXaTzMcxn6z+zppoXULfK0r8sj42
	oea3bxwsremp89F+p8ndsMEmphVs1QydErCL1ZX9HtJFjE35YFWvBGXQkH/RTA==
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
Subject: [PATCH 2/9] media: sun6i-csi: capture: Remove useless ret initialization
Date: Thu,  8 Dec 2022 12:47:35 +0100
Message-Id: <20221208114742.399461-3-paul.kocialkowski@bootlin.com>
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

There is no particular need to assign ret when declaring it as
it will be assigned before there is any chance to return it.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 6d34f5c0768f..cf6aadbc130b 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -832,7 +832,7 @@ static int sun6i_csi_capture_open(struct file *file)
 {
 	struct sun6i_csi_device *csi_dev = video_drvdata(file);
 	struct sun6i_csi_capture *capture = &csi_dev->capture;
-	int ret = 0;
+	int ret;
 
 	if (mutex_lock_interruptible(&capture->lock))
 		return -ERESTARTSYS;
-- 
2.38.1

