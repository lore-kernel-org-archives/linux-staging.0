Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33518EC8
	for <linux-staging@lists.linux.dev>; Thu,  1 Sep 2022 09:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662025623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AIBTQIX9WjmLw4cuQWISLlPhWFRRwMDbjdX1Z/XJX4U=;
	b=iJOrCqVnnSIT5uJVKMy2nTWaQLWa/379BEcJthMu2Xv9oci/9tIXgyXPQCEOlX5tSOpWJx
	gJcrjTcW9uZgb4URBGPw31tgLFHI0PT9UJldj6CrK6fB58scjZFhh0xpTuIIFKQy9pxdYn
	4HKAVQq+kI+ao8yK1Andcq/x4Zl91VI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-QgexFxPpNHy_CYpayJbbEg-1; Thu, 01 Sep 2022 05:47:00 -0400
X-MC-Unique: QgexFxPpNHy_CYpayJbbEg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 114AB8FC16B;
	Thu,  1 Sep 2022 09:46:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77240403344;
	Thu,  1 Sep 2022 09:46:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/14] media: atomisp: More cleanups / code removal
Date: Thu,  1 Sep 2022 11:46:12 +0200
Message-Id: <20220901094626.11513-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

Hi Mauro,

Here is a second set of atomisp cleanups / code removal.
This applies on top of my previous v2 series from here:
https://lore.kernel.org/linux-media/20220822150610.45186-1-hdegoede@redhat.com/

I plan to do more atomisp work the coming few weeks. So I'm thinking
it might be better / easier for you if I just send you a pull-req based
on 6.0-rc1 with all atomisp patches bundled around rc5/rc6 time.

Would that work for you ?

I do plan to keep sending out (incremental) patch-sets with my work
(like this one) for review / comments.

Regards,

Hans


Dan Carpenter (1):
  media: atomisp: prevent integer overflow in sh_css_set_black_frame()

Hans de Goede (13):
  media: atomisp: Fix device_caps reporting of the registered video-devs
  media: atomisp: Remove file-injection support
  media: atomisp: Remove atomisp_file_fops and atomisp_file_ioctl_ops
  media: atomisp: Remove the outq videobuf queue
  media: atomisp: Remove never set file_input flag
  media: atomisp: Remove the ACC device node
  media: atomisp: Remove some further ATOMISP_ACC_* related dead code
  media: atomisp: Remove empty atomisp_css_set_cont_prev_start_time()
    function
  media: atomisp: Split subdev and video-node registration into 2 steps
  media: atomisp: Register /dev/* nodes at the end of
    atomisp_pci_probe()
  media: atomisp: Remove loading mutex
  media: atomisp: Fix v4l2_fh resource leak on open errors
  media: atomisp: Simplify v4l2_fh_open() error handling

 drivers/staging/media/atomisp/Makefile        |   1 -
 .../media/atomisp/include/linux/atomisp.h     |  14 --
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 134 +---------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   2 -
 .../media/atomisp/pci/atomisp_compat.h        |   6 -
 .../media/atomisp/pci/atomisp_compat_css20.c  |  26 --
 .../staging/media/atomisp/pci/atomisp_file.c  | 229 ------------------
 .../staging/media/atomisp/pci/atomisp_file.h  |  44 ----
 .../staging/media/atomisp/pci/atomisp_fops.c  | 187 ++------------
 .../media/atomisp/pci/atomisp_internal.h      |  16 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 192 ++-------------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |   4 -
 .../media/atomisp/pci/atomisp_subdev.c        |  95 ++------
 .../media/atomisp/pci/atomisp_subdev.h        |  47 +---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  99 +++-----
 .../staging/media/atomisp/pci/atomisp_v4l2.h  |   3 -
 .../staging/media/atomisp/pci/sh_css_params.c |   4 +-
 17 files changed, 104 insertions(+), 999 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.h

-- 
2.37.2

