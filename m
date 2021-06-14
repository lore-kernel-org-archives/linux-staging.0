Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B25C6D0E
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 10:36:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CFCC61445;
	Mon, 14 Jun 2021 10:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623666977;
	bh=8W/ZXGZjpUtm/og8bVr+bOo9zj9+oALHaRtC050jLqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S81+0IpkKdPFxZyFrE0j8Ha05DgDcAnxEyLgwOBcUJsb/JRkXwDXHixZ9TWLuIWs8
	 AxrFejftFXYLCKxPInq028CDzaB8h16mbnJoMsTAbH6AUpVCbmaf90luX5AX2lYDJ8
	 z6ySPx+MozeCfZnL7IH7Vl3LWI3hoYRObB8Lg540fZ3dPyBKZwtGAWEUdV7OaDGGtn
	 Gce/d1ugu1NOXsp1KJHd5gzFmlb5H3bDWx/YcXeoQRl1axwHfCqnIv9Gbfj+zGSfSJ
	 W8rDVgQwJ+dB0OtbZoxe6Ol515fnM7sPggiPmHvBEA8ssmyGpCP9mmsGBeuak6w0jT
	 uTkyRRJRafMVQ==
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
Subject: [PATCH v3 3/8] media: v4l2-core: fix whitespace damage in video_get_user()
Date: Mon, 14 Jun 2021 12:34:04 +0200
Message-Id: <20210614103409.3154127-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210614103409.3154127-1-arnd@kernel.org>
References: <20210614103409.3154127-1-arnd@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The initialization was indented with an extra tab in most lines,
remove them to get the normal coding style.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index f19e56116e53..d94389145479 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3142,18 +3142,18 @@ static int video_get_user(void __user *arg, void *parg,
 
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
-- 
2.29.2

