Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09382F80
	for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 21:44:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DD076141F;
	Thu, 10 Jun 2021 21:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623361497;
	bh=TlkIF8TF9j+74Su5L9XU65cloJswG8lpwGpXJ4LchNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gE3YkI5pig+tAXh2h7gzE91McLRugMNmNlrUFvaPe+iucAOmqFR6HSlBJ6wokc8+f
	 cFZPflPhIuQ8BhClViCzjX0neTGcVQtuxHwe9AcEqBXad4zFmhNN7wy1zL/Cw6Lbrq
	 errKk8gIyoAezLRNep+f0GXJY/OOg/+YKmBZ5TUkWgxxYc0XsdQ5CLH012nCxfRX0o
	 kYxgB/YVDCrljBIOGpkiRhLU/KU3KAkyyKsuTkphUY8hED6x5U/2TuwDw/cyAq9ou8
	 6L7+z6KoKrJ7q0BzrFxEuCHEw0MqQK1slxv7pB6sZSFWGcoxg81sQfhcgDOTMja1fe
	 kw6t9zTzvBfEw==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	Liu Shixin <liushixin2@huawei.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 2/7] media: v4l2-core: explicitly clear ioctl input data
Date: Thu, 10 Jun 2021 23:43:00 +0200
Message-Id: <20210610214305.4170835-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610214305.4170835-1-arnd@kernel.org>
References: <20210610214305.4170835-1-arnd@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

As seen from a recent syzbot bug report, mistakes in the compat ioctl
implementation can lead to uninitialized kernel stack data getting used
as input for driver ioctl handlers.

The reported bug is now fixed, but it's possible that other related
bugs are still present or get added in the future. As the drivers need
to check user input already, the possible impact is fairly low, but it
might still cause an information leak.

To be on the safe side, always clear the entire ioctl buffer before
calling the conversion handler functions that are meant to initialize
them.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 51 ++++++++++++++++------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 58df927aec7e..bf5eb07296a5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3122,12 +3122,23 @@ static int video_get_user(void __user *arg, void *parg,
 
 	if (cmd == real_cmd) {
 		if (copy_from_user(parg, (void __user *)arg, n))
-			err = -EFAULT;
-	} else if (in_compat_syscall()) {
-		err = v4l2_compat_get_user(arg, parg, cmd);
-	} else {
-		switch (cmd) {
+			return -EFAULT;
+
+		/* zero out anything we don't copy from userspace */
+		if (n < _IOC_SIZE(real_cmd))
+			memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
+
+		return 0;
+	}
+
+	/* zero out whole buffer first to deal with missing emulation */
+	memset(parg, 0, _IOC_SIZE(real_cmd));
+
+	if (in_compat_syscall())
+		return v4l2_compat_get_user(arg, parg, cmd);
+
 #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
+	switch (cmd) {
 		case VIDIOC_QUERYBUF_TIME32:
 		case VIDIOC_QBUF_TIME32:
 		case VIDIOC_DQBUF_TIME32:
@@ -3140,28 +3151,24 @@ static int video_get_user(void __user *arg, void *parg,
 
 			*vb = (struct v4l2_buffer) {
 				.index		= vb32.index,
-					.type		= vb32.type,
-					.bytesused	= vb32.bytesused,
-					.flags		= vb32.flags,
-					.field		= vb32.field,
-					.timestamp.tv_sec	= vb32.timestamp.tv_sec,
-					.timestamp.tv_usec	= vb32.timestamp.tv_usec,
-					.timecode	= vb32.timecode,
-					.sequence	= vb32.sequence,
-					.memory		= vb32.memory,
-					.m.userptr	= vb32.m.userptr,
-					.length		= vb32.length,
-					.request_fd	= vb32.request_fd,
+				.type		= vb32.type,
+				.bytesused	= vb32.bytesused,
+				.flags		= vb32.flags,
+				.field		= vb32.field,
+				.timestamp.tv_sec	= vb32.timestamp.tv_sec,
+				.timestamp.tv_usec	= vb32.timestamp.tv_usec,
+				.timecode	= vb32.timecode,
+				.sequence	= vb32.sequence,
+				.memory		= vb32.memory,
+				.m.userptr	= vb32.m.userptr,
+				.length		= vb32.length,
+				.request_fd	= vb32.request_fd,
 			};
 			break;
 		}
-#endif
-		}
 	}
+#endif
 
-	/* zero out anything we don't copy from userspace */
-	if (!err && n < _IOC_SIZE(real_cmd))
-		memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
 	return err;
 }
 
-- 
2.29.2

