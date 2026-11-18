Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794960368;
	b=PaZ2+jgfvipBfKqBkxjRdnQYcAf3c8t7sxP/kXxLxoQ9W6FbWuMs20qMGZePH5X6N1oU
	 lnHrhVam3mwe/Cc27We1esx+NxKPW4ERIC5bdzY6SG1sf7+U3XcMArA+YdRtl5VKn6VlU
	 AMH5qWRjgPycFOVu8SJ/S+QF/jXADOA1qftZOzWe7i5e7LUEEsEuFUeHqHlNfyf8ezPDl
	 2H6adavg472Bn+cKZhMlDgIoa2PWEywF70Ekg61PINaCr4XPp0zkmQQgOgWs66Y8mCy5z
	 DBS6qCDbhS6+dkGkjavCp0/mrnnkBpBPI6BPI6B0MWHQlZfFW8t9MLIyArW3COvmGFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960368;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Sh41BKaEFqu40VZCFAZtZ2re9360uoXZkICjD6gYqTs=;
	b=wpFfG4+RZSeD0FPDaWoxeqKqaz3YTiolvilEmT6A1VhhzNbason9l5vdA+sCKvS6JPoE
	 ovPNqtIK6p1APSgC5scb4YNw75Oz/k66mI6aOeU9J0W51Vq5CCC0NQn7hOL1m0YJbVSsF
	 uqRPspJ6PIKK+eunGzHN4dFCpPZ3mHBa7OtTBJq7BeqXNTznKMYEJDCe8cZbqU6gW9txT
	 YRfqqFdVmwUCi+MHUObEF+ywp13jMsboCDKyWjYYtefyrHgCPS3HgFHTpgGh+tyzZSOs0
	 DJzFkT7xIPTXU+pE5mhN8X3T54wFmT6cpezv64lic4CfiKhVvQg/Gl8zJuz767TGQpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XYxX3ALS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FA9606A32A;
	Wed, 18 Nov 2026 00:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XYxX3ALS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794960367;
	b=FdqUTD0wj+GlkMx3WsuJFvm6h0aQv0t6+8sPq3640JZKzifxtW4ZNIgL777jQ4feLQTv
	 IO1XntPfkGM8twfDcTyy4LnLvB0O+T3rJZXScnaidZmDcD7xZTZ8M9l0a5FbujrjgWgiM
	 773OOo5A31q0ggU+EqL25Z/ruhrG4CFI+p+jhN01NKqX3QWw5erbGZvIatr4kp0apc9kP
	 4n/JAKRFzoSZwuaSvkWkbekMd1u07lSyyds76yTVvI5hLBBOabalCAKs/EIJljqTlZc3C
	 BKBY7+qBU9Do+jk68Bs2jL2EcNKQ2t74v/CWOrwr3bLM1V9MzprS9L3ITG+kOG0xaeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794960367;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Sh41BKaEFqu40VZCFAZtZ2re9360uoXZkICjD6gYqTs=;
	b=Oka17lkNKTu1aE0ugyfr37ydXFk5FvPR+cCAfKYlI9IxqOSXlL/IgD8Ty18ibfzO9jbh
	 3bQX+wBlo9Dj6IYMAGfUUrcySwxUxCLagtalnzyux1bFyWzERwVvddCllO1T9hwV3WHD9
	 K/HqHueT+afcKPMGzxDpz156zMNSOC57RXUSwX70ZLmNLXTi51yncVPoP9+vCNTD3yntJ
	 Dz8BcY9aNd40tpECbOvx5tFZBpTm+m/kH7Nsn6oq0sB5tFH308CD6x22h/nbq+y/KTVlU
	 pwu1U2nUK/+bGY3kqQgnFcUxLJge+PZX/F2Y6KQkTmz73dOPYQwsLqUg06zyhldYbJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BF6F1F000C6;
	Wed, 18 Nov 2026 00:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794960367;
	bh=Sh41BKaEFqu40VZCFAZtZ2re9360uoXZkICjD6gYqTs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=XYxX3ALSDLdil9S02lCrJttjPEnjkuQfsp5RaM4PU7y0owIzwdhvKNP8EEJChkYHW
	 1HYu8wMmGgByQx3yaMo1Xv3uZGW7+y69J1piZ6qw122jRFgDNn9DHbuvsToY96etsQ
	 iOC2VVPC8T4A6nVqauHUaMyXrBTOG+rF+1VYlN+TbawXvkaxAf6MeyQ6hHalls2MCu
	 5Bvaun2Tqpyc6Q/vzIxI0oMaLh39zR4ElpK/vxvodp0SpFBeilVF4dC1C9Heei4hPo
	 G5pj7euQpXy0JJpiVSWupYcb4030dZz8sFjZUXsWbm3QUVEBfTJ6VyyY9hSsxCkm/n
	 MaoqFE5NOnZhA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8D1FC4790C;
	Wed, 18 Nov 2026 00:06:06 +0000 (UTC)
From: Maximo Manriquez Lizarraga via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Tue, 17 Nov 2026 16:06:06 -0800
Subject: [PATCH v2] staging: most: dim2: use atomic_t for channel state
 counters
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
Message-Id: <20261117-staging-dim2-atomic-v2-1-a550f0518043@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7RhatTauvIdhMcAUxgglbSEaw
 t0F3Lt8yfvvzxA5CEe4ZTMEniSK71fQhwyqlvqGUeqVQefaKJVfMSZqpG+wlk4jJd9JhcaSvTj
 rmJyBdTkEdvLeq4/ix3Esn1ylLbUZrcTkw2e/ndTm/X+YFCo0XJ7ZOuXMie5pLH06vihBsSzLF
 2q0klzIAAAA
X-Change-ID: 20261107-staging-dim2-atomic-68a85f8feaf6
To: error27@gmail.com, shyamsunderreddypadira@gmail.com, 
 marusik.adamenko@gmail.com, rajveer.chaudhari.linux@gmail.com, 
 parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
 Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3418;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=DzVwGgJlaMAT/3SAIgdkmln9ovVSG2ZhjYnhV3aplks=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFl/Xr/9uNDl6g6TFZyFb2+K2nkm9HqZsJYuUdnjs1Okr
 vxT6bKXHaUsDGIcDLJiiixiMjzv6+/rxFlbzTkBM4eVCWQIAxenAExkOwMjw7S0lCZeoSddMrvv
 tZVHaRq1VuRmi8R8VnGx+Tu9zeb/VEaG9kNmFzmvxIlmGJglyF0NcdiWG6g/9dImzUzTEydPHEt
 iAwA=
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>

Replace the volatile int channel state counters with atomic_t and
convert all access sites to the atomic API.

request_counter is incremented in the AHB interrupt handler
(channel_service_interrupt) and read from task context
(channel_service), while service_counter is updated in task context.
Plain volatile provides neither atomicity nor ordering for such
cross-context sharing, see
Documentation/process/volatile-considered-harmful.rst.

Use atomic_set() at init, atomic_inc() for updates and atomic_read()
for the comparison in channel_service().  No functional change is
intended.  Unlike the earlier attempt that only dropped the
qualifier, this converts the access sites as well.

Compile-tested only; I don't have this hardware, so testing on real
hardware would be appreciated.

Link: https://lore.kernel.org/linux-staging/2026072515-domestic-cardboard-f657@gregkh/
Signed-off-by: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
---
Changes in v2:
- Resend under my real name (From/Signed-off-by: Maximo Manriquez Lizarraga).
- Apologies for the wasted cycle; if the objection was technical rather than the sender identity, please say what to change.
- Link to v1: https://patch.msgid.link/20261107-staging-dim2-atomic-v1-1-6eb4e8f1f63a@tubot.lat
---
 drivers/staging/most/dim2/hal.c | 11 ++++++-----
 drivers/staging/most/dim2/hal.h |  5 +++--
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index 4f137ef846a3..ca931782b06c 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -419,8 +419,8 @@ u16 dim_dbr_space(struct dim_channel *ch)
 
 static void state_init(struct int_ch_state *state)
 {
-	state->request_counter = 0;
-	state->service_counter = 0;
+	atomic_set(&state->request_counter, 0);
+	atomic_set(&state->service_counter, 0);
 
 	state->idx1 = 0;
 	state->idx2 = 0;
@@ -634,7 +634,7 @@ static bool channel_service_interrupt(struct dim_channel *ch)
 		return false;
 
 	state->idx2 ^= 1;
-	state->request_counter++;
+	atomic_inc(&state->request_counter);
 	return true;
 }
 
@@ -682,8 +682,9 @@ static u8 channel_service(struct dim_channel *ch)
 {
 	struct int_ch_state *const state = &ch->state;
 
-	if (state->service_counter != state->request_counter) {
-		state->service_counter++;
+	if (atomic_read(&state->service_counter) !=
+	    atomic_read(&state->request_counter)) {
+		atomic_inc(&state->service_counter);
 		if (state->level == 0)
 			return DIM_ERR_UNDERFLOW;
 
diff --git a/drivers/staging/most/dim2/hal.h b/drivers/staging/most/dim2/hal.h
index 5d69a5e7d299..70b10793cf84 100644
--- a/drivers/staging/most/dim2/hal.h
+++ b/drivers/staging/most/dim2/hal.h
@@ -9,6 +9,7 @@
 #ifndef _DIM2_HAL_H
 #define _DIM2_HAL_H
 
+#include <linux/atomic.h>
 #include <linux/types.h>
 #include "reg.h"
 
@@ -34,10 +35,10 @@ struct dim_ch_state {
 
 struct int_ch_state {
 	/* changed only in interrupt context */
-	volatile int request_counter;
+	atomic_t request_counter;
 
 	/* changed only in task context */
-	volatile int service_counter;
+	atomic_t service_counter;
 
 	u8 idx1;
 	u8 idx2;

---
base-commit: a41e364995bbcfa627418a70fe913c35b7510728
change-id: 20261107-staging-dim2-atomic-68a85f8feaf6

Best regards,
--  
Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>


