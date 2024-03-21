Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2767284A28
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026473; cv=none; b=UmQ79aCUcISI+iDRuI/iTD3WC1Thy44ROH+zcXq58beZ8jc97hL4KNx/U2YzIZWK9TOctHfQjDWgyDY7AHr/JamzIARJhU8kv66nfpcuW47y/qdbp88I+23Wjfr5oCdoAyNQCLUFsLDtPp1mnopk/1l9E7fYVZhZ5zNGX/fL54k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026473; c=relaxed/simple;
	bh=42uS1nv9lLcdn0bExmpA+X6TRwtxntz7ggHmW7n3t28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZaQ7muU0uux49SycE9UuKaBgLgo7ala5w2jReG3CuIYdU15Mfot2oA9RtnqtjBf5fv6dKLEDaC2FaH57Tkor+xlSxrhnrEECbVpWqWs8m3utX2YbuLT1H0ug4kAYhpa/zqssvtl6qTry+jE9OFCJDE2HLW7PapTTdY7Q/pJR2sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UyIC42R+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UyIC42R+"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B796A2B3;
	Thu, 21 Mar 2024 14:07:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711026440;
	bh=42uS1nv9lLcdn0bExmpA+X6TRwtxntz7ggHmW7n3t28=;
	h=From:To:Cc:Subject:Date:From;
	b=UyIC42R+d5QWYH1rh3Aq/PCgILEj04T8dNlCfd3WBfzyXlXRqBYBJ+pv6NQBREzFh
	 /fDAPE2iMxA4eF95KuJAFvzviWNB0XMvQJPu0kEj/2FcOVMBif8T8RqMY5G3QYCq8N
	 w8ktiB4Uqex+Bmlxbz+p7BoqFsxRXBaFj9txAa2E=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/5] staging: vc04_services: vchiq_core: Stop kthreads on shutdown
Date: Thu, 21 Mar 2024 18:37:32 +0530
Message-ID: <20240321130737.898154-1-umang.jain@ideasonboard.com>
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

changes in v2:
- Drop one of WARN_ON from patch 2/5 (will be handled separately)
- Remove curly braces for single statement in 3/5
- null-check driver->remove in 4/5

Umang Jain (5):
  staging: vc04_services: Remove unused function declarations
  staging: vc04_services: vchiq_arm: Use appropriate dev_* log helpers
  staging: vc04_services: Do not log error on kzalloc()
  staging: vc04_services: Implement vchiq_bus .remove
  staging: vc04_services: vchiq_core: Stop kthreads on shutdown

 drivers/staging/vc04_services/interface/TODO  |  7 -------
 .../interface/vchiq_arm/vchiq_arm.c           | 19 ++++++++++---------
 .../interface/vchiq_arm/vchiq_bus.c           | 10 ++++++++++
 .../interface/vchiq_arm/vchiq_core.c          | 10 +++++++---
 .../interface/vchiq_arm/vchiq_core.h          |  6 ------
 5 files changed, 27 insertions(+), 25 deletions(-)


base-commit: 68bb540b1aefded1d58a9f956568d5316643d291
-- 
2.43.0

