Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A201266D5
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DOn2lz3W"
Received: from umang.jain (unknown [103.251.226.9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19FF5EF2;
	Wed, 25 Oct 2023 12:32:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698229980;
	bh=lN/b6aBQlp0QJ2/bKG+wfQaYXsqIJPtPWZLmBnXQuiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DOn2lz3WYp55/+mOCeR5fxgCT8m4Wo34DWUe5MsErrp552yrvALfsTb82mD826qmy
	 QbaD3Vn+Kq9hAZdH0urr6LRzGFYF25nDWkKEGiSBdJbCQpawJILIPTqmbkGypLzCOq
	 GldqMDWPDOH4IOV3vsZ2PegQBTkigPHW4Me/Xw2A=
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
Subject: [PATCH 2/2] staging: vc04_services: Drop completed TODO item
Date: Wed, 25 Oct 2023 06:33:00 -0400
Message-ID: <20231025103300.340572-3-umang.jain@ideasonboard.com>
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

Memory barries and remote_event_*() are documented.
Drop the TODO item related to them.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 9c79ed549831..2d51f6928e0f 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -33,13 +33,6 @@ such as dev_info, dev_dbg, and friends.
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
2.41.0

