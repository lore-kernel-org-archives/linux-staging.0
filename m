Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20CB2CAB
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 11:58:28 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [103.86.18.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 408671643;
	Wed, 18 Jan 2023 12:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1674043099;
	bh=4ZkEehY0EKcMSSK/FWZM4yQ45U26CQ/uPHxtUY8/+Kw=;
	h=From:To:Cc:Subject:Date:From;
	b=mr0XK0dJNxcu3fFvP7C+BBGG9i618Wp2a6bHZ4j0KZhNxdYBGNuju4tgCE/dVaS5x
	 vPradXpHtzLbV0a8YcUOCmv/JXCNWzYeUqGHYLkRfxp+CZoi9WUk3T7oNYeY+3lL//
	 Zyx45aew3KRMeYAPPkqHCT1swWhfj2xxzQgXBMJw=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [RFC PATCH 0/4] Drop custom logging
Date: Wed, 18 Jan 2023 17:28:06 +0530
Message-Id: <20230118115810.21979-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop custom logging from the vchiq interface.
Mostly of them are replaced with dev_dbg and friends
and/or pr_info and friends. 

The debugfs log levels (in 4/4) are mapped to kernel
logs levels (coming from include/linux/kern_levels.h)
Would like some thoughts on it as I am not sure (hence
marking this is RFC)

From drivers/staging/vc04_services/interface/TODO:

"""
* Cleanup logging mechanism

The driver should probably be using the standard kernel logging mechanisms
such as dev_info, dev_dbg, and friends.
"""

Umang Jain (4):
  staging: vc04_services: vchiq_core: Drop custom logging
  staging: vc04_services: vchiq_arm: Drop custom logging
  staging: vc04_services: Drop custom logging
  staging: vc04_services: Drop remnants of custom logging

 .../interface/vchiq_arm/vchiq_arm.c           | 151 +++---
 .../interface/vchiq_arm/vchiq_connected.c     |   5 +-
 .../interface/vchiq_arm/vchiq_core.c          | 479 ++++++++----------
 .../interface/vchiq_arm/vchiq_core.h          |  39 --
 .../interface/vchiq_arm/vchiq_debugfs.c       |  26 +-
 .../interface/vchiq_arm/vchiq_dev.c           |  78 ++-
 6 files changed, 329 insertions(+), 449 deletions(-)

-- 
2.39.0

