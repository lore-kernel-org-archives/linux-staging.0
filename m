Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445839;
	b=tm3xyEV9P1he9ZUpKoob6PMHpA/kHh7AWuEBc9tce3O8OHUSHXZxBtfSo//e7c5LpqgZ
	 1HQ1PuiU+omfkYoc6/wHWLN5t3mp08ySxU76EAbQ+ckc2Yc5AiGq8LRfJQxfFqKDvmXEK
	 WPdnvskap683lp3FlAXJp6rdQ27LNJayTLrtuSVsrBcNj4rE6U8ceWK7JKkYQJhkyDRYd
	 yq7wNB28F7ARNK8z24zfvn9dND3yyO5jOPomgtPbvgL0solv8k5Beza0RDiFsQtXKo78v
	 FAkWnb5P7QNdk5HFRPaQIlzCxuJNQQhN4T0BaQoDvmvzvntLQCxCfPXlsg4yT3QDu8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gm2pXlyoDZjy2jUYL1gRIjcpASld1ugjhk6MsltZUAM=;
	b=DL7+fqtNLEOIDLWgM9hoKiBOGOTuG1gZhoqtd66DrQTq4sp3007Y6XSHw3jgO5WfVMfq
	 DH+GrxCnL88TACNTS/I/M/XuQC+Ch7dL1LnpQ9iZCUVls0EpVqmHQTny2mVgohq2phwYY
	 DmeQGVxGeIOI8Dgku0CQkmEeO/FFdfkYsYwtIaPSsM1TwT2YFNV20n7ggEAj8pNkTRGRj
	 OhyXhIObipfJi97Z1pZKoc7IbhD+WxyVt4eWJXpv+RbuOA1+K00WlTVjvjmR8Yl0++PpO
	 e/xf1nMnhLlyYPXLKrBMpQSziVPtJ/vcAlxIk9KO6rR5MMccEgtQq80A5+gy7vCHOxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCAL0ddC;
	arc=none smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452D606A890
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 01:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0452D606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCAL0ddC
Received: by mail-yx2-f11.google.com with SMTP id 00721157ae682-8b3b57f3634so4991367b3.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 17:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794445838; x=1795050638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gm2pXlyoDZjy2jUYL1gRIjcpASld1ugjhk6MsltZUAM=;
        b=xCAL0ddCGHZnPC5Wrwcl37yfmJpsvtmtYF97Yt53/pk4qxha+AbRfJftXdWAALwMF+
         WCV3lRLwWRmRX5H87D1V71yQQP2uOsZTqqbWPvhFdZSe7ZVeSBUG5Udqxxc+pYrUAfDx
         HpIjPNEE2uWZEkQlGJp3LQyqWrGzqA171vId0Z+RAY8ebWp+wM2rozEHjrxO6cWONIIv
         fok5pbUitLXm63YzgoMeEt2x2arR7o5SnGTnEAuoWmW8VNe/rk1IHum6o8woPAL9Ccjn
         7dmo9Dh357q1DsiCQYFOh4SBOtB7mLUa+lPhdffYw7y9lEisMtZB82cSokAb7egFF3hk
         Qz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794445838; x=1795050638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gm2pXlyoDZjy2jUYL1gRIjcpASld1ugjhk6MsltZUAM=;
        b=f5S+qtYTZpwAQblBp7qweXs/+Fq32grK1B5oMxE11w87ev9b4m+pXdj06rntpza3GR
         Umh2pPq5JSu1v+cH4OduP6TgKqWX39x6TAR4t0hJBFmb1jHxtyhpMIL6mDel6jjHz71r
         /80sV0EDgZs6BpuzgVBj+Zi2qd9ryW7HD05SrzvgPBnqvuCXZbwcP2vcN5pZS6ORE9NH
         B1caplC3v4v3zA/gPkakoHTyU2b0ytFPPC91SWF2YlsKYlu2VCuHiiPSM0ocuCGDOe/W
         1sy2uTS6POIru9i2tT36y4s9zYN6VPoju4E4thHPoj2nD17cHmDH4czOTPNc9p2GUfVB
         nGuw==
X-Forwarded-Encrypted: i=1; AL+hErG6s7ZiFEGKrDGG3d06JeGgKV+B8KH7F4VWU2a7hbQECcvflI8/aFC9IkL6m2Z7OampCR277rTe0hgstG4f@lists.linux.dev
X-Gm-Message-State: APuU4Z9AOJCKWFRZu3tpZu+lBwB4OC+ALPqlfoZkRQE0ruaZ2q/QSvJ7
	6hbRlUS3F1SJCPExrQ3j9rvxrxzW7HZzrs0asvxsoKpJTPfSP55vVHYa
X-Gm-Gg: AYBFou2x9qYeFXO63hE45y961xEERq4Z8l8XUa7pW3UQ967fDa2FFlbykkLAaUO77OH
	/YvzVe9y1dWIjYTDJKlSHN9V38TGoifS62QsDoTvheHDezSQOtEjqbw20LmYsaxnOfa9wg0ocQy
	9FpM8phU8kQ1ZH+uFVVurNBlITiKgL5pSnNLI/U+GCRIZXFOEmMX9U0NNJTvbp5fNYbkDdZn5mS
	on8iphgaEladoL2iOeuXMPq3HrqPW6Kw3NMZcs1q7D43ekCM7iLDynyfnKD0lBjluMadPvOgzy5
	3lkr6vUNChSGgquD9qd/bzYStnjk4tMaIKypWeZbEQ8DQCMx7QXKfxYfSqpXHPHAAW5J2cwD87m
	pMw/JYkNbXU/rNy8VstCMO2rDiaRwelzYzaaOGHxruAprdpv/Yqiv0neWuPIbqOBGJpIJWATPvv
	UPNaZd0crjlazioLulNjqJTUh5XwKOdQtYdbdbcSVqDkdNLdGSvu5FS5ho+3+W0EMBYMuUKu4fN
	5+HJIAWrYptrBKXd3ORcG/CYAm22Qpmf5wqQirdHO+MFRuwaBh3WVr5SwKUL3+zYI0JyTG8Gd40
	Keq8NeD7qp2VIrtQc5f+yYGVM6IW+sRbk3QEASVIUg==
X-Received: by 2002:a05:690c:39c:b0:8a9:cdd:faa with SMTP id 00721157ae682-8b3a81dc415mr23588437b3.93.1794445837938;
        Wed, 11 Nov 2026 17:10:37 -0800 (PST)
Received: from athenadria-developer.attlocal.net ([2600:1700:1350:96b0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c6e207adcsm2591300d50.15.2026.11.11.17.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:10:37 -0800 (PST)
From: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Subject: [PATCH] staging: media: atomisp: Remove unneeded return statements in irq.c
Date: Wed, 11 Nov 2026 19:10:25 -0600
Message-ID: <20261112011025.101375-1-hmjm081106@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Remove the bare return statements at the end of void functions, along
with the blank lines before them. They have no effect and checkpatch.pl
warns about them:

  WARNING: void function return statements are not generally useful

Signed-off-by: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 61dea386361a..6ca8fcd61b36 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -60,7 +60,6 @@ void irq_clear_all(
 
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, mask);
-	return;
 }
 
 /*
@@ -104,8 +103,6 @@ void irq_enable_channel(
 		      _HRT_IRQ_CONTROLLER_MASK_REG_IDX, mask);
 
 	irq_wait_for_write_complete(ID);
-
-	return;
 }
 
 void irq_enable_pulse(
@@ -120,7 +117,6 @@ void irq_enable_pulse(
 	/* output is given as edge, not pulse */
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_EDGE_NOT_PULSE_REG_IDX, edge_out);
-	return;
 }
 
 void irq_disable_channel(
@@ -150,8 +146,6 @@ void irq_disable_channel(
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, me);
 
 	irq_wait_for_write_complete(ID);
-
-	return;
 }
 
 enum hrt_isp_css_irq_status irq_get_channel_id(
@@ -212,7 +206,6 @@ void irq_raise(
 			    (unsigned int)addr, 1);
 	gp_device_reg_store(GP_DEVICE0_ID,
 			    (unsigned int)addr, 0);
-	return;
 }
 
 bool any_virq_signal(void)
@@ -251,7 +244,6 @@ void cnd_virq_enable_channel(
 			irq_disable_channel(IRQ0_ID, IRQ_NESTING_ID[ID]);
 		}
 	}
-	return;
 }
 
 void virq_clear_all(void)
@@ -260,8 +252,6 @@ void virq_clear_all(void)
 
 	for (irq_id = (irq_ID_t)0; irq_id < N_IRQ_ID; irq_id++)
 		irq_clear_all(irq_id);
-
-	return;
 }
 
 enum hrt_isp_css_irq_status
@@ -302,8 +292,6 @@ void virq_clear_info(struct virq_info *irq_info)
 
 	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++)
 		irq_info->irq_status_reg[ID] = 0;
-
-	return;
 }
 
 enum hrt_isp_css_irq_status virq_get_channel_id(
-- 
2.56.0

