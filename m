Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDDB126F3E;
	Thu,  7 Mar 2024 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818180; cv=none; b=mOfuApF0tMU91i3afNYLmXjqpPT4vMWFJ1yByZrwVmENjLOEXSYZbryEjEnAG8SpdvS74UxOHOrz55mgcI7/9mR3h6DoH+yyUKSS7iijMs3yHn3Y1ihblbpaJojRXPUA8XCI5OZZEuFJ7ax6AFrKwkndittcZMTLWKf4+O4wSfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818180; c=relaxed/simple;
	bh=TfhQye8+kKsaw6p4zzSiLXV/FEFNRVDo8eLrLLyKvvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qcQMMZbEBS75xbSkQMLBtH/faQWzw2m57laVEiYRtDbwAcbpMdcwdQN1Te6cU8Ebzm6vmE9Uay2UvbiqCM5TXn7FDWSHLadL6N6Fz8rnnn8dkxXrANPQ8kdCwJxt/VZy5yhKfz/w0gIuk1hBCuEMb2oMUZ9b9vxRlgYOJV2l/Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqCSDAVA; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqCSDAVA"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so1132608a12.0;
        Thu, 07 Mar 2024 05:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709818177; x=1710422977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN8fkyCFm0Sk6kiyFuMvtIhU+xOrBVIA/3EdyvxsHec=;
        b=JqCSDAVAoB+M0K5YHJN6/OOOA+Nq7/iodrW8JXtz0YoZUgZovz3fs54VYmdgQZy31F
         uomF4BgLtI71FEfurlrs6z0dUzAsPHINaRRCjF8IZpiWk5jIU0EPbkChCjoSDYDfnhcG
         yHRabkIGHxuyTvwThOzjwBikI/w1UioTxa23BljUtG2Q23OnHPb+Ny9/RMawsiAV+On7
         zMFIT4KC3XsUP9ULI/WLetQOo7aN3AJhr5Y3HIjShhgHUomCdi321NVu3KIyZTLl591F
         L1w9UNXuikph0HQdxTUTXVYikYs0YK0CqJ3nhsgQxHCioBSFamqDNuKDxoK7Lq0Izmqa
         Oj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709818177; x=1710422977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN8fkyCFm0Sk6kiyFuMvtIhU+xOrBVIA/3EdyvxsHec=;
        b=kIgCgH4BZQTxy084Vg03Kj11BMgNAal97O8WomLELeXpccpfKzwYDuI5AdHV0jSnE8
         WlgoVQsMvQaVI1tHSWKyviEbnySPkMNXxoyc3ObCF+HZZS/Vfv/bJnMqYV8wk3qurmgp
         /jaSJJDtJloev22fO5snqml8VDUWQ4+9fGRASnCLoPdM+UcGQ3gvGxNV22CS+ux65V7x
         bI9sMH53pF+wtdenvbNyRd0PdfY4W1io2R873a0FvTzROtFZH5UqG7bnNZ8CcIt3o3Qm
         rsTTa+wnRqGibF7q+6ycn9vWznv08Nl5NqV9aFqOSD/bdvzuvlZhIj6APlOZYIpnOo1G
         5Tyg==
X-Forwarded-Encrypted: i=1; AJvYcCV0rxfGISzzAsRVYVlEB5oLeEmJTawhk69rE5IwbiajItWOKbQZDdyN6eoDCjRkLHZQ5IkTd+cgyeG7jAAHeXEAEPV/Z97+Hc7JYlvFkhfrRB6CGvxTGhfnZmdusknt8zNRAp/SvONHiw==
X-Gm-Message-State: AOJu0YwXf519f6IZgB1vIeCtxeMNwW/Rapo3GDxySCInEMp7yMjSz2qU
	J6gkTNZ33sa/5cwz0B/WmPMktF7TDktm4euuU/Ntn0VAKNx/Vy4Q
X-Google-Smtp-Source: AGHT+IHOuQg4jwffL+6pXzZnddYUH5w94ptCyG35QdYjRomwt/t4W1rb6at4IyiimzULyigfrfy1TQ==
X-Received: by 2002:a17:906:3c17:b0:a43:86f3:b00b with SMTP id h23-20020a1709063c1700b00a4386f3b00bmr11945706ejg.0.1709818176918;
        Thu, 07 Mar 2024 05:29:36 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id x14-20020a170906710e00b00a45769e8e58sm3904401ejj.219.2024.03.07.05.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:29:36 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 1/8] Staging: sm750fb: Rename sii164ResetChip
Date: Wed,  6 Mar 2024 05:44:51 +0000
Message-Id: <20240306054458.102288-2-dorine.a.tipo@gmail.com>
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

Rename variable sii164ResetChip to sii164_reset_chip to silence
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added the patch to a series.
    Fixed errors within the patch.
    Compiled the kernel

V3: Reverted a commit in the same patch series

 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 3fb14eff2de1..6dee95e60a6e 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -18,7 +18,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_vendor_id = sii164_get_vendor_id,
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
-		.reset_chip = sii164ResetChip,
+		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164GetChipString,
 		.set_power = sii164SetPower,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
--
2.25.1

