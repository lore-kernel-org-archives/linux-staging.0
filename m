Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02D446A4
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711649510; cv=none; b=DJB/ZibXXX5DwUWfHIzVkvkqSsPOn1O1TRpGvKV1Aph1pUTew+isKRYy8w4KyXrIdivMxVteaPP8+r8Qf8Irk4euz50dak8YDxWb7l0r1w7mmawaIWZVsHZjYbGspzoVzZ0mCJITyQoBuCt0B2AcunHruvxg1/yqbCJynMnEMWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711649510; c=relaxed/simple;
	bh=Z53N6h75muw8hWFApfiBdxnCGf/9WGZPDVxgvcGPB70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLDANBmKKl+93Zms8re8++kDN734UjF/RJLuTlqwtwQXRDHaRHo8G0FCPPARzVxQT21xynEu1YSRvCaFqEB4fVGhoTR1XzAkbED6P7xefL0srcRX1EBlhwg4wHnT8GNK41hbsN7FbQmroBNQEbb108Rmlc0QZmDUL/qyRfih8Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UJ0VXQhl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UJ0VXQhl"
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D57A1890;
	Thu, 28 Mar 2024 19:11:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711649474;
	bh=Z53N6h75muw8hWFApfiBdxnCGf/9WGZPDVxgvcGPB70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UJ0VXQhlSsq/RqIAaSN9ASBM4+QILqhN+uUb6aTUdWXoekG0zdc0CuK3W9m3fvB29
	 KdAsFt7hlLHQvdpcmK7bS0NVGSwojAPgQUhJXa/bLuy+xg/vjjUQyH3wZUeOCfeVXr
	 UIk4Ny4v+xB0ocbAvcR0OKgl4ciF5qKMc+4kgC+8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v4 01/11] staging: vc04_services: Drop g_once_init global variable
Date: Thu, 28 Mar 2024 23:41:23 +0530
Message-ID: <20240328181134.1548799-2-umang.jain@ideasonboard.com>
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

g_once_init is not used in a meaningful way anywhere. Drop it
along with connected_init() which sets it.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_connected.c            | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index 3cad13f09e37..4604a2f4d2de 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -11,16 +11,8 @@
 static   int                        g_connected;
 static   int                        g_num_deferred_callbacks;
 static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
-static   int                        g_once_init;
 static   DEFINE_MUTEX(g_connected_mutex);
 
-/* Function to initialize our lock */
-static void connected_init(void)
-{
-	if (!g_once_init)
-		g_once_init = 1;
-}
-
 /*
  * This function is used to defer initialization until the vchiq stack is
  * initialized. If the stack is already initialized, then the callback will
@@ -29,8 +21,6 @@ static void connected_init(void)
  */
 void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
 {
-	connected_init();
-
 	if (mutex_lock_killable(&g_connected_mutex))
 		return;
 
@@ -60,8 +50,6 @@ void vchiq_call_connected_callbacks(void)
 {
 	int i;
 
-	connected_init();
-
 	if (mutex_lock_killable(&g_connected_mutex))
 		return;
 
-- 
2.43.0

