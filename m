Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791639;
	b=ulIXrhloE4pEcFsuNiwWFdGrW8XHQn/got8fLwyjSmJU/RBXvPdU1n5D10S32HNRnEFX
	 cruOUeekFn/7ZsHrIBY0RquAD1Gpdwn9x1ifSpD2ApHQEcUz2iXq39yrxqDUqbgfJ6yXh
	 7R5VqdcKqVt/aF5Pb5Jcktsh5GNwMhOwCD6+QTkLvrq87yYj7S5YGQtmHVNWXtwrvYJqo
	 IK0vHAk7SXCbdKJe94oNGHlew8OY+BfGDLqjxJK+JkWHl7Efl5vKaTa7cNo1e0G5uQ5e1
	 Cyj15qGlAgK1K+xz4y7DM84gfM7EpkS7UTaRRHl6xfGL/Wj2tMKeJ0wPy/Dh4kNR5Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4q1WGi9vPIf9vHoF8r8SkjERKMefi2tjXdzTAcwJSz0=;
	b=mB1AiEP4knvSh5KHRlBEMfd6xDEvi3jV7REfJypy3n1UiwQ+wnSRR5jIWSzFABc/zJGU
	 lYCd/wQnoiJQxLOKgyoh1Pjg6t8Cd08MPLLyVjy5DjHSGPMvWsAPXhJ+sexPgpDxvuMud
	 NS/hFhFOc35FR6AgZQCJLJql7JkizIEpYYTBW6C8Em+9Nw3qPsNEYlOgw/7GkcE9Pnt7b
	 5t8HZFRp1g1pAMWBksazMxMA2UsQjE5VzacAMUYQiZuq6FpgVz+JWtMRW4V4NwRbio0gS
	 pu8SOa3mKAbwSJ/92KDOagkTD8/H1sz3jLc5ZeIcWa1q7zmz2Lhbzmjr/Rv7Fdvjw2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gRwLH6/V";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80091606D804
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 11:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80091606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRwLH6/V
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35b2c599f43so1165835eec.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 03:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793791638; x=1794396438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4q1WGi9vPIf9vHoF8r8SkjERKMefi2tjXdzTAcwJSz0=;
        b=gRwLH6/VQxmiMHue5C1hBstJAoJjG3aQb3Hiqnbatr453VB0+D4d3I7F1Xd3ObDnOu
         EOGa9P/ns3PhiEaKdYHwoMyslfAVJ781ZSgmSwOc652BV43ZXk9Eb7LgvO5+tvv8O0ZK
         cBREmpJ0hVC6YjK1v/e4jj7gan2+7t0SQZEn6YkTX6JQ6hw4itRRCcB45KK2une2KnPL
         hqtZiSuRuIER/IUUjfS31IOKsG1j8jTtGc5QUf+qnINbKiKRG54Kmp01xz6Zouqc179Z
         5Rzdxf3Z2D5RFmhZynkTKmMYpp5AgIvVj2j8+6OzjBb9nudHAihxVJJgKqr9dMo8/VFL
         QagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791638; x=1794396438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4q1WGi9vPIf9vHoF8r8SkjERKMefi2tjXdzTAcwJSz0=;
        b=y4MXEkUP8Ey7meCtu5mffHqyTP+5XfNFB/a+yZBhz7RpcfueNYR8vm/QyFVOdmGTgG
         zV7Ct5Lgqageih/t2gHlmf35oF2LDm1SZTaMRw7p28lmnVISR6Qqo66OcMZdfvZ+8phu
         Yh2n4Skod7NZvatIATLPpZzdgz6mR4qlmabpsJ80T1sPAlLhAQmV4lEAOgw0Db9mypY6
         NTPYlGhToZqrHOVfOVrSmejwBc/VDBt/qu1gvIZbWWuUGjMg+De3jQ2/eFmZf4Atxsjp
         xZ4L8LefZiOKIAH5RjRKqiw1iph6X50z5I2i9zeWmdOrb1kclBRbvsSq/ID/bRRgsRyl
         5rRg==
X-Forwarded-Encrypted: i=1; AKwUvBwWakTwE3ObRFjl/WCWBu4+XHB+vUYXwf80MMvHG1iIh4fVEWcug8rhqSn8iNMwq0ILDflzwYwgbfYbgBZQ@lists.linux.dev
X-Gm-Message-State: APuU4Z9jTMqGx9kORkm+4T8V+kLp+w0X7ZDc3zpup/GFm8Zg3j96jC7b
	b4QH5iDujbhnvtZnNbyWOfsdzTwN7wvSnrFO7Ld684o229ZubXrsHYX3
X-Gm-Gg: AYBFou15pHPqFXcz5B1g9Lmry7Gln9oeQ5irXT1hvmWN3GqJKc544faZ/j1Np/jvnP0
	UeAsey7TfqfZfJ3XcFyJ19Fp7P4Mu70E101Zjd0x+wsGDMmAPhyq492xqOGRrX0+tNu3vIyZffA
	WrFu1QkOLjIUGKI7WGa9qdTCj0e/hJlvpR/xDyrM+ynFCh+3VbuOeqnhEdSA719g1VeGwHRb08o
	ToeRAf7uZKXmQVZdU3ZRxWbun1ILEnZfMhQAmdyG+QHe6FSfs84goIuCEg3J89SBGzuSiqO++hx
	B2MlPu37RQOyRyqbdfsMkVQklJNgm+tmg9Degbx66WTGl2xy1xXbB2Fim2SoKrxdVcEnpwvehkr
	LvxY350NGub5svp5ht3VDMgVSiDr/TI361dWg+ZLdqOpXxwXo5fqDdkhYPpTOPr7HiPFRrPefTQ
	1q2Ozp6FDuxWHdo0vgL1e1pumlA7E8agRsvpYDxqD7jdJRF4rVZs5YfdnYcp4yhjvv4QkrOig+X
	et8BFWJUYhhDVYWW7Q1+yZ4scPl2FqEzlcueNHWw9a2eMjhLe8Ke0l495+rXJqd2isnlWaJ542s
	dacAi8guf4uQOKQuj8tXEdWFkT5YflytCcTJmnM8YZD7bFKJBtw=
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr24062847eec.37.1793791637656;
        Wed, 04 Nov 2026 03:27:17 -0800 (PST)
Received: from Anonymous.localdomain ([223.181.62.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm11119601eec.11.2026.11.04.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:27:17 -0800 (PST)
From: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hussain Sitamouwala <husainsitamuwala21@gmail.com>
Subject: [PATCH] staging: sm750fb: fix spelling mistakes in readme
Date: Wed,  4 Nov 2026 11:26:29 +0000
Message-ID: <20261104112629.180890-1-husainsitamuwala21@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Fix two spelling mistakes found with codespell:

"defaulty use" -> "default to using"
"althernative" -> "alternative"

Signed-off-by: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
---
 drivers/staging/sm750fb/readme | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/readme b/drivers/staging/sm750fb/readme
index cfa45958b9d2..a000f833d8ce 100644
--- a/drivers/staging/sm750fb/readme
+++ b/drivers/staging/sm750fb/readme
@@ -30,9 +30,9 @@ About the kernel module parameter of driver:
 		insmod ./sm750fb.ko g_option="noaccel:1280x1024@60:otherparm:etc..."
 
 	2) if you put 800x600 into the parameter without bpp and
-		refresh rate, kernel driver will defaulty use 16bpp and 60hz
+		refresh rate, kernel driver will default to using 16bpp and 60hz
 
 Important:
 	if you have vesafb enabled in your config then /dev/fb0 will be created by vesafb
 	and this driver will use fb1, fb2. In that case, you need to configure your X-server
-	to use fb1. Another simple althernative is to disable vesafb from your config.
+	to use fb1. Another simple alternative is to disable vesafb from your config.
-- 
2.53.0

