Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C319DF7A
	for <linux-staging@lists.linux.dev>; Sat, 12 Oct 2024 18:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728759440; cv=none; b=UINvRDzrNNmnwyOst9WyQ86nE31kuFGjiEUOI7HBgsZoY48l7t3kUA5W2aIEp3eLJqHzJo2qvAYK+czQhlX1DA1IuVId47MuqTjLFwaYzGg7x5ZsWX1vlQUocIfVXZCU3NAtJ8QW39L6de3uS2muA5b1XZMFAg+1vHv0gSAw3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728759440; c=relaxed/simple;
	bh=rzdfDk5u7zAZeymF1izXLwtTGZLruxo3jvMUzkDdK7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4C9MJeQsgJE4a8pqIOcFExbHsc3J1Hj1KDPfnCGER4m3JEhuxqxnUHJ6xG6gyYrzqshuzjayEmShQ9cSzeJIbAeqnta7NREjrwR63Kx51Nko5Yr1LcGnzvyzNsEp1n6is8Zv1PWrueD6O+6Rk2svoS0pI1CINiq5F1F9jTnRfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ORXS9JES; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ORXS9JES"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DD288BF;
	Sat, 12 Oct 2024 20:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728759338;
	bh=rzdfDk5u7zAZeymF1izXLwtTGZLruxo3jvMUzkDdK7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ORXS9JESGYtERhiQPTeuPzDWFRYTKAkU8FCyWxQf/XIK3SWWLr16fudANp6HiA889
	 OiggFL0yrOi5o/Zld3XiG9H1AEi7gm+3Kj2ecP5iaqYG3V19U7QG32t+W6sxlc7oPP
	 811AcJf1ts1GERFNhVJz0jjw7CYauiDTAQhZ+6Gw=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 6/6] staging: vchiq_core: Lower indentation in vchiq_close_service_internal
Date: Sun, 13 Oct 2024 00:26:52 +0530
Message-ID: <20241012185652.316172-7-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241012185652.316172-1-umang.jain@ideasonboard.com>
References: <20241012185652.316172-1-umang.jain@ideasonboard.com>
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
index e2183d55e5cf..a2bb368836e4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3169,19 +3169,21 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
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

