Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9B72C9B
	for <linux-staging@lists.linux.dev>; Thu,  4 Nov 2021 12:06:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ACEE6120E;
	Thu,  4 Nov 2021 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636027560;
	bh=HybiI7UdlSZcnbdy55jEnHO7M01Yy9wdGqRy2VCwnT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iJCEOOTcX38JqGf3XOeX1UrAV/yixYarKvHsFQRafL9F0l0ywYhJUDmUSIcw/0joR
	 9cAvEhx3nyP0QTNMwgFp8R+lsaKSG5XQymBIWQxXb9QXapAisJShYnrLBXpzSa2k40
	 zP41OnC13PK9quZORoX1ceOYm0hOAREeUDMPY1v4WMwsh0Is8mmg3LHbKEnp9QbvtU
	 csevUGneEVOG50CWZYVSwPxwgEFM9rSMaNuPgOqeEbq0T7Kt1ZJWZegL51CUOJh/91
	 66ITVEbhiFat5Qs7Fnybayd2QJBSDUhbgibt7p1hfBREYcNVuuxx93uTbL2KNGzhvr
	 6a9P8gGBPo78w==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mibVG-005nHq-7G; Thu, 04 Nov 2021 12:05:58 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/7] media: atomisp: move atomisp_g_fmt_cap()
Date: Thu,  4 Nov 2021 12:05:54 +0000
Message-Id: <75e35d0ea4b6ee7f47bbed61f2eb258a07bcd01f.1636026959.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636026959.git.mchehab+huawei@kernel.org>
References: <cover.1636026959.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

move atomisp_g_fmt_cap() for it to be after try_fmt, as we'll
re-use try_fmt there.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/7] at: https://lore.kernel.org/all/cover.1636026959.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/atomisp_ioctl.c | 56 +++++++++----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 30483a84ed80..84ff97dabbed 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -833,6 +833,34 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 	return -EINVAL;
 }
 
+static int atomisp_g_fmt_file(struct file *file, void *fh,
+			      struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct atomisp_device *isp = video_get_drvdata(vdev);
+	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
+
+	rt_mutex_lock(&isp->mutex);
+	f->fmt.pix = pipe->pix;
+	rt_mutex_unlock(&isp->mutex);
+
+	return 0;
+}
+
+/* This function looks up the closest available resolution. */
+static int atomisp_try_fmt_cap(struct file *file, void *fh,
+			       struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct atomisp_device *isp = video_get_drvdata(vdev);
+	int ret;
+
+	rt_mutex_lock(&isp->mutex);
+	ret = atomisp_try_fmt(vdev, &f->fmt.pix, NULL);
+	rt_mutex_unlock(&isp->mutex);
+	return ret;
+}
+
 static int atomisp_g_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
@@ -907,34 +935,6 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int atomisp_g_fmt_file(struct file *file, void *fh,
-			      struct v4l2_format *f)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-
-	rt_mutex_lock(&isp->mutex);
-	f->fmt.pix = pipe->pix;
-	rt_mutex_unlock(&isp->mutex);
-
-	return 0;
-}
-
-/* This function looks up the closest available resolution. */
-static int atomisp_try_fmt_cap(struct file *file, void *fh,
-			       struct v4l2_format *f)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	int ret;
-
-	rt_mutex_lock(&isp->mutex);
-	ret = atomisp_try_fmt(vdev, &f->fmt.pix, NULL);
-	rt_mutex_unlock(&isp->mutex);
-	return ret;
-}
-
 static int atomisp_s_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
-- 
2.31.1

