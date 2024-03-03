Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7FF6E5EF
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709484977; cv=none; b=Kj82svKiY0OMb+lwmPwyeQhWcAJpI99BNOOMyUfNF8I86WooENMdkbA9lRGjK/0OmpwGb6jYTAqVImV8FJIn8Z3VO+NbFUEMUp4sRPi7dNaacd3Fa6RhNfiRfeFyl3lWfe+P5BVhVqSdCDUaukocL+U88Zfb0L9az2xJ40Hf3lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709484977; c=relaxed/simple;
	bh=uB8M5ZFqU823RPwkCme41wqgW8S1MAohoBHD2f/FRBE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=odr/Amoujlf9h5IG8AKxvSwEQcyiQ+/yoLDZ8Y4uEqZqivPgZ/aW+ifi40CxkeJSuKtv4+48FnCjh3WhFqB1zWHYRcfsTzX6Ri93JTsprdF0n4VxdV8XJwPSRIctholX29O9+h3psQSZIZvFXYV+8JRxIvLore5RiebaQEkdOSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXajryFH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXajryFH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5649c25369aso5291670a12.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 08:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709484974; x=1710089774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5trdsWXQ1l+BmpkQ2xBDJEcjKE6ifeu1ZxitnKw1Sr0=;
        b=mXajryFHoL1R54M8RbiIJxagaxv8NcYXGE6Z9Q3VEhS8WdJkfQSGlK1BFy3R+Jc08q
         Up8N5iES1whzyLwc85FRKmddeIRD79hcgg99/VcuAENVAIsMELBFGs9oNSaeaf0W4TUI
         yIO9nSeBw+LdBiEvEDswxcKljupkOwYJp2f4YCDEOitHJKRWI/TrzIQoTo5ppf5kS2el
         QjM1UXOTskO4UISjNa6l4J/E4kmmfhLr06CtWebD0KdnzsYSBojK27HJhTEQvCQpOMNU
         Tf7Xh3jTEpHf+MmkR+G+Xzcf5YSg83SutD8he1OCFAGxBdcvEOeS2ustYCi40G4BBtnU
         BqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709484974; x=1710089774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5trdsWXQ1l+BmpkQ2xBDJEcjKE6ifeu1ZxitnKw1Sr0=;
        b=SppamEjzbyUY5+iDTlo9yRq2L7OcO2RIRtjs2KkWS/IxtrrmXZnBsRxNHKOfJRadnG
         UaWoOiR/dJS8HrbMQK9T2g3gcthfWaieUYDuTc5BJrzovNPqiJRoF68LC8elYmi40cmR
         9h6upFEjfGf8Jxey1b/bPQSBzjwAi4gpVehrLKw9uZxGEFTUbS0MXF7Rq6kuIxdTxBQ3
         UdBiK2hkMvTQu6T6NyPv0ncV0gjel00MUXOMASxV6NldMCKsv9KPfPCajEi3BCC1ipJ7
         f+5pvMsGM3o+LEHbBqsvBVIhOnRiNE6Jr94zb5mwbgviP57JuWzLraq80EXmoe/25tsR
         FZ8g==
X-Forwarded-Encrypted: i=1; AJvYcCXgkUgluna8R5o0Ve3vbR26GB1l9ByuOpBm0dMsAL2a+HdXpbfPG1RgyJR8lVqIG4UKB5ljH18bSoFiLiCDd7ktdw0dcFMB3t5tQy0olQ==
X-Gm-Message-State: AOJu0YzXEJ+1RPYlJR81dLOLjytGYIMQ8UU+VVhgmyhaxetKytU7R4DZ
	tE8zwb0a52dITmk/UtrkXighnrmcYxeCd3/Qn4v5IOpLjQvdWNAK
X-Google-Smtp-Source: AGHT+IFr/+Q5FwilXYnFHkS0oVria4ZfBK0SJnLPrIG33Hdow0H6P536dcBvJTBTiocc7mUIugoG6A==
X-Received: by 2002:a17:906:d20a:b0:a44:505f:bfa9 with SMTP id w10-20020a170906d20a00b00a44505fbfa9mr4354830ejz.58.1709484974130;
        Sun, 03 Mar 2024 08:56:14 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id jw11-20020a170906e94b00b00a451caaf82csm715904ejb.65.2024.03.03.08.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 08:56:13 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] Staging: octeon: match parentheses alignment
Date: Sun,  3 Mar 2024 06:23:19 +0000
Message-Id: <20240303062319.8779-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct parameter alignment in cvmx_spi_restart_interface().

This patch aligns the parameters with the opening parenthesis for better
readability and adherence to coding style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 3e7b92cd2e35..44cced319c11 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1362,7 +1362,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					cvmx_spi_mode_t mode, int timeout)
+					     cvmx_spi_mode_t mode, int timeout)
 {
 	return 0;
 }
-- 
2.25.1

