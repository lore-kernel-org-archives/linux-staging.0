Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060546;
	b=WTkAW8pB+3WbZhV18vwV2n6EqZgAU6Gxx8xKH0QWoVBAc9Eyz2yznoq/VCu74ovqsVZK
	 bCTR7T6o2dsWndUVwbWGb5xT00hadcsko7lwgl+8EyEARTOIgA3h8TLotedQIWkZiy+DB
	 UEB+QjaAM5Q2Iahme4c21UK5sMA5SuqXS6cQWVAwJ+w96W/EETbK47Nn30hzCSEmaeAOr
	 MrYK+5g8Fn96nVEe1NMx7Os2xKfKRltYlRMu1VKAAD5b0yOC+7KLqzyEBonr0WA6TOVMZ
	 Qm+aDFMzaazcUPemEEOZiWPDHI2O40eexcaaa6Jra+KdtyPknoyOe9gBBFAA9Yt35kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
	b=UlWBzYKIBphK0GBPM5PgwpPrOJ17yAUgf4WS5qYL8+RdDE1sdk2eZXaU9CUgEOkmg6r0
	 SFNVL/yzeMzCWHcnyAiJ7NpGDcds7g+SJwK8Fqpuh/7wORC7eL7A0QJa+MJtntLZzfEkl
	 SZ7ivQd/wCU1e9nmyuWlmAc3qjSF14vJp1hP5krUHimDjnK3wil0J8tv/edgws8Bp4mWt
	 j423rqF5sck+tVy15hxQoIbhDN6WryyhdWAsP2nQ5yGhe1JD8Am851lZuex/IG3HjswAv
	 6yOC47DBEmEpn9jw8n9DodmWQkQXisyD9KHh00JQQC88azWqLSiJxJuLUSXuywqga8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RUxPRePA;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41488606A31A
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 00:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41488606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RUxPRePA
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-181516de561so280160c88.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 17:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060544; x=1793665344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=RUxPRePAFbiaPM0aIqWYlN7KP/WpFtBCQCKY3yQhxkxxA+AKqjvgqVklvooFSye3Zv
         NbcWJ7fc1Anpv35TM1iYRyfb+Xd/pbbDZa7Y0DWZTWdYRiA4WfJHEu/6X6iI7mHm+odA
         c4huHScPQZtlh0r/xGyVrVE/Oi2p/okYcRBQNtRN0BRwdxmoFgzoQdx2J4leyvL6EGQc
         8j4hpBOww5YatIUHuSoBj81c5p/0IHYlO+WNCQGGnNafHRjCY1BNdmsfrBzDndeEyzSw
         /adaLVUUpOb96fdebnkM6neXni4IYpRJtM6zsyQXWdrLvnYeEu0OryDaodT4pwSan1Vt
         uCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060544; x=1793665344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=IUhkOmONkXQpnEp6Uec3jkNWhFEnMW07HpcfScFDEBQZU3LoZ+khi/sRZOafM/aJQP
         GvPWq4IsbRcg+QY7RiR/Yg6LR4t/O6461jOXOMgRzt32QJnqXToo8gN+dMzZDNFt0T93
         E/dcQTtzbT/hYYVUE6VbncDpU2re/4wisOpA2fYLFZebRnUtOKObjrTku4hZIMyTKL/s
         XrtB2KrCs8xYCLoRXK8FEMJtQtxEtO4J9cUaIeiez+/qzWEo/lEKl39f/cYrFh2QeWof
         cHIhjS0UVcceB4PtMAgBAdN1B+x9JzJe/J/DHsEc0A9vUhDFcNhgc4UYPrybvCj2cr/l
         wdwA==
X-Forwarded-Encrypted: i=1; AKwUvBxGXekSl7dV19K4Gq7HcBRk9UNS7AxsTmLrOWmaKpkhf6DWcJJtqOGedd8qjB71Ml4l6c7LPTXerDAMC+Rk@lists.linux.dev
X-Gm-Message-State: AFq9FYL2aQy8QuoMvnyqLHdAuntaWLEk3fpuAh/JPjLKcJ7ZEI+60gE/
	F0AowctCfqWvkYcx3r3i+G1eHa7gAHO8TP1oPNFMi09wt4WfAoxfff6c
X-Gm-Gg: AYBFou29zu5w8IEg3xufVes1pbpe7cuYSbpfAK1JtK1gqdRzq6+/p/DZWCy3VGty9gJ
	3IZDnV7OuPWAKlbAx6aOvButjQAPS05OmbULKV1u6wvRMhzjVHtTSOrwOD1knUINg4F31bvprnI
	bLyDxwJCRegsXOjzKAiKwLaN7QQMc7DT78+rpjdg0BsLA/Bsl2NjCWPKMo8/a4jPPmtKzyQCPem
	lCimqOJ2gOLM17Y3Nhz5jb2db51JBSXOYW8gfw2DKL8Xp8pc/0E9bnoP6yicGXBwzzyELcSeOiJ
	Sx6OHgcwSNvgALkWzXx4mG8dU9u0BIuLcHgeFRbGyCFIIxmvcMDioX5wGp3k2b+vkbHMJS10HZP
	oegob4vVbzoGabkyU7rXNparxvD2b8Q5SJq0ndM8abuVSbnGZYVm6zFveKKdp34eG8TgW++jkBQ
	5LhwVyp/L9hTabecgQs+mzXnWVUmhAdDRa7bFH8hApTNQgDOMJi13+/iiFwm7W248feB+/4j5Cc
	NQPfowDK4cFyPFjSNOzP4wWkrvxdLz5oMSFXw9RrHemcaKL7WGottfNIOY85ZF8uj4igqFkMe3N
	sUzMe8iwQGcBiRbSKzpI6RsXG8wO
X-Received: by 2002:a05:701b:240e:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1a3bde8faaamr1245749c88.0.1793060544072;
        Mon, 26 Oct 2026 17:22:24 -0700 (PDT)
Received: from localhost ([103.204.210.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm27529598c88.16.2026.10.26.17.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:22:23 -0700 (PDT)
From: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
To: error27@gmail.com,
	dan.carpenter@oracle.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Subject: [PATCH] media: atomisp: Fix memory leak in atomisp_alloc_dis_coef_buf
Date: Tue, 27 Oct 2026 00:19:40 +0000
Message-ID: <20261027001940.20565-1-sifat.yt.2.0c@gmail.com>
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

Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate

fails to prevent a memory leak in the error path.

Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index eacd7ee5c050..48196a358ad9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1373,8 +1373,12 @@ int atomisp_alloc_dis_coef_buf(struct atomisp_sub_device *asd)
 	/* DIS projections. */
 	asd->params.dis_proj_data_valid = false;
 	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
-	if (!asd->params.dvs_stat)
+	if (!asd->params.dvs_stat) {
+		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);
+		asd->params.css_param.dvs2_coeff = NULL;
 		return -ENOMEM;
+	}
+
 
 	asd->params.dvs_hor_proj_bytes =
 	    dvs_grid->aligned_height * dvs_grid->aligned_width *
-- 
2.53.0

