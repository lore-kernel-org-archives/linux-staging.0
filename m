Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7F42BE7DB
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493175; cv=none; b=AhLaju0ShFtC9uev4X7PW0rmaZeVXV3hewLRBxYuTOZh15vUTHNtTJ9K2YCulJhyw4xeHv1gLVe0mKzxEvp2KlCLDU3nQ4633wJ4bcW4nDGpBRoSvDVBlfunbyjxotlIxwIGqDkXazkQdwRIV+0Y/ve8npvAbIvFZhiSm1GAn1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493175; c=relaxed/simple;
	bh=TeYCFJsRCwmNdtC5dl1fr8oY854INDkWFfshcBTClWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SO42VqIKgqoqc6budLHCTODBGT83dp5iw1Bg5kJKOw2NZGKabI/P4iexUrZ+S1QvXSUuwLAyitGsdFUqI4fNEy5uxzxcNI2VROFjKT4CqBWvfeq1/2vxHizvbzoOgLHwX15Brd0Bzk7cY+XqMxd4p9Q5LIHjwcK6CJZFtOyG4M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b=l/msWD7H; arc=none smtp.client-ip=77.75.78.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="l/msWD7H"
Received: from email.seznam.cz
	by smtpc-mxd-5757bcb9c-s9zn4
	(smtpc-mxd-5757bcb9c-s9zn4 [2a02:598:128:8a00::1000:a07])
	id 610474f1d96b597e63faee6d;
	Wed, 03 Jun 2026 15:26:11 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=szn1;
	t=1780493171; bh=13IKAhnpuUy6Lh6IVO6R8GAyRAXG35UBulVX9C5w3hU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=l/msWD7HYMfg36zmoLkHhAPE5DP9rRjd2KH+f1b8wBzrznh02pSpuqbpjPY3UrHHw
	 RMBie+lgs+wzrEygOKey7iaOmDV1HQsKCQx7oLa8nLV9hg2hX1IF0nUINGtmzpmMFq
	 6yQn4z06HgxntPAI4Yu3fzELEvam6PKJM+triE5V7WBE1uRyhF8H9MBM7cXDkPUW93
	 vAtYRrdkHl44d9epf9FghX8vTBdBVDY4MStfldMD9mKmHmOuOMUcJmKXlV3xu6QddS
	 EN98b1GXmG73QVmwqwj7HT0EIcaisHNBUyGKjM+2AWIMr5gPF0yUjHzw8Ai/g+LJZS
	 F0nzsj3ApKZKQ==
Received: from archlinux (ezechiel.sdb.cz [185.100.196.77])
	by smtpd-relay-5698866cf-4zzqs (szn-email-smtpd/2.0.73) with ESMTPA
	id 152c4a36-af35-4b37-8c87-db7ce4b9c1ac;
	Wed, 03 Jun 2026 15:19:53 +0200
From: =?UTF-8?q?Vojt=C4=9Bch=20Kr=C3=A1tk=C3=BD?= <vo.kratky@seznam.cz>
To: gregkh@linuxfoundation.org,
	christian.gromm@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Vojt=C4=9Bch=20Kr=C3=A1tk=C3=BD?= <vo.kratky@seznam.cz>
Subject: [PATCH] staging: most: video: Use min_t() macro for type safety
Date: Wed,  3 Jun 2026 15:19:28 +0200
Message-ID: <20260603131928.44274-1-vo.kratky@seznam.cz>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the open-coded ternary operator matching a minimum calculation
with the standard kernel min_t() macro. Because 'count' is a size_t
and 'rem' is a signed integer, comparing them directly introduces a
signed/unsigned comparison risk. Forcing both to size_t via min_t()
ensures safely typed comparison and fixes a build-time macro assertion.

Signed-off-by: Vojtěch Krátký <vo.kratky@seznam.cz>
---
 drivers/staging/most/video/video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8ccccf..709f61ed0322 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -178,7 +178,7 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 	while (count > 0 && data_ready(mdev)) {
 		struct mbo *const mbo = get_top_mbo(mdev);
 		int const rem = mbo->processed_length - fh->offs;
-		int const cnt = rem < count ? rem : count;
+		int const cnt = min_t(size_t, rem, count);
 
 		if (copy_to_user(buf, mbo->virt_address + fh->offs, cnt)) {
 			v4l2_err(&mdev->v4l2_dev, "read: copy_to_user failed\n");
-- 
2.54.0

