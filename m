Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1435B2FB5
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:23 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWBC8-1ly1Rk4B1m-00XeCq; Sat, 15 May 2021 21:11:19 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 01/20] staging: vchiq_core: fix return type of vchiq_init_state
Date: Sat, 15 May 2021 21:10:40 +0200
Message-Id: <1621105859-30215-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:i6nM/b6sAW77J14Cd7HyS/TbCo/syasSRqc9mKq/9LKXmH3kr3B
 l/Pn4tGTqxiJGkY6y5XU76V39tVt0NFYX7XzPlGmxRxWrQ4G5PrSaREDREmwaC/MVh24mhY
 dMBzrrD+WxE1wVAc5TCAhbh2oPISFJTmdgpoGbI1DlfD/jMDF699uUnBmx3k8PL4lR7KGE4
 zjRPW4vUTaA4PQ+lYmHEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hNr1ETzA4xE=:MHYqJllh16tZuLqcnbDhM3
 FLSOVcx1nBqX390aeNE99HFK7bWxpeQBZy35cRQ7MjpYDXDSu2MAkX+zfvsLweoeCSFuTJlHi
 FAHyOMCFsQTdxyb5QXSEoNTPzWoOMwLwkKmy8/PmEoS0S/HSdoaklFHK/E8P1CTFdcShbeqJu
 cWWvkJqhVErFQU7fikJZ3fV20BNpH60mrpf6PdBpRf7mvUGtP2/UrSapzc570/lh27zoR2R+0
 rOwpFzHxvbXoA+o0JZw0VV7uKDJF3fnN1vtynldIrp/VzkSERJaM5Yu99vZwPCy2NKIhsIsyw
 qYFkL2wWOZ4ss5qTj0evpqg+fa8mqlp2WVsVhUXZJCIqnFxoEiXXj49GfAGc91c7Rjycx+p+m
 mj3AbaxdJ6cFvw61Mb1yFwDuNiNldJ4wnEqfLrg4mM463vQKD7583rqJa/7yDlvEsQ/KPBLAH
 J0oI2/OGaFVNpMvOJ41u/hjMcN201USi3qM0T891k9+pp9zobp1QekwYt3HfotJBSIgYfOCsz
 jmSPjIkDE2n9cgCJr/Nns4=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Recent commit "staging: vchiq_core: drop vchiq_status from vchiq_init_state"
missed to change the return type in the definition. Let's fix this now.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index ff85327..9b6c626 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2157,7 +2157,7 @@ vchiq_init_slots(void *mem_base, int mem_size)
 	return slot_zero;
 }
 
-enum vchiq_status
+int
 vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 {
 	struct vchiq_shared_state *local;
-- 
2.7.4

