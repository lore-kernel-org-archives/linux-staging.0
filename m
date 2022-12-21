Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C691FB3
	for <linux-staging@lists.linux.dev>; Wed, 21 Dec 2022 07:41:16 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [IPv6:2409:4041:6e00:8664:7b2b:8fb:60de:a205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6649EFB;
	Wed, 21 Dec 2022 08:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1671608468;
	bh=eFlNBXwSSXctvuPUS9pXmGHrLnv5YhS5W9CJ67PeCAI=;
	h=From:To:Cc:Subject:Date:From;
	b=oD54nE+MO8FZZBeM2qhzezzombfMcjovY29Zc3E2ooJVEzhWBpC8s4lh9nZ/ekiqP
	 bS2nSMcIyQcJH/1COl9mW9x9XHy0b3+6bT8gzWuK/66SHMrpfKtS38C4ocKyvj0nAx
	 QfPsbtU3+09gHNSzxEzeglfviTLTQ0ULIFQ0+Lhw=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Adrien Thierry <athierry@redhat.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] staging: vchiq_arm: Remove extra struct vchiq_instance declaration
Date: Wed, 21 Dec 2022 13:10:47 +0530
Message-Id: <20221221074047.233473-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Additional declaration of struct vchiq_instance was introduced in the
commit 726e79f8a648 ("staging: vchiq_arm: pass vchiq instance to
service callbacks"). Drop the extra declaration.

Fixes: 726e79f8a648 ("staging: vchiq_arm: pass vchiq instance to service callbacks")
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index 66965da11443..52e106f117da 100644
--- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -78,8 +78,6 @@ struct vchiq_service_params_kernel {
 	short version_min;   /* Update for incompatible changes */
 };
 
-struct vchiq_instance;
-
 extern int vchiq_initialise(struct vchiq_instance **pinstance);
 extern int vchiq_shutdown(struct vchiq_instance *instance);
 extern int vchiq_connect(struct vchiq_instance *instance);
-- 
2.38.1

