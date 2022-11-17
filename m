Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CEA6AA2
	for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 16:00:44 +0000 (UTC)
Received: from ideasonboard.com (unknown [103.251.226.79])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC745929;
	Thu, 17 Nov 2022 17:00:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1668700842;
	bh=1DYpqsXvXsGG5IOvxeeijtQCtN/gvWpP1KZhKnLeIbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Swk4StMfC87C4+EHNtHps8Zsm2j+XMV36WOhsHH2IDlV0p4FtZWLFnZh30co8Uk3+
	 TqZolGoofnEbvlq7GVz/B1koaxITxDxKocWiklCxhMTXfbWerF19KP1SL44gEeGDOM
	 669rva9SqVKPAJetExlV5w9KTLO6YrdgwGxUHNzI=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 3/3] vc04_services: bcm2835-camera: Use bool values for mmal_fmt.remove_padding
Date: Thu, 17 Nov 2022 21:30:15 +0530
Message-Id: <20221117160015.344528-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117160015.344528-1-umang.jain@ideasonboard.com>
References: <20221117160015.344528-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct mmal_fmt.remove_padding is defined as a boolean type hence,
use boolean values for it instead of 0/1 integers. This enhances
code readability.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../bcm2835-camera/bcm2835-camera.c           | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index fd456d1f7061..797ebe2a973a 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -87,21 +87,21 @@ static struct mmal_fmt formats[] = {
 		.depth = 12,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 1,
-		.remove_padding = 1,
+		.remove_padding = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.mmal = MMAL_ENCODING_YUYV,
 		.depth = 16,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 2,
-		.remove_padding = 0,
+		.remove_padding = false,
 	}, {
 		.fourcc = V4L2_PIX_FMT_RGB24,
 		.mmal = MMAL_ENCODING_RGB24,
 		.depth = 24,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 3,
-		.remove_padding = 0,
+		.remove_padding = false,
 	}, {
 		.fourcc = V4L2_PIX_FMT_JPEG,
 		.flags = V4L2_FMT_FLAG_COMPRESSED,
@@ -109,7 +109,7 @@ static struct mmal_fmt formats[] = {
 		.depth = 8,
 		.mmal_component = COMP_IMAGE_ENCODE,
 		.ybbp = 0,
-		.remove_padding = 0,
+		.remove_padding = false,
 	}, {
 		.fourcc = V4L2_PIX_FMT_H264,
 		.flags = V4L2_FMT_FLAG_COMPRESSED,
@@ -117,7 +117,7 @@ static struct mmal_fmt formats[] = {
 		.depth = 8,
 		.mmal_component = COMP_VIDEO_ENCODE,
 		.ybbp = 0,
-		.remove_padding = 0,
+		.remove_padding = false,
 	}, {
 		.fourcc = V4L2_PIX_FMT_MJPEG,
 		.flags = V4L2_FMT_FLAG_COMPRESSED,
@@ -125,63 +125,63 @@ static struct mmal_fmt formats[] = {
 		.depth = 8,
 		.mmal_component = COMP_VIDEO_ENCODE,
 		.ybbp = 0,
-		.remove_padding = 0,
+		.remove_padding = false,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YVYU,
 		.mmal = MMAL_ENCODING_YVYU,
 		.depth = 16,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 2,
-		.remove_padding = 0,
+		.remove_padding = false,
 	}, {
 		.fourcc = V4L2_PIX_FMT_VYUY,
 		.mmal = MMAL_ENCODING_VYUY,
 		.depth = 16,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 2,
-		.remove_padding = 0,
+		.remove_padding = false,
 	}, {
 		.fourcc = V4L2_PIX_FMT_UYVY,
 		.mmal = MMAL_ENCODING_UYVY,
 		.depth = 16,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 2,
-		.remove_padding = 0,
+		.remove_padding = false,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.mmal = MMAL_ENCODING_NV12,
 		.depth = 12,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 1,
-		.remove_padding = 1,
+		.remove_padding = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_BGR24,
 		.mmal = MMAL_ENCODING_BGR24,
 		.depth = 24,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 3,
-		.remove_padding = 0,
+		.remove_padding = false,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YVU420,
 		.mmal = MMAL_ENCODING_YV12,
 		.depth = 12,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 1,
-		.remove_padding = 1,
+		.remove_padding = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV21,
 		.mmal = MMAL_ENCODING_NV21,
 		.depth = 12,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 1,
-		.remove_padding = 1,
+		.remove_padding = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_BGR32,
 		.mmal = MMAL_ENCODING_BGRA,
 		.depth = 32,
 		.mmal_component = COMP_CAMERA,
 		.ybbp = 4,
-		.remove_padding = 0,
+		.remove_padding = false,
 	},
 };
 
@@ -1147,7 +1147,7 @@ static int mmal_setup_components(struct bcm2835_mmal_dev *dev,
 	struct vchiq_mmal_port *port = NULL, *camera_port = NULL;
 	struct vchiq_mmal_component *encode_component = NULL;
 	struct mmal_fmt *mfmt = get_format(f);
-	u32 remove_padding;
+	bool remove_padding;
 
 	if (!mfmt)
 		return -EINVAL;
-- 
2.38.1

