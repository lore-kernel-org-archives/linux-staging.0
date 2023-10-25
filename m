Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA76266CA
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C9wXwlGe"
Received: from umang.jain (unknown [103.251.226.9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8B8EBEB;
	Wed, 25 Oct 2023 12:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698229977;
	bh=zchdBfdBSrxs9LBFtwEEnlIYbRTUEnSVxqasOdMq3QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C9wXwlGef6XedHa73XKEI0mbVoYn4ZW/8JcJAmPSrtHUOsoa68WJMPuFLdgq1eVxz
	 po1he65cdSDPu3dy70Q9Er7FAcpie3Fb0yqbi2dUtqFQ+fUi/fWD12skxq91Belxz5
	 qp0cVhgQcb6QEJTE8wvrDX/Qd0QH3JnKm+0qw32I=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/2] staging: vc04_services: Drop completed TODO item
Date: Wed, 25 Oct 2023 06:32:59 -0400
Message-ID: <20231025103300.340572-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025103300.340572-1-umang.jain@ideasonboard.com>
References: <20231025103300.340572-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the TODO item which deals with non-essential global
structures and per-device structure. All this has been
handled now through vchiq-bus and struct vchiq_device.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 6d9d4a800aa7..9c79ed549831 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -46,14 +46,6 @@ The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
 indentation deep making it very unpleasant to read. This is specially relevant
 in the character driver ioctl code and in the core thread functions.
 
-* Get rid of all non essential global structures and create a proper per
-device structure
-
-The first thing one generally sees in a probe function is a memory allocation
-for all the device specific data. This structure is then passed all over the
-driver. This is good practice since it makes the driver work regardless of the
-number of devices probed.
-
 * Clean up Sparse warnings from __user annotations. See
 vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
 is never disclosed to userspace.
-- 
2.41.0

