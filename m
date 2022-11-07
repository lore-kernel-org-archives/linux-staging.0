Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B39A17C7
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 04:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667794846; bh=K3l8aNi6tXs7C8Soq/7V0kdkH5J0anIcX/pV2o0Kziw=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=lUxg3iWhpHnG3ikfJSQzwYSovFfvAw3NpUdOynMm4xi2RiZmFyNGUi5hy7ppcVG6S
	 gQe8Kk9wgKORPyOUmMC7+WgngxNcrPVTN9FX0eNoie+zyno9nGFONvEVLRzTyMWpsa
	 RB4nXHCfFVwvYfArT7/i2v0CVsRbFNZjcWrVuLIA=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon,  7 Nov 2022 05:20:46 +0100 (CET)
X-EA-Auth: L+KOezgXoKLy0w2UXz8vniZWzgycWzMAhm0HNXPw+zfIJjT+A3gOmLt8vkjNrcji/Wnj8+y5HcJAcYaK21QUFxcJgWXobTLM
Date: Mon, 7 Nov 2022 09:50:39 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: most: video: use min_t() for comparison and
 assignment
Message-ID: <Y2iHl5CuqyR2vEc8@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Simplify code by using min_t helper macro for logical evaluation
and value assignment. Use the _t variant of min macro since the
variable types are not same.
This issue is identified by coccicheck using the minmax.cocci file.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v2:
   1. Revise patch description. No functional change.

 drivers/staging/most/video/video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index ffa97ef21ea5..d5cc7eea3b52 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -173,7 +173,7 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 	while (count > 0 && data_ready(mdev)) {
 		struct mbo *const mbo = get_top_mbo(mdev);
 		int const rem = mbo->processed_length - fh->offs;
-		int const cnt = rem < count ? rem : count;
+		int const cnt = min_t(int, rem, count);

 		if (copy_to_user(buf, mbo->virt_address + fh->offs, cnt)) {
 			v4l2_err(&mdev->v4l2_dev, "read: copy_to_user failed\n");
--
2.34.1



