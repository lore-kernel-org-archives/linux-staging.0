Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3487E
	for <linux-staging@lists.linux.dev>; Mon, 19 Dec 2022 11:58:15 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [IPv6:2401:4900:1f3e:7d24:3f0:3e81:fb16:ab4d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF18C825;
	Mon, 19 Dec 2022 12:58:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1671451094;
	bh=U4AsQkzYd1PDi/2MceWavcKccSKSoRxFVZd5HokQOSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJ/3b6+7HMvZn1HMYMUJndDv2VTxgGfZCPJ7bQVANEjCfQopAZxUz/UvTnuXAjsHy
	 KGCQsAn4REpMFKCxVXJUIgvWe124ah8A0GMdfRuOlysHmzm+TA4pxqC9pPlOPEq21w
	 JpKKwvg81MM/K70epa92UL16yF53SVst+ZC2TvT8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 5/7] vc04_services: vchiq_arm: Drop VCHIQ_RETRY usage on disconnect
Date: Mon, 19 Dec 2022 17:27:23 +0530
Message-Id: <20221219115725.11992-6-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219115725.11992-1-umang.jain@ideasonboard.com>
References: <20221219115725.11992-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the usage of VCHIQ_RETRY when the vchiq has connection status
VCHIQ_CONNSTATE_DISCONNECTED. Disconnected status will not be valid to
carry on a retry, replace the VCHIQ_RETRY with -ENOTCONN.

This patch removes the usage of vCHIQ_RETRY completely and act as
intermediatory to address the TODO item:
	* Get rid of custom function return values
for vc04_services/interface.

Fixes: 71bad7f08641 ("staging: add bcm2708 vchiq driver")
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 9c64d5de810e..ddb6d0f4daed 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3641,7 +3641,7 @@ vchiq_loud_error_footer(void)
 int vchiq_send_remote_use(struct vchiq_state *state)
 {
 	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED)
-		return VCHIQ_RETRY;
+		return -ENOTCONN;
 
 	return queue_message(state, NULL, MAKE_REMOTE_USE, NULL, NULL, 0, 0);
 }
@@ -3649,7 +3649,7 @@ int vchiq_send_remote_use(struct vchiq_state *state)
 int vchiq_send_remote_use_active(struct vchiq_state *state)
 {
 	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED)
-		return VCHIQ_RETRY;
+		return -ENOTCONN;
 
 	return queue_message(state, NULL, MAKE_REMOTE_USE_ACTIVE,
 			     NULL, NULL, 0, 0);
-- 
2.38.1

