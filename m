Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAB1426431
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440201; cv=none; b=OKylwf/GYREwsHdajJuqbVeDx0jzNtVxn4Wp6Cyqtr9PzSL0jDf/64tLDDi0Rk3/2EK/j+vxyFUy0Uxu7B85hqYbA4FyogGuQJ/5mrbu+csDw9rK+YIjfhu1p0UpYowCb9illCAqvnV7mkL7sGixHgIDHP5CmudV8guQ/mnHYXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440201; c=relaxed/simple;
	bh=SnaWfOpVsK+YNXWcucsTtFq/QeWTdU0cd6LVHhV280Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cW5/GciMf0utgAcFupsS8FSGFAmXc1eQ5avu+pkjJZomLjYe+b1VZ+G9o8rmUkl9cgSEoZ4LSFEI97kY1a0t5rXgSZsOFdzLYWhoIgB5M3fsHp/ao9i5L6K//WFpXbI+4D6YNPw5epiatxT4+x1OrQ9LfMqCnGB20oHlZxruYZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 465622de956611f1aa26b74ffac11d73-20260811
X-CID-CACHE: Type:Local,Time:202608111723+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:958e1bc7-ae7e-47d7-8dbc-a9e23fdc469a,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:2f8c95e5b12852334618ba02968d8797,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 465622de956611f1aa26b74ffac11d73-20260811
X-User: jiangyunshui@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangyunshui@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 451201604; Tue, 11 Aug 2026 17:23:12 +0800
From: Yunshui Jiang <jiangyunshui@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	martyn@welchs.me.uk,
	jiangyunshui@kylinos.cn
Subject: [PATCH v2] staging: vme_user: fake: stop tasklet before freeing its data
Date: Tue, 11 Aug 2026 17:18:31 +0800
Message-ID: <20260811092300.368329-2-jiangyunshui@kylinos.cn>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260811092300.368329-1-jiangyunshui@kylinos.cn>
References: <2026081116-flounder-facing-6ef7@gregkh>
 <20260811092300.368329-1-jiangyunshui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fake_init() arms a tasklet whose callback fake_VIRQ_tasklet()
dereferences fake_bridge and fake_bridge->driver_priv. Both fake_exit()
and the err_master error path of fake_init() free
fake_bridge->driver_priv (which embeds int_tasklet) and fake_bridge
without calling tasklet_kill(), so a pending or running tasklet may
access already-freed memory (use-after-free).

Add tasklet_kill() before the frees in both paths.

Fixes: 658bcdae9c67 ("vme: Adding Fake VME driver")
Assisted-by: Claude-Code:GLM-5.2
Signed-off-by: Yunshui Jiang <jiangyunshui@kylinos.cn>
---
 drivers/staging/vme_user/vme_fake.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 8abaa3165fbb..074f0ca521ff 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1226,6 +1226,7 @@ static int __init fake_init(void)
 		kfree(master_image);
 	}
 
+	tasklet_kill(&fake_device->int_tasklet);
 	kfree(fake_device);
 err_driver:
 	kfree(fake_bridge);
@@ -1283,6 +1284,8 @@ static void __exit fake_exit(void)
 		kfree(master_image);
 	}
 
+	tasklet_kill(&bridge->int_tasklet);
+
 	kfree(fake_bridge->driver_priv);
 
 	kfree(fake_bridge);
-- 
2.49.0

