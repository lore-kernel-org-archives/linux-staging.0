Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8793B171AE
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OE+9O9/j"
Received: from umang.jainideasonboard.com (unknown [103.251.226.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D0D02B3;
	Wed, 18 Oct 2023 15:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697634807;
	bh=+ozrzQQSGP1QwCylozlA5ZbUcJOXCNAT1SFWc6r4OSs=;
	h=From:To:Cc:Subject:Date:From;
	b=OE+9O9/j+2k6yc2A+s6p9Z6vAvCPQuyp/My+I31nJBC1zwsZ/5Ahh1IAh7unPfb8h
	 NQq2zI69M4Y6aBfkaDOIreVHEd+DxckDDJsZX2w6U5O5S/Z3K9S+WA6sYb6F5hBVHd
	 HSpz+BtSTril84YDGAKa8aVM5xple18EObqXQvRs=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: laurent.pinchart@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: css: Write LINE_LENGTH_PCK correctly
Date: Wed, 18 Oct 2023 18:43:25 +0530
Message-Id: <20231018131325.1022113-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MIPI CCS v1.1 specification, the LINE_LENGTH_PCK
units is in VT pixel clocks (Section 8.2.6).

To compute how many pixel clocks it takes, simply divide the
VT pixel clock frequency by the number of pixels in a single line.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
Testing:

The patch is tested using IMX519 with CCS.
This patch makes the frame buffer being filled to the fullest
(instead of getting 1/3rd only previously) - without any workarounds.
---
 drivers/media/i2c/ccs/ccs-core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 16de66a37fad..12c75a843dfe 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -734,9 +734,11 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		break;
 	case V4L2_CID_HBLANK:
-		rval = ccs_write(sensor, LINE_LENGTH_PCK,
-				 sensor->pixel_array->crop[CCS_PA_PAD_SRC].width
-				 + ctrl->val);
+		/* LINE_LENGTH_PCK units are in VT pixel clocks. */
+		u16 line_length_pck =
+			sensor->pll.vt_bk.pix_clk_freq_hz /
+			(sensor->pixel_array->crop[CCS_PA_PAD_SRC].width + ctrl->val);
+		rval = ccs_write(sensor, LINE_LENGTH_PCK, line_length_pck);
 
 		break;
 	case V4L2_CID_TEST_PATTERN:
-- 
2.40.1

