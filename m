Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E3D2C8B
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 12:05:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E16006124F;
	Sat,  6 Nov 2021 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636200340;
	bh=ExULPcPAQoZ6nf/Kka4K5xyWq9L9oGa+euKjhEgJoac=;
	h=From:To:Cc:Subject:Date:From;
	b=cB8G277AtlUgFWTh/DwPMKZ/RZDJontr2wA+KRVrc6eVljnKV4nAFnhs+Qz0rnSGJ
	 xw72TmCL2Nj5ufau79Is1kiz+db53vLAWjqjHKnwW3dd8s1yvw1ekZHneXYKjewl8z
	 IlBI+E0136TiI+YcdV9+pTlJEjPmO3cwtLX6W/mtSDyns6u3TKJVCZdO6Q82m/IN6j
	 iN1034zEAXHuZ+HOCmkyy5ATZguTDoHzq4G520qasKaiXRgn5VIZxo+VVKDKljqNhW
	 0Jd0/YZeGgRc3hGtf+CbaycGKimnWm4hys4RCLP39b4o3U7pX8ljMRmD5tfD/H6KeD
	 eEcp2XjhgyF4w==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mjKS2-0006ov-22; Sat, 06 Nov 2021 12:05:38 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/2] Address device enumeration and run_mode
Date: Sat,  6 Nov 2021 12:05:35 +0000
Message-Id: <cover.1636200095.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

As the atomisp is starting to work with normal V4L2 apps (on USERPTR mode),
change the code to:

1. start creating devices from the one that atually works with normal
   apps (the preview device, previously /dev/video2);

2. Set run_mode for all device types that need it.

Please notice that patch 1 replaces a previously sent patch:
	https://lore.kernel.org/all/543e61dd07c90a7d8577b3a94696edc77953b9d8.1635497370.git.mchehab+huawei@kernel.org/

Mauro Carvalho Chehab (2):
  media: atomisp: set per-device's default mode
  media: atomisp: register first the preview devnode

 .../staging/media/atomisp/pci/atomisp_fops.c  |  5 +++
 .../media/atomisp/pci/atomisp_subdev.c        | 31 ++++++++++++-------
 .../media/atomisp/pci/atomisp_subdev.h        |  3 ++
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  4 ++-
 .../staging/media/atomisp/pci/atomisp_v4l2.h  |  3 +-
 5 files changed, 32 insertions(+), 14 deletions(-)

-- 
2.33.1


