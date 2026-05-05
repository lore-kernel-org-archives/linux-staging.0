Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F743CF67F
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009050; cv=none; b=O4WHro9PPJt0V6xjvoUgq7Wz2Dkz5WGAj+zA/a8iWOnvbswgnujxfDeHMxt7q3+RzrHzcJ4RALO6IqmHkFFp8yTs3Hut6ivmvKU2KX2j25j0uK2QGBvm/2iju4nPEbxc64Vm6hFrCiEx32RDIRAY5pW57MtvKcfOW6gxXlgg414=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009050; c=relaxed/simple;
	bh=2I+cpvUfY8iKVACTbHgDhnpXEGqmYavmj3u8YxHN604=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxQRD5bbeLCMy0mQUTIUhc8HJHdJEuFcJ1Bo5GxXp6pedoiy6L/tIaKedom/tTeeSKXQu12G8JQDHF9Xs3KC6L7c6khLh20mB4kcIWEst25dfoTEnZMK9vMmGXzkjsoRdSHS+FLM0LitStuKvX27/2JrYp7HgOZ4ti2En9/cb+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPpQWg8l; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPpQWg8l"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3653cb9c6f8so2480183a91.0
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 12:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778009048; x=1778613848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IY861zFHkDT67hb7sr2GFTeNCFIDnUejouhFoVLBUuo=;
        b=aPpQWg8lkOBU9TMhm4FqnLokn5RMlVqGHsiCCrBwekbPUOnLbrslEltyee7v2lL23d
         zL/JUIovUwoXyKQTE1QIo2YtHhWkIS7W8twAot1y/w9jF117SA0aYfa5jTNkNWajYEbA
         C1BDkV94E4ZUahjeWLps/OGA8lmyYLZmdSq819kITYET2IznedUmXdHo+K5y5DW9TMMI
         Vv5r/24zf6ko1hIgANZn/lyikNnFHaUE8lIgPJt7CXztK8oNc1LmAd+AFgkSsD+CTMnR
         8NycuZmpVGPdrKTLyxkAcKR1IcYTsf1zIxGvNIOp3M3iWmyqN9HXY7Ii6shEizejGdj7
         A07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778009048; x=1778613848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY861zFHkDT67hb7sr2GFTeNCFIDnUejouhFoVLBUuo=;
        b=p5a3IDn3IKAuBwBD2yUnt72Xd5+tA4c6EnD3luk0+T0LY7ojgzhpVxbqLs+QQaFKzE
         g/dIquYeoNw3cGEPWg04WUA3i6jNzFMuNoGDlxl8ZsTyZdU8o3o84eSq9u7j/yyawjxm
         a6BoNcrkHgb8eJ1dwS0uDqNi7md0hvnpYMDz8Ng9yLc5VME5zUmqkGjXS6FV878c0ue1
         WzGsxR4J2T+6SZSGNkJPjLJWHz9GwTEv+veoAOEdnosoxxMka4nex0IEOtS1lMTKAHDg
         AnOWjyb6faj4yX5BrbIsQ1ioGI756r3nCX1rp94HfRPLvw1l92UFbjLh95f/ooH66blJ
         nF8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9kL+uH2CNRQ3ygeMVdnt04f2vW2kywDMs1s3/CzQwGsBSI5d0Emmep5nR/FkxEZe3/4hMSm3+z2uP4XUkF@lists.linux.dev
X-Gm-Message-State: AOJu0YyVrEuTf1EcoHVBE75kq0OwOikpM/g3D3Y2grH5EZ9hHz6OfObc
	cHejtOUWDpdEl5aaz7OoFXT44nQ2vlddGhhM9sbEUxzmOWbi7V2DkBG9
X-Gm-Gg: AeBDietmDPbp6fls7zZMkYqC4MiQTqH0DszwVBH6yTnrEVQKCbNi9RJr9g/YljCLdZf
	0WGJly3scfb/DgMJO1bxYeuVaiONJxU63GyuE9XLCBADCfNvMlD0vtSVB9cT6KcKpCN9EIWzP2T
	c2500NVM5z9AqZXTr7f0SiNQG8C5/wl2xY2wShySR9kP7QippR02PCABsNaJfBFzG51wYbJMkm5
	enbKyVmhgoMKXbO6/0UvJUlPyD8ur6HmjjqkNm70myl5DARcu5hRop8iMzC6zWdH0awL19ADeau
	4Fy8MfMiY9nf+g8cd2AppARCr6VzBU1/q5VRkE1CkdE0SFWcJ53cic28sCIU6nm9OILp/AFcdwy
	6fN69veB+wRF6//MH9qjlC08qBJWNDlrS7s+CegTTbVSUGUXy04Bq1Reje6bGpHgNJ9AebooLUD
	e+UcP2Ns8y5u21l6FrIC7qhgjBrrnp2XGxfwXUW6O8Hg37UiGX96g7oszZ4AciIwvkta0u1jixC
	uYeVFU1GC3QidQDSE4GR2W1V5IbSLc9
X-Received: by 2002:a17:90b:5546:b0:35f:be35:fedb with SMTP id 98e67ed59e1d1-365abadb3d0mr228015a91.9.1778009048207;
        Tue, 05 May 2026 12:24:08 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00ae51sm19028970a91.11.2026.05.05.12.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 12:24:05 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: vme_user: remove unnecessary NULL initialization before list iteration
Date: Wed,  6 May 2026 00:53:20 +0530
Message-ID: <20260505192320.107936-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant NULL initialization for list iterator because
variables used as iterators in list_for_each_entry() do not require
initialization, as the macro assigns them before first use.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/vme_user/vme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 7220aba7b919..cb9796c87ee8 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -253,7 +253,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 {
 	struct vme_bridge *bridge;
 	struct vme_slave_resource *allocated_image = NULL;
-	struct vme_slave_resource *slave_image = NULL;
+	struct vme_slave_resource *slave_image;
 	struct vme_resource *resource = NULL;
 
 	bridge = vdev->bridge;
@@ -447,7 +447,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 {
 	struct vme_bridge *bridge;
 	struct vme_master_resource *allocated_image = NULL;
-	struct vme_master_resource *master_image = NULL;
+	struct vme_master_resource *master_image;
 	struct vme_resource *resource = NULL;
 
 	bridge = vdev->bridge;
@@ -818,7 +818,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 {
 	struct vme_bridge *bridge;
 	struct vme_dma_resource *allocated_ctrlr = NULL;
-	struct vme_dma_resource *dma_ctrlr = NULL;
+	struct vme_dma_resource *dma_ctrlr;
 	struct vme_resource *resource = NULL;
 
 	/* XXX Not checking resource attributes */
@@ -1426,7 +1426,7 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 {
 	struct vme_bridge *bridge;
 	struct vme_lm_resource *allocated_lm = NULL;
-	struct vme_lm_resource *lm = NULL;
+	struct vme_lm_resource *lm;
 	struct vme_resource *resource = NULL;
 
 	bridge = vdev->bridge;
-- 
2.43.0

