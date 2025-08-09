Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A227F4D5;
	Sat,  9 Aug 2025 21:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774361; cv=none; b=UBmT+ehL2N6NWtE2/ZYDxxiwUDfj/7bVO9mGa1Tqafp8Hjh9TMW/OZLm8nEHiV1PSy1FKI5XfMlAjD+35PtwJgPJNXrW8v9p6xM0SLNPCce5B10msBibvylkwYvPqeBsrtLgWDkwy3dgxI3Ji7yJoILZKWSiD0rChZZcaPu4xHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774361; c=relaxed/simple;
	bh=kkLRffQukcyjRIe8oY//+QAB7N6KkwxoVZBJB8FoZNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3qFZ3KmyZbxlbMPAczMnlJCi1tMcGg9GAVC03MDr8yvl0CuUXXJYXKBh7HRWNN1LZx2c4N2f0OdMJnFVbfG4nmQFbL3HaeGwF27x89G6DjnD+MGPS04Q/hvuctczn9Q1asKkJpkMZOESBchZCrdUzekKKOAkJ8eM8tLJc4Vs3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qwg3c8H1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qwg3c8H1"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ED6F5162B;
	Sat,  9 Aug 2025 23:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774308;
	bh=kkLRffQukcyjRIe8oY//+QAB7N6KkwxoVZBJB8FoZNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qwg3c8H1qiDPaBsuLO9gIXcNwNQzjdnO3wsbXjaTPw/RcISOkLMu+yltQzPoUJFBj
	 Bff3ulMyj5qBcJztMlKT53Rce5RxBKyWWmpd78m1jsWwOONM/VEo8NaMLixJjifutH
	 cuJKXvutnegp6yilCHM3EQoYPnfkvVO8JVBrcxIc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 76/76] media: staging: Rename second ioctl handlers argument to 'void *priv'
Date: Sun, 10 Aug 2025 00:16:53 +0300
Message-ID: <20250809211654.28887-77-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The second argument to the ioctl handlers is not a file handle any more.
The standard practice is to name it 'void *priv' in drivers. Many
drivers still name it 'void *fh', and a few use more exotic names.
Replace those more exotic names with 'void *priv' in all media staging
drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 16 ++++++++--------
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c     |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 24899f41dc1c..e7b99cee63d6 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -419,7 +419,7 @@ static void sun6i_isp_capture_format_prepare(struct v4l2_format *format)
 	pix_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int sun6i_isp_capture_querycap(struct file *file, void *private,
+static int sun6i_isp_capture_querycap(struct file *file, void *priv,
 				      struct v4l2_capability *capability)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -433,7 +433,7 @@ static int sun6i_isp_capture_querycap(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_enum_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
@@ -446,7 +446,7 @@ static int sun6i_isp_capture_enum_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_g_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -456,7 +456,7 @@ static int sun6i_isp_capture_g_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_s_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_s_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -471,7 +471,7 @@ static int sun6i_isp_capture_s_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_try_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_try_fmt(struct file *file, void *priv,
 				     struct v4l2_format *format)
 {
 	sun6i_isp_capture_format_prepare(format);
@@ -479,7 +479,7 @@ static int sun6i_isp_capture_try_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_enum_input(struct file *file, void *private,
+static int sun6i_isp_capture_enum_input(struct file *file, void *priv,
 					struct v4l2_input *input)
 {
 	if (input->index != 0)
@@ -491,7 +491,7 @@ static int sun6i_isp_capture_enum_input(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_g_input(struct file *file, void *private,
+static int sun6i_isp_capture_g_input(struct file *file, void *priv,
 				     unsigned int *index)
 {
 	*index = 0;
@@ -499,7 +499,7 @@ static int sun6i_isp_capture_g_input(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_s_input(struct file *file, void *private,
+static int sun6i_isp_capture_s_input(struct file *file, void *priv,
 				     unsigned int index)
 {
 	if (index != 0)
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 3d95ed0b023e..77c2d06c0436 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -383,7 +383,7 @@ static const struct vb2_ops sun6i_isp_params_queue_ops = {
 
 /* Video Device */
 
-static int sun6i_isp_params_querycap(struct file *file, void *private,
+static int sun6i_isp_params_querycap(struct file *file, void *priv,
 				     struct v4l2_capability *capability)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -397,7 +397,7 @@ static int sun6i_isp_params_querycap(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_params_enum_fmt(struct file *file, void *private,
+static int sun6i_isp_params_enum_fmt(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *fmtdesc)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -412,7 +412,7 @@ static int sun6i_isp_params_enum_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_params_g_fmt(struct file *file, void *private,
+static int sun6i_isp_params_g_fmt(struct file *file, void *priv,
 				  struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
-- 
Regards,

Laurent Pinchart

