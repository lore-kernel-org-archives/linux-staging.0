Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946EC2F80
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 21:58:35 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mrwnt-1l6mLz0xaH-00nzml; Tue, 25 May 2021 23:58:30 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] staging: mmal-vchiq: Fix incorrect static vchiq_instance.
Date: Tue, 25 May 2021 23:57:37 +0200
Message-Id: <1621979857-26754-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:ZCm6tFvXIRoeC6eTbezdjIYvIUXFY+8YWRF++EU1qNB7srC4X+h
 9trYiLtCy16tgAekDxD3hY3hHCl7sxk3TgPLpTHXpZila7I3Z1x3YMBsZUG38XzfivVrfyq
 P8mFqQw9xwY/YpUgOHMCtJ0HH2NZuP/nmPGz+cj7PHjd0mai1kr8JgvWdt2GILx82MHch8w
 Ss0JEzv8543uDhZpCldCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dAfDoSmyyoA=:bjkarddJ+vCjOLDRVAZ079
 jfgBFHMh0ZrxRhR5unzZgLhg6IszPiHp38/+VdWTwutnXQF+RCPp09NhhuMyXv9g3Ty9Byjf+
 2H0LjTIbg7QGdAcFxV4cqCjloU+A/aW5XRvVnq03+KeK1kOiyYh+e6Z5OFQL1q8s8M66uRSHR
 az/A7CiElAHSl1GQdOS9u31fzVprAvxVIupMHVBFe+66UHSx1/xkr7eIdOvJ5/GTrty5iR8O0
 KgkkXogtWBrrcsFxDWmOF6dF0mIj/WpUrcHK1KF9a3kywwelX7BGBPaRypA/L5RVBOxZMZPnH
 X7RYPNM+j5YWXSTW3ZfokG1jZJLkEYXCGA1jk8XFUcOmW+fPruJztSxCcW3tdKHL7kDB/76go
 5iC/8VTpz0oGTA0/QeKhQWQh2xMDOxP/1Ox/j6jPoebUez0BlYw+ZdaY5EUHqgfEV7vJsrqF0
 f4OKCgeSQaiauJn0fao8tW0naVQRtAAJFE4J2evj89pm1zqWbOVhr6i1DwtrIDWfSqv0HVjwg
 JGPO/+1PMyp+urlgP/WfOU=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

For some reason lost in history function vchiq_mmal_init used
a static variable for storing the vchiq_instance.
This value is retrieved from vchiq per instance, so worked fine
until you try to call vchiq_mmal_init multiple times concurrently
when things then go wrong. This seemed to happen quite frequently
if using the cutdown firmware (no MMAL or VCSM services running)
as the vchiq_connect then failed, and one or other vchiq_shutdown
was working on an invalid handle.

Remove the static so that each caller gets a unique vchiq_instance.
	
Fixes: 7b3ad5abf027 ("staging: Import the BCM2835 MMAL-based V4L2 camera driver.")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 06bca7b..76d3f03 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1862,7 +1862,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 	int status;
 	int err = -ENODEV;
 	struct vchiq_mmal_instance *instance;
-	static struct vchiq_instance *vchiq_instance;
+	struct vchiq_instance *vchiq_instance;
 	struct vchiq_service_params_kernel params = {
 		.version		= VC_MMAL_VER,
 		.version_min		= VC_MMAL_MIN_VER,
-- 
2.7.4

