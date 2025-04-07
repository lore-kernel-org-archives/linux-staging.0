Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD26423C8A2
	for <linux-staging@lists.linux.dev>; Mon,  7 Apr 2025 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028727; cv=none; b=Ivnd2RdFNnsiG2Y6PEwDjsguqX5vOk5QKkkcwANt7GV/aU/ZIbj3mVU3Yy84zZmk7X1GL9t7ESpNvEtUN7TO6aUk6kAtZwLPCutaLjJ7UEkmouPFU9L24YSdOJR5s89t4oEycfpm0RN35tXojLA3ti3+5d6qKdoHdV1p2rc3PdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028727; c=relaxed/simple;
	bh=xmKme93midQ+JJDFdHWVCcn+RtOTg7o4q+QA9nKEd+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WvGHdvYP1937APu/VHj1jHh02RTJxvzvK19fzDs4MnE8YAT8yTUo82YcPsirv9i3Aqsjk2zi/W4QsBK/43K91/Wpl+l35gYOn78ANvtzl+9ricP8x1QWckfzhf+K3ie6ctIdBw2LO8sPA1RVc7X+MZU4/92cX7niXXUJxDqJyD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUW/CuNz; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUW/CuNz"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so6586626d6.2
        for <linux-staging@lists.linux.dev>; Mon, 07 Apr 2025 05:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744028724; x=1744633524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cn9ebfllB7wRop82dN1NbH3lkIi5hYOeluU75VAyu0=;
        b=NUW/CuNzvHZXGaN8Pp55e38Smrlamb9b91J63X8+ssAgIHcdiFNod0L1T7YD3DS1Bh
         zG7n0uLuHrfjan2qQRA40HjrP7JJE4WB88kGdLLLihaGYc1BtWeSHUDvd4VSVroNgtBw
         exco2tfTwIG+45cbDwho0EFdp4oA5be8sHs7v+kLiHXeEuh85L2Igf+p18a6Rr8uf5rF
         4XkL+pGiCYiMUWDn4QsKMeBTXQAJgwWb/cggJm3Ck5fkxP51jiKbk19b47TOOnB1jQfR
         daCKmKEneEQrb8CIv887lpWJbYUxaE8GyBz2Be2KvgZvEyJOtZOjxcmXu736m3iwvkXL
         eB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744028724; x=1744633524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cn9ebfllB7wRop82dN1NbH3lkIi5hYOeluU75VAyu0=;
        b=ZEnZZjyd3IcIZA8mvHe5bq3qqIngrTn0io6K6e6t5614Gj5aQWVIosnnJmcqRCbQZr
         GkQaKQuIzuhl4ejcyRRCC/X5ZoyV8zJaT6O9F+JeHpbzv9XI9bhEASvQvUzPb4y5wXC5
         5mXYnptjAfkz0sy+uj3BaRLBNBuyil2ku52uoQ6vjz3h8hXUXm+75loDQpRmLGnktPHF
         yq4bXD/cAiL20QsUXBy6BnUTLcl3InTjngz6rXGS0ta+BRXmAoQcfvAmWFhJYXX0qElB
         mwRjKJPXpYBMdDQmpTEoASKydPhVbqXsXFMUisOAuuMWCDPmpbBlzngve/KwdPU7fK3z
         5gRw==
X-Gm-Message-State: AOJu0YwID7ejvpz14tsng/pqP6rYS12K9+7Y7h/j4mjkPcl+UK69QvGg
	sL8x+W8baaf3KYgldMKlPrRhRQ5VkGj1lAgVeuYlvZUYyoVTux45
X-Gm-Gg: ASbGncuzilGYC/OHUAwEJG4vNfjt+WklWvgGuE57GF1CRIWbEcijCd3mNuEVyXUEDkq
	9czkkRSRFwF4KQ6OSq9006J0Lu40kj8G2Cu4FQZLfBOjuJvvjWBLZynY34q/1E2s9kxPlQkKpMB
	gQgkpUOOTnpzv3pkDiyNBFqB0TEbDxvZuBPZuHjVcdipxiMZoCqf5JiZQuH8apGmSzHCsBw7kk3
	o501jbraShvUVNkZNCghmoHf962cwi5pF01JvydtpE2EroAq1Fy1pezRHzvaaQ0NhFhSt4Bj1PX
	YEJRognlBOqJRMjjiMfzTqz7PD4PwSlhrs7SrOndm1+6uv26NgpYg/Gi1R4=
X-Google-Smtp-Source: AGHT+IHC07CSqBBMnII1zKPWrQHUZaz3gKIakHZohts7j8jkKwQpEDDVdIgVf4BIIJ1UETe9wk/4kg==
X-Received: by 2002:a05:6214:2a8c:b0:6ea:d033:2853 with SMTP id 6a1803df08f44-6f0584ea122mr180835396d6.16.1744028723680;
        Mon, 07 Apr 2025 05:25:23 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f1501ccsm57166626d6.118.2025.04.07.05.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:25:23 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	kernelmentees@lists.linuxfoundation.org,
	gshahrouzi@gmail.com
Subject: [PATCH v5] media: imx:  Remove unnecessary braces for single statement block
Date: Mon,  7 Apr 2025 08:25:20 -0400
Message-ID: <20250407122520.364124-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces in single statement block to comply with kernel
coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Add missing author.
	- Fix title of email.
Changes in v3:
        - Resend using git send-email to fix formatting issues in email body.
Changes in v4:
	- Use correct patch version.
Changes in v5:
	- Use media prefix.
	- Add driver in the subject line.
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0

