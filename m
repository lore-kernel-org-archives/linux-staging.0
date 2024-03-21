Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7AD14284
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711017505; cv=none; b=f9+4EfsccvuCk/PcTtcWePx9k+pOjCXVEqJuNAjoZyzU/H2BU3uapEXpARWq6sarJnOSF0kpu+grPEj/UIZObX/y3TtUDhV/cR1agWDS90JHZI3YgyQyKkCJYJgZnewiWUijBwBVdHe8RBpeWEsq9W3n16ve6rdnBqBxs35MAI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711017505; c=relaxed/simple;
	bh=+zDj3+KqKnCAebLURtp4uIsNRia3Hsd2DOgOrLM3+PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dR64Z6hNiBKuQ1ulw8Kb70Bt/OS9O5XsXZEPhg/xayMV8jcEULKgL18jSb3Ikx+7lGnHCvM/rU4xgHZtTCSPDWQcnqotNazSeFFXOgXhxe5hQWJIG9kLfqw/pFYdtZiCqJ7H/UyWCfY68GShZzL08UTi+pyRVZFfc6DwxeCUQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=frUL5jCi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="frUL5jCi"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E04B8CC;
	Thu, 21 Mar 2024 11:37:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711017475;
	bh=+zDj3+KqKnCAebLURtp4uIsNRia3Hsd2DOgOrLM3+PE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=frUL5jCiJvs2rDFwLVU1LuRYoZcd8WZXwjs4Xo6IVKPIt1VW+/AZLnZ8aXXkgBP6X
	 ZGVtMaYRP1qFpvZwq43xTsGW+4gi5naGxS9izVnbDY3NxXy7G3gXUJ4di+pdH+JKuv
	 brh2GjtRvjqoAce1q8PAXQlaXyn/wPKuxPAbbNGA=
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
Subject: [PATCH v3 6/6] staging: vc04_services: Drop completed TODO item
Date: Thu, 21 Mar 2024 16:07:40 +0530
Message-ID: <20240321103740.808561-7-umang.jain@ideasonboard.com>
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

The memory barrier comments are added in
commit f6c99d86246a ("staging: vchiq_arm: Add missing memory barrier comments")

Drop the respective item from the TODO list.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
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

