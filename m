Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158A620B1EA
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 07:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631377; cv=none; b=OWz52qJxinBytiZtj3K/wGM6oBSdIkmSRj06l2BernakD5/b1YT09+SGRMobEx8lGlEo4zMQIfersxzbf6s4iySZ9jTdvxItAGjSN+rO0nOlUftGEzvFrfN04z5QJMCaOqGOoptZ5zucC/aOgqJdB/p6fXRftCm0uE910eEs8gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631377; c=relaxed/simple;
	bh=csyxQoNQ7+mcBisJn+zgfV6Hd6DlNjHmaj2xueLISA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GV8mmiGUBlBhx1Bka3cXF/k42wXUW3kcn9QWGxOrNeGw7hd18V8cjBE7/LnxVnZAXFvnBleZEGA5cDn3WICh5Xatsd6Qe+6/7dyr6BBdLmzkBhxycvGlU1YjnHsDTZ6cIFEGpS0EAkHsaif9I+aEGFKDIWiTbDtAj4CyMrlFOOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QB+0yjaJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QB+0yjaJ"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9A25D8B;
	Fri, 11 Oct 2024 09:21:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728631276;
	bh=csyxQoNQ7+mcBisJn+zgfV6Hd6DlNjHmaj2xueLISA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QB+0yjaJGoVmccHL2cyKLdAx/mNCkmh57XSSS559Lg8tLrlcOu+P6tsk54Y/jqYDH
	 4WJ1gVu3jGZJMVhn/gcuPfn2kGJQYWsXCh76RE4E+YAQSBgAU+uzTyzpZBJnT5/whI
	 jsVqZEHgcRyVMpKF6KpuxrXvIlZ9vdWH8zSLPOzo=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 8/8] staging: vchiq_core: Lower indentation in vchiq_close_service_internal
Date: Fri, 11 Oct 2024 12:52:10 +0530
Message-ID: <20241011072210.494672-9-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011072210.494672-1-umang.jain@ideasonboard.com>
References: <20241011072210.494672-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce indentation of the conditional nesting in
vchiq_close_service_internal() switch case by checking the error paths
first and break early. This helps to reduce conditional branching and
reduce indentation levels.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_core.c          | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 04401baee9a6..204d73f4e904 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3152,19 +3152,21 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 		if (close_recvd) {
 			dev_err(state->dev, "core: (1) called in state %s\n",
 				srvstate_names[service->srvstate]);
-		} else if (is_server) {
-			if (service->srvstate == VCHIQ_SRVSTATE_LISTENING) {
-				status = -EINVAL;
-			} else {
-				service->client_id = 0;
-				service->remoteport = VCHIQ_PORT_FREE;
-				if (service->srvstate == VCHIQ_SRVSTATE_CLOSEWAIT)
-					set_service_state(service, VCHIQ_SRVSTATE_LISTENING);
-			}
-			complete(&service->remove_event);
-		} else {
+			break;
+		} else if (!is_server) {
 			vchiq_free_service_internal(service);
+			break;
+		}
+
+		if (service->srvstate == VCHIQ_SRVSTATE_LISTENING) {
+			status = -EINVAL;
+		} else {
+			service->client_id = 0;
+			service->remoteport = VCHIQ_PORT_FREE;
+			if (service->srvstate == VCHIQ_SRVSTATE_CLOSEWAIT)
+				set_service_state(service, VCHIQ_SRVSTATE_LISTENING);
 		}
+		complete(&service->remove_event);
 		break;
 	case VCHIQ_SRVSTATE_OPENING:
 		if (close_recvd) {
-- 
2.45.2

