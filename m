Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17421A07
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 21:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f34InSJ4"
Received: from umang.jain (unknown [103.86.18.252])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E335C58;
	Thu,  2 Nov 2023 22:05:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698959160;
	bh=g9HzfZmE3ZTc4WYjPHq8NUaGArWYbSyR+SDvRDMfWbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f34InSJ4zuWTnqz8o3vseg3vLJLp6bKr8J12nENr+rN6xNpRYdO5J34VhW+qvFn3X
	 JwCwYbCDrBKvJe5sbs7Wv196g87asy6/U4Hy5x/OyuIhGg9vjU4oKPQDHeU+TRjQry
	 z7oFkUj8S8TErHvJmzNHxFFsuTf2UDU2pSoFv2t0=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 2/3] staging: vc04_services: Log using pr_err() when vchiq_state is unset
Date: Thu,  2 Nov 2023 17:06:02 -0400
Message-ID: <20231102210603.1201311-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102210603.1201311-1-umang.jain@ideasonboard.com>
References: <20231102210603.1201311-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cases, where the global vchiq state is still unset, we cannot log
to dynamic debug (access to struct device is needed, hence potential
NULL de-reference). Log using pr_err() instead.

In vchiq_initialise(), remove the 'goto' because it is just again
trying to log to dynamic debug. Simply return with -ENNOTCONN after
logging to pr_err().

In vchiq_open(), move the vchiq_log_debug() after the state pointer
null check.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 6 ++----
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c  | 7 +++----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9fb8f657cc78..9fb3e240d9de 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -687,10 +687,8 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 		usleep_range(500, 600);
 	}
 	if (i == VCHIQ_INIT_RETRIES) {
-		vchiq_log_error(state->dev, VCHIQ_CORE, "%s: videocore not initialized\n",
-				__func__);
-		ret = -ENOTCONN;
-		goto failed;
+		pr_err("%s: videocore not initialized\n", __func__);
+		return -ENOTCONN;
 	} else if (i > 0) {
 		vchiq_log_warning(state->dev, VCHIQ_CORE,
 				  "%s: videocore initialized after %d retries\n", __func__, i);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 0bc93f48c14c..3425d2b199c2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -1170,14 +1170,13 @@ static int vchiq_open(struct inode *inode, struct file *file)
 	struct vchiq_state *state = vchiq_get_state();
 	struct vchiq_instance *instance;
 
-	vchiq_log_debug(state->dev, VCHIQ_ARM, "vchiq_open");
-
 	if (!state) {
-		vchiq_log_error(state->dev, VCHIQ_ARM,
-				"vchiq has no connection to VideoCore");
+		pr_err("%s: vchiq has no connection to VideoCore\n", __func__);
 		return -ENOTCONN;
 	}
 
+	vchiq_log_debug(state->dev, VCHIQ_ARM, "vchiq_open");
+
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance)
 		return -ENOMEM;
-- 
2.41.0

