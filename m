Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752002;
	b=M3LST1ACHP0HZTrZKgwM3YDuC/YNJ9WJE7VQn+DNzV/EbVcrPQjwO4TyLETho103tJJT
	 pWhdZrzLHWtI3ACBB5oa6dCd1kqyy/nI9M1KOyJumvmctgeIawIWEoUL1h4lhK9P2m1U3
	 W4CRJpxf31dyF+83H0ga+lsh8ryPQyb4pMkoHsl2k2ssjJSr9pHNOo21SMZsWoCYgzcTZ
	 8qTRZ3Nvifivk6T1eRtKSA8DO5AriRKhD6W9gR5SmiLmXrziMFk/K4abAD4yvYNTea3Ff
	 rvYKKeWR/vcodZh8s5sNDTBpjAkyW/lH0Z8onFu3QI69P37nBv/6GModxg3uCxeBhtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0zDX4I/rzq0NwFF/RM7fThuRZfIPuAAwOOGiXNusSno=;
	b=V3oWS7vVBfi5Rx/C5G/FYY24aK4eL1p4oqP0oIj0sKC8C9RDjsYZ1CohU5DM9fcpfhOT
	 ArF1hvgSfLf+o6SMO/aHfCSUi8lrg1p80gn29xxn/C6PDD1Jc3AQy42iJRvhTys4Siwes
	 dwl7r7d1l8AN9HiLzMw6ShYRndVNefF5wcpADZflyz4HSg54sZ97juqeaRUcPsxszg8LA
	 HX57iouSdsukI3x3E4BHJGmxlLrKJYMo3f0iD0Bwhu2Q0iSPJcwEK+TZNADVEI9d7U0sC
	 sey7qJkDHBsdpoliA5Dg1LYoGEI8JOa6hF4AUnnJYuufvXAAc73dFEW5CHSMAADZ0gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CYMppPMK;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB16606A31A
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 10:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB16606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CYMppPMK
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so268164e0c.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752001; x=1793356801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zDX4I/rzq0NwFF/RM7fThuRZfIPuAAwOOGiXNusSno=;
        b=CYMppPMKkDje00F8S6eCC8BJQM+S1pxN1bxsUv3VYZHuUlKuxOAzbiiP+9hS/cTbxM
         4HfljLeA6gRw6arUZshHdu66oWihTuJdB1PomKTah5o/d+eholXcfxgIg3YZ9AUCvjNU
         S4Su9yk8/ItwYfL8Uob4lcNJYdfcY85Ze2gfulODhcyp6DsWYwtHPXnPwEyx5+WPw69b
         aafYPw1KX7EuKzYWJQUN9ElN9+Szn+YAClxOwnoAv8Z3kvwNa1Y4g3pPRdkU7Equ5zj+
         jSWGszhJnjraSlKUd1ZLbRLwlY1t+u8Umkj7KJHl5UEbSU+UQzpbLuC9KI25hR5xYQ/x
         Leqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752001; x=1793356801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zDX4I/rzq0NwFF/RM7fThuRZfIPuAAwOOGiXNusSno=;
        b=091wwrn5xoJ/jgfRAg1Yc2r4QJVGS8hJ/1r9YuVhevRXgB8FRJZgcgoVg9nw/U92Zt
         FRDJZKzlHAVox3d9oBhC3l+xlwHs/Y8+c8N8p5MbEP05laFmEMEyxK8o7dRBTayrysFE
         dfDqGznirNkOPFuZWs2MbiRKo6RuaX7Apl1jhb8+HnIEQrqFENIrUMyEXFwRoSd7zByQ
         yzHkSMNuVlJ12pj/7tNsq4eZLjQVxK8i0A3Fb+OXxDMBt4TtJJJMJYilO83WCnDfaU/b
         AJCWhpec1hck4p5akMM57T4pH8DeYWdsGgR+5PqtxL8zmXGeQDS1VWYvXjAy0AtVfnoy
         QTEQ==
X-Forwarded-Encrypted: i=1; AKwUvByxJBQbRVELOEQA8wXSkSTh/L1+PTlJXKVRdfGfUc/hTqa6SAIkld9GIC4X8es1EctQJqG1Ntnmp7t5DUWT@lists.linux.dev
X-Gm-Message-State: AFq9FYJFhYEmbeiHSiKjgrAk4Q5OSZp+uSeTW1XcyEI4kfkFLSktnXNt
	Onl7lRwb/rh6ahhouG1B0W9h5KHcWWTlvv5sfzcD1U40N3jlx9v2TQbB
X-Gm-Gg: AYBFou0H2iioz1JLaKyANXdVpr9fA4NuV3UnxyL4As1rWZsTQ9oZO649ALxlLLwH3vA
	scxGo22aWXwDaoC1w0Oc0msbZQzJ2IvtQUK7V+rXicQC7oYPvhxT/Qh5h9Je85unCBTsvhpBgbw
	mnQqyb+2I6Uyw0+JMeYbZZVtydJsriuoUeCMM3QeKqIui3ESz3eLv1SyO6M+LyLLKHL/7KCn7bq
	qhGJWVYmnwe5uyrCiP7UEeMGrawdb9Q/p6Q63+eM0KfEAHCzOaV6R4/K2xeAfQY2LjEnfgXns1O
	2HLS27A1AfdiscyUXJi/PYmJwx0L/9UBzA2M02zJDkvranLW2ZkEAGX6urIG77Ijxbt0mTRPUbE
	bE0b+LPawvLcVnJHjg2HO6SSUBIti8LuLNhFoAYJQz2FEnJ6db9heEorsLMWCap0Rx3v/J8Wokr
	XKE5u+wQ8EZpt1x6dy8ArNvMlkNlO+f93eDLpYvQAU9Y7490QS9jaidG81/yt+iHMcxr9TcHAA2
	1PV6pwLuIgLvA1/GMvvWPZakNb2sMVHEqWHotMjlbswW+HffIW39MB7hqgwA1VmW6JwNxtK2ObT
	xnir2mJExJCHbQDUj2PX
X-Received: by 2002:a05:6102:2912:b0:7b3:78ea:88fc with SMTP id ada2fe7eead31-7ccc349c3e9mr700369137.35.1792752000633;
        Fri, 23 Oct 2026 03:40:00 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ccc20fed4fsm2546405137.7.2026.10.23.03.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:40:00 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2] staging: axis-fifo: remove unused r_mem local variable
Date: Fri, 23 Oct 2026 07:39:43 -0300
Message-ID: <20261023103943.20995-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <2026102337-headroom-shun-9d45@gregkh>
References: <2026102337-headroom-shun-9d45@gregkh>
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

Remove 'struct resource *r_mem' from axis_fifo_probe().  It is filled
in by devm_platform_get_and_ioremap_resource() but never read; pass
NULL instead.

This is v2 of a three-change series.  The debugfs_create_dir() check
was dropped because debugfs has handled ERR_PTR parents gracefully
since 2019 (thanks Greg and Dan for the correction).  The
-EINVAL -> -ENOBUFS change was dropped as well, after Dan Carpenter
noted that -EINVAL is the common errno for this path and that he
would leave the choice to the author.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3d358f919..464368e04 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -428,7 +428,6 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 
 static int axis_fifo_probe(struct platform_device *pdev)
 {
-	struct resource *r_mem;
 	struct device *dev = &pdev->dev;
 	struct axis_fifo *fifo = NULL;
 	int rc = 0; /* error return value */
@@ -447,7 +446,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	mutex_init(&fifo->read_lock);
 	mutex_init(&fifo->write_lock);
 
-	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
+	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(fifo->base_addr))
 		return PTR_ERR(fifo->base_addr);
 
-- 
2.56.0

