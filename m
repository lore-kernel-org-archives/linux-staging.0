Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A08940244D
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433461; cv=none; b=HlEenuIFjnNKPxHV5qQfBjkbB4Y0Lod8m1u1nYeoL+nhjs9AZ1Gu0hCLZLn6IjS9+L2tmZ0w0M53z933Kk6qKI/WvnQUmB598WEyn7CKyiE9C/RMuTD1nGP+RtJb6U0b0+CqzfHbgKMtGLBHAP8GNf/B6je5He6bHbFJvgMVQ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433461; c=relaxed/simple;
	bh=CwAUaR488OrZMFfmERf5PK961nx0c8A88HCPIjtD7Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WLX1awMI6JyD74NyAD2tdwfInux9k0dBodClCy/OhJm19s7naxbXuzqWu1AS8wgx6Rz3cLZHOC6prRzEfH7ukS0x93oQRgBK1hi8IwKA0kuvKG9gNCMl6a9miyjR2iM1ZS6eGDG8ARqgDPCSWesqjO1DmQ3V8SjRZvolMY3rtss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 91b5f0a2955611f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:34272b59-a387-4794-9f56-96e83a7fac6f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:42c434b72a7bed245995d284f5de7cef,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 91b5f0a2955611f1aa26b74ffac11d73-20260811
X-User: jiangyunshui@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangyunshui@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2002706240; Tue, 11 Aug 2026 15:30:46 +0800
From: Yunshui Jiang <jiangyunshui@kylinos.cn>
To: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	martyn@welchs.me.uk,
	kees@kernel.org,
	jiangyunshui <jiangyunshui@kylinos.cn>
Subject: [PATCH] staging: vme_user: fake: stop tasklet before freeing its data
Date: Tue, 11 Aug 2026 15:30:39 +0800
Message-ID: <20260811073039.288957-1-jiangyunshui@kylinos.cn>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jiangyunshui <jiangyunshui@kylinos.cn>

fake_init() arms a tasklet whose callback fake_VIRQ_tasklet()
dereferences fake_bridge and fake_bridge->driver_priv. Both fake_exit()
and the err_master error path of fake_init() free
fake_bridge->driver_priv (which embeds int_tasklet) and fake_bridge
without calling tasklet_kill(), so a pending or running tasklet may
access already-freed memory (use-after-free).

Add tasklet_kill() before the frees in both paths.

Fixes: 658bcdae9c67 ("vme: Adding Fake VME driver")
Signed-off-by: jiangyunshui <jiangyunshui@kylinos.cn>
---
 drivers/staging/vme_user/vme_fake.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 434cf760ade6..7b9d13183a41 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1226,6 +1226,7 @@ static int __init fake_init(void)
 		kfree(master_image);
 	}

+	tasklet_kill(&fake_device->int_tasklet);
 	kfree(fake_device);
 err_driver:
 	kfree(fake_bridge);
@@ -1291,6 +1292,8 @@ static void __exit fake_exit(void)
 		kfree(master_image);
 	}

+	tasklet_kill(&bridge->int_tasklet);
+
 	kfree(fake_bridge->driver_priv);

 	kfree(fake_bridge);
--
2.34.1

