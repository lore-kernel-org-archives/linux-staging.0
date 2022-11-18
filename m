Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB30C28E3
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 08:43:07 +0000 (UTC)
Received: from ideasonboard.com (unknown [103.251.226.79])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBC9BCE1;
	Fri, 18 Nov 2022 09:43:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1668760986;
	bh=6Phtney9spbBUHdVRM2VGrePUW5l4G22Zp/hlcIOKcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SvuHBB6Gb8xK4U/2WKK92L7uHV4jHTdlWpJ2AhFmEM0Dj3zfnH/eCHCOpODGSO/iD
	 cMY9VLGjJXYs/umwSYu4nyEPfDlVoxu7inLCBG2kCn40/Fn1VpVRdt0w4Za9d7HaIa
	 89fIIkC5ZKp6sAdXQyw5TiWKVaz+DxV/7COIcOEM=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 2/3] vc04_services: mmal-vchiq: Use bool for vchiq_mmal_component.in_use
Date: Fri, 18 Nov 2022 14:12:43 +0530
Message-Id: <20221118084244.199909-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118084244.199909-1-umang.jain@ideasonboard.com>
References: <20221118084244.199909-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 7967656ffbfa ("coding-style: Clarify the expectations around
bool") the check to dis-allow bool structure members was removed from
checkpatch.pl. It promotes bool structure members to store boolean
values. This enhances code readability.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 6 +++---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 4abb6178cb9f..294b184d4a49 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1648,7 +1648,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 	for (idx = 0; idx < VCHIQ_MMAL_MAX_COMPONENTS; idx++) {
 		if (!instance->component[idx].in_use) {
 			component = &instance->component[idx];
-			component->in_use = 1;
+			component->in_use = true;
 			break;
 		}
 	}
@@ -1724,7 +1724,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 	destroy_component(instance, component);
 unlock:
 	if (component)
-		component->in_use = 0;
+		component->in_use = false;
 	mutex_unlock(&instance->vchiq_mutex);
 
 	return ret;
@@ -1747,7 +1747,7 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 
 	ret = destroy_component(instance, component);
 
-	component->in_use = 0;
+	component->in_use = false;
 
 	mutex_unlock(&instance->vchiq_mutex);
 
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
index 6d984cf5a83a..09f030919d4e 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
@@ -82,7 +82,7 @@ struct vchiq_mmal_port {
 };
 
 struct vchiq_mmal_component {
-	u32 in_use:1;
+	bool in_use;
 	bool enabled;
 	u32 handle;  /* VideoCore handle for component */
 	u32 inputs;  /* Number of input ports */
-- 
2.38.1

