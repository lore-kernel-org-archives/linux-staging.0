Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F215D5B6
	for <linux-staging@lists.linux.dev>; Sun, 10 Aug 2025 01:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789493; cv=none; b=b3BKXJxk8LeN4AUP5RJ0GvYY4yCjG6Gw3pC3d0twlXgLQIJnwJOGDcP/4kuP0sJToWdGnUJIMBTIQWNiR2cY/131sD3iIYBEo9jLRBPDUVfjU2WbPXDNr/wDpGSBjm6BD2BBx4xm6PS6B2uJWf+lkIzbE6tRuWSS617bXVnNynE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789493; c=relaxed/simple;
	bh=xBT7ujv6VSEDaLZl6ARKJQYa2JlE2lH1XZ6TydjARX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fl3+kYPPzYkfmrhk46SwMOE7iqCgMfXw8+fzdaUIcGGDq4uPGVj9V188LNxG2CIeq7ZIbGH0RFuIz3/rqgugiHrKz/nnjL4hE3TLxg7uiqRDZFX2A65U8TLWm0os2vZfsU3H+GHhfcCntgQPWHSA2zd9wSUoXiv8oMLpm7T2SS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ik3H6ZwN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ik3H6ZwN"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 60EA9104D;
	Sun, 10 Aug 2025 03:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789439;
	bh=xBT7ujv6VSEDaLZl6ARKJQYa2JlE2lH1XZ6TydjARX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ik3H6ZwNcE7KczjS+tVP48tB8hDlqCGGp8RLwRg8Km+R124OqQVu9ds/mfdHXdOj5
	 xBnTpwYbRBQXgw0mOzzxR3/23Fklj1sX6Zyc1QtR8mNTyFx7yuUfk+u7rTYZ6qJ8id
	 Mz4jFCJ3NYAiu0JgFpetx7LSd7H+TlzOuRQYz+Cg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 07/76] media: staging: most: Store v4l2_fh pointer in file->private_data
Date: Sun, 10 Aug 2025 04:29:49 +0300
Message-ID: <20250810013100.29776-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
most driver instead stores the pointer to the driver-specific structure
that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer itself to
standardize behaviour across drivers. This also prepares for future
refactoring that depends on v4l2_fh being stored in private_data.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/staging/most/video/video.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 2b3cdb1ce140..bce7ffeac8fe 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -52,6 +52,11 @@ struct comp_fh {
 	u32 offs;
 };
 
+static inline struct comp_fh *to_comp_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct comp_fh, fh);
+}
+
 static LIST_HEAD(video_devices);
 static DEFINE_SPINLOCK(list_lock);
 
@@ -91,7 +96,7 @@ static int comp_vdev_open(struct file *filp)
 
 	fh->mdev = mdev;
 	v4l2_fh_init(&fh->fh, vdev);
-	filp->private_data = fh;
+	filp->private_data = &fh->fh;
 
 	v4l2_fh_add(&fh->fh);
 
@@ -115,7 +120,7 @@ static int comp_vdev_open(struct file *filp)
 
 static int comp_vdev_close(struct file *filp)
 {
-	struct comp_fh *fh = filp->private_data;
+	struct comp_fh *fh = to_comp_fh(filp);
 	struct most_video_dev *mdev = fh->mdev;
 	struct mbo *mbo, *tmp;
 
@@ -151,7 +156,7 @@ static int comp_vdev_close(struct file *filp)
 static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 			      size_t count, loff_t *pos)
 {
-	struct comp_fh *fh = filp->private_data;
+	struct comp_fh *fh = to_comp_fh(filp);
 	struct most_video_dev *mdev = fh->mdev;
 	int ret = 0;
 
@@ -200,7 +205,7 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 
 static __poll_t comp_vdev_poll(struct file *filp, poll_table *wait)
 {
-	struct comp_fh *fh = filp->private_data;
+	struct comp_fh *fh = to_comp_fh(filp);
 	struct most_video_dev *mdev = fh->mdev;
 	__poll_t mask = 0;
 
-- 
Regards,

Laurent Pinchart

