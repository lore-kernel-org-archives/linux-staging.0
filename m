Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795026377;
	b=NIkwJ19ScnWpJoNFcLf/ieLIh4ggUcNf26de3RimxLEhwe2gv+TK/7HDObZtzEW10F9k
	 JNQ2N863xjqY4dFoirhWmBpXmlAkBWK4P8L5FeM4RQz8iTC6N3TeyYYrWzfjnE2XrCynu
	 /azDJSSvmY4Cpy24TrLJ/sVy5ZF6Iy0J5J9Z3QX/o2VdPEvzeoswZQm0hRooMoUTmTtcr
	 IhZXlJGGJ5rUovPF8Js0GJvi7r9f5Mmaw6mE4ZOBjluUk2TifgLemAbjbH0SBNbRxX3X/
	 BlrkChic95lFyybXtyiaugML8kZNoPioBiBBPeVcQVBIJ+zdXiLv6iQaMWkb3s0cCRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026377;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r7sbzCl2qpTgoM/gKEteCq1RYkwvwSqJCdHHjbgh9xU=;
	b=DpE/Ub4DkmVwjqjVMb28mACK6NDxVIuE2Wr1UgbT5A6c5e1AxL+jbbldD98e8pclF3mH
	 twBDBxrbYi5UhAau34QoYjSp4SUFmD9FYiuVIkA9KKBmBKsIwLGMTna2XyawXpaBBChhP
	 F/RK6aSvzGAZjpJoQ219sHR/KRI4HadZEKsXj1+8nLcAzOmJzP5u6xlkxaXBJJCCxQ0mY
	 Qt6o3l86VSjwK3D5gXR5T8oZ706bZoSzoj1xV2vTLgEZKI4FHae0UcSi2AvpQsUKd8vdF
	 wrBBpXhjk+SnP4e3AEizp0KHWLSpjk6QUf8n4rJB5GHWc/86nVwkPQ1Su4xTIAuLFfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zjir4qpl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81050606A31C;
	Wed, 18 Nov 2026 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zjir4qpl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795026377;
	b=xE30EIpjA+tvBvcnwmFilf8lUrpVNpBl1gOJrMzyqvmcQHIaX6cCc1qcwfNm5XLQ9BVc
	 z/9UQDjvTiUupIIgCY6pUbF+p6ltCPE4v0SVSUoJkcON+fUq29DyBAMm19vBKGrJlC43H
	 8Jz3ujXbExSoK4g4MRqazOk/dAGXH6LCHt1tTdk9CRi1HeebL5pqiO4U8m5gU7GdJ2uvS
	 MWYvhHnlQ3CHk8R0WorGmIctVAA1rtjRBLh7NFIhI/I5UsNZGMXJkxM7evBO9PJmJ5WEx
	 qbcd36PfqKyT5xya5cHzO0T3i+iJ3Kjj1zXE9lEAUNoj1antwkuvi4K7pl5Qmt3qQ6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795026377;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r7sbzCl2qpTgoM/gKEteCq1RYkwvwSqJCdHHjbgh9xU=;
	b=FU8mX5wfb0bavvKmqjC4Qm3617EnUD6QNddgmGM4c2hW+5GuItP/d9HKBC9BbMeZLojj
	 vDnX3XS01QUU0T5nZLrcJBUZLLcfHpJp1uvTjWcFdDa6cLjtoCyPv5txqQYNmtSpybbEb
	 PZ+ev0tcdTsCemNeVlNCarpY7Y6CYIUoVjQjCfl8j2y/lokJBnRzqH4+SqOvelSQFpEOQ
	 WEXaQT+PCGGUwoF6bKdhOybqkV3fFtCzxGftd54C/D2Le22MyUBvTWnUZuPje8O+YX0eY
	 dB4Xn38HoC5/V77bdTS+lJtHp1mCejIHfx7g+buD6WJnaFYpFkhYdnydqnvNM9zgmbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D62D21F000C4;
	Wed, 18 Nov 2026 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795026377;
	bh=r7sbzCl2qpTgoM/gKEteCq1RYkwvwSqJCdHHjbgh9xU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Zjir4qplSv8aSEBPPG0izn1e/f7nrRAolyNYb7OhiAxUeJV3YOmXFf3EH9xh/q2SB
	 /JwkB1wtS1z//nIT6m/BuvebnXCzDvJYhLnezdPbToQx2TvasbIEmS49d3hKSmmoEa
	 GBa5wVjKbUXRPidh6Jz/55mrE9EQTkMMazE5KZE5Vd6gZZrF51QFQSZoHPOSATwq8e
	 JYt1cUZ7/DHitSXKN9bhafNfFnRBDWKbtbuKLDINOsHEY1NNMNX5rXzNMxnwyGFCuG
	 15R2YvPKXPZ8XBz1ipCQ+KPnM2//ntgJJDJorKUG9yDUyDmU+afcrDySX4FJdTQTrT
	 LEcS7FTI45NHQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 52AD04AEF9;
	Wed, 18 Nov 2026 18:26:16 +0000 (UTC)
From: Maximo Manriquez Lizarraga via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Wed, 18 Nov 2026 10:24:41 -0800
Subject: [PATCH v3] staging: most: dim2: drop volatile from state counters
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-staging-dim2-atomic-v3-1-bc595e081fc8@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBQFr0K6tqYttDauvIdxUeAXvhFq2kI0h
 Lvb4oaNLid5b2YhATxCIOdiIR5mDOjGBOWhIE1vxg4otomJYEJxzk40RNPh2NEWB0FNdAM2VGm
 jpdUWjFUkPZ8eLL426/X25TDVd2hiVuVFjyE6/96yM8+7/4WZU04V1BVoy60qzSVOtYvHh4kkF
 2axc/AfDpEcRkpmmeSaVeXesa7rB+y+100MAQAA
X-Change-ID: 20261107-staging-dim2-atomic-68a85f8feaf6
To: shyamsunderreddypadira@gmail.com, marusik.adamenko@gmail.com, 
 error27@gmail.com, gregkh@linuxfoundation.org, 
 christian.gromm@microchip.com, parthiban.veerasooran@microchip.com, 
 rajveer.chaudhari.linux@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
 Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2808;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=obOr3rP8PTgcSS0Dx2Zi17AJdPtVHUgcvGOImUJO25I=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFl/3x5P7s9RsppXzhhYcOZ+pvvrOqFdkX2Z/3pcfvKc2
 B16UO9ARykLgxgHg6yYIouYDM/7+vs6cdZWc07AzGFlAhnCwMUpABNhe87IMHWOdUfRJukPVl2L
 MrishERuvv88t2zdhp92ORYzVqz7c4fhf/mX4D+5C2qEL21gv+i+6R3/UvNP543fiPwriSxNkF0
 whQsA
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>

The request_counter/service_counter pair is shared between the AHB
hard-IRQ handler and the threaded-IRQ service path, but every access
already runs under dim_lock with local interrupts disabled:
dim2_ahb_isr() holds it across dim_service_ahb_int_irq(),
dim2_task_irq() across dim_service_channel(), and configure_channel()
across the dim_init_*() calls that zero the counters. The spinlock
provides both the mutual exclusion and the memory barriers, so the
volatile qualifier adds nothing and wrongly suggests lockless
cross-context sharing (see
Documentation/process/volatile-considered-harmful.rst).

Converting to atomic_t is the wrong tool here: the service-side
check-and-increment cannot be a single atomic step when done as
separate atomic_read() calls, as Dan Carpenter pointed out on the
atomic_t attempt, and a lockless scheme would still need dim_lock for
the sibling channel state (level, indices, done-buffer count, MBO
lists) anyway.

Drop the qualifier and document the actual protection in place. No
functional change intended.

Compile-tested only (MOST=m, MOST_DIM2=m build clean); I don't have
this hardware, so testing on real hardware would be appreciated.

Signed-off-by: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
---
Changes in v3:
- New direction: drop the NAKed atomic_t conversion. An audit showed every counter access already runs under dim_lock, so drop volatile and document the lock instead (Dan Carpenter).
- Link to v2: https://patch.msgid.link/20261117-staging-dim2-atomic-v2-1-a550f0518043@tubot.lat

Changes in v2:
- Resend under my real name (From/Signed-off-by: Maximo Manriquez Lizarraga).
- Apologies for the wasted cycle; if the objection was technical rather than the sender identity, please say what to change.
- Link to v1: https://patch.msgid.link/20261107-staging-dim2-atomic-v1-1-6eb4e8f1f63a@tubot.lat
---
 drivers/staging/most/dim2/hal.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.h b/drivers/staging/most/dim2/hal.h
index 5d69a5e7d299..f857e6856a16 100644
--- a/drivers/staging/most/dim2/hal.h
+++ b/drivers/staging/most/dim2/hal.h
@@ -33,11 +33,11 @@ struct dim_ch_state {
 };
 
 struct int_ch_state {
-	/* changed only in interrupt context */
-	volatile int request_counter;
+	/* protected by dim_lock; incremented in interrupt context */
+	int request_counter;
 
-	/* changed only in task context */
-	volatile int service_counter;
+	/* protected by dim_lock; updated in task context */
+	int service_counter;
 
 	u8 idx1;
 	u8 idx2;

---
base-commit: a41e364995bbcfa627418a70fe913c35b7510728
change-id: 20261107-staging-dim2-atomic-68a85f8feaf6

Best regards,
--  
Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>


