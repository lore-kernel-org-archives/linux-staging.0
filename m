Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E19313524
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619613; cv=none; b=Kur+zrS64tYviLexCQtiNT3kFRFmCa6/uLneupvH96qj+7gWYJxF9IHQxtHsebNOd7cC78e/yL+G7vu8ssonM6jEchqZns1plqfo/rK1ug2qDdD9QISdOXnlpdw6r6uQTLSRZf7bR1ZwR8jVlCxg/XS4ABnHmbi+fhja2Rbw+yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619613; c=relaxed/simple;
	bh=CNRPhu53QxXcdG6SjRDofGKa9r9A3ndm26+G+UlldpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRQU01RKDLCW6eFFEERtkYp8SuPPTNjjrnHWmeiiV8l9ygVZAl9Z9xksoFkVdZQ/RizIDn20A9La1uHu8PIC+00NSiGFJjV077nCxTEP3d/zxyUx6r1ZaOz6dJzNsjgQxgYQJNaTThH2fqn9O6xykFhA+6Zk0lao1g4r5s7Zm64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMgJUx5G; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMgJUx5G"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806bf39419so7676895e9.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 09:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769619610; x=1770224410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBQss1jJFU5a4CFP0vqS7yMKyxU2b/P3/2L9s6yVfrw=;
        b=aMgJUx5GiyiOghIOZ2eNUPqa/ZBh5/hrAFdVk1kkec21HPCAcGgleCA788yTjhaSB1
         qs9DkbOC4JlsGDbCTrVp30+pob2b73o8UIiK1EOc+eDwuh2rLBa8gM2J53II2nDEV6ca
         mpvbP5GvGGG3B7P6WE0npa4o3+JS76OjzLFSBhCYaCfa7EYzt5rFs+0MnisyzBNPW2OZ
         CVL8QHRx+KeHJtP0jC5YqWLjKzsa302xu5w2Y8skssTt0EJQrDt63mg6my0O/SrFIY+w
         sfFU9z+l0ZV6sVUbBQHToS3tX/KPa4h4DGX+3pJQUG6H1LYH0gzvT0uMSrL6VFpJ134b
         8evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769619610; x=1770224410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBQss1jJFU5a4CFP0vqS7yMKyxU2b/P3/2L9s6yVfrw=;
        b=t0X2rnM/gF71n0OZT66vMoVC4n96AUso1yFfzGoJDqxz9BMvaWrUC5cwajwUIftyXE
         3Qf+SV3rSk/gjWKtMpu+jnxNaIJsDYjfrNVN0SgdGBfiQKc9vjqT2Aw00oiuipDo944W
         3gixZp/oJGoFUgwS1DWamDtv6j6imWlPPAiVoUEVgPd+F9fUISKxztdmcuOEjzlwsghp
         EaqjOu+arB57AyGWjMijJTNLEuaXKktxBUbsPEty6mz3Kj2M57OaI1TxgbgjN7Mu8fc8
         upE8eooZDB0kkD8r6Au7SXLrmUiaZH1OpedMvW26W1RMC8nLOEHra4h12qNY4MbPzwS4
         F5yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrMfSQOGAUj3ICdswzT00wkCOJBL6Fafdvv3xLJNRllvXaF0omzf51dMgiuNhd/ot8LImpaQ0rcW12xm66@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+aPNr5sGj+Bo4SLMk0J89kx70I1Z1d3g2eyOrJrc/bon41tLb
	DV8fxng3JmOKZJtduHFqgoDveXrQ8jY2x2z8EFLFtk0MYSmDdW+kLSc7ojgc2d+W
X-Gm-Gg: AZuq6aKUR2oXDuWhm/AO6i+5FJhpXBfz1saQgTSU0J5CJ0+yCj7WNO/xXd7rupHbto5
	ZY5am7wcBGQCUDLx0eYQgNkbIR6vUM6YGLU0QSNSltz+fdWcGo5N5a97E3UHfVbVNKegNsKnDh+
	pUXbiEpMuN454OYi8U5om8JTb//EV93AveluU2vx4Vk+UI9fHVBT2ewz7a7i6rtSgyQ2Tw3yAGe
	QtuSaGLomGiNc3i/JQRzifTptU7QmU5W0rAVHzqsKZfKHvRFzQ1MJbl+JNJHwci1/MvEuuAYM1B
	ERVHHthHmOEcA/jPDFjhaha9kwVHSxHEE5xa8rTbUUXHTixrb+WZGymsAdapzm7A328ChWhy9+v
	X59SirukJbUCN2XVHyQ/sKEQDy3531npvUGc7ZnN7nwxJcD9Hl7Sr/qztv5KwMQpMrz8YErSpbG
	+3DfS1lVim
X-Received: by 2002:a05:600c:3b85:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-480829b8e0amr1241075e9.16.1769619608142;
        Wed, 28 Jan 2026 09:00:08 -0800 (PST)
Received: from TTPP ([31.176.186.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdebf86sm71964775e9.8.2026.01.28.09.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:00:07 -0800 (PST)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v2] staging: media: ipu3: fix function argument alignment
Date: Wed, 28 Jan 2026 17:58:46 +0100
Message-ID: <20260128165846.20375-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125134900.9964-1-omer.e.idrissi@gmail.com>
References: <20260125134900.9964-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment of function arguments to match kernel coding
style as reported by checkpatch.pl

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/media/ipu3/ipu3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index bdf5a457752b..84c4d0bf027d 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -151,7 +151,7 @@ static int imgu_dummybufs_init(struct imgu_device *imgu, unsigned int pipe)
 
 /* May be called from atomic context */
 static struct imgu_css_buffer *imgu_dummybufs_get(struct imgu_device *imgu,
-						   int queue, unsigned int pipe)
+						  int queue, unsigned int pipe)
 {
 	unsigned int i;
 	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
-- 
2.51.0

