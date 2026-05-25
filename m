Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [178.154.239.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49263D811E
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699726; cv=none; b=TeRnSLkIDjXMOZVpleuPI8EQf4MdxQYHWM0QNWtkjz4pPsNkxUWygZYE5Z5wsJz+3b2CUYrXPFpDO64o4WNTPpvNuKOpUSznhnbwkykeSWZrNAChphsubp/UpnzbLd4yoA78VwCyDC3RXgskigI5fIKyVROq4WzP5OipLJibdj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699726; c=relaxed/simple;
	bh=yKOB/dzLndgyODm8UqOWwVgg0ulYG9g6Fhm8unW8IDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h3XX2E+cby7a5/2DBAyRuHsqPt0rnqMiEIV119Wyu6Uti/xLEV+RxqXgr1WLqURQXcX2p5JQQRdJMj4d7YKHdFw5PW8YfNVMN24vuYmx2oLGb//1FHLWoHG+6tMdUYJvIoEJ27EKuMljRBc8Lrk1qQQyNpPm7LimKeOEhRGX+A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=BLxqhuPw; arc=none smtp.client-ip=178.154.239.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="BLxqhuPw"
Received: from mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1f87:0:640:a06a:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id B6E1CC0226;
	Mon, 25 May 2026 12:01:53 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (smtp) with ESMTPSA id m1TmE1aggiE0-oHPQL3rs;
	Mon, 25 May 2026 12:01:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779699713;
	bh=Sb0SkXaF7JEYRaJoIcO+lgS6TBmrjuI8gls221iU+mk=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=BLxqhuPw0vOSBklngV2QYarJmJicKMjxvUh0rqjJGifRjBidop10PhHJom8++DeXn
	 kQzPqiV2Mv6kIGXmrpW0yNAA9aLiUp3+WE9/71YnxmgLBWZtZ8K1jRbBa0arLNSOjN
	 JpQqD9lRYAQRIF0UV4Wd58z6rvjNqvARzKlgCv3k=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH v3 0/4] staging: sm750fb: various code cleanups
Date: Mon, 25 May 2026 08:58:04 +0000
Message-ID: <20260525085808.171974-1-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series performs several cleanups on the sm750fb staging driver
to improve code readability and remove redundancy.

The changes include:
- Removing a block of commented-out forward declarations.
- Removing redundant variable initializations.
- Removing unused struct fields.
- Deduplicating per-index fbinfo handling in suspend/resume using
  a loop.

No functional changes are intended.

Changes since v2:
- Add braces around the multi-line if (info) body in the
  suspend loop per Dan Carpenter's review.
- Remove a stray blank line left behind in lynxfb_resume()
  after the dedup.
  Link: <https://lore.kernel.org/linux-staging/ahQB8C1gTr7LF0FO@stanley.mountain/>

Changes since v1:
- Dropped "staging: sm750fb: use ARRAY_SIZE macro in fb_find_mode
  loop" per Dan Carpenter's review.
  Link: <https://lore.kernel.org/linux-staging/ahF8dacOkX0tdxGf@stanley.mountain/>

v2: <https://lore.kernel.org/linux-staging/20260523153459.177488-1-ahmet@sezginduran.net/>
v1: <https://lore.kernel.org/linux-staging/20260512164124.188210-1-ahmet@sezginduran.net/>

Ahmet Sezgin Duran (4):
  staging: sm750fb: remove commented-out forward declarations
  staging: sm750fb: remove unnecessary initializations
  staging: sm750fb: remove unused struct fields
  staging: sm750fb: deduplicate fbinfo loop in suspend/resume

 drivers/staging/sm750fb/sm750.c | 47 ++++++++++-----------------------
 drivers/staging/sm750fb/sm750.h |  3 ---
 2 files changed, 14 insertions(+), 36 deletions(-)

-- 
2.54.0

