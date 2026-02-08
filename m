Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BCA314D2A
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548502; cv=none; b=PMCu5De5jZ88lAwWbGskLmlV6KIP8+cSmTgZ4FDG9WigZh55QZ97fEZiKyl7xTAMCpfFpbcYHPMvaI/8F5zmzvjyMtmBW9fPCXFVYdIyqon+x+T1EHri4sl5gcXJsKfZ5Rd9EXl0Hm+4Q8N+yyXD+cJV4yAQ2TuVurmLQKwndBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548502; c=relaxed/simple;
	bh=JzfHCigjpzhEue6O6oT7OKneCtBT0tnEIAdpzv2yHCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AuA0sr7QfvnlftsWEMmBbqRtI8x4U05gXuaNNClZdseK0PWum1l44YhYIjN+/AcsPPeHZcDD+1UUhuFk/Zmn8tdrhuHaDseAm+zhTy7PkfWQL+6mzJ4zeV3DxYZ8KSSck/gJjhXnvgW8j8cmEsmsRJo0C3hgHP+cl60+S2tcpbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cGD/hT5J; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cGD/hT5J"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VEF6A5x5ITOe5grXU3RbVa9iRhWD1z/UXHo6Z9gGSEw=;
	b=cGD/hT5Jlp3KwEq1/ZILrLBmlqH1G8VdRemAvgmYf4xYR8DIR6qztv3Oezo8YeFiiT37ZV
	lvlLbFf1aRU2lX9MTwDZnRu86rjGs3ys5Dg/IAgzlGdqvpRwUBM/dl5rhXQ0vTtkbtxHtR
	8rMqQGj/ySyWRK/yjmiM0sGiKNwDykg=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 02/22] staging: rtl8723bs: remove unused rtl8192c function declarations
Date: Sun,  8 Feb 2026 12:00:51 +0100
Message-ID: <20260208110111.46642-3-luka.gejak@linux.dev>
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
2.52.0

