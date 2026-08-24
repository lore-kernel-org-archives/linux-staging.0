Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930EF4302FC
	for <linux-staging@lists.linux.dev>; Mon, 24 Aug 2026 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580304; cv=none; b=ELc6R/sh3yjWuzZlxcOP+nJGCc75sdDz/BD9QO1mlFh5GGAYnImWJMX0uL9gKoK3VgMB6046CEpWL2h77CW76vkFihnoJls1X4dnPUqOMoZeb+WNQQpfLfAw6VPt5HVAqz7cNZGaizTl1+JSX9ECvmcekM59k61AUvROFs8yB0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580304; c=relaxed/simple;
	bh=i0CgCXqu33TmRa2bbFb1zGywoIksjg7kwqufczincbg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oFyCecXzgRiY0O4AMTqRU2myHmNuo86qEwyeyolwfxww96X3N7q0OLghZF1LsLLtGNawZ4ZZcLslMEFUAx1ZQP9gC+ubBcmjVp+H+IfwWPM6eXDbgQfz+Iw+hSv4UTWBSFYRKw1hI03oJx6RG0PQAfCQCeEBOCj5ylY1wqDlwUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz; spf=pass smtp.mailfrom=post.cz; dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b=N9az7CAU; arc=none smtp.client-ip=77.75.76.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=post.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b="N9az7CAU"
Received: from email.seznam.cz
	by smtpc-mxd-fc6854d64-wssh9
	(smtpc-mxd-fc6854d64-wssh9 [2a02:598:96:8a00::1200:701])
	id 5ed62db9fcf777e84dac20d6;
	Mon, 24 Aug 2026 16:04:54 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=szn1;
	t=1787580294; bh=8OatC7/MgoGyXPrU57uKzaVG6jKfmnzK5h4DJItZMsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding;
	b=N9az7CAU/Aj/hDeBzUFxg72pbY+ykQ7VA/ruRZ2+1VIT/7shwNkb2o82PrSQkCZbe
	 f8koN0OYawcC5f/eSTE6zNnQC7jJ0mWhqsyZNhtjmr18jp8cKrJvhjuX3pFa6/PZJI
	 A2wT/OmHUvX6ELtdXHYmALBBFTWwzbx6E72ouAYRN8KXpHvifjoZ08mIekoBKV9cpg
	 KysP12vgjzYVmfUXxI+HTeISrxtQAwilTYTgY83VIl0ZH9yR4l1Uozz0XlyGjO4dgf
	 In/8FIVeaKA9siWi1RiTbp+QFgUEZDd8BnmkUs9FTIG8muAUM1k5uHhChyI6tE9+mh
	 IXZYivEchiDOw==
Received: from raspberrypi.tailf05c2d.ts.net ([185.155.34.10])
	by smtpd-relay-86c88674d5-sfjfn (szn-email-smtpd/2.0.80) with ESMTPA
	id 527a0abf-1a69-4afe-b175-264f009bf8c1;
	Mon, 24 Aug 2026 16:04:07 +0200
From: Matthew Zvolsky <matthew-kernel@post.cz>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Matthew Zvolsky <matthew-kernel@post.cz>
Subject: [PATCH v3] staging: media: atomisp: remove unnecessary void function return
Date: Mon, 24 Aug 2026 16:03:58 +0200
Message-Id: <20260824140358.22379-1-matthew-kernel@post.cz>
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

Signed-off-by: Matthew Zvolsky <matthew-kernel@post.cz>
---
Changes in v3:
- No code changes, just resubmitting under v3 prefix to ensure proper delivery.

Changes in v2:
- Fixed author name and Signed-off-by identity to use real full name.
- Removed duplicate Signed-off-by tags from previous local attempts.

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

