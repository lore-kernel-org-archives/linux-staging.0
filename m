Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC536AA8
	for <linux-staging@lists.linux.dev>; Sat, 24 Jun 2023 21:05:20 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id B35CD181B56;
	Sat, 24 Jun 2023 17:05:12 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
	YQasF6gnsIv733wQJwuJbqwg8s0h+AM9hZKen/fTpYc=; b=brP3g7drSw08mlvj
	Sv8+n3N6j7KNbUxha9i+UxZaZd13rq+vBzhJh5oFiE4owvXNCj+Seqjn6O4tmTh/
	O97SnSmKIbYUPu4s9tGQFo1AU5znZ8N8aKz6SQADNEqx5GVjNlaPVRj70QmUq7NZ
	DbmY1Z2b/sNBaiWYE/kdknwQK00=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id AA836181B52;
	Sat, 24 Jun 2023 17:05:12 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2019-09.pbsmtp; bh=YQasF6gnsIv733wQJwuJbqwg8s0h+AM9hZKen/fTpYc=;
 b=rt/Ne2GOR8sX9gXZE+UzfniFlI2hXS/3slhsD+SVfYuHOoumWtslrij/hpU2j9QpH9dHfFaLlbIIypftPVwpXFmggh8kih716DNz3eO4qt1rPGhJwidm569wHCnHxO8Qo8Park+mv78D5sefiV/qtUNeAdN/SJv0aKh4/xXSa6Q=
Received: from tacos.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 95DA2181B51;
	Sat, 24 Jun 2023 17:05:11 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
Date: Sat, 24 Jun 2023 14:05:05 -0700
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org
Cc: tdavies@darkphysics.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8192e: Rename function HTIOTPeerDetermine to
 ht_iot_peer_determine
Message-ID: <ZJdagUiGPqzb5lp+@tacos.darkphysics>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Pobox-Relay-ID:
 CF08D668-12D2-11EE-8300-307A8E0A682E-45285927!pb-smtp2.pobox.com

Rename function HTIOTPeerDetermine to ht_iot_peer_determine in order to
fix checkpatch warning: Avoid CamelCase

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index f9fa3f2bb728..33fac7d9ada8 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -164,7 +164,7 @@ bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
 	return retValue;
 }
 
-static void HTIOTPeerDetermine(struct rtllib_device *ieee)
+static void ht_iot_peer_determine(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	struct rtllib_network *net = &ieee->current_network;
@@ -720,7 +720,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 			ht_info->RT2RT_HT_Mode = (enum rt_ht_capability)0;
 		}
 
-		HTIOTPeerDetermine(ieee);
+		ht_iot_peer_determine(ieee);
 
 		ht_info->iot_action = 0;
 		bIOTAction = HTIOTActIsDisableMCS14(ieee, pNetwork->bssid);
-- 
2.39.2

