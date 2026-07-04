Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63158301486
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783148305; cv=none; b=AUOG6LF6XAExf7Pf2FsLHjW2OoxMJPvJ2uKej/CngJcP79SLyq1qTputBxCemCd5QYOC0pXI1hqMMMidEVsNXtR9gAN0F1LYgdi7ojGxC6m+15URz15M3QcGTnayMVfe040GLwmJaMO8jftm1m/vfIjE9SBqFvx/13xlS2Ib8JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783148305; c=relaxed/simple;
	bh=cBcc7ErXfRFr+J/7vYzLtp7sZi7PCKZ7EKoS2iHzJC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QzXMkr1pmQ1Sj33f+I+7zPaHNLmtZKVoeb889pdYerKElSZjXQ3n2Ht0LkkVgcv41Rmav97TXfxmyRHLT99+WNYszr9jWIHWibNCiv29A9UGKml16JR1koy6zRYN25aAmlNKrvR37A809FSgIzYq9jH6Wu4J/3XMQzHXay2cGJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVF/dfDF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVF/dfDF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c9e89fded0so9839355ad.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 23:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783148303; x=1783753103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzYCbb8eQnCwKeqzpjwTQYnkWDJ8B7MI97un1VYHv7c=;
        b=jVF/dfDFyHOZ2KacEwut8jgttAQh4UKYgcAoiOHJNA6LgaGFK9NDYx7Bhe8dsDDAMi
         hasCDVNwIiqplUyhVsw9CztagVTypsptQbLQMn0QyKl7C1bCBQubzT2oUH9+LEjjf+yD
         HymPnZzg2zu9nTjnE2Tzvi4yRriH9Ogo9k233w77j1bx0dD4LX77ULV/jzLcX2DrxMxd
         8LS1PwaebEEtY/cIXaIA7gnj/PrQCGOS5xiTncZ5qelrXzbplu8Z26mZosmn/rb/HYpB
         BvabWQ99wws07tCRxhCFGagXD/DErGGqBGbrl0E6VQ1yG5miHE9vUVfrS9fJKodJc5ph
         bVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783148303; x=1783753103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzYCbb8eQnCwKeqzpjwTQYnkWDJ8B7MI97un1VYHv7c=;
        b=RmNzV84UMqsFtqJv6Qj/CHpAzMT0kPqQtHqLLE224gavo1g+8n+lGLTbxdQcd49YQj
         9gIt2Fi59bJGoavKQOMTEasxuNXhbguTWISbf92L4tyNIWRPFwPBDbtZeBVI5VlMeyXI
         JRVdRRPKLVvyVNUsJkvBWP7/kmudnqxsdQHOPnHdq0nxT5dzaGaibnaDPJHymFblc8Zx
         rCjYFx96gK7KqgCg0QsZDetVD+6oujc5gXnzZC16muOTqJjFAJ2IAu3r4og4A1u3g+aM
         84dnUkmsMcEMtE1uisKzuaKapgrWvFy9UkTw7hFS+qnyPs8BYUMyXIF9ukF6gqzedkKR
         uJsw==
X-Forwarded-Encrypted: i=1; AHgh+RovdN/d7TMKxiXqZyEMeahe8DuJ2XOqfEFlJRTClCaXnoRBLqPQks7tfKb3XRdOM0gxXA7t/Y6QjlhaXMWZ@lists.linux.dev
X-Gm-Message-State: AOJu0YylPnhmBvNIG9cnfDgEh4TaNLCyRHW8iXYb71d9pg5q8H/te/RX
	3rpyrGUA/RZZLwjlJWYPhG05S6Cq3x5kOhMiSvMRCZE9EHI80oWV+Na5
X-Gm-Gg: AfdE7cm2ur/4M7Jt2hSMil0CQpFTmhnGUHz/gJGcxl697Q4Ng/xSRQCc6C3jY5+wUW4
	aHCi/m/Ikht74JiVD4sq7koK2GtBT+5KxU9/fQQxEFcik8z5N2TYgPSZXGJ8bG/xnPVxEAUwtkm
	NFIEPgAwRkQD5CTx9arUJjWoeDtqQpBMGFEVQ5c6xR6LpP87e+/HYgoj+f4pWUhFGKhvv5EwwU5
	dFp7lVsR0+LPCvihrA+DVo2Kg5vrWBtvlwHsn1VXsZnRNdKbUlRV/76pZO5DL/16rF7he25HLWQ
	OP6R+ySkd5npsTauKKwXd6l7mPBFKYdxBUyR4Sf4ZVLabMdFd9wFj7JwzLZSuGQ2pgO5DMt/8MW
	k/hSbhIvKjE1ueNb99HMQzw6emJpPOxisHvfQ6rhaS7ZdBmFeHHAN12TqZMx9aL6wYazJq30Lnf
	AFElTXdo93BmzADwS3T4WVCN24yTTesrE6OLZsdznk+X9H
X-Received: by 2002:a17:903:46c6:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cbb201b667mr21145145ad.3.1783148303405;
        Fri, 03 Jul 2026 23:58:23 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([101.12.233.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad712ca17sm19526275ad.28.2026.07.03.23.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 23:58:23 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nadzeya Hutsko <nadzya.info@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	stable@vger.kernel.org,
	Martyn Welch <martyn@welchs.me.uk>
Subject: [PATCH 1/2] staging: vme_user: fix location monitor leak in fake bridge
Date: Sat,  4 Jul 2026 14:58:15 +0800
Message-ID: <20260704065817.403111-1-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fake_init() allocates a location monitor resource and links it into
fake_bridge->lm_resources. The init error path frees this list, but
fake_exit() only frees the slave and master resource lists. Loading
and unloading the module therefore triggers a kmemleak warning:

  unreferenced object 0xffff8b8b82aebe40 (size 64):
    comm "init", pid 1, jiffies 4294894572
    backtrace (crc c1e013ef):
      kmemleak_alloc+0x4e/0x90
      __kmalloc_cache_noprof+0x338/0x430
      0xffffffffc0602246
      do_one_initcall+0x4f/0x320
      do_init_module+0x68/0x270
      load_module+0x2a3b/0x2d90

Free the lm_resources list in fake_exit() as well, before fake_bridge
is freed.

Fixes: 658bcdae9c67 ("vme: Adding Fake VME driver")
Cc: stable@vger.kernel.org	# 4.9
Cc: Martyn Welch <martyn@welchs.me.uk>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 8abaa3165fbb..434cf760ade6 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1239,6 +1239,7 @@ static void __exit fake_exit(void)
 {
 	struct list_head *pos = NULL;
 	struct list_head *tmplist;
+	struct vme_lm_resource *lm;
 	struct vme_master_resource *master_image;
 	struct vme_slave_resource *slave_image;
 	int i;
@@ -1268,6 +1269,13 @@ static void __exit fake_exit(void)
 	vme_unregister_bridge(fake_bridge);
 
 	fake_crcsr_exit(fake_bridge);
+	/* resources are stored in link list */
+	list_for_each_safe(pos, tmplist, &fake_bridge->lm_resources) {
+		lm = list_entry(pos, struct vme_lm_resource, list);
+		list_del(pos);
+		kfree(lm);
+	}
+
 	/* resources are stored in link list */
 	list_for_each_safe(pos, tmplist, &fake_bridge->slave_resources) {
 		slave_image = list_entry(pos, struct vme_slave_resource, list);
