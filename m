Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DDE189B93
	for <linux-staging@lists.linux.dev>; Fri, 23 Aug 2024 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724426077; cv=none; b=A68ErPRHXE4jOGxsgLGjBre5MIMouZ0SL0IHBI2jT4+R3BSYOrIGebUMJDnDmMDcFtRHzzcYfjzKLkzCbFId1AmVJYwB6rqBroGyI7Ob2BX7VURxbarqbVlY2OptiVzVanIDAD2s8zRgFq5jZP1P1X53kCeJuyuYEOwfwH9PYog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724426077; c=relaxed/simple;
	bh=uczQTHc/hJKZFwcpphfWQ48EAdA8J/cRvXojkpCAitw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iANoXh0LJm02YtGpnu/DetZ2sGqpzc4rwuTulO526X3vaIz3A7UJRuNBGontop63yU/qQjFdUuYAa/39loO45ttCLh8gdcc+CROIO3C3/rzZhiem0j9+VWVTxYGZieYpFbyMwlc9rdhrpCyBJA0fmuXGntnT8g6n9pXXMY2kjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BKP4s+yN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BKP4s+yN"
Received: from [192.168.29.25] (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF063E7C;
	Fri, 23 Aug 2024 17:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724426011;
	bh=uczQTHc/hJKZFwcpphfWQ48EAdA8J/cRvXojkpCAitw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BKP4s+yNmARUq6QppbA6TIMDB57XvoieF0d54rOKuENxAGUf5dwE6hFgCzoIGFaTZ
	 B89ucq8WrQGQsVROqvzWVz9MriG7TlZn90yIuK0ar7y14Oq8+PJVzAAECAlotMu6A/
	 Ii2v/M9C2MEvtUiOApnkpdu4gyYAzLyAoanbTpxc=
From: Umang Jain <umang.jain@ideasonboard.com>
Date: Fri, 23 Aug 2024 20:44:23 +0530
Subject: [PATCH 3/7] staging: vchiq_core: Factor out bulk transfer for
 blocking mode
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-to_sent2-v1-3-8bc182a0adaf@ideasonboard.com>
References: <20240823-to_sent2-v1-0-8bc182a0adaf@ideasonboard.com>
In-Reply-To: <20240823-to_sent2-v1-0-8bc182a0adaf@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Arnd Bergmann <arnd@arndb.de>, Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Umang Jain <umang.jain@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724426064; l=5364;
 i=umang.jain@ideasonboard.com; s=20240731; h=from:subject:message-id;
 bh=uczQTHc/hJKZFwcpphfWQ48EAdA8J/cRvXojkpCAitw=;
 b=HkrgIOoi3sFW3j4ZN1ZTzjTeRdIGA81r75Fl+wbVWWhuah28u+fwXQo0CWYNa4oQt91a0Qaqa
 D1tSByuXtfRBAvYqohx80Lm62D3VJoGEKoc0gNphMKqBbT9TsZ1YS2b
X-Developer-Key: i=umang.jain@ideasonboard.com; a=ed25519;
 pk=7pvnIBNsDpFUMiph0Vlhrr01+rAn5fSIn/QtDeLeXL0=

Factor out bulk transfer for blocking mode into a separate dedicated
function bulk_xfer_blocking_interruptible(). It is suffixed by
"_interruptible" to denote that it can be interrupted and -EAGAIN
can be returned. It would be up to the users of the function to retry
the call in those cases.

Adjust the calls to vchiq-dev.c ioctl interface and vchiq_arm.c
for blocking bulk transfers.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  |  5 +--
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 48 +++++++++++++++++++---
 .../vc04_services/interface/vchiq_arm/vchiq_core.h |  5 +++
 .../vc04_services/interface/vchiq_arm/vchiq_dev.c  |  6 +++
 4 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c4d97dbf6ba8..e9b9c76381dc 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -968,9 +968,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 			return -ENOMEM;
 	}
 
-	ret = vchiq_bulk_transfer(instance, handle, data, NULL, size,
-				  &waiter->bulk_waiter,
-				  VCHIQ_BULK_MODE_BLOCKING, dir);
+	ret = bulk_xfer_blocking_interruptible(instance, handle, data, NULL, size,
+					       &waiter->bulk_waiter, dir);
 	if ((ret != -EAGAIN) || fatal_signal_pending(current) || !waiter->bulk_waiter.bulk) {
 		struct vchiq_bulk *bulk = waiter->bulk_waiter.bulk;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index c31f5d773fa5..341a06997848 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2985,6 +2985,48 @@ vchiq_remove_service(struct vchiq_instance *instance, unsigned int handle)
 	return status;
 }
 
+int
+bulk_xfer_blocking_interruptible(struct vchiq_instance *instance, unsigned int handle,
+				 void *offset, void __user *uoffset, int size,
+				 void __user *userdata, enum vchiq_bulk_dir dir)
+{
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
+	struct bulk_waiter *bulk_waiter = NULL;
+	enum vchiq_bulk_mode mode = VCHIQ_BULK_MODE_BLOCKING;
+	int status = -EINVAL;
+
+	if (!service)
+		goto error_exit;
+
+	if (service->srvstate != VCHIQ_SRVSTATE_OPEN)
+		goto error_exit;
+
+	if (!offset && !uoffset)
+		goto error_exit;
+
+	if (vchiq_check_service(service))
+		goto error_exit;
+
+	bulk_waiter = userdata;
+	init_completion(&bulk_waiter->event);
+	bulk_waiter->actual = 0;
+	bulk_waiter->bulk = NULL;
+
+	status = vchiq_bulk_xfer_queue_msg_interruptible(service, offset, uoffset, size,
+							 userdata, mode, dir);
+	if (status)
+		goto error_exit;
+
+	vchiq_service_put(service);
+
+	return 0;
+
+error_exit:
+	if (service)
+		vchiq_service_put(service);
+	return status;
+}
+
 /*
  * This function may be called by kernel threads or user threads.
  * User threads may receive -EAGAIN to indicate that a signal has been
@@ -3018,12 +3060,6 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 	case VCHIQ_BULK_MODE_NOCALLBACK:
 	case VCHIQ_BULK_MODE_CALLBACK:
 		break;
-	case VCHIQ_BULK_MODE_BLOCKING:
-		bulk_waiter = userdata;
-		init_completion(&bulk_waiter->event);
-		bulk_waiter->actual = 0;
-		bulk_waiter->bulk = NULL;
-		break;
 	default:
 		goto error_exit;
 	}
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 1fda8631d1b6..ff3559c3d1ba 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -474,6 +474,11 @@ extern int
 bulk_xfer_waiting_interruptible(struct vchiq_instance *instance, unsigned int handle,
 				void *userdata);
 
+extern int
+bulk_xfer_blocking_interruptible(struct vchiq_instance *instance, unsigned int handle,
+				 void *offset, void __user *uoffset, int size,
+				 void __user *userdata, enum vchiq_bulk_dir dir);
+
 extern int
 vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *offset,
 		    void __user *uoffset, int size, void *userdata, enum vchiq_bulk_mode mode,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 445b7938eea3..1bff97ad28fa 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -304,6 +304,12 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		}
 
 		userdata = &waiter->bulk_waiter;
+
+		status = bulk_xfer_blocking_interruptible(instance, args->handle,
+							  NULL, args->data, args->size,
+							  userdata, dir);
+
+		goto bulk_transfer_handled;
 	} else if (args->mode == VCHIQ_BULK_MODE_WAITING) {
 		mutex_lock(&instance->bulk_waiter_list_mutex);
 		list_for_each_entry(iter, &instance->bulk_waiter_list,

-- 
2.45.0

