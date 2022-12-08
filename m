Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429342F5E;
	Thu,  8 Dec 2022 13:55:47 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8F00C20019;
	Thu,  8 Dec 2022 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670507745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9WP6UuK09ZiFFwZrEctyWpBf9jdRvt9QAuYsYKrf9k=;
	b=i3cfaYEH/DQZOcJK0DKD98VcDygnOXzzbGnsd+/9NP3e+6WcZ+U1IK6Pn6xv4mJo9ww01g
	y7VcqMrCWYMSjpY8JkOzpyvcWRkgo+dGobQB/D7cUBpg/XU3VTtnMU1d1ifj3mYDh0u5H4
	kjs91HSY5jDQA/YpXXFAA//HH//C6ElCEzWwb1ctlnfeOj6pSlWzNFtp31qhf1mF2xWCCa
	YN0RwHK7yxvmogF/r8EQ9pB/Lh0nPbifNLMhqoCjVpv/Dwos9PJflv1hke/VDHaa7U82ef
	KzCkmTJDCi3W4X5PaXNSKF48xoR3j9+cEmK/nqW1qiC+2sYfahEPDGhtVFiq5w==
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
Subject: [PATCH v2 04/11] media: sun6i-csi: capture: Remove useless ret initialization
Date: Thu,  8 Dec 2022 14:55:05 +0100
Message-Id: <20221208135512.421903-5-paul.kocialkowski@bootlin.com>
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

