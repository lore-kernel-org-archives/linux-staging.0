Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1F23793A8
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508910; cv=none; b=kLUrhFTaki0CCoFLshb7iqDDngNzMZ/nIoqtVVFlz4bbA1yU7JtYZR7Q21P2O9Evl4o3pWsXf5b+KOMQ4JvnfmOScwHq147TjKceGZ0edgz6eMkkVxXf+1vBJ1IYkeC4FJXiV7MRwmR22kygU3VoE/8YA9dFJ4kWg2PlnZXkmZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508910; c=relaxed/simple;
	bh=yT4hv0raBUjv6lAEEObzu+QtflldmZdO3JERLBCiaZM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XRy02S2/Pf3e4eYWBqgGYqg2mC7iKHNMC1l9DmPBk8o56hicnMbwlezTv/Z8S705k9gSD5cE9bolDYFma1NY1+sQ3+zvdzg7ZCQa9+H+xfUbctRink06gn5OKqWUO4pSUreXgUMxXZSToDKN/l4gwmPYpkOCZaf4ddpL2g6IcnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz; spf=pass smtp.mailfrom=post.cz; dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b=yMVw/LTE; arc=none smtp.client-ip=77.75.76.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=post.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b="yMVw/LTE"
Received: from email.seznam.cz
	by smtpc-mxd-fc6854d64-wssh9
	(smtpc-mxd-fc6854d64-wssh9 [2a02:598:96:8a00::1200:701])
	id 0a8299c8a8a3c39919f894a7;
	Sun, 23 Aug 2026 20:15:03 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=szn1;
	t=1787508903; bh=p44p+3wFj3y0H8LSg0YLSfqEeayBrTa/HtbLimWYV4E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding;
	b=yMVw/LTEmXQTtHz/5EUKAOOnJguexK1mgTL6Fv84Cz/wr5A+kUtJVegX+U61q290B
	 HF9f8iHZqzfu69qkRVwLDwpepHz4Q1IqOoRf/rXPeFvwYPBJ8PBffPo98FTkns5YF7
	 +P5olQjSQDTy8C7JeKD1Ueu+sI5t+zsRU6cNWDQwhNsgZ/gcubVpDDRACiCRELJg7o
	 SmCSBWcONgX5s0CVEX4iO0HetlWA3pPd6U5PrewfkguL2rgLW55gPEYNsOiVTrHfFq
	 bKTAD3BbWetEASR9SYf3HkrOAZlqxTzCsey9ZTMRxFQ865ryMGRz5chV8ap1B7I6Ms
	 oZCWuf3HQMA1Q==
Received: from raspberrypi.tailf05c2d.ts.net ([185.155.34.10])
	by smtpd-relay-86c88674d5-79dbn (szn-email-smtpd/2.0.80) with ESMTPA
	id 149242ff-bbcf-475e-9e11-728be5856f5c;
	Sun, 23 Aug 2026 20:11:51 +0200
From: Matthew <matthew-kernel@post.cz>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Matthew <matthew-kernel@post.cz>
Subject: [PATCH] staging: media: atomisp: remove unnecessary void function return
Date: Sun, 23 Aug 2026 20:11:41 +0200
Message-Id: <20260823181141.265635-1-matthew-kernel@post.cz>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unneeded return statement at the end of a void function
in atomisp_cmd.c. This cleans up the code and fixes a checkpatch.pl
warning: "void function return statements are not generally useful".

Signed-off-by: Matthew <matthew-kernel@post.cz>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..81d0afae8041 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
-- 
2.39.5

