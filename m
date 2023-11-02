Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE161DDE9
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 21:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WhWh/ZlS"
Received: from umang.jain (unknown [103.86.18.252])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58D718C1;
	Thu,  2 Nov 2023 22:05:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698959154;
	bh=BkGxsNNSRUx6gC44hd97VXoSDmZaILyAWU4NzNuHK6s=;
	h=From:To:Cc:Subject:Date:From;
	b=WhWh/ZlSUXO9aK81i2fb3pB/go8W2jeI7RrUs4PTP8gN9GigJrE4OOvvNFGE35iiL
	 aZyw6DTFXMzGfPNul6gxAfj+2EMKCkBoa7bZXrbb/+8e7iIsrcfh5MtLYF6hk85xK3
	 1fc1cBoo3jDZ21UVN5FQIGFLZZcKDXeHNVEmHWi8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/3] staging: vc04: Smatch analysis fixes
Date: Thu,  2 Nov 2023 17:06:00 -0400
Message-ID: <20231102210603.1201311-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

low-hanging fruits series that solve a few of the warnings exposed by
smatch analysis. See individual patch for details.

Umang Jain (3):
  staging: vc04_services: vchiq_core: Log through struct vchiq_instance
  staging: vc04_services: Log using pr_err() when vchiq_state is unset
  staging: vc04_services: bcm2835-camera: Remove redundant null check

 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c  | 7 ++-----
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 6 ++----
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 6 +++---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c  | 7 +++----
 4 files changed, 10 insertions(+), 16 deletions(-)


base-commit: a4000df5300fdbe10d84e3b70e2d6a98686310a9
-- 
2.41.0

