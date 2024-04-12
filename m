Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284623218B
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908682; cv=none; b=Ao3Nwp9LWuV2Y9cvhkZXAia92foMg+cjz3mPofOjImaw+lWY08vLbWuSs4A7VXgEkM0uuE52zc8u3J+D6qJ2UDy6eN+qX2lq0bt5NzW1xPcuqL5DSpSUFOpkCbV4ZG54HIS+YIzApZwRU/mQyGA5NQMASbRhrg4eP/Sh5F+pywE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908682; c=relaxed/simple;
	bh=nCC4xyVgOQIY//Dwrdt2ljXPq2xmAocy87+QkS81b1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUndxbogU2Xn4r5Qxh8zZtncuhdb8yuamaCSjDKDdwsqTxYIf4FV6NjMurJxI+NAVAlmthivx7qVK0SYrsk/nhSe+hnas+bxaQuxflvihoqCV8QtM1lPGKVOkJWPYYnqUQ3SvcTSO0wt9RecPRTfsLm6q7p9p/NIs0C/IPFA3Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=acPsP1BH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="acPsP1BH"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7D9BA68;
	Fri, 12 Apr 2024 09:57:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908635;
	bh=nCC4xyVgOQIY//Dwrdt2ljXPq2xmAocy87+QkS81b1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=acPsP1BHsRnAVyJ/7teaLiunMd8FOfa9O64iMpY+1QCWad0SdcKImIBTGKokpCrTN
	 T9TdlzrBNbLMEJHVBwO997vuvnrino/EGMqyDPH4ZtmVl1LDdz+K3goDPU+AXGbQT7
	 pYRJE7HYHXuMLKhd3ET4ZaB6DnUIXlrMBeXIYrOs=
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
Subject: [PATCH v5 01/11] staging: vc04_services: Drop g_once_init global variable
Date: Fri, 12 Apr 2024 13:27:33 +0530
Message-ID: <20240412075743.60712-2-umang.jain@ideasonboard.com>
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

g_once_init is not used in a meaningful way anywhere. Drop it
along with connected_init() which sets it.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
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
2.44.0

