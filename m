Received: from forward201b.mail.yandex.net (forward201b.mail.yandex.net [178.154.239.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189543D522C
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775672363; cv=none; b=aiKd+gfWqMDxlwCtXaryTKBj2ezENR183r50F4oyMnlB1iEExHiZ1s0Dn4VZxJTtd6XqEDU6Adjcmc7KZjGfzGZpvi5k5tEnsSPIqkcDDa24J02Jmro5skp91Im3XCWkCOE6ab21lqFO3Tmd8kOLM1xQukr0tZOWRMoOYKRNAi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775672363; c=relaxed/simple;
	bh=zHWLD39elmtHFk9gL4/4AetyT3SYH3uI4+IBxhcZyQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aRCiZRj9Qve54L/vLL3AzUYBAebQdfKE912+fh9vmVyKt3B9BYR5kBktGftNGru3kzLiYxengmycl5Ru/iAyzRhk47eEET2CtF6Wm9JhVJl6plcwjzIdXplB98+jcUS7nZDCrDofXtU6NocEacaXm8sx0U58rISZjZumAO9sozs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=FAfSCgNO; arc=none smtp.client-ip=178.154.239.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="FAfSCgNO"
Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d101])
	by forward201b.mail.yandex.net (Yandex) with ESMTPS id AB2BAC81E0
	for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 21:12:23 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:1698:0:640:befc:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id 7A473C0079;
	Wed, 08 Apr 2026 21:12:16 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id CCKZw22Qva60-LraX5ZzU;
	Wed, 08 Apr 2026 21:12:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1775671936;
	bh=ycIonyznxkel0YAIXtSeuuYxqbfKaxXwk7TWnKFZwuY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=FAfSCgNOfaSkSNosqhw9wmS0Wiyi+Cvd4fVTHKZUKUNRdFoP7msMQNGa+89kAy5LY
	 kNxHDKz50+FYsDvC6qIPCI75MYM4eCH7iqngEFeV2dME6KOMntY4NfVArn6qw3aCZw
	 S624ioOhxu2LyGNbKpun87DxCOc4k+uiKDiCnmyk=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH] staging: sm750fb: fix off-by-one in lynxfb_ops_setcolreg
Date: Wed,  8 Apr 2026 18:12:10 +0000
Message-ID: <20260408181210.9672-1-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bounds check used regno > 256 instead of regno >= 256,
allowing regno == 256. Valid indices are 0–255, resulting
in an out-of-bounds write.

Also remove the regno < 256 check in the truecolor path,
as it is always true with the corrected guard.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e82a..ea077c7c89cd 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -531,7 +531,7 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 	var = &info->var;
 	ret = 0;
 
-	if (regno > 256) {
+	if (regno >= 256) {
 		dev_err(info->device, "regno = %d\n", regno);
 		return -EINVAL;
 	}
@@ -553,7 +553,7 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 		goto exit;
 	}
 
-	if (info->fix.visual == FB_VISUAL_TRUECOLOR && regno < 256) {
+	if (info->fix.visual == FB_VISUAL_TRUECOLOR) {
 		u32 val;
 
 		if (var->bits_per_pixel == 16 ||
-- 
2.53.0

