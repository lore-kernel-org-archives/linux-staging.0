Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388821;
	b=s4FxtthJvIT3DCc+jBFE4Rd9TwJ9/D56QkfNMmCcdTJPArr+OWW6TYsBBgYvSLC0Q7OL
	 Sl7IG/mWc6SdDgwkPWR3LL8GKBtyFq8ZU6pFnhGxmu0vGPL4nmam5EeFbdcbZUFnJNhBn
	 ABtBrz828VKyLjGXu93qJwLK+MXTEV1HGSB40RaGgqLUFQNAnnCjpxbLzUdlQpoeF7BOJ
	 eVxjPYYRbcJJik6kUjmv2ksxLq617bUGbjt3tz5xnKOEMRCmH+0OH2c76IOtSLSym+ZnH
	 pG7W0mjk3xusBqBufwHfsP1AUQkOA/E0l+fPcN451ojhiKtr2eKRiYujbgtbFZls91A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ghEJXKWzTP9aAwVoN6uwmlIFk1sC5DaCEYh0pbHfkpc=;
	b=BPTlMH/CMhCuIjDj2JUxp1/u4sJdvYEUlovnCqakH/iyRPKmX76bT8iCpwxsg9B4DAgR
	 dZiN/IIC5vq4HUuA5nY/a3Ki0VYlYo9on96+Y3Kwxhh4W1VcwC+k97yU5ZrTH85QlaJPD
	 uJdHEx9Sl5oHR+1tNUiOnua/qGHlmGDX30tkVyJ0ciuI/mYc8+cyMSFw7/e01LSXJFoj4
	 /8j2ebody8j3+HsHajJnjwKI14XFWJb+sMummnAC0kKxImD2skkfugqjANAEMIhJ2tAiy
	 qVHFVAiE3OBN21OXmwjMtYdfV1UmZeUOeedgi0eNXGv8ej8bWEVB9rWOpHMK1yrONlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVFyeyJI;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C7606A321
	for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 19:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 841C7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVFyeyJI
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so1877949c88.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 12:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388820; x=1793993620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghEJXKWzTP9aAwVoN6uwmlIFk1sC5DaCEYh0pbHfkpc=;
        b=NVFyeyJI+gmMdsiNrjI2jOFtixfwO8Drx+bDEa2EAhxZVRj/3/2VRR4go432jlRzJO
         P2KdFIJfjAwAPij6GWyT0/1iIfpJ89I0yCgTLM7y1iNZM+uifwTSgXp4jOQLoF2hQqaj
         ZkDbRu9EGqVVW3jwC17D7NPA+XlKJra068iWgsbDD4pHQL9zHK8IhsW1nKIp/Tz9S2K+
         Yy17rrqIxRK+9EMHwYImQYgqFLmWsJPrQbFL9TczE9ghP8YgArQnJuvnA/P59RHg0+cS
         1iDvPLvlRbTeDAY/QWufjLGfxgXeiY7MdudtcdylfvY7LKC1giX8aH14P2AclsSjya1o
         hF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388820; x=1793993620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghEJXKWzTP9aAwVoN6uwmlIFk1sC5DaCEYh0pbHfkpc=;
        b=s2XuCVflSKrrEqbgqXyMG/F2984Va+j/Sm7uWA0MTfTV2tHq+hV45OBWMPktcgkHto
         Jb/2ZNCOVCqkUQQ7pfcWdeF458YZivLlpeWtbMxtg303AOmiQ4uvDiE6GzZhiuoXvYpW
         albk6I0Njs01SamMMDPQiZOYGlxycf0mJnXJbs8xWqUP8Gll++pKf4oye6unNdklX37I
         4s/fvzJ1VNunJRmOgB+Z0rFaxjozQ+gYwWmSe9DIOsCv87Fh2J1xPIX8ZU56YnAm0qmE
         HsT6AM6zUdpB3PlUcBafLPNK3xhFes1YdvSSNlzgYn4rC3lyNpFMzJU51S0eTRdMU41v
         +CNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLeIahZ0BGJXkWhHoBjRP/36O9kqZFRg4FEsOGRQwxUGYbol1x3ZeflLTQYbJFFLL8Aqm59nyMvuNX01zg@lists.linux.dev
X-Gm-Message-State: AFq9FYKBe6tQI7xz9zsdvIZqmBtA+FzSK7NY64099Zij2uQoZ/iNXm8t
	6SsXlRkY55ZxOvx8TdUs9skrR2GGRV92slgFiTC97hvyTn2jWs8rBq9G
X-Gm-Gg: AYBFou0491Zven1VuXxCV2YzMx5ZCt1HBiT64lWVsj7Ijna4zHQXCk8G8Oj8VoUfhAU
	cSoEtsJZxlEXvqC9n+ZwQjJ/4UnlDu7BBg8aHpxiEl7Oqe6UcZibVSbFiS4kT8Mb6dobG9WT7G5
	MaIDSFozpiN02ykp2r+byqfAg7PHHKfmMT77VZpX8ygtskY3DR2wj4CSZHaT5ihlOHqHsQeVDJi
	rE7UPx/poXcpFPHhy8LG78jCZSFASk/ELJCyX75ADtuIjrdd4rcXbied83U9+vl+bGRlIrwusfw
	9SoJ841GLEhbcF8Ba/41cLgFIoTOlmVPG/GgJAgFSnAGuYTkcWOiYPYWs2M9wcg0/KOsCMongdJ
	FmKicGV1kDYgR3GWOQ0ktuH8mxWYxRLdTtnUP0aDA6H6Ywvg+KjrpVdoOGlgSEDuTw/Hh7UNKAt
	+yA01M48/8K/N1OL6Rk+2vONou0INd8CMLGQG41uDkmX7aplin06tJETVT4Cz0bN2zaKyj0zs7v
	A3jePH1xWnaOeoS7CNB48mnhgMWPU9VEig6LWslAKuaag6s37i4hNJvAu5Y7MJzupcspTvTrNQx
	dCYI0zCDY5Wz/DrbNVbRKpL/c+aCjczyzWdwO7Tkl8N1CNTFaHHNnLMFdXE+qTWUBLIy1W8=
X-Received: by 2002:a05:7301:6198:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-36a42602aa1mr4298875eec.38.1793388820302;
        Fri, 30 Oct 2026 12:33:40 -0700 (PDT)
Received: from X.tail7c3ebe.ts.net ([103.190.40.7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm10796405eec.25.2026.10.30.12.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:33:39 -0700 (PDT)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove redundant return statements
Date: Fri, 30 Oct 2026 19:33:04 +0000
Message-ID: <20261030193322.13777-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A return statement at the end of a void function is redundant; control
returns to the caller once the closing brace is reached. Remove the two
such 'return;' statements in hmm_bo_release() and hmm_bo_vunmap(), as
reported by checkpatch.pl.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0a8f401a1..4ceb8cb41 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -483,7 +483,6 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
 	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
 
 	mutex_unlock(&bdev->rbtree_mutex);
-	return;
 }
 
 void hmm_bo_device_exit(struct hmm_bo_device *bdev)
@@ -957,7 +956,6 @@ void hmm_bo_vunmap(struct hmm_buffer_object *bo)
 	}
 
 	mutex_unlock(&bo->mutex);
-	return;
 }
 
 void hmm_bo_ref(struct hmm_buffer_object *bo)
-- 
2.43.0

