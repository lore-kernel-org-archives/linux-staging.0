Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6444DA09
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908721; cv=none; b=aU2CdA+nhKtEPZEkjrdZg303L8Kz2pxSVy9pyWXYPenVUeFG2LRm2iLPaSFNC+QYQFipgDS+qoGyb7qxqn2zWZqxgKBDRRXWTZIdi1dcK1bYesXK154qY9R6y26ApM54B5MYQYCoecvh6om7Ds0IKZc82xv8hpnDvDzjZDVT80Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908721; c=relaxed/simple;
	bh=bYfYhFrkojMCXm2VszrqhvT7g+UJF9wLuDkxq6/qUvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WP6qNh+TbiutdunmFaGiuYjXb/4CfdCuXqyNJMTI4ITg+ILRqm4IykkL9yVrjusKOgow07auz0cR0uzcptqReJf6vrauZ75f0TeS8vkB0RaxxAKuiHmUahGvykYxGy7BTcAPRyfRt0PBR+Zx9qsFBoX1bl77m2DtuNrBiW4ObIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mqpoN/rL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mqpoN/rL"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D61ABA68;
	Fri, 12 Apr 2024 09:57:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908676;
	bh=bYfYhFrkojMCXm2VszrqhvT7g+UJF9wLuDkxq6/qUvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mqpoN/rLrLm36rnIGTvl/h3Jr/2MFfYQofJURmctnnK0bknCl1UNs3ePVzpqpT+j2
	 VspM27zA0QuHUTT5Bex+oyinGxUcy7Vxztexl7rpK80RxJPhzYp1dk7PHfdMMpFb5E
	 VuKIUvljhR1nVXh50xu0PkcnNzifTd8ZYqwyux6k=
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
Subject: [PATCH v5 11/11] staging: vc04_services: Drop completed TODO item
Date: Fri, 12 Apr 2024 13:27:43 +0530
Message-ID: <20240412075743.60712-12-umang.jain@ideasonboard.com>
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

The memory barrier comments are added in
commit f6c99d86246a ("staging: vchiq_arm: Add missing memory barrier comments")

Drop the respective item from the TODO list.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 15f12b8f213e..05f129c0c254 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -28,13 +28,6 @@ variables avoided.
 A short top-down description of this driver's architecture (function of
 kthreads, userspace, limitations) could be very helpful for reviewers.
 
-* Review and comment memory barriers
-
-There is a heavy use of memory barriers in this driver, it would be very
-beneficial to go over all of them and, if correct, comment on their merits.
-Extra points to whomever confidently reviews the remote_event_*() family of
-functions.
-
 * Reformat core code with more sane indentations
 
 The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
-- 
2.44.0

