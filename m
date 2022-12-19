Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F005A7E
	for <linux-staging@lists.linux.dev>; Mon, 19 Dec 2022 11:57:51 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [IPv6:2401:4900:1f3e:7d24:3f0:3e81:fb16:ab4d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5ECF1825;
	Mon, 19 Dec 2022 12:57:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1671451062;
	bh=Go7MiR3dYCV2jmv6BwP/3GC/SWENkVqsP5a91fdMktY=;
	h=From:To:Cc:Subject:Date:From;
	b=Vh4K3fIeW5NVh9gjKZnW8nIBvVQFqGp5+Iw5qgdIjcWeMoiW2dn8Jx/IN7HkVCoIM
	 CgiCVA1k03nvVCCJtPkQPBsDXAcYUMpJlHLv6/okdpCMhXIap9nAlFK3/s43D1CGTn
	 4ihvtNBgeOSWoni+UGaOdjMbrDHN3WIeDI10YuJI=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/7] staging: vc04_services: Remove custom return values
Date: Mon, 19 Dec 2022 17:27:18 +0530
Message-Id: <20221219115725.11992-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series removes the custom return values from functions
and replaces them with linux error codes. This address the TODO
 vchiq interface:
* Get rid of custom function return values

Changes in V2:
- Patch 3/7 now reports for specific errors like -ENOMEM, -EHOSTDOWN
- Patch 5/7 reports -ENOTCONN instead of -EINVAL and adds a "Fixes" tag

Umang Jain (7):
  staging: vc04_services: Replace vchiq_status return type to int
  staging: vc04_services: Drop VCHIQ_SUCCESS usage
  staging: vc04_services: Drop VCHIQ_ERROR usage
  staging: vc04_services: Drop VCHIQ_RETRY usage
  vc04_services: vchiq_arm: Drop VCHIQ_RETRY usage on disconnect
  staging: vc04_services: Drop enum vchiq_status remnants
  staging: vc04_services: vchiq: Drop custom return values from TODO

 .../bcm2835-audio/bcm2835-vchiq.c             |  12 +-
 .../include/linux/raspberrypi/vchiq.h         |  65 +++---
 drivers/staging/vc04_services/interface/TODO  |   5 -
 .../interface/vchiq_arm/vchiq_arm.c           | 124 +++++-----
 .../interface/vchiq_arm/vchiq_arm.h           |  12 +-
 .../interface/vchiq_arm/vchiq_core.c          | 216 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |  18 +-
 .../interface/vchiq_arm/vchiq_dev.c           |  36 +--
 .../interface/vchiq_arm/vchiq_ioctl.h         |   8 +-
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  11 +-
 10 files changed, 246 insertions(+), 261 deletions(-)

-- 
2.38.1

