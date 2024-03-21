Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433C03FB2C
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711017482; cv=none; b=KjTmZuRdm4b1eVsClWDh5VPJ1xeV/jW0NnHspIrSrniG8NwS5Wkz2Y0bTqhX6WPZC6bVs0mPwsJPX8LNVismPKrB1tMrtJJjwvWkFDh/WRPCG38achR17DNHIV1lblEZIKWyAZYg5bSnwNiSPGJSFJJP1JOhP8xHNNN8bWAq6XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711017482; c=relaxed/simple;
	bh=Z53N6h75muw8hWFApfiBdxnCGf/9WGZPDVxgvcGPB70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QPiXTuny3OLyI6eOuFPHZFPdRP1j6fhNZ52RCdSZHQy3Dxt5OiA3P8pAmTzXRypRvUmtMTwepfjOj3EtoFTepdBNrz4o2yEBiwozXCY0e58DHPa3X1fcdNMcBwVjIIXbEPPgO9OqGwdZjzf1oi9lFK/CxdJ2GIT4NmuyW4fFuts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NMNxNtor; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NMNxNtor"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D13F48CC;
	Thu, 21 Mar 2024 11:37:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711017450;
	bh=Z53N6h75muw8hWFApfiBdxnCGf/9WGZPDVxgvcGPB70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NMNxNtor3vhNw6h0/wrD9Ot368U6yAnZ1BbUCVB80Dt4vcNoFfAKQqUlpqAoQQ22W
	 eaJekkiZ6JT0Fxvh9weotH0i/xxTzL6plqYQrr45hKZQTjl/ntLL5LzC3gNrfAvj/Q
	 j5h4J1mZYOgHFCMvr0XUxWI3mDe5g+Uywso+8blM=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3 1/6] staging: vc04_services: Drop g_once_init global variable
Date: Thu, 21 Mar 2024 16:07:35 +0530
Message-ID: <20240321103740.808561-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321103740.808561-1-umang.jain@ideasonboard.com>
References: <20240321103740.808561-1-umang.jain@ideasonboard.com>
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

