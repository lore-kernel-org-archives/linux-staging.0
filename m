Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E03218B
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908713; cv=none; b=YfUFRcv6Q3np9UK0cVlN5SYliRd7Gqb+mulSjGgjU6S91lUAn63tbhr5FyVS+oWcCOnBpj7GsttIRlA2javJhRKRSy+P0XcR5y0UYcca6kk90MOfK4/t9eM4JokGBE07/uLu25KnhjzQIGgjV7nw33GXjpb8IwJupbT/jE9cvkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908713; c=relaxed/simple;
	bh=7boKpAvnnAhRYHnZ9vY45O5hk/RZvz+ki3er8enzeNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OufbIbnYxz9S4FbcALCF9hlfWWeCnQ6Nt9+8euSD0oHiNuVjY5tXujlx0YbfEKtw9tvxffP1aeSYsXaGtnTZNvyF/rVoM4hcDMwahHISPMT5pQVpXkDDteOkNayt0TKlXNVs8HOn7t9lCr4C+NGUvfubzoS96Gb4GEpOqLl3X1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=scixvUYs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="scixvUYs"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4562CA68;
	Fri, 12 Apr 2024 09:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908667;
	bh=7boKpAvnnAhRYHnZ9vY45O5hk/RZvz+ki3er8enzeNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=scixvUYsq/OvNzhCXlQ7YE8RN0hKfEXfkhhnulJedEDDb6XL4LmyU2IUqH9KFqlzs
	 fpkl4jaE3GnoNm06DQ4uImFuouMF1e/q7WwUinQZZF93mbBndE2qKEN4JMKGl3zG8x
	 lmKAY7m1u4D0TEFpWpuyl19Ea8eC49ljKTtID5JU=
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
Subject: [PATCH v5 09/11] staging: vc04_services: vchiq_mmal: Rename service_callback()
Date: Fri, 12 Apr 2024 13:27:41 +0530
Message-ID: <20240412075743.60712-10-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412075743.60712-1-umang.jain@ideasonboard.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 4c3684dd902e..680961a7c61b 100644
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
@@ -1862,7 +1862,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 		.version		= VC_MMAL_VER,
 		.version_min		= VC_MMAL_MIN_VER,
 		.fourcc			= VCHIQ_MAKE_FOURCC('m', 'm', 'a', 'l'),
-		.callback		= service_callback,
+		.callback		= mmal_service_callback,
 		.userdata		= NULL,
 	};
 
-- 
2.44.0

