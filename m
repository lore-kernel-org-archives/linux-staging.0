Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ED513DDA6
	for <linux-staging@lists.linux.dev>; Wed,  3 Jul 2024 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720012270; cv=none; b=EHfBQR8wBL3SDY+6lDtdr8aXHdUCF7AB5O+Y3ofpl0c4iZFKK+d2D6xfw1RfEgA6j5Axl2dfvAbtHWpj0O3t9Np+KatZy2M2gTn7AsYt/H+zpanQlYLHkW4niaoNubcnzAUU+i0qBzGpsFz04rFZQghkjNb7VaqaZ2f0HE6wvoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720012270; c=relaxed/simple;
	bh=16IATYUkH4RNobDhEkBiMEiaaroCzTY3eKpfb+j6gmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ho1sJLY6s3N8w1kMDjjtvqpnAjXeOezHvSEwRlC8z2Zg3UqJm3uLH88d78Dax0YhgZLw/s86Qhciv/oSUsl5awjjvSyJ9RQEjeDkvoKNt88gEuYWoZzkZOFJf5y4VcektbtTMOjozKasDjuL0nfhnViXZUSv2ExYUmW42q5T3QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wk/C06Y3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wk/C06Y3"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 700313D6;
	Wed,  3 Jul 2024 15:10:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720012237;
	bh=16IATYUkH4RNobDhEkBiMEiaaroCzTY3eKpfb+j6gmU=;
	h=From:To:Cc:Subject:Date:From;
	b=Wk/C06Y3LJne+jA+Ce0qCiKZDz7gJEe+2CVrVV5Oyd7VAXQh+CxDtxhi00uw15LIY
	 E2dzZ4xHSfzdREFpceY3AZ0o9hW9mwj7uGOxKD3A6fO8wsRFEXZejiY0KJ8sGzhycE
	 h/hIKlBP0p/rNzTIoDqeZ/pyKvyPGEBFeMRAR5kY=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/2] staging: vchiq_core: Stop kthreads on module unload
Date: Wed,  3 Jul 2024 18:40:50 +0530
Message-ID: <20240703131052.597443-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a re-attempt of [1] where we noticed corruption of vc04 firmware
on stopping the kthread.

After investigation, I found that the case where
wait_event_interruptible() can return early(wait failed) with
-ERESTARTSYS, is something not handling in remote_event_wait(). Once we
bubble up the that return/err code and handle it - the issue is resolved
correctly and kthreads are stopped as expected.

Patch 1/2 handles the returning of the return value from
wait_event_interruptible()

Patch 2/2 handles stopping of kthreads.

---
Testing with
+CONFIG_BCM_VIDEOCORE=y
+CONFIG_BCM2835_VCHIQ=m
+CONFIG_VCHIQ_CDEV=y
+CONFIG_BCM2835_VCHIQ_MMAL=m
+CONFIG_VIDEO_BCM2835=m

and as per
drivers/staging/vc04_services/interface/TESTING

Entire test sequence:
https://paste.debian.net/plain/1322185
---

[1]: https://lore.kernel.org/linux-staging/20240403052100.2794-1-umang.jain@ideasonboard.com/ 

Changes in v2:
- Return 0 as success value for remote_wait_event() in 1/2
- Fix stopping of 'keep-alive' kthread in 2/2. 

Umang Jain (2):
  staging: vchiq_core: Bubble up wait_event_interruptible() return value
  staging: vc04_services: vchiq_core: Stop kthreads on vchiq module
    unload

 drivers/staging/vc04_services/interface/TODO  |  7 ----
 .../interface/vchiq_arm/vchiq_arm.c           | 10 ++++-
 .../interface/vchiq_arm/vchiq_core.c          | 37 ++++++++++++++-----
 3 files changed, 36 insertions(+), 18 deletions(-)

-- 
2.43.0

