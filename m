Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97902175A91
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776513587; cv=none; b=CTW3K3he92KJi1zwgRchf2uhapfBhk6fYWIjclUUH36pOc/lP06iVPdLwtrljgAF1dgvvEQSQi3IqP8RPLS8P8FCWPnR15u1D93oSZZMprLw0qdBK4DSuIC+NjhVk1aNGECK+eefWQ1xYb/MUYCBMLhAhwLuG4SVKspn4Q8unPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776513587; c=relaxed/simple;
	bh=lXG1XmkBL05fEgiTJV1H971hSDhXFt/TDG1R3lTPEek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gKqxRU59AWKunkdOsBAozpHNFfEa0U8ogl19I7Re+mO6etMWMqTdImfQhvVStAwyTzQJVvaXDMu3DfjK4MMwzKGorPfK0OCzt9TEPnvxsVAHnhfOkxwv80Gawha0DNh+GOn8CnS7/joJBwnlU8ct5DqHavZodAltjDqxdQOZG2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzSxDyQE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzSxDyQE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so10336355ad.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776513586; x=1777118386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZKTorwwa5cJmcW/TdvR+L173SFKJnCAM2gDE8R2pHM=;
        b=UzSxDyQEYqguSuliqP558xLUR9vXU/F5amuFCcAd9JQXvKsF7sJW/NyxsWagH57K7i
         rfBDfrbSiahlwUJMIFzkD3V+eBleVnoLHUc+JQqEGNa0lSWCu2CEpgX2d6khyvc354ug
         yKmE8FKWfMqPe6CkuSYSjsA8csvbAur+yaN1Z21/hcww7DUEfPrZKa4/YHBxQ/Fy+CP3
         BEMBBQFAQ8R25HDINwvxmR1/kbjf3hSkIhrZuZaqCb7gW1Unk3IXU7KzVqzj/DRnPm5R
         CMx+Glut8YUhDJfzh3N5zicfT9HZ12+VR1NJshTnE5nKxePMCpDsuLzOdkSm9M48HAHw
         A4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776513586; x=1777118386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZKTorwwa5cJmcW/TdvR+L173SFKJnCAM2gDE8R2pHM=;
        b=lRTKWjPQQh4iWB5sD4UALy2x8NPpTxToC0onWcg2QUKU+VN4RpUAOuGQjRb/JXBuCk
         vhg3nlYdO9XPNfmt+fkMyn+ULculJt6XuKymWHSwcZ2Oph5tFFC29yfRUzWv21hRgTfJ
         OoL5X68/zz9HNimhLt84Ur6+ERsW9pX20eTJJ7Di9jLWdee5gXYF0CDN6F+t2ncPuRPT
         GhgJ5Hqidf5iums9bF+aglymmvPbByjsO2YTGJfF0/Nu3VcBRhG0EP+OCovL5trs87P7
         xK1gy57b7EYS5DjoUC8A/asexnHag10LAB+RP/maaOtecqTa2UeBh99w1oj+OP83C8nL
         zRTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FWsjzwufr15pq+wEiwDcTmBiZe9di7pdS1aUKGfJgGRlVoPQilUfR+DCwCNGlyieEIhkWadZ1l9n4bq1v@lists.linux.dev
X-Gm-Message-State: AOJu0YzGVRYHcd/lnPNjunTuoTTpDsw5awdkLKWAQZvqDb8yzywK+hnO
	lKZNx34092TPPN5iiYwOVSkEY88PcvpElsN999cMcXul6/VuhoSqxfwn
X-Gm-Gg: AeBDievrxp9cmRjtbED6RdyQGB6hWkX60VmQ50IEzcIYZTano/Uxay5BxxPzp2arG8b
	Y6PqJhc2G77bpCS8TkuoVZDhfQqXHClT+zYw2Vi1Bv7eCao8VH4wob7VZnRCm7kOgfLA+SccpjV
	5MQbbmBiH4421sl75jzqdAMhNxnqCP8dKC5D7NGFWvGACaQYrzE2uDw9LfOL2m68VLz62vSBmhz
	zGBjW6xjppyZ+KihBw+C6+GV/tphbx4OSP/FoKZM/ZlQRROwovYXeKTV0V2j1F7n3KHTta0Rgf6
	lIXD254wEW3yDKXM+t/aiNJVIFXqlvB9m2iT0zRC7fjdvsn5357FC1KNg93u4ptVakS7dntRvxi
	GXPKqOBSnG97g4jNO04/cftg9yRo/TBfhY3fv8EVErsqpoNKxHWUElbDRnb0H1li6az29L3k00B
	cfTconTQcs464nWkXpGzbRcq3WutLdCKgKmxEVASOKAoRX7afMmBOWgeWqdAx3FSTXB+7LfFxga
	ZsJpO5Djwh9i4wxyCHrvNk43Uvkeglrlg==
X-Received: by 2002:a17:903:17c3:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b5f9f3b367mr74490605ad.29.1776513585943;
        Sat, 18 Apr 2026 04:59:45 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff71esm50079975ad.8.2026.04.18.04.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 04:59:45 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: akhilesh@ee.iitb.ac.in,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: vme_user: fix missing blank line after declaration
Date: Sat, 18 Apr 2026 17:28:57 +0530
Message-ID: <20260418115858.5072-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning regarding:
-Missing a blank line after declaration

Add a blank line after variable declarations to comply
with kernel coding style and improve code readability.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
index f73ac92320bb..3102b94a0a86 100644
--- a/drivers/staging/vme_user/vme_tsi148.h
+++ b/drivers/staging/vme_user/vme_tsi148.h
@@ -34,6 +34,7 @@ struct tsi148_driver {
 	void __iomem *base;	/* Base Address of device registers */
 	wait_queue_head_t dma_queue[2];
 	wait_queue_head_t iack_queue;
+
 	void (*lm_callback[4])(void *);	/* Called in interrupt handler */
 	void *lm_data[4];
 	void *crcsr_kernel;
-- 
2.43.0

