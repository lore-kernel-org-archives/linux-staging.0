Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA5F1C684
	for <linux-staging@lists.linux.dev>; Tue,  7 Nov 2023 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YEYI598t"
Received: from umang.jain (unknown [103.251.226.96])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 499138CC;
	Tue,  7 Nov 2023 17:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699376115;
	bh=1H6/Xs6rlQM2lcXsSBsc50FMtGsuBvxFv3yX7+RhGmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YEYI598tvMB2spg0c8f5okp2xivKMIENKixTtnx69eZO6kF3XUhdB1nG3jgyGDjcd
	 U9uyXVwSokq9cx42/V+HowPBzEU8bywZ1IE5nou93cLEJ/B+l2W+ePcDlCa4XIDSRn
	 kI8K5oJdcO+BgOvqYwLRgpHNPP8CPMeU3tDZ+SJg=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/2] staging: vc04_services: Use %p to log pointer address
Date: Tue,  7 Nov 2023 11:55:22 -0500
Message-ID: <20231107165523.638555-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107165523.638555-1-umang.jain@ideasonboard.com>
References: <20231107165523.638555-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Solves the following Smatch warnings:
vchiq_arm.c:1113 service_callback() warn: argument 7 to %lx specifier is cast from pointer
vchiq_arm.c:1113 service_callback() warn: argument 11 to %lx specifier is cast from pointer
vchiq_arm.c:1113 service_callback() warn: argument 12 to %lx specifier is cast from pointer
vchiq_arm.c:1113 service_callback() warn: argument 13 to %lx specifier is cast from pointer

%p will print the hashed pointer to dynamic debug.
In order to print the unmodified pointer address, one can use the
`no_hash_pointers` via kernel parameters.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 4a2023919f5f..34b8985a57e2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1111,11 +1111,10 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 	rcu_read_unlock();
 
 	dev_dbg(service->state->dev,
-		"%s: %s: %s - service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx\n",
+		"%s: %s: %s - service %p(%d,%p), reason %d, header %p, instance %p, bulk_userdata %p\n",
 		log_cat(VCHIQ_ARM), log_type(TRACE),
-		__func__, (unsigned long)user_service, service->localport,
-		user_service->userdata, reason, (unsigned long)header,
-		(unsigned long)instance, (unsigned long)bulk_userdata);
+		__func__, user_service, service->localport,
+		user_service->userdata, reason, header, instance, bulk_userdata);
 
 	if (header && user_service->is_vchi) {
 		spin_lock(&msg_queue_spinlock);
-- 
2.41.0

