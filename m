Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105C828E3
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 08:43:02 +0000 (UTC)
Received: from ideasonboard.com (unknown [103.251.226.79])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 296CACCA;
	Fri, 18 Nov 2022 09:42:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1668760981;
	bh=iQ68jUqBgEQAwQC2wOa1YQTubJd9hMRa/Dl1/9xvBPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DHpanySh5ExNVFhh5w2sahewHz+aHB5bWT76gVavMrbh2ANZW6V7tJn0DsdvcNEdZ
	 QdFIyN4ofwz2N1NjWAOIleTonFE3rVblXo3AXexUbXoDbxaEkXR9y1LRVPqb1eFaML
	 omm3fI/MXYxxsVUw3IbY4OhOHtGfRU0tkM0KfWrg=
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
Subject: [PATCH v2 1/3] Revert "staging: mmal-vchiq: Avoid use of bool in structures"
Date: Fri, 18 Nov 2022 14:12:42 +0530
Message-Id: <20221118084244.199909-2-umang.jain@ideasonboard.com>
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

This reverts commit 640e77466e69d9c28de227bc76881f5501f532ca.

In commit 7967656ffbfa ("coding-style: Clarify the expectations around
bool") the check to dis-allow bool structure members was removed from
checkpatch.pl. It promotes bool structure members to store boolean
values. This enhances code readability.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/vchiq-mmal/mmal-vchiq.c    | 12 ++++++------
 .../staging/vc04_services/vchiq-mmal/mmal-vchiq.h    |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index cb921c94996a..4abb6178cb9f 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -863,9 +863,9 @@ static int port_info_get(struct vchiq_mmal_instance *instance,
 		goto release_msg;
 
 	if (rmsg->u.port_info_get_reply.port.is_enabled == 0)
-		port->enabled = 0;
+		port->enabled = false;
 	else
-		port->enabled = 1;
+		port->enabled = true;
 
 	/* copy the values out of the message */
 	port->handle = rmsg->u.port_info_get_reply.port_handle;
@@ -1304,7 +1304,7 @@ static int port_disable(struct vchiq_mmal_instance *instance,
 	if (!port->enabled)
 		return 0;
 
-	port->enabled = 0;
+	port->enabled = false;
 
 	ret = port_action_port(instance, port,
 			       MMAL_MSG_PORT_ACTION_TYPE_DISABLE);
@@ -1359,7 +1359,7 @@ static int port_enable(struct vchiq_mmal_instance *instance,
 	if (ret)
 		goto done;
 
-	port->enabled = 1;
+	port->enabled = true;
 
 	if (port->buffer_cb) {
 		/* send buffer headers to videocore */
@@ -1531,7 +1531,7 @@ int vchiq_mmal_port_connect_tunnel(struct vchiq_mmal_instance *instance,
 			pr_err("failed disconnecting src port\n");
 			goto release_unlock;
 		}
-		src->connected->enabled = 0;
+		src->connected->enabled = false;
 		src->connected = NULL;
 	}
 
@@ -1799,7 +1799,7 @@ int vchiq_mmal_component_disable(struct vchiq_mmal_instance *instance,
 
 	ret = disable_component(instance, component);
 	if (ret == 0)
-		component->enabled = 0;
+		component->enabled = false;
 
 	mutex_unlock(&instance->vchiq_mutex);
 
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
index 6006e29232b3..6d984cf5a83a 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
@@ -48,7 +48,7 @@ typedef void (*vchiq_mmal_buffer_cb)(
 		int status, struct mmal_buffer *buffer);
 
 struct vchiq_mmal_port {
-	u32 enabled:1;
+	bool enabled;
 	u32 handle;
 	u32 type; /* port type, cached to use on port info set */
 	u32 index; /* port index, cached to use on port info set */
@@ -83,7 +83,7 @@ struct vchiq_mmal_port {
 
 struct vchiq_mmal_component {
 	u32 in_use:1;
-	u32 enabled:1;
+	bool enabled;
 	u32 handle;  /* VideoCore handle for component */
 	u32 inputs;  /* Number of input ports */
 	u32 outputs; /* Number of output ports */
-- 
2.38.1

