Received: from mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE4044C67C
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125057; cv=none; b=U0GTEEoVont4q3qYRgF3W1s5ge2abIuPg0ksHkDAq4yo6299QgmWvhQZRltwvMcM3z0SKSigWEeA9j4KVsYzlOfYdt6txoztLCaX/uKKd0Tr7pcOGuSxgaEvNi/HwLVekFIECIAt3IWfqMwGoMUr/qIRhReG58ohjJfCABs6TV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125057; c=relaxed/simple;
	bh=wH7807qWO5kQg87Jj8j4ZCvElyELLtvRNqcUUS+EVPQ=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc; b=HqB8ttxFp/VPU4mhIa3w/ivwnAw+u1SppgzbUVN625ZUeZpeAEqL2DenVbXDtwb7Jw3OIP7jHfUan6zzKIzgtAPssNgogcBmPsI7PkZUYvJO9nIzvHf9EqMGHAuoSFyQELpRXbogc+lFqb4RR62+/XNHgiURBcinZkSS0NRwjw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ftOGxgcp; arc=none smtp.client-ip=91.218.175.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ftOGxgcp"
X-Envelope-To: linux-staging@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=wH7807qWO5kQg87Jj8j4ZCvElyELLtvRNqcUUS+EVPQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789125046; v=1; x=1789729846;
 b=ftOGxgcpdBcSNbniPQ/OnUyl2lr79Y6SOmN1ZP+7yAWXUsEAcksSE3vkG97IKAhNmkggVn0q
 o1uBXPvtNzWjg1xS44aeNfiUjf0entACyXiUDdmF5WzJuL6xuZvoSfROQ7BYWZSy3/1l1SWjiCv
 hG9JYoEEPLc7AShIfb1kfDOQ=
X-Envelope-To: linux-staging@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 0ef244dbc3a5c695;
	Fri, 11 Sep 2026 11:10:46 +0000
X-Mizu-Trace-ID: 0ef244dbc3a5c695
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 11:10:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <8114c3adc1acaea78523cc0fb4d4b25f7665cee9@linux.dev>
TLS-Required: No
Subject: [PATCH] staging: rtl8723bs: fix RX buffer OOB write from
 device-reported length
To: gregkh@linuxfoundation.org, hansg@kernel.org
Cc: linux-staging@lists.linux.dev

From: Tianchu Chen <flynnnchen@tencent.com>

sd_recv_rxfifo() trusts the device-reported RX0_REQ_LEN value
(hal->SdioRxFIFOSize, a u16 read from the card via CMD52) as the
size of the next RX packet and passes it to sdio_read_port(), which
copies that many bytes into the recvbuf skb whose data area is only
MAX_RECVBUF_SZ (10240) bytes. A bogus device on SDIO can report up to
65535 bytes, causing a heap overflow of up to ~55KB past the skb
buffer.

Bail out when the RX0_REQ_LEN exceeds MAX_RECVBUF_SZ. This is expected
to keep behavior unchanged on normal devices.

Discovered by Atuin - Automated Vulnerability Discovery Engine.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
---

Test Report
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Device: Wintel CX-W8

Cmdline: nokaslr no_hash_pointers randomize_kstack_offset=3D0 norandmaps
mitigations=3Doff slub_debug=3DFZP=20

Method:=20An oversized OOB RX packet filled with "RTL8723B-RXOVF" pattern=
 has
been sent via sdio bus.

Result: Kernel reports object corruption on an unrelated RCU-reclaim path=
:
redzone and object-padding overwritten with the test pattern.

[  973.253606] CPU: 1 UID: 0 PID: 54 Comm: kworker/u17:2 Tainted: G    B =
  WC         6.12.94+deb13-amd64 #1  Debian 6.12.94-1
[  973.253635] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN, [C]=3DCRAP
[  973.253651] Hardware name: Insyde Intel CX-W8/Intel CX-W8, BIOS M.W8RA=
AA01 04/17/2015
[  973.253668] Workqueue: kvfree_rcu_reclaim kfree_rcu_work
[  973.253698] RIP: 0010:object_err+0x1d2/0x1df
[  973.253722] Code: 1a 29 c1 48 8d 54 05 00 48 c7 c6 13 ba 4f 82 48 c7 c=
7 fc 5f 4e 82 e8 6d fb ff ff be 01 00 00 00 bf 05 00 00 00 e8 de 60 40 ff=
 <0f> 0b 5b 5d 41 5c 41 5d c3 cc cc cc cc 49 89 d7 48 8b 0c 24 4c 89
[  973.253744] RSP: 0018:ffffc90000217be0 EFLAGS: 00010046
[  973.253765] RAX: 0000000000000000 RBX: ffff888001045580 RCX: 000000000=
0000027
[  973.253783] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88807=
b8a1780
[  973.253800] RBP: ffff8880191c8040 R08: 0000000000000000 R09: ffffc9000=
0217a60
[  973.253816] R10: ffffffff82cb43c8 R11: 0000000000000003 R12: ffff88801=
91c8000
[  973.253832] R13: ffffea0000647200 R14: ffffea0000647200 R15: ffff88801=
91c8040
[  973.253849] FS:  0000000000000000(0000) GS:ffff88807b880000(0000) knlG=
S:0000000000000000
[  973.253867] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  973.253884] CR2: 00007ffff7dfe350 CR3: 0000000005622000 CR4: 000000000=
01026f0
[  973.253901] Call Trace:
[  973.253918]  <TASK>
[  973.253939]  check_bytes_and_report.cold+0x66/0x84
[  973.253967]  check_object+0x17c/0x310
[  973.253994]  free_to_partial_list+0x1cd/0x490
[  973.254017]  ? kvfree_rcu_bulk+0x16a/0x1a0
[  973.254040]  kmem_cache_free_bulk.part.0+0x3b1/0x3d0
[  973.254064]  ? kvfree_rcu_bulk+0x16a/0x1a0
[  973.254086]  ? update_entity_lag+0x1b/0x90
[  973.254113]  kvfree_rcu_bulk+0x16a/0x1a0
[  973.254137]  kfree_rcu_work+0x100/0x1b0
[  973.254160]  ? __schedule+0x50d/0xc00
[  973.254184]  process_one_work+0x174/0x330
[  973.254210]  worker_thread+0x191/0x2f0
[  973.254234]  ? __pfx_worker_thread+0x10/0x10
[  973.254257]  kthread+0xcf/0x100
[  973.254279]  ? __pfx_kthread+0x10/0x10
[  973.254299]  ret_from_fork+0x31/0x50
[  973.254322]  ? __pfx_kthread+0x10/0x10
[  973.254343]  ret_from_fork_asm+0x1a/0x30
[  973.254369]  </TASK>
[  973.254385] ---[ end trace 0000000000000000 ]---
[  973.254404] FIX kmalloc-cg-192: Restoring Left Redzone 0xffff8880191c8=
000-0xffff8880191c803f=3D0xcc
[  973.254426] [Right Redzone overwritten] 0xffff8880191c8100-0xffff88801=
91c8107 @offset=3D256. First byte 0x2d instead of 0xcc
[  973.254447] FIX kmalloc-cg-192: Restoring Right Redzone 0xffff8880191c=
8100-0xffff8880191c8107=3D0xcc
[  973.254465] [Object padding overwritten] 0xffff8880191c8110-0xffff8880=
191c813f @offset=3D272. First byte 0x52 instead of 0x5a
[  973.254485] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  973.254500] BUG kmalloc-cg-192 (Tainted: G    B   WC        ): Object =
corrupt
[  973.254517] ----------------------------------------------------------=
-------------------
[  973.254517]=20
[=20 973.254560] Slab 0xffffea0000647200 objects=3D25 used=3D12 fp=3D0xff=
ff8880191c9e40 flags=3D0xfffffc0000240(workingset|head|node=3D0|zone=3D1|=
lastcpupid=3D0x1fffff)
[  973.254587] Object 0xffff8880191c8040 @offset=3D64 fp=3D0xffff8880191c=
8400
[  973.254587]=20
[=20 973.254606] Redzone  ffff8880191c8000: cc cc cc cc cc cc cc cc cc cc=
 cc cc cc cc cc cc  ................
[  973.254624] Redzone  ffff8880191c8010: cc cc cc cc cc cc cc cc cc cc c=
c cc cc cc cc cc  ................
[  973.254641] Redzone  ffff8880191c8020: cc cc cc cc cc cc cc cc cc cc c=
c cc cc cc cc cc  ................
[  973.254659] Redzone  ffff8880191c8030: cc cc cc cc cc cc cc cc cc cc c=
c cc cc cc cc cc  ................
[  973.254694] Object   ffff8880191c8050: 56 46 21 52 54 4c 38 37 32 33 4=
2 2d 52 58 4f 56  VF!RTL8723B-RXOV
[  973.254711] Object   ffff8880191c8060: 46 21 52 54 4c 38 37 32 33 42 2=
d 52 58 4f 56 46  F!RTL8723B-RXOVF
[  973.254728] Object   ffff8880191c8070: 21 52 54 4c 38 37 32 33 42 2d 5=
2 58 4f 56 46 21  !RTL8723B-RXOVF!
[  973.254745] Object   ffff8880191c8080: 52 54 4c 38 37 32 33 42 2d 52 5=
8 4f 56 46 21 52  RTL8723B-RXOVF!R
[  973.254762] Object   ffff8880191c8090: 54 4c 38 37 32 33 42 2d 52 58 4=
f 56 46 21 52 54  TL8723B-RXOVF!RT
[  973.254779] Object   ffff8880191c80a0: 4c 38 37 32 33 42 2d 52 58 4f 5=
6 46 21 52 54 4c  L8723B-RXOVF!RTL
[  973.254796] Object   ffff8880191c80b0: 38 37 32 33 42 2d 52 58 4f 56 4=
6 21 52 54 4c 38  8723B-RXOVF!RTL8
[  973.254812] Object   ffff8880191c80c0: 37 32 33 42 2d 52 58 4f 56 46 2=
1 52 54 4c 38 37  723B-RXOVF!RTL87
[  973.254829] Object   ffff8880191c80d0: 32 33 42 2d 52 58 4f 56 46 21 5=
2 54 4c 38 37 32  23B-RXOVF!RTL872
[  973.254846] Object   ffff8880191c80e0: 33 42 2d 52 58 4f 56 46 21 52 5=
4 4c 38 37 32 33  3B-RXOVF!RTL8723
[  973.254863] Object   ffff8880191c80f0: 42 2d 52 58 4f 56 46 21 52 54 4=
c 38 37 32 33 42  B-RXOVF!RTL8723B
[  973.254880] Redzone  ffff8880191c8100: cc cc cc cc cc cc cc cc        =
                  ........
[  973.254917] Padding  ffff8880191c8110: 52 58 4f 56 46 21 52 54 4c 38 3=
7 32 33 42 2d 52  RXOVF!RTL8723B-R
[  973.254953] Padding  ffff8880191c8130: 4f 56 46 21 52 54 4c 38 37 32 3=
3 42 2d 52 58 4f  OVF!RTL8723B-RXO


 drivers/staging/rtl8723bs/hal/sdio_ops.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/r=
tl8723bs/hal/sdio_ops.c
index da2d9088ab5ac..b7a4ab0bedc90 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -644,6 +644,13 @@ static struct recv_buf *sd_recv_rxfifo(struct adapte=
r *adapter, u32 size)
 	struct recv_priv *recv_priv;
 	struct recv_buf	*recvbuf;
=20
+=09/* RX0_REQ_LEN is device-reported; the skb buffer is only
+	 * MAX_RECVBUF_SZ bytes, reject bogus lengths instead of
+	 * overflowing past it.
+	 */
+	if (size > MAX_RECVBUF_SZ)
+		return NULL;
+
 	/*  Patch for some SDIO Host 4 bytes issue */
 	/*  ex. RK3188 */
 	readsize =3D round_up(size, 4);
--=20
2.51.0
