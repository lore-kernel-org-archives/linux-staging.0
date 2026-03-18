Received: from cvsmtppost12.nm.naver.com (cvsmtppost12.nm.naver.com [114.111.35.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C220C32F742
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853765; cv=none; b=HQqrG4OEUQnKPff6as6msDm7vhlPuq/CggxM9Z3dz1KPyo6w1ODXzGpPDc9yhd+2g4XfaMFt11Ku7tBZkH3Qlj/61hcxM043z7lj1R54m8TNHIMR+RCFjapcc+avlaREjEXUUioqpqqoUnZ+MW4yd1+qufchXR/VolFPCo46SHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853765; c=relaxed/simple;
	bh=M8N51uXREzbc0JbgQcXP8kUleKzjXFuRC4xvSEgVsok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rp25Z7Ha8ReaY0qPsYxwxczUnRZRDNs+JdPtZf0hf6lRmvlB0ZJ5PR8i9spweZBF7di/VIJG8InTCsDPNXe5ETDD4mVA3PEuZvEWTEx4AzAr/JpcfMgLYowDtu+xfsA9NXNelzlR5NQHlG87ERZQe6i9w2ovmpv4lV/aREBMs+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=cjqGwxsB; arc=none smtp.client-ip=114.111.35.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="cjqGwxsB"
Received: from cvsendbo018.nm ([10.112.20.46])
  by cvsmtppost12.nm.naver.com with ESMTP id Ai+Kp1GXQ0eexTJ9YDSusw
  for <linux-staging@lists.linux.dev>;
  Wed, 18 Mar 2026 16:49:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1773852548; bh=M8N51uXREzbc0JbgQcXP8kUleKzjXFuRC4xvSEgVsok=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=cjqGwxsBeF9X0XDOeNUZrxIUtB1e9+rIXX+6M6SkpqTBQ/vf0tXpSBhwGpldyX+Ff
	 7ewlAvM8heC6EeHuIZB6dL6kn0Y2PGHgjRCxWIIJ9EFOM1z6IHm4lxTDTUEFPVgsvi
	 qTWVPor+UzVLargqXNh+mPppxQ2YQHEKcFiO60HLujcdnnMsO2jMVs0A2EpXidX43k
	 fGE+GXyD/9ac2EgSRIfr3+UEVF4W5I+LBpS7lM9e6v2edaiXNQgT1HcKojZ+1zrFB2
	 ywc/wo+xP2bf+7F27XQMlnxj9MnR8MU4CRARaqWAiLlVokV+TncsXNxGkX1n2RPvhK
	 XsYi2qCPQ9k7g==
X-Session-ID: +5gN2BdzRhKLeO+H8f8mIQ
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: YZKZaAKXFqJZ+HmXFAum+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp006.nm.naver.com with ESMTP id +5gN2BdzRhKLeO+H8f8mIQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 18 Mar 2026 16:49:07 -0000
From: Minu Jin <s9430939@naver.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	kees@kernel.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v3] staging: most: dim2: fix race condition in network info delivery
Date: Thu, 19 Mar 2026 01:49:06 +0900
Message-ID: <20260318164906.262225-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous implementation could lead to race conditions between
deliver_netinfo_thread() and retrieve_netinfo().
Additionally, multiple interrupts could lead to event loss.

1. Using local variables to store a snapshot of the network
   information under a spinlock. This prevents race conditions between
   deliver_netinfo_thread() and retrieve_netinfo().

2. Invoking the on_netinfo() callback outside the spinlock. Since
   callbacks may sleep or take other locks, it must be called after
   releasing the spinlock, using the previously captured local variables.

3. Introducing an 'is_netinfo_pending' flag to track the delivery
   status. This avoids redundant wake-ups of the delivery
   thread when multiple interrupts occur.

Fixes: ba3d7ddfb5c6 ("Staging: most: add MOST driver's hdm-dim2 module")
Signed-off-by: Minu Jin <s9430939@naver.com>
---
Changes in v3:
- No code chages: resend to include missing mailing lists.

Changes in v2:
- Add 'is_netinfo_pending' flag to prevent redundant wake-ups.
- Add Fixes tag.

Test Note:
- Compiled success, with no error.
- Verified with Smatch, no new warnings.

 drivers/staging/most/dim2/dim2.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 66617e89e028..b75e1db671dc 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -97,6 +97,7 @@ struct dim2_hdm {
 	void (*on_netinfo)(struct most_interface *most_iface,
 			   unsigned char link_state, unsigned char *addrs);
 	void (*disable_platform)(struct platform_device *pdev);
+	bool is_netinfo_pending;
 };
 
 struct dim2_platform_data {
@@ -212,20 +213,29 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 static int deliver_netinfo_thread(void *data)
 {
 	struct dim2_hdm *dev = data;
+	unsigned long flags;
+	unsigned char local_mac_addrs[6];
+	unsigned char local_link_state;
 
 	while (!kthread_should_stop()) {
 		wait_event_interruptible(dev->netinfo_waitq,
 					 dev->deliver_netinfo ||
 					 kthread_should_stop());
 
+		spin_lock_irqsave(&dim_lock, flags);
 		if (dev->deliver_netinfo) {
 			dev->deliver_netinfo--;
+			memcpy(local_mac_addrs, dev->mac_addrs, 6);
+			local_link_state = dev->link_state;
+			dev->is_netinfo_pending = false;
+			spin_unlock_irqrestore(&dim_lock, flags);
 			if (dev->on_netinfo) {
 				dev->on_netinfo(&dev->most_iface,
-						dev->link_state,
-						dev->mac_addrs);
+						local_link_state,
+						local_mac_addrs);
 			}
-		}
+		} else
+			spin_unlock_irqrestore(&dim_lock, flags);
 	}
 
 	return 0;
@@ -242,12 +252,24 @@ static int deliver_netinfo_thread(void *data)
 static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
 {
 	u8 *data = mbo->virt_address;
+	unsigned long flags;
 
 	dev_dbg(&dev->dev, "Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);
+
+	spin_lock_irqsave(&dim_lock, flags);
+
 	dev->link_state = data[18];
-	dev_dbg(&dev->dev, "NIState: %d\n", dev->link_state);
 	memcpy(dev->mac_addrs, data + 19, 6);
+	if (dev->is_netinfo_pending) {
+		spin_unlock_irqrestore(&dim_lock, flags);
+		return;
+	}
+
+	dev->is_netinfo_pending = true;
 	dev->deliver_netinfo++;
+	spin_unlock_irqrestore(&dim_lock, flags);
+
+	dev_dbg(&dev->dev, "NIState: %d\n", dev->link_state);
 	wake_up_interruptible(&dev->netinfo_waitq);
 }
 
-- 
2.43.0

