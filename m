Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD717430E2
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 20:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lKXbdFFy"
Received: from umang.jainideasonboard.com (unknown [103.251.226.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7281B291;
	Tue, 17 Oct 2023 22:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697573118;
	bh=fSTwgeBv4Z3p87X/FYECfDVA2ALKAroeIFkV1pa1/fk=;
	h=From:To:Cc:Subject:Date:From;
	b=lKXbdFFyAt5QbanJcsYoeihxc4u3NgUBVpdleZF1zaqsDrRLUj08VufyD7kEf3gTP
	 Is2ssPPEPHQc2XYrbyl0aSr89/aNii3rUKWo5MC4cYxiHyaqaycGNwYeF3wr6KuTtO
	 9Y6DpW829fNGjuweNoFecp1MJf08YQ+ridGMkZ/s=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/3] vc04_services: Tweak module autoloading support
Date: Wed, 18 Oct 2023 01:35:08 +0530
Message-Id: <20231017200511.678223-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As explained by Greg KH in [1], we should not be using MODULE_ALIAS
to auto load modules within VC04. Drop that, in favour of
MODULE_DEVICE_TABLE. This series addresses the suggestion.

Patch 1/3 adds vchiq_bus_device_id and supporting entries in 
script/mod/file2alias.c

Patch 2/3 drops MODULE_ALIAS from bcm2835-audio in favour
of MODULE_DEVICE_TABLE.

Patch 3/3 drops MODULE_ALIAS from bcm2835-camera in favour
of MODULE_DEVICE_TABLE.

[1]:  https://lore.kernel.org/linux-media/2023100955-stunt-equate-c6fa@gregkh/

Umang Jain (3):
  staging: vc04_services: Support module autoloading using
    MODULE_DEVICE_TABLE
  staging: vc04_services: bcm2835-audio: Drop MODULE_ALIAS
  staging: vc04_services: bcm2835-camera: Drop MODULE_ALIAS

 drivers/staging/vc04_services/bcm2835-audio/bcm2835.c    | 7 ++++++-
 .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 7 ++++++-
 .../vc04_services/interface/vchiq_arm/vchiq_bus.c        | 2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_bus.h        | 3 +++
 include/linux/mod_devicetable.h                          | 4 ++++
 scripts/mod/devicetable-offsets.c                        | 3 +++
 scripts/mod/file2alias.c                                 | 9 +++++++++
 7 files changed, 32 insertions(+), 3 deletions(-)

-- 
2.40.1

