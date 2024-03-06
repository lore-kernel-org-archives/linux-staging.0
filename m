Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CBC26AE9;
	Thu,  7 Mar 2024 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814057; cv=none; b=jNJeVIKlXO1xRiSDw9SKz8X58wz8MExSl84TIiTshT/Bb9ijJsoE4fz1o+r719mZO4VsaB9/RLO8odOUegCjZJ0lx5egf3ldcYfE4JlVDt14SZLrgGol2VgpFD/EGRO2SoeM/92n+XHFWjzv43M5lcKkIS4zqDtIub1lvPOekyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814057; c=relaxed/simple;
	bh=7o+VO8HNYRSafVC5KhnLxJ+wgfDU/WJP4Lx4qQTuCBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hSAUs9B8TcSiJcAEyNeplZ4/v/MQi9ZDAOzDi+GBFfKG0Otqxfjs0rwEqlCEVPdq5rvnzrFZcCIoHKEc/0UF1rXVffthmJhKZx3Aw5CCioiCi30VqUz3Z1tYFwQNXmYxP6noSoofsOO8oJQLQCPHmISfuC/Q1LUSGy8ZO6mVIjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXjSXYfU; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXjSXYfU"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a458eb7db13so120238466b.2;
        Thu, 07 Mar 2024 04:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709814054; x=1710418854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XL3qPag5LtZLbwgaDInJPfzFZRAMo6Z+w6bJMoBvGP4=;
        b=XXjSXYfUTlgmbtiqWdRtDma/JgRfWgG2Pa63PeXuECajGzsA4zD2HED/c+69xEZI0Q
         UFTYH0/8jjV0YOnawMDc7TWUpH2rJ1ICZU3zRRA9NBbtWg83I9wSgITH41TysA44180O
         EDnWD6p1jBI0nGyN8BFvkvk3yIz38i/HmQfNt6mR3CcrXWx1MObIRXAGxg3SGWq/A6oR
         CHJsRc5DyNJYluywUyY44z6hEt+0+HNlLZ0RztjiFERs2CjYKf10f0BKdyOsZDHvEG2O
         9Z8V20XpwIUPrU7i8qCsRiT8c22Rqsw9z4spZHqxNFSThm7ceuIpB+4XRpD4Fy+Ij98j
         Josw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709814054; x=1710418854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XL3qPag5LtZLbwgaDInJPfzFZRAMo6Z+w6bJMoBvGP4=;
        b=mpkwNGnMpC2ECUKYPk5BkmRtVQwfLcKO1Z52ogrwditgc++kuM5Ze6cEMxp47D+n0b
         M3+85N0VpnjPJe09XKRE906geSHho+ThLA7+f84uALtjO5xppyQcYSXHSzBM3xVXwYpb
         XYt1Vp2iZ9Y3V7k/TTjtDnjo2/yDbNa9azXCI3dC1K+jJyZHGiqjxB+PCBy/c3u2QnFU
         IjDr5rYZK7NfNYsaeOzJT4t8vY7JKs09LwEjfFzmCHnYFcOUrC2jsChBDAhsdKI0kkOW
         nTMTWPJnIEP5NCylizA9FAWmFWgmL1w2djvcNXAEshyr5tciO+nbABIxj0TpEF6UFS5M
         d9HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtPWLY+gYduBA9dYAMVrJ1uopC+1/ZGkWPTtaDD14LH92BI1/SPOVchD8dH/LTwlohKYv2x2jkSYJl8lNulGJTfj0rrquvkcFxTs9GPxi9ja8zoGtk6o3+l8s1lc3vZynQdaeiRF/QWQ==
X-Gm-Message-State: AOJu0Yz238KnwJ+E2a7M2FC5H2/tnBWyMoYYp1pTy5kHWAVSoeXYA+lB
	/Ye3Zitfc0k04uHYLVEqBZR1MCxtPKDsAEqCXzht6uoQlq++MxbY
X-Google-Smtp-Source: AGHT+IHbOkz0f4MTCKh0W8qd0RFcGUeKjE3lzVByfqm3/8j10N33v+X0eJTm3JWLEAHlbnddmU7lPQ==
X-Received: by 2002:a17:906:c411:b0:a44:7edf:e6bb with SMTP id u17-20020a170906c41100b00a447edfe6bbmr11722258ejz.37.1709814054470;
        Thu, 07 Mar 2024 04:20:54 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709065a9900b00a45bb9b81d6sm1643073ejq.195.2024.03.07.04.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:20:54 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2 5/8] Staging: sm750fb: Rename variable sii164EnableHotPlugDetection
Date: Wed,  6 Mar 2024 04:36:08 +0000
Message-Id: <20240306043611.98074-6-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
References: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164EnableHotPlugDetection to
sii164_enable_hot_plug_detection to silence checkpatch warning Avoid
CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added patch to series
    Fixed patch warnings
    Compiled the kernel

 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index c12df1f9fb00..1ce44c50617a 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -21,7 +21,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
-		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
+		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164IsConnected,
 		.check_interrupt = sii164CheckInterrupt,
 		.clear_interrupt = sii164ClearInterrupt,
--
2.25.1

