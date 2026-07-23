Received: from mail-108-mta126.mxroute.com (mail-108-mta126.mxroute.com [136.175.108.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2C7330B3F
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 21:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842887; cv=none; b=ojwKKdpcD/54TK5RT0Xr1BC98vEzF2NEaAphGTrX4xN/nrKWOZd9vGFnZzisllwgL2CyEzhU7MKLnZOsXnClU/iS8IYj4XUKw336tR9t9nHNGLR2UYzqKvfhUAcIhg310mKenPoZy60tBqGYwwForFegY7eEdeDcxkc4qAJ18V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842887; c=relaxed/simple;
	bh=l43o63ocrDEQmekkGB+Uzx12bKy3hnOpS+wIZtBecgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bg8FRQwsq6nPFvPpc4ER6ZpGLUPxNOncPsJmj0HAenM7ksv4ULfIsT+uaYXdMbsRIPi73wYG7mbC5q5/Bgv20hZg7fC06BYeyRpE4e0D6QRYIMxrYhXD14larnfWTdBIVwO/M7YXKiNz8W0cmKezulDcnleE6mSxX8AHEp2WLDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=diersmann.eu; spf=pass smtp.mailfrom=diersmann.eu; dkim=pass (2048-bit key) header.d=diersmann.eu header.i=@diersmann.eu header.b=rayfF4ol; arc=none smtp.client-ip=136.175.108.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=diersmann.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diersmann.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=diersmann.eu header.i=@diersmann.eu header.b="rayfF4ol"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta126.mxroute.com (ZoneMTA) with ESMTPSA id 19f90e851cc000c8ef.002
 for <linux-staging@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Jul 2026 21:36:12 +0000
X-Zone-Loop: dde81e24656a979022de2c2d4c111af774beb857b41d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=diersmann.eu; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date
	:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HsqD+S3VoBI6FVkr5xsUc9+kfXLim7edb3fjpES8MgE=; b=rayfF4oltred/cWFyoG8cNR/Zi
	RNyta71i7SdgnMNxL/fW+QTQLKDdKwReIYTAjIpKhssQKpkNLsP2ONKfLws2NaiPljxAh7PonpInr
	wKDaBGluMOn2DPRGCSjG1slr7w4ssIgeiPvMQmPJw5JLqAomgGGiBTReDqbN8EpxRZLIVumvyf05b
	pLX2FLpBc/Be9lXHnx8E5T/EeD7rxKGCe5agDZxla6yuUk+TdhJKZteI6XyrTTU11Tw8ZX8M0spSH
	HqzszqmRzM/k9Sll6a5fLxbCnx5N8zyQAsUyGpmULNXxZCdOKtud9Sl6Zov5gu1OMBlNeX+APOawG
	WS9vyeMw==;
From: Gerrit Diersmann <gerrit@diersmann.eu>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gerrit Diersmann <gerrit@diersmann.eu>
Subject: [PATCH] staging: most: video: remove unnecessary blank line before closing brace
Date: Thu, 23 Jul 2026 23:35:22 +0200
Message-ID: <20260723213522.86962-1-gerrit@diersmann.eu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: gerrit@diersmann.eu

Signed-off-by: Gerrit Diersmann <gerrit@diersmann.eu>
---
 drivers/staging/most/video/video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 78234620d..5c34f93a0 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -439,7 +439,6 @@ static int comp_register_videodev(struct most_video_dev *mdev)
 	mdev->vdev->release = video_device_release;
 
 	return 0;
-
 }
 
 static void comp_unregister_videodev(struct most_video_dev *mdev)
-- 
2.55.0

