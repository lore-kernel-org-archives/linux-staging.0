Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525F0328AF
	for <linux-staging@lists.linux.dev>; Thu,  7 Dec 2023 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CoRiCgCA"
Received: from umang.jain (unknown [103.251.226.79])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 171C9669;
	Thu,  7 Dec 2023 09:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701938287;
	bh=D3D1TD9ac0JkckHnvb2sD5MkPEbDyC1GqVp0zg7uxc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CoRiCgCAt3YVtv6/QNL1wTa+oIeCikbKPq8LhTP3nuVaJh4sxkl+yRz3V+UvZMm+Q
	 2/Pw4JHvqHWc4mpd0wO8y0miXRKf7/8YmifYKjhmPmw8/0o9JuOFLyuhmTE3Fo/nZq
	 F9GOiK4231mO9wgV0TAvNo4koBfg9rj1E/qyXiUk=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 2/2] staging: vc04_services: vchiq_dev: Use %p to log pointer address
Date: Thu,  7 Dec 2023 14:08:37 +0530
Message-ID: <20231207083837.153843-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231207083837.153843-1-umang.jain@ideasonboard.com>
References: <20231207083837.153843-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Solves the following Smatch warnings:
vchiq_release() warn: argument 7 to %lx specifier is cast from pointer

%p will print the hashed pointer to dynamic debug.
In order to print the unmodified pointer address, one can use the
`no_hash_pointers` via kernel parameters.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 68c8897c504c..4d9deeeb637a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -1201,7 +1201,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 	int ret = 0;
 	int i;
 
-	dev_dbg(state->dev, "arm: instance=%lx\n", (unsigned long)instance);
+	dev_dbg(state->dev, "arm: instance=%p\n", instance);
 
 	if (!state) {
 		ret = -EPERM;
-- 
2.41.0

