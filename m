Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C170346E78
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548503; cv=none; b=BCWF0b7gmhVHB47+npZrzieroJyTVPWBWFfBX3y2+uUsl0gp+TpF4s/JnVL332FRaWN0uPXY4B9fatxSWDEZXpFFuX5Z4wIHnaNM9kE6jiXpO5byhsnifj64Vku4xp3kaGzAOpOnxbj8g6qmNdSa6bFe8Qr/T958n92ncvGKBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548503; c=relaxed/simple;
	bh=0JLvMly40iAA5ZpGnc5+tpY9B6nciRVswuTi5BWfxXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peSpF5EyVnqQ/bH0+r4yhECCyRMEaymXrBD3ukTbbdpBu5+/iKdn3Cuy03EOwSKSVXVh95eaemS/VbgSJ2oplWa0FgXVzqRAFvJvp2yPWGBI/paFlfWFKG0hUh/R6BxhKLO9g2f30lRYBQP1F+iqhK3g3i1mj8lb+jqv277vsZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U1Lg6O8V; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U1Lg6O8V"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCPSZS3n83hjOtMjXj5lQIhDzlwdrXLIQ1D5go3k7tk=;
	b=U1Lg6O8V+zTMVKQiuFLoiy5voKg1bpr7Gk+OcOej5mh53GynFWjtXYKHW93y3/USD1JS7r
	3TmevHNTdorPDiMahDdQKYDeQawP04kIaq3tbFixx5ZepCIaeCGH/CnQst5Q6mdM4qZRRb
	LWOrS6CdDCRsjmr0zufcDgzZdzwC2X8=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 04/22] staging: rtl8723bs: remove unused MAX_PATH_NUM defines
Date: Sun,  8 Feb 2026 12:00:53 +0100
Message-ID: <20260208110111.46642-5-luka.gejak@linux.dev>
In-Reply-To: <20260208110111.46642-1-luka.gejak@linux.dev>
References: <20260208110111.46642-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Remove unused MAX_PATH_NUM_* definitions for other chips (92CS, 8188E,
8192E, 8812A, 8821A, 8814A, 8822B) from odm.h. Only MAX_PATH_NUM_8723B
is actually used by the driver.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/hal/odm.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 1c929d88e596..38830552d5bc 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -202,14 +202,7 @@ struct odm_rate_adaptive {
 /*  */
 /*  Declare for common info */
 /*  */
-#define MAX_PATH_NUM_92CS		2
-#define MAX_PATH_NUM_8188E		1
-#define MAX_PATH_NUM_8192E		2
 #define MAX_PATH_NUM_8723B		1
-#define MAX_PATH_NUM_8812A		2
-#define MAX_PATH_NUM_8821A		1
-#define MAX_PATH_NUM_8814A		4
-#define MAX_PATH_NUM_8822B		2
 
 #define IQK_THRESHOLD			8
 #define DPK_THRESHOLD			4
-- 
2.52.0

