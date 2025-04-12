Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F0784037
	for <linux-staging@lists.linux.dev>; Sat, 12 Apr 2025 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744440218; cv=none; b=YgyEmcAx55ft+RvbYByX1NOVBHaVRAuqyhGvgD6onFneg2HPQkCHfJ5GwXXfUV/6ugKNtfVCVCb/DKW4yYwLoxKESDE203YN1jrQEfHTjZc3PCFqo9YnM6Uvc0jqJ3DPShYbIWLofQyIIEef1geOMVuX40ub/RbIKifhTxxiJhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744440218; c=relaxed/simple;
	bh=Pbg91NGVaIppdXiCQrAk27vgVtrjkiG606Woz1tENV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKK/uprgddav2ZIevIZAbG53Np+NazyimQfo48g01nXNx0E9L5fxyhT0PQC4aPWURjw7liEJlgLghlx1VPF0Kcyjp6hqJP899s30mPSbayieVvjhLAkVl3Q13uAWIC75RAo+1px/eyPbpP3bfaChtP7Ch2ZAKDGcztgI5DSds60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=X0xjjADn; arc=none smtp.client-ip=193.252.22.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="X0xjjADn"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UYwuQskrdrQ13UZ1u9Tdl; Sat, 12 Apr 2025 08:42:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744440125;
	bh=qmcOzlOI/g3RKdkTnvlzTmINQekNCm3D9C0EIorAHIE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=X0xjjADn1UsDPY3SskDqS30cuzEVbuKLhE22gn35wZGqrxLC09dIwQB5jPX3G0SF/
	 TIR9evw4kBke0nsyqQeQyaSAZEiyWb9J1QtRX50f7c22NyEgTNiQzAvjTWpHPhQ7tb
	 u0L+O+xqWIQdaJgtC4+Ymj6bsR0pJb846I8NZFSTVveQi+i0eJCm2GYGtyYRyf2j7j
	 U/BsrPzl1x0cGksPBl0rg2zUGCBoZrPlcl7ZEaqhE4R0Nn9WSToDNoitJfBecFGahg
	 rff8hSSTv0wzay8JNn8LncvrmyTPxYLNeOhvC/lG6Hgs6npHryZwQurCscp0lXAMJ1
	 Jx/doC6wiN7gQ==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:42:05 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/16] staging: gpib: hp_82341: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:42:14 -0700
Message-ID: <5bc4da465b2df932b7cb7783012786a7220a2e2a.1744438358.git.paul.retourne@orange.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744438358.git.paul.retourne@orange.fr>
References: <cover.1744438358.git.paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the style of multiline comments to comply with the linux kernel
coding style.

Signed-off-by: Paul Retourné <paul.retourne@orange.fr>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index f52e673dc869..0b1f923de24a 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -51,11 +51,12 @@ static int hp_82341_accel_read(struct gpib_board *board, uint8_t *buffer, size_t
 		return 0;
 	//disable fifo for the moment
 	outb(DIRECTION_GPIB_TO_HOST_BIT, hp_priv->iobase[3] + BUFFER_CONTROL_REG);
-	// Handle corner case of board not in holdoff and one byte has slipped in already.
-	// Also, board sometimes has problems (spurious 1 byte reads) when read fifo is
-	// started up with board in
-	// TACS under certain data holdoff conditions.  Doing a 1 byte tms9914-style
-	// read avoids these problems.
+	/*
+	 * Handle corner case of board not in holdoff and one byte has slipped in already.
+	 * Also, board sometimes has problems (spurious 1 byte reads) when read fifo is
+	 * started up with board in TACS under certain data holdoff conditions.
+	 * Doing a 1 byte tms9914-style read avoids these problems.
+	 */
 	if (/*tms_priv->holdoff_active == 0 && */length > 1) {
 		size_t num_bytes;
 
-- 
2.49.0

