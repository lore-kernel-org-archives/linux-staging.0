Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D072AD22
	for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 03:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724558128; cv=none; b=k+CyiUL4yAl6RkCCHTUh/wWnUiT8AEM54j9qDRgryAF6JtwBILHLOocPJIm5yCQX50jAgacBnmGDe8vb5b5xdhZTjXkN988CQbZtRmCJsxbCETUDZnbPojFLGN6MFojcq1WvUrg25MZ2KOa/xV/jaJ1UgJKYnExtoHuLkPyfhAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724558128; c=relaxed/simple;
	bh=sZQOe7xHP3OjdupH2X9l9O+m1HSX2fWNk440f4gWAWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O/j8YoRmchcYUtnZOdRidu0pMNZjGk1UPbiwGG98DLEiYNqxK2sQSOtBBRAd+9g1EBmzT58l7ygOKVBaPisCtW5MsPRCOO/5/fhIuahjW8uoLny/cYvfzcxs2tJWFAT+l/Mlf4rMGkRbVLD4rUKa7rkLAbzch1XwVrYryBaAKIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzZveeM8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzZveeM8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7141e20e31cso2755136b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 20:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724558127; x=1725162927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Im7+BhtxW89XIZEU/f57AqCNicfD4Wbey8FFMEh3HXA=;
        b=RzZveeM8zH7GbyrxuB/9MhShr6zj1SRBliAK6j12NjmFbInYhTlLe+I6Vd4wLkRTTO
         usdRxuM5hCy5cwZhmj1I6mi9rNW+KMXZS2u95LBFcjMg+DJIG+KofX70p81fdTcGKXGl
         Uo5C4w9NqzWibKSptENkRa1siuE9wIx68Ca39IFlefwskP5hQSbdA/VzUfsmwO217tj9
         NzTSt9e2yDew7JaKqNXEEyvrITD2nDPqV4xjO7NeFhUIgirg7bjLZEecNmezWMEsVSUe
         1jXd5MkDGygp1QJZi+3TrXVztfHlLNTDVJF4Oi/J3dC0P2sO4gjG+V5bUBG9wc6rh733
         mg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724558127; x=1725162927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Im7+BhtxW89XIZEU/f57AqCNicfD4Wbey8FFMEh3HXA=;
        b=SRUnztMU0z1yl34QhSMNShGrvnJMoUUZxPrZV+61XGCMc3Q+V+nxU/Y6Q8bGn/iS51
         jC4WO4noredlx57UgoNA+qjmU0QnfNJo0yNFfl/FLJSGlHq0lU6vkefkiWz2JX90mTan
         0eK3VPa+34TppNs+zRvCYavLqWNLp7F09roUXWvbxFdkRI5nhZs5Dn7R40sr3KNYCU8Y
         pYasegn2MbX4f+E0nfEO4mXcM5AdG2wD6GnNY75MEoOsL8DNxnb2FN6v3ELpMtAqbDEC
         5wOajrKjaCf5qhtYjlp1uXGfPPPGurDEnkc9PUwacZv8AePW2fD3F1Eg2oZx8+BGhHYC
         dXjg==
X-Forwarded-Encrypted: i=1; AJvYcCUkVQ3xDWKuGwpWNFNwOHIFWYxN+i6ut9uhzTyzLmqlxFpRxsGrxaCoCPGIsUR9moYC63jpRww/tCZAO11K@lists.linux.dev
X-Gm-Message-State: AOJu0YzOXcwupaR05Kt9YmSFH82aRe6fw7RGz1zXLsiXGCZJjBCzsSHJ
	yLFrwLneWWlWTLYRZtxZIrzGHSeRv25u73bsKZMiipCDhn+Pwp2W
X-Google-Smtp-Source: AGHT+IE22uT2L7oxZJxiJ0DzouctlKhGAxVyb4UuNjbPFENilt4LXT1f9PRGUJ9QzbJ+rZNUE/HBOA==
X-Received: by 2002:a05:6a00:10cf:b0:714:380e:12b7 with SMTP id d2e1a72fcca58-7144576eeeemr9074641b3a.8.1724558126321;
        Sat, 24 Aug 2024 20:55:26 -0700 (PDT)
Received: from fedora.. ([122.180.191.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342750a0sm5260124b3a.95.2024.08.24.20.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 20:55:25 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: Added static to image_desc and vme_user_vma_priv struct
Date: Sun, 25 Aug 2024 09:25:14 +0530
Message-ID: <20240825035514.40095-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct image_desc and vme_user_vma_priv are used only in vme_user.c file.
Added keyword static to these struct definition to limit its scope and
potentially allow for compiler optimizations.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme_user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 5829a4141561..fe1026857710 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -88,7 +88,7 @@ static unsigned int bus_num;
 /*
  * Structure to handle image related parameters.
  */
-struct image_desc {
+static struct image_desc {
 	void *kern_buf;	/* Buffer address in kernel space */
 	dma_addr_t pci_buf;	/* Buffer address in PCI address space */
 	unsigned long long size_buf;	/* Buffer size */
@@ -114,7 +114,7 @@ static const int type[VME_DEVS] = {	MASTER_MINOR,	MASTER_MINOR,
 					CONTROL_MINOR
 				};
 
-struct vme_user_vma_priv {
+static struct vme_user_vma_priv {
 	unsigned int minor;
 	refcount_t refcnt;
 };
-- 
2.46.0

