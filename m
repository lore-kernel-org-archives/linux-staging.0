Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BA819ABD8
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 04:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773981648; cv=none; b=pRrKr/x086FetHPpcJszMDe1DL54LSRVCov6WYjJ+5mepe96RG2YjqDDbN/mU1o7/4USBRTmKWNyg4UJsiU/oVjvb3huSyAhj73TuOWvYW+e8dvnU8Y+6QHK8P4yeqBodO21MrsrD0Cl6g42ptAWhTrU0dQgXdVBrfg4XgySK8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773981648; c=relaxed/simple;
	bh=C+DoUMatZsWnVfCvZvnfB7cWC86pJ/ZQ/KlfTu2PjnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WAowZmbH7pmF1p8wQoZFVJbS2shNslpElA0jzUcNGbJUHvZCcjXLCFHXHesOx02yIsOnvHpuBmfm2er4Kdc7TOIBXD5d5Koq5DnRpXvQrkjmvCGSnnOz/k6rEY4FAjxDULBtz6QrJFJaOGRUepv+zytRJ1zfZTuXduZ1YOP0MoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+JecVwW; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+JecVwW"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso987684a91.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 21:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773981647; x=1774586447; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Imqe9MQMpqBslZv+dVeUQ9fVHkOVnvAt3LiSMBguiS0=;
        b=S+JecVwW1KrxLd9CoCy2ZF1WQZiMj3uyi6FGCh3ro+Lx+3HXOjIvOQEGziumLm27C0
         /Yqly59UGkoVE5i+59DVShYDB5AkgPHSg+3plbVgLA95rj1P0iGP73MBC2m1t3QNUeFW
         qPkiDAm7yFFYDgA4+3oVEpvtrk6kixQRl0vjdllmkIMujGAra7RYQbdrukU3IRpciv2A
         Z7+4JlxRZBcBEdtXsxo3ZCyuznxhWCJTkxCSiNJAQIU0C3cF6eooqlrw4wh51ATZUnkh
         HwWlLfmCVdGvdYuzGTq5beRsAFbeZW0ECXZ2rlEMw8sxPZ9kDVpxDk4iaCE/Zh+2C+5E
         4DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773981647; x=1774586447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Imqe9MQMpqBslZv+dVeUQ9fVHkOVnvAt3LiSMBguiS0=;
        b=lGh3KXegdmyYd1sNvc05dLvi4UC4S2nnHLGRujcxhjQRH/ALOCtG7ntexi7e1GhLry
         cn2yWCi+t307mH/sZlkMDm+Fe6nF2PGlrPqmGhYDNduTKqMFT+70+ydhx4jPwV6RfXaG
         7KcmKSnDcgyTsAspb4XuZ0lkZ0ASzRQmij3DoQlQCV6afAg6FBTgUB4mLolAvbiqGht0
         dtOkd0ZOYgx/VhpDwTpGiy5cIy6HCqQ8f01v2rROlOTVgnIkA7HypH9tXOuAJXxiB+VM
         b1AP+ZyPuwsPY6uxZCeK52a64ZyGYyfZKv+FpQ6/rLdekuJT2HgHbnod+bdsvQRP7Jcr
         Sdrg==
X-Forwarded-Encrypted: i=1; AJvYcCWwoOA5txTtyY7dfX3Kris1PPGxDOZAlHKwYkmaltTM4QdzEYPYzj21O7WmgCd4fpD1FyIvz5c2af5rPzsG@lists.linux.dev
X-Gm-Message-State: AOJu0YyJiEjkNpTuByDrJZOANOhu0099SO3atxYdNo3S20tDAA3wOom9
	d07Oorc8fjxCzQdYYOy2XaknHqAoRhId/iij53s5xp1losd1JYShWqBY
X-Gm-Gg: ATEYQzwi/msvpxFlQuothloYGVJsXiIV3gpfbgDMmjtciPZCOIhlj1vf+Wj5k/oH4Kd
	cyOLBr9ZzrCc7bC27mgagIKv/zp2k8Sll/lMSazTjtaapL86L99QJY+thoXGjry3N5P7FNbjBaO
	Ayd+p93HT1hKUpQ1yJT3wONzlBXjLaoyKi92IUwCff/9b2uaA8p0mmSwOe3peqXCIMy4ikgdoCm
	UqzCJLCdn4fttxJDZCd0F1OVasPDbJFS+Xj6+W3NNIcwlG0NbrWiwiq48mAsUozrNpMeDBhghqp
	xEVi6W6w9F3WatEdMogWjWOO/3a2OWU1R6Dq/RS8l+fM1t3uCE08YHRWjBCp5KDBna5fPetl/2F
	TDaofFWiS9i0utJKjTPxOsaAgPDZG9f4UrRhoL8lSVoi4ZPm+JyVtmeo7B8woF0LTLQoGYJ30RD
	f4/nxZeu5UURxPSuxKUwUEmUx/DhdNz85asufqIyejpdlIya1DP4MbPjzFDc01rSa7vsMjxlEPj
	s4Ln4Q2VuJJNyhqqTzv8DJD2HEh+L7hAIRII0hM
X-Received: by 2002:a17:90b:3e44:b0:356:7b41:d348 with SMTP id 98e67ed59e1d1-35bd2cb2bd2mr1225592a91.20.1773981646902;
        Thu, 19 Mar 2026 21:40:46 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60174e7sm4224083a91.6.2026.03.19.21.40.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Mar 2026 21:40:46 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH] staging: axis-fifo: remove redundant comments for mutex fields
Date: Fri, 20 Mar 2026 12:40:40 +0800
Message-ID: <20260320044040.21149-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant comments for read_lock and write_lock, as the
field names already clearly describe their purpose.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..ad98d5eb7751 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -75,9 +75,9 @@ struct axis_fifo {
 	u32 has_tx_fifo;
 
 	wait_queue_head_t read_queue;
-	struct mutex read_lock; /* lock for reading */
+	struct mutex read_lock;
 	wait_queue_head_t write_queue;
-	struct mutex write_lock; /* lock for writing */
+	struct mutex write_lock;
 
 	struct device *dt_device;
 	struct miscdevice miscdev;
-- 
2.39.5

