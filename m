Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11FA429CCE
	for <linux-staging@lists.linux.dev>; Mon, 24 Aug 2026 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579168; cv=none; b=c8pJk9aYG52168I/pjJyNN970jHhwgzFZMUau1Bm1Ec2EBf5PTz9SldUBDju0Tvzf40qgx1BerLpMHIeizPW44dkM2fGT2kNbLxBKzz+C1adxn6zKjAnEKDYJuEuKdNVFP6sv+yGgyNKJV/HbENVxkLuoL+fF4aNlDv/it+FIVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579168; c=relaxed/simple;
	bh=RRf1kpS+HYu095aWYVJLj7vLW/tCFRVRUVVgldeGmyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lYN+aIjWYqQeEMpHPJHiHGnpsnETDvohCcr4YvSRrtEJE7Xmfqvq4A6S01LDAP5aft1+PCCsLCVNXkQQFdzP0D0QPIpnlqAPY76wS/yh+7pWGcigPxxJIl2ZneSsJ5Ln5spH3GzeLXy/WMn36SDbgb8XhUHG6xGcQZ0j/h59hkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz; spf=pass smtp.mailfrom=post.cz; dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b=vSgae4pF; arc=none smtp.client-ip=77.75.76.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=post.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b="vSgae4pF"
Received: from email.seznam.cz
	by smtpc-mxd-fc6854d64-wssh9
	(smtpc-mxd-fc6854d64-wssh9 [2a02:598:96:8a00::1200:701])
	id 7addec07d8fcb65669a7e168;
	Mon, 24 Aug 2026 15:45:54 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=szn1;
	t=1787579154; bh=2q1Vzl6NudYGyhDNIyN1wV9JtRWeXY1lb0L4efFYQbk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding;
	b=vSgae4pFUQQkEkP8BrTCUM+ZOPBWKJ2623JhPqlWDAyb6v42F2bjJDGKtFBG0+rrb
	 yklKwMB5Q3/33ZsSzWLdwsQ7zcLX9CFH76O+wGywLRuGEA+WMWCxw0Ig1HjLyv0Z3t
	 t69wSeBHJ2HTCSo2EJBDdz3sTMuA4zprQewnmR5rH2qtD7NnQztrx9s8PyeYnYvMy4
	 uDfJKLjcToi4dldLQPXl8h8UdxfO90rd2W4i4XOnt/S1s64NxocC5GiaSI2FiCLGCk
	 M4fhsyKw3gXLDnkT9O4MFGAsABrR+8bT7kn63I3Zqgo6VR+OTH4EvXaiU4PDtC7T17
	 3HVbW00NORlgA==
Received: from raspberrypi.tailf05c2d.ts.net ([185.155.34.10])
	by smtpd-relay-86c88674d5-v9m66 (szn-email-smtpd/2.0.80) with ESMTPA
	id ce916720-b83a-464f-a60a-6c20e3c1b4ba;
	Mon, 24 Aug 2026 15:45:36 +0200
From: Matthew Zvolsky <matthew-kernel@post.cz>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Matthew Zvolsky <matthew-kernel@post.cz>
Subject: [PATCH v2] staging: media: atomisp: remove unnecessary void function return
Date: Mon, 24 Aug 2026 15:45:25 +0200
Message-Id: <20260824134525.11509-1-matthew-kernel@post.cz>
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

