Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3282F80
	for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 21:45:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 131D96141D;
	Thu, 10 Jun 2021 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623361500;
	bh=ql1oV1rq//CRvUy0F7HDTW6q+eFb02wnUXlrJrXa2hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o3zoNLqSXfQITog8yYtrX+ZX2vylMv1/BTTCG7KcA0/JgoQgIbZG5XIKnLPzzWbQm
	 Tbo/h0e+5wB1KzXJUU3BrKDim5wLvvfNoEGb8O41Lpc0l/y50E3/BgXQImwLd+yByT
	 PPCHOr+TSzEDJxf3tymMNcBXoDIIOI63e+BdbxyiNE9SqbKlzJ6LdLJQVM1Du7mvDY
	 CxyK/DYN1BQFjBVOfS+8IRnSQzSMDhGYEWYo0A5rGadJoKyIYaPMr15hruK+wzW3y/
	 KT97fYsXzFN0CmJMl9h2XdAMw1/5XkZhXGWGWtx3Ac2OJOiEnKYF5YioL/lHO9QAI9
	 6WRt+eiriNmJw==
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
Subject: [PATCH v2 3/7] media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
Date: Thu, 10 Jun 2021 23:43:01 +0200
Message-Id: <20210610214305.4170835-4-arnd@kernel.org>
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

Converting the VIDIOC_DQEVENT_TIME32/VIDIOC_DQEVENT32/
VIDIOC_DQEVENT32_TIME32 arguments to the canonical form is done in common
code, but for some reason I ended up adding another conversion helper to
subdev_do_ioctl() as well. I must have concluded that this does not go
through the common conversion, but it has done that since the ioctl
handler was first added.

I assume this one is harmless as there should be no way to arrive here
from user space, but since it is dead code, it should just get removed.

Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 956dafab43d4..bf3aa9252458 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -428,30 +428,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
 
-	case VIDIOC_DQEVENT_TIME32: {
-		struct v4l2_event_time32 *ev32 = arg;
-		struct v4l2_event ev = { };
-
-		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
-			return -ENOIOCTLCMD;
-
-		rval = v4l2_event_dequeue(vfh, &ev, file->f_flags & O_NONBLOCK);
-
-		*ev32 = (struct v4l2_event_time32) {
-			.type		= ev.type,
-			.pending	= ev.pending,
-			.sequence	= ev.sequence,
-			.timestamp.tv_sec  = ev.timestamp.tv_sec,
-			.timestamp.tv_nsec = ev.timestamp.tv_nsec,
-			.id		= ev.id,
-		};
-
-		memcpy(&ev32->u, &ev.u, sizeof(ev.u));
-		memcpy(&ev32->reserved, &ev.reserved, sizeof(ev.reserved));
-
-		return rval;
-	}
-
 	case VIDIOC_SUBSCRIBE_EVENT:
 		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
 
-- 
2.29.2

