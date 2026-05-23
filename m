Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FCE28DB54
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779550512; cv=none; b=OMceA0DSsxZd4Xj4yVU+SMlVvA3dq/7LoiK9C2GK5uFIi/jipt6EvgIPhOVIqN91zndbqC7EHqsS2LEvppzyRHpUnsb6bmFnoVYyZqMcDI7/JSkSE4rSs2GrHJLwi875JePy/r30jM8aD8B/TE8chwrqTXGqSeiojJEAh4ZnqMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779550512; c=relaxed/simple;
	bh=CwJNNCBsvJNFzSCWApDVhdbSadDMkPDrMPTtsIRi4i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHKWb2eBvXreGSxoJHtfLfr2eitJz27y/iZEgfOtK9l+bWh3jyhnD1weD523ol6Nubsd0Zdlu1pHNTG5AiosWkZCEcuy76NpZ64dx1hoFmcWRutqDDGmU61pjqT9Rp/7SOH20Wt7QvAbYYnhU7UC21yduYcV0KEW9keh39ISJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=HSzscF/H; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="HSzscF/H"
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:eaca:0:640:4fc0:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id E39CCC0083;
	Sat, 23 May 2026 18:35:07 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (smtp) with ESMTPSA id 1ZXKP9PgKKo0-sqI2a4YP;
	Sat, 23 May 2026 18:35:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779550507;
	bh=k4QiqVG9fkZCj6ihyj9tY2eiqlAdY8Oop4Qjl04unIk=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=HSzscF/HASa+8xgLFBz572RWIjS5b2dcfKnp6HIPqrENLFQ6yEsfAGbdjiAGNHXnV
	 sTXrx4HdizSE51j2v+Mh6Yu39UJVtq0eWv9ldj06+ks8NVaHa8Fa5U1aongllXfpg9
	 AAPGzjlXShEQ5w2PLrkY7x1mBtkdq4X+OUGOId9g=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH v2 2/4] staging: sm750fb: remove unnecessary initializations
Date: Sat, 23 May 2026 15:34:57 +0000
Message-ID: <20260523153459.177488-3-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523153459.177488-1-ahmet@sezginduran.net>
References: <20260523153459.177488-1-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove two instances of `ret = 0` initializations since the
variable is overridden unconditionally before being used.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
v2: No changes.

 drivers/staging/sm750fb/sm750.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 02db1418476b..fff9c35ee7b0 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -343,7 +343,6 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 	if (!info)
 		return -EINVAL;
 
-	ret = 0;
 	par = info->par;
 	crtc = &par->crtc;
 	output = &par->output;
@@ -463,7 +462,6 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 	if (!var->pixclock)
 		return -EINVAL;
 
-	ret = 0;
 	par = info->par;
 	crtc = &par->crtc;
 
-- 
2.53.0

