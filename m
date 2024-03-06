Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37307126F3E;
	Thu,  7 Mar 2024 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818192; cv=none; b=Bx7StoGgUgJn45la9xXT4fqNBQsHf5q5FESMwYarW7K5Yhpk/mnAA7qVybt+a5a7nVUv5qbH0f9QHR8MK2zKFKuzg8YgoFZLJQAMFcYWJUUXcQlhMGTQhtCqcP8WZ94bIFsCiQ1CkET/173ar/wObYuFvXbLeTGPhdpSYbUmSpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818192; c=relaxed/simple;
	bh=R47DsG//AxrWdYf8iQXB2gIo9z2P64gzY7xRWVY+uPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lyCthLcaBmjh/I5/QCv7Mw8yOawCYCmyUa7cK35RGADPjA5zg25x1Ix1/rOhoG2wQ8NkoamfBzf8Af7/GHQ7BWY5L6MFLWGQvKfM4jvP4SIEL8WbjPw0KRpjHSyVDj1o7HbVuFz5atyBhpKnCPWcw3RuXfs9QbIMjvRvOX/B+/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ko55pdc3; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ko55pdc3"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-567bac94719so1044370a12.0;
        Thu, 07 Mar 2024 05:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709818189; x=1710422989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/Hf/WHvJYnvdk6aAm9VJWSPNBZ7PYU51Yu7wvZp5lE=;
        b=ko55pdc33sChZXkBh7A1ZaLGdylGDXebsLn1Q/wHhamTv8xPogmXa4Rx5GogebCKaI
         3lcTZaxStDWQIU7o6HSiDWCVUDoWod6LC3AoSSnGMwZxBhvM5cZMHwdV4TEP3WEg/vRf
         SEeQIwG799GX9gphodFK74rGR0ODEfs50fYnQwQUBa8v7xWgS/ybpD/5kU7uZi5VBdcY
         ryHna7krkHV2xeo7KAm0nVVf90ajMGxxhbkBVuoVWp03/iEGBH00ocr1YusFeLVWMBsk
         rBQO2a++naa96hrpe6DAnq9YcYie8y503B9F0cslSJ5mYqOMhHH8M1/RPyo0MWmM1JPc
         Tp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709818189; x=1710422989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/Hf/WHvJYnvdk6aAm9VJWSPNBZ7PYU51Yu7wvZp5lE=;
        b=BFahikSZ+Ezu313mVHOE9Ciw1YATRyTpo9CQkjvAiSkKPibytCwhFzi2FNz82G3FlM
         T8V4QZFNYlP9QXfCT7sOZWIdRGIzkn/sBMJmmpz3BDQO346dDDhyWA6gKitBRORpZvzc
         8aDhWeUcah/nR6+gnoU+rurSsVBnkG6DV2Nliu5W1XU3J1hgH2Z8Rt1OQ7rkDQu3kYYT
         XkKCxcbRAtDXtaWZoNpYnPcs2cHKjCNkKDSox9lywt3dqmcE4Q8A3Q+EkmcB6xkt3cN6
         clgNYQQXhVzTrVpHNf+pv3LQ6isfkTrH4zrRJBz8w9SNRtBd3mW7COOcY9BTG8MDPPn0
         fpNg==
X-Forwarded-Encrypted: i=1; AJvYcCVwm+ZIz9N+dPatDXz21Fu5f4BSi+86/tRvFRNxwyc/ZWxBOmkx0hqrKU7SBMLDL3sA7vgMDWIUdAHMoCVxNVQjWmeyJcO5GJVi8bJpgC68XTIh+MKyOZjg+UCL3restbz/QBqjPigqvA==
X-Gm-Message-State: AOJu0YwM4rceSveq0IHW++lQ6zJBttK0lD5xMPL6bzMSpBdB7IsMquEn
	KCqoRpcgTZcq/GUuZKS6VklOZiSk0o76NB+w0xjBdNuM1DdVsPgr
X-Google-Smtp-Source: AGHT+IFnJIq6tWYl5o9ukOyn66iw7ivainrRFCUCtLrP/eh3EYKIerDZCXySTepHS6RPzZzeinsKvQ==
X-Received: by 2002:a17:906:cec9:b0:a45:ab5c:42a7 with SMTP id si9-20020a170906cec900b00a45ab5c42a7mr5085835ejb.75.1709818189283;
        Thu, 07 Mar 2024 05:29:49 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id x14-20020a170906710e00b00a45769e8e58sm3904401ejj.219.2024.03.07.05.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:29:48 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 6/8] Staging: sm750fb: Rename variable sii164CheckInterrupt
Date: Wed,  6 Mar 2024 05:44:56 +0000
Message-Id: <20240306054458.102288-7-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
References: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164CheckInterrupt to sii164_check_interrupt to
silence checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added the patch to a series.
    Compiled the kernel

V3: Reverted a commit in the same patch series

 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index ac1aab77da28..1def02be4cce 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -23,7 +23,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164_is_connected,
-		.check_interrupt = sii164CheckInterrupt,
+		.check_interrupt = sii164_check_interrupt,
 		.clear_interrupt = sii164ClearInterrupt,
 #endif
 	},
--
2.25.1

