Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7C939E166
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939695; cv=none; b=JDEPQZOcGnOdbO12wFECfVy1Did2jVz6kdDSQsEgF96sC/Db6y0nxQVhhNTsunGRC1pwONWuTw+XmQMi/r2vQFH/w8ekuoVd0hbajzPYga08qSpklJPcvwLlbcajlrMp/HP8bvJ2beHNLDzvPhlY2o5a26olGUQUssnvwOWO6x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939695; c=relaxed/simple;
	bh=DxaTw1L6SRcCxnbDF0OySZWkl2cbNdm7lmEmbODYqfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6NPwAx4v9/MET91WAthqM/XWXLDwFF82y3nhEPSadjhezK3yhzyY+DKyYevCoXJ8hIE5XSwxACf1zTbnGb2qMC1V/2ITK8vZfOgBdCNb4Tti5Guxn1L9xND6G4v1FWyy7MFYINqoCYWR6BaPrk7d+HKz0PXBYdlse/79+BualQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J4Pb4lFx; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J4Pb4lFx"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzxWUEoGZ+et+NndGLhVQFCxKWV14debxmMzzTExuxI=;
	b=J4Pb4lFxH3LVVKy7m7LZrQDItIrhI9ujt48+9X44TNn8RTD4QBGDPVAj678b0aoxas+u+1
	5ezbc/4knZcqlJtZcxS8sCjyIZ7GbFSeBHiRS1SGr+5mdDTTAf5cZhmngacCJUsGOraNB4
	5dpl9BwBUSOgOdPcnqfWfyXUGV83178=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 01/21] staging: rtl8723bs: remove unused rtl8192c function declarations
Date: Tue, 24 Feb 2026 14:27:28 +0100
Message-ID: <20260224132748.12336-2-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Remove rtl8192c_translate_rx_signal_stuff() and
rtl8192c_query_rx_desc_status() function declarations from
rtl8192c_recv.h. These functions are declared but never implemented
or used in the 8723bs driver.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index 9664758e21be..ac3e08ad53cd 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -34,8 +34,4 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
 #endif
-- 
2.53.0

