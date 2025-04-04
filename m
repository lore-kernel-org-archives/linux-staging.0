Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522C31F0E52
	for <linux-staging@lists.linux.dev>; Fri,  4 Apr 2025 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773725; cv=none; b=LPR10P4CIiyDdc6Ca3iAJOE6R2/rkPzX9zEkhzirBVMLbSnBC5pzGLPcdyV+BN9aHWwC1Y0Hs9giIaCQMLSYYe3S++0zmh8WjYw7DvMXC+z91A9cuhIIcVqFTQGt0Qx60O4ONN4OVHCwVIXIiBJyxjZbTk0L5On6g58gjILXmpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773725; c=relaxed/simple;
	bh=iSPqErZxC4LadBJfw/bHoBjcJYWzig0oMNRs5w/4daA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KNi/JIDavetBOJrrVM9sZ+n8FBtyh/pZB2HfghG7nl1LYNvyMOWxHyvabf0/oBopYXZLmUUTQc8S33+RGliRyvzU5KGBAbhilCrQ8YsuDgBDicZKRnlcKRRwROe64hRMkwofEh9P3ESCSSIsrvefy+EN41h7RDZ9wE2wIeUq6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Sa45lJWz; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Sa45lJWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743773716; x=1744032916;
	bh=iSPqErZxC4LadBJfw/bHoBjcJYWzig0oMNRs5w/4daA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Sa45lJWz/EQuYqoeQSPIKNAq2n/Bx3vI4xmmSObtiUb5OZgezFvnmJJyaVNEjBDxY
	 GVCaWaypX0eSfqs3eLX/Q2dQhDdoZLBsNxeCZDDyJ+rHFkAVbek+nnL46rYLotomHN
	 QrQn5wXpHikX0qp4fOIx+yPdbEYsLeKF7kvarABgVsNFvCe20VLnlqvpH8Sw5XFGoH
	 PiRfS4ClrukL8Bd8+3hhoFXYzn8L0beZPDEbR0if2q/f694ePobWYuLRwN6agcCqyS
	 C92T3vKGY0h6Nr8BktmNl/s0Z7ue+EFy91wILjvbc8nB9ke/nBq6AntloZEJ6c6WHs
	 Xtifi/Zef4c6Q==
Date: Fri, 04 Apr 2025 13:35:11 +0000
To: gregkh@linuxfoundation.org
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: rtl8723bs: Fix unbalanced braces in conditional
Message-ID: <Z-_gC8XOVoiXsC8i@ubuntu-desk>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 12c1f626f44bc9f7b326b4fee82961bcbc9f9555
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Only one branch of conditional statement is a single statement thus both
branches should use braces to adhere to the Linux coding style.

Reported by checkpatch:

CHECK: Unbalanced braces around else statement

Signed-off-by: Bryant Boatright <bryant.boatright@proton.me>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl=
8723bs/core/rtw_cmd.c
index 64ce33c6fba1..5fd635a4c632 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -273,9 +273,9 @@ struct=09cmd_obj=09*_rtw_dequeue_cmd(struct __queue *qu=
eue)
=20
 =09/* spin_lock_bh(&(queue->lock)); */
 =09spin_lock_irqsave(&queue->lock, irqL);
-=09if (list_empty(&queue->queue))
+=09if (list_empty(&queue->queue)) {
 =09=09obj =3D NULL;
-=09else {
+=09} else {
 =09=09obj =3D container_of(get_next(&queue->queue), struct cmd_obj, list);
 =09=09list_del_init(&obj->list);
 =09}
--=20
2.43.0


