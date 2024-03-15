Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6629E18E02
	for <linux-staging@lists.linux.dev>; Fri, 15 Mar 2024 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710500233; cv=none; b=IYGF1BLs+Cuk9pRqpLFPlboCEk3dgLhYLrVnYUkbqlZhgXlR8WnDcVwKyrXjy2qBMouzHQQamYW0L+TLqeVOetHqsi2Vfmu1eWYJLwM8jvBP/0q9YNmxZW2zF0WurHSYezn7ruezE+r8AcWLyh1gbm0TYWChDvotS0nZEYU+7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710500233; c=relaxed/simple;
	bh=TkRbh9m0Rc3tzwydHqpMwQAiGh0IQGr5p1ewO+rE7JI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZKndTluYv+pzYmamgvQGNRdyIHFPXcHguEzQXB/9cvCte6k6lDztuJocZCnRpKtiCSCJkqHUdae+ny9Y9afztGjsT2OfQq8tjx1exexs69c0u6pykAbbNI0M3zcRgbdl4qabCGYyvPk6Er/YXhYiL92puhKIdSTVzhBR6uYu/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=axxhoNgu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="axxhoNgu"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2DDAB3;
	Fri, 15 Mar 2024 11:56:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710500203;
	bh=TkRbh9m0Rc3tzwydHqpMwQAiGh0IQGr5p1ewO+rE7JI=;
	h=From:To:Cc:Subject:Date:From;
	b=axxhoNgunjXJTN5BOQqupHW/kPP0R/GMXzNoq8rDDsg3kDBcVTmVQTg6RUwjvOvNb
	 7lIjtIjKRrjahgThmSkxiQmG9iQn3UBmEfAukagMRkvdlnST07sjZXwctP1WXr2Ddc
	 dNqfQYlfGJiAg/ggdTY0ZJkEWLK1h0rHShwkeaGg=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/5] staging: vc04_services: Address module cleanup
Date: Fri, 15 Mar 2024 16:26:54 +0530
Message-ID: <20240315105659.111544-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series addresses the following TODO item:

```
* Fix kernel module support

Even the VPU firmware doesn't support a VCHI re-connect, the driver
should properly handle a module unload. This also includes that all
resources must be freed (kthreads, debugfs entries, ...) and global
variables avoided.
```

Patch 1/5 to 3/5 are log cleanups spotted during the reading of the
driver.

Patch 4/5 implements .remove() function vptr so that individual
devices(bcm2835-audio, bcm2835-camera, bcm2835-isp etc.)
can run their cleanup when removed from the vchiq_bus, during their
own module unload.

Patch 5/5 stops the kthreads started by vchiq - on shutdown path.

Rest of the module cleanup (debugfs entries, deregister char device
etc.) is already done as part of vchiq_remove().

Testing on RPi4 for vchiq module unload:

```
uajain@ATX:~$ uname -r
6.8.0-rc1-00128-gab2b09f632fa-dirty
uajain@ATX:~$ dmesg | grep vchiq
[   21.401426] vchiq: module is from the staging directory, the quality is unknown, you have been warned.
uajain@ATX:~$ sudo modprobe bcm2835_mmal_vchiq
sudo: unable to resolve host ATX: Temporary failure in name resolution
uajain@ATX:~$ dmesg | grep vchiq
[   21.401426] vchiq: module is from the staging directory, the quality is unknown, you have been warned.
[   96.388148] bcm2835_mmal_vchiq: module is from the staging directory, the quality is unknown, you have been warned.
uajain@ATX:~$ lsmod | grep vchiq 
bcm2835_mmal_vchiq     40960  0
vchiq                 581632  1 bcm2835_mmal_vchiq
uajain@ATX:~$ sudo rmmod bcm2835_mmal_vchiq vchiq
sudo: unable to resolve host ATX: Temporary failure in name resolution
uajain@ATX:~$ lsmod | grep vchiq
uajain@ATX:~$ dmesg | grep vchiq
[   21.401426] vchiq: module is from the staging directory, the quality is unknown, you have been warned.
[   96.388148] bcm2835_mmal_vchiq: module is from the staging directory, the quality is unknown, you have been warned.
uajain@ATX:~$ 

```

Umang Jain (5):
  staging: vc04_services: Remove unused function declarations
  staging: vc04_services: vchiq_arm: Use appropriate dev_* log helpers
  staging: vc04_services: Do not log error on kzalloc()
  staging: vc04_services: Implement vchiq_bus .remove
  staging: vc04_services: vchiq_core: Stop kthreads on shutdown

 drivers/staging/vc04_services/interface/TODO   |  7 -------
 .../interface/vchiq_arm/vchiq_arm.c            | 18 ++++++++++--------
 .../interface/vchiq_arm/vchiq_bus.c            |  9 +++++++++
 .../interface/vchiq_arm/vchiq_core.c           | 10 +++++++---
 .../interface/vchiq_arm/vchiq_core.h           |  6 ------
 5 files changed, 26 insertions(+), 24 deletions(-)


base-commit: 68bb540b1aefded1d58a9f956568d5316643d291
-- 
2.43.0

