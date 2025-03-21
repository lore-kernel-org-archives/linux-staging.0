Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CC41EA65
	for <linux-staging@lists.linux.dev>; Fri, 21 Mar 2025 01:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742519230; cv=none; b=sM3mTsRR5uQR95kcePo4BSUMRQrovJcbU4qF66JVz/RD3To3Uiyknvk9i2fEdqoXvWE+3icuYkQs0yd9u4zAX0eHTrv9QRU0wx7uoZqzLWfSryz6bin7wxdGUvPC77gWGUEZr0Gs10YU0za0BAP9KOLIdd1X6XDj4HDWP48KJBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742519230; c=relaxed/simple;
	bh=LzjLWtNm8vIx5m/jeMY8e5F6Ay/oAnGOKZbPpKEEA3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QrE4slp++pMoC/swnmTedQZur0JJtDfGf1zvyjOgtOrb6j5FsFc9DIrmOay/0Kdiym4GD1PyXRIxbZnCOp+WWhvzp0ZWiBnPaDT2wSPqkEOju7hTbg+2Rqc1m0BhF63L6GQ4eJ7tozhxSETXgQ8RCO/VCm/6QXnLlyJn05iJ30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iEZbggtj; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iEZbggtj"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742519223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WVZwF7aFIAedNImI3f0zkPZlr8EcTIXGZ6tIWmPnltQ=;
	b=iEZbggtjtl+3K2e42DqCYGW/GyIiFB1eviHiXmcOHdNnHVTGsDtK+ncpP/pFdql+jbPV8j
	ZsulXdX62DHD/FDquYJyo9HMLNiyTvNmOREV+V9BjTAVFcabrKPveVmxgEo28V9zCZUn2f
	UCoE9Gfir6xkq2NfyCMnhBJeN4WSEOQ=
From: sunliming@linux.dev
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	everestkc@everestkc.com.np,
	niharchaithanya@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: sunliming <sunliming@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] staging: gpib: warning: variable 'nec_priv' set but not used warning
Date: Fri, 21 Mar 2025 09:06:49 +0800
Message-Id: <20250321010649.10918-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: sunliming <sunliming@kylinos.cn>

Fix below kernel warning:
drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable 'nec_priv' set but not
used [-Wunused-but-set-variable]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 0304c5de4ccd..6854a745ccff 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -194,10 +194,8 @@ static int fluke_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bsr_bits;
 	struct fluke_priv *e_priv;
-	struct nec7210_priv *nec_priv;
 
 	e_priv = board->private_data;
-	nec_priv = &e_priv->nec7210_priv;
 
 	bsr_bits = fluke_paged_read_byte(e_priv, BUS_STATUS, BUS_STATUS_PAGE);
 
-- 
2.25.1

