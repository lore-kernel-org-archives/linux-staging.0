Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAB55A4C7
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 18:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711649542; cv=none; b=EwISWb25i/P5OiIWWQ0CnIdsKJWmyvuD+OHo0je4qmSX491N/rx1lqyLoTEY4QE16fz9cj7mpMRFKlbUSB9K9EGi1inI0nzEr/3RdhbofZeZoOV68C2gc2nsp+6MpC4+5LJgK2ljU0MNxifGm/Wr5+h0shm5LGLo0Gp0k9HtFRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711649542; c=relaxed/simple;
	bh=RsPBiqu76eJualsoIaHREDbvTC3RfPQqRg0K0q3OY0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glwe2qLrKdF6/0OYNkooHR8v98LpV3E9XARdvCITWR0lZuFu++l36PxnJhr+Pai6lEfXq+JkeQiAM6Ew2u2D4VyJB/btPQOd0bloPW9vqlirM5fCxUFC+MLbWQf47zyKLkEi9dUCp9lIxx7rFqE90RjkABLzc621Tp7g6ZET5zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bo2cX1j3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bo2cX1j3"
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC0B9475;
	Thu, 28 Mar 2024 19:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711649506;
	bh=RsPBiqu76eJualsoIaHREDbvTC3RfPQqRg0K0q3OY0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bo2cX1j31VEsFB2QAQVdzt5NA7/MNmLD7jL1TE7BR3RFgkFPBuIEHY/k7eSYzgYmo
	 mzjPaEP7z8Kgt4L6BPlKjSR/2dz+PAFSuOPCrsAjEZrjVxyi6iVBeS+X1WRZbK7+Hn
	 HnJZCf1yoZqD1LSaeq8IrSJG2t1v8cho7TuL7+E8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v4 09/11] staging: vc04_services: vchiq_mmal: Rename service_callback()
Date: Thu, 28 Mar 2024 23:41:31 +0530
Message-ID: <20240328181134.1548799-10-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the service_callback static function to mmal_service_callback()
since the function signature conflicts with:

extern int
service_callback(struct vchiq_instance *vchiq_instance, enum vchiq_reason reason,
                 struct vchiq_header *header, unsigned int handle, void *bulk_userdata);

in vc04_services/interface/vchiq_arm/vchiq_arm.h

In a subsequent patch, we will include vchiq_arm.h header to
mmal-vchiq.c, which will then complain of this conflict. Hence,
this patch is meant to handle the conflict beforehand.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 258aa0e37f55..e9cac8f3f744 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -548,9 +548,9 @@ static void bulk_abort_cb(struct vchiq_mmal_instance *instance,
 }
 
 /* incoming event service callback */
-static int service_callback(struct vchiq_instance *vchiq_instance,
-			    enum vchiq_reason reason, struct vchiq_header *header,
-			    unsigned int handle, void *bulk_ctx)
+static int mmal_service_callback(struct vchiq_instance *vchiq_instance,
+				 enum vchiq_reason reason, struct vchiq_header *header,
+				 unsigned int handle, void *bulk_ctx)
 {
 	struct vchiq_mmal_instance *instance = vchiq_get_service_userdata(vchiq_instance, handle);
 	u32 msg_len;
@@ -1861,7 +1861,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 		.version		= VC_MMAL_VER,
 		.version_min		= VC_MMAL_MIN_VER,
 		.fourcc			= VCHIQ_MAKE_FOURCC('m', 'm', 'a', 'l'),
-		.callback		= service_callback,
+		.callback		= mmal_service_callback,
 		.userdata		= NULL,
 	};
 
-- 
2.43.0

