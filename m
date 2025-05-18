Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1F01A76BC
	for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747606198; cv=none; b=LCEPC7/OnhJNUU2/fkYkTbmm9N8kahBscrDwetCV8BhS35fwHdxNt7e4i5osxvSBMYARGEEGxzJyyOFhHPwfip2KE+HuNoXhT0NaAb9rFUDyXgf9A926++C6hCOGvDHoxepB/05fOqL1tLlHq5tTT223ObdBA1ziCTfGRjmDjlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747606198; c=relaxed/simple;
	bh=WUUkI/runPD4UYFAWLA4UTyBwT40Tgtc9DAcQ9wpeAs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=T2PDpG9b9zoS6n4X7oDicxatqC8A4+HPe/5dldWg201s0+nOE+OHzlAyDPBtFqeMe2v639pNx6N9hNCenzhYOvCtu7rpbmhv/xTgzxFOLdl5ViHTw4XaZndv8b+qL4Ie1ViyNdzOvZ9zPX6WbdHkyFzdQt2PS6ctfpH86C0p7Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lhaq04T2; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lhaq04T2"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22de54b0b97so34964485ad.2
        for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747606195; x=1748210995; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gfhLPxw+UZ1Sf6wlYpIDTg9JpsqEdC+eRzqAuOTaGg4=;
        b=Lhaq04T2I0lWVsRmIQkYNKNjjzCNEedOdGFk0JanbGu0wv6q3GNC5DIQ8KX6KeUrCx
         v1CaVDc2gB0UEN8lOJn2xGjsMhJvpGdD5s8pUleW9elDClQLM+0+jZQbpqfG1cYHq6CX
         8BiQWou0K6x9BguNPEXnEpdyxVRhXKnRDuZ3LhYWTmdVLN1lemjlBwuqSjQgacs7+HsM
         RgFTsNpEwWw7or2uQjxaw8XdVc6xsK2UMQ2d6tc+kQKFG583wTwLOmKgLDzvyXAmaIny
         p6KeyQ9s4B1ufI6Z2hYiR/odQg06i7VqBosDbkrTGaXq7jnZ7d9EKDl2mpl0kUm6t+Az
         uJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747606195; x=1748210995;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfhLPxw+UZ1Sf6wlYpIDTg9JpsqEdC+eRzqAuOTaGg4=;
        b=pb4cwCRTcfcAJ8l+awh8MyFgLCVKMEy1R4Ysg9A9+uf14TmtgD9dAXfo3QaAIFoxLa
         h3hlBKp81EefxiaOe/kuDd966redv88m++MxbhrjvLqvRXgFnIqNkgpYDesfuw6nt9GG
         8SBDoLu5mwCGawecvWRJUaIHK2fzAGqOmNywi37amt+EsFC/soEQ3zV3JGauFsH4/7u0
         TjQqOcK7rC/eXsKejLz2n5e5DDlO9qW6PLaKzUipaDma9zi8ORkl4fYaDXKZ3OEv9YrF
         tlfcg7ivC4mKb46y9FkqgqcEn7kdzFIn53G8hVMxIiuyOkcDl6tClDcDMtzDo9l3NG3M
         b97Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAYd6NOJPH/zd6+BGLY2rWBWnSuSAFv+rSgIQeHrFkn1mwjsIrrS5rd8EbfOb5TRilg1LNQmtqbw/LZNIe@lists.linux.dev
X-Gm-Message-State: AOJu0YzeAljxOdELIi6wGW1mvaa9CWHY9p4Lm4PJqWY0fMTboyuTaQRw
	UBd5hlA1nCeoYQRa/0aN0nhB921j6xAdR0eCGNxd8DQ7VP+IZDp4XQyQBIcJV4HeXUwodaHYZH3
	zK0CHlYnMU0x6pr7M/8P4AA==
X-Google-Smtp-Source: AGHT+IE/fmUAhEdNDzUegq5lLa6Q8dX9Z5TuEMtadBh3S+h8FbzaC55CAiy3l07PTwJodpEclNws7FtKjuJY56b/
X-Received: from plrj4.prod.google.com ([2002:a17:903:284:b0:22e:327e:32c8])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2f44:b0:223:88af:2c30 with SMTP id d9443c01a7336-231de30281bmr131476915ad.16.1747606195043;
 Sun, 18 May 2025 15:09:55 -0700 (PDT)
Date: Sun, 18 May 2025 15:09:45 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <cover.1747605658.git.ericflorin@google.com>
Subject: [PATCH 0/2] staging: sm750fb: style cleanup in `lynx_accel`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

This set of patches covers two style cleanups in `struct lynx_accel`
defined in `drivers/staging/sm750fb/sm750.h`.

PATCH #1: rename `dprBase` to `dpr_base`
PATCH #2: rename `dpPortBase` to `dp_port_base`

Eric Florin (2):
  staging: sm750fb: rename dprBase to dpr_base
  staging: sm750fb: rename dpPortBase in lynx_accel

 drivers/staging/sm750fb/sm750.h       | 4 ++--
 drivers/staging/sm750fb/sm750_accel.c | 6 +++---
 drivers/staging/sm750fb/sm750_hw.c    | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.49.0.1112.g889b7c5bd8-goog

