Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358776BFB5
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710410804; cv=none; b=u8aKuHuY7E9wQXuTVhAo/EpVo50KmX9TzUVKbrkrK3yi/FilgddVBEpDyyfDDd2/OsOjQgc/6JA6DXQxqBA93s9GdXTsUjIT+f/8Thh/C0FzdoaQWDkHztgIrSsjWy5OwpBJHc31Yp9F5v2aZNHN5KN/QWSClvbZZP8DEInkC+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710410804; c=relaxed/simple;
	bh=zdanYWThrvEP2nwJ7UBzymrzm9sKsa2Ow9T9TKiegjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbZ73IWHi3UyJW2d7Y0j0TdZl0uD1sSPKP0veSE1ALR8pW/tQCYw+U9Z0CPx+bC22EIbjw4bzQO+J3GJK1jEJR+WbJfJaGYA9YhKc6Kq3MnnYhZZeTgyW+UGYl5/juGQnnF8TorFayYf6lGWZWiSfJW3x8qxts/bAQxu0KSNTFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WN8AqonN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WN8AqonN"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AADCA6BE;
	Thu, 14 Mar 2024 11:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710410778;
	bh=zdanYWThrvEP2nwJ7UBzymrzm9sKsa2Ow9T9TKiegjU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WN8AqonNg4LepVFBgjJay6N+oEVXA1gW5H3vlTPv4IdIwEn7Xunk1H+bbAhJ0pIF5
	 NVQCUZUzxPAomWD+4JChUBfR2QRC2MbuzdDBfo8Xvs0Mi/F/gqhwuwIiD2EZFV6HcM
	 DvQe90jUGx9qo5M6DvHcH3EnPaJipHjeux/6vzv0=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 6/6] staging: vc04_services: Drop completed TODO item
Date: Thu, 14 Mar 2024 15:36:07 +0530
Message-ID: <20240314100607.336009-7-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240314100607.336009-1-umang.jain@ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
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
2.43.0

