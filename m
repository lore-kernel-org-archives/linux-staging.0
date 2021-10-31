Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F422C86
	for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 11:25:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 721AC60F9E;
	Sun, 31 Oct 2021 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635679506;
	bh=yWrx6iv06r2GqFH4VQZjTHiT5ccrn4b5I9ePck+bYns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rIT/1xHUV33yKbZdHVRcC5DI/obAHQdv3K3Ns3AQ38ka19ofrevwnDmgctC7QDeVU
	 I0ZyynsCtqjYN+KLD/qtSxNF7VZJftjp9UDyjJBc/4E+Gzeoav5vOkNVbMRtfLd45q
	 hOLQDCI8YFsoHidyyevq/dHJwWqIAOhMd9+KqqCfL6NEveD+ncIHIy9X+fXZuwV9bR
	 o+me66FB6xiF2z5AYNvLNv/Q93Dha57DBFvB7E3uvKplKTOT5nBnTbzd9rLbOPE0zF
	 w1oxZBzTvbXCTvjRPfl5SCJVeAqr4WDe6+PPWkzIcnSxvsK4zeQ4wHL1Ax+4jyLZly
	 uq+phd7/vGaGg==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mh8xT-003wZM-EC; Sun, 31 Oct 2021 11:25:03 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Kaixu Xia <kaixuxia@tencent.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/3] media: atomisp: report the visible resolution
Date: Sun, 31 Oct 2021 11:25:01 +0000
Message-Id: <3a7f0de1edeca8d3e4d91f25f42339580d34a6e0.1635679495.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <dc24ab2a6c9bb0831e1bb732d3377529fb0ead87.1635679495.git.mchehab+huawei@kernel.org>
References: <dc24ab2a6c9bb0831e1bb732d3377529fb0ead87.1635679495.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The atomisp sensors and logic adds an extra pad lines/columns,
called "dvs envelope". It also uses an extra 12 lines/columns
at the sensor for BYT.

As those are not visible to userspace, the V4L2 API should
decrement such values when reporting the current resolution.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 8f0a9a69f075..d92d41dd0ade 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -876,6 +876,20 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 		v4l2_fill_pix_format(&f->fmt.pix, &fmt.format);
 
 		f->fmt.pix.pixelformat = fmtdesc.pixelformat;
+
+		/*
+		 * HACK: The atomisp does something different here, as it
+		 * seems to set the sensor to a slightly higher resolution than
+		 * the visible ones. That seems to be needed by atomisp's ISP
+		 * in order to properly handle the frames. So, s_fmt adds 16
+		 * extra columns/lines. See atomisp_subdev_set_selection().
+		 *
+		 * Yet, the V4L2 userspace API doesn't expect those, so it
+		 * needs to be decremented when reporting the visible
+		 * resolution to userspace.
+		 */
+		f->fmt.pix.width -= pad_w;
+		f->fmt.pix.height -= pad_h;
 	}
 
 	depth = atomisp_get_pixel_depth(f->fmt.pix.pixelformat);
-- 
2.31.1

