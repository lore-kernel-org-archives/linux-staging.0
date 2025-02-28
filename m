Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086F627425C
	for <linux-staging@lists.linux.dev>; Fri, 28 Feb 2025 16:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740759847; cv=none; b=tstoyB9diiFOwNU8DySZOX5uGXyMeW7xzEGTvIZdYukTUoSIjKJTx9pnxkkNI5piYq7f1Ulxe7yLNuphwf3v05GoBk40pWlK/kgJZksWSa5yJNPqY0RJp7qnut4WaL7nTcAueJTtm8aqR7SWyw2kZ2OXvqvg6K+L6OtOgWuFPJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740759847; c=relaxed/simple;
	bh=vw7uvbl/KnjEf50NZ9ggW2ca9g1yuG4sjfLATHQRM0I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=H7Uk/jfll1FffFFsU3iM9VH/BMVUw4nk6oG0kZmQflMuFW8MzRiP9WG5y68GKieu2emoNaz+DpyxKg/oXeFRUHDvZUKfDknS820NaksfX4i4KtVEery/kL9GGYoezz7JEEVd6zwMBe5m3aX2jYlmvHrdRaVAKsTsNoni6ST5GlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N13l16Yo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N13l16Yo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22104c4de96so41167215ad.3
        for <linux-staging@lists.linux.dev>; Fri, 28 Feb 2025 08:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740759845; x=1741364645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZpdt6SfKLnffkI9zi8NmCtVZiMpf5sWSLXSEwyV0aY=;
        b=N13l16YoWeQsPTxQrUMNT513NUa4I9bOt34JElyYBSdyfl3nGb/IRn685/IiakNUZV
         qU2lgGr/BYKPMBUovBC7jIAMX+eZEupTS1MgCbsCiNJ7lDxy0CpTOO8tTk3XF9aVacm3
         xwypiuy1551/ifAZfhzT40aX23daLdRztaagvmBfv3+tgTo00huJxglJNJ7a+6SUeXcx
         7D/3W2PX6EbHdGcvn9/PwONFmalSunqUymbPxMSzmLiDsPU2XNEedBP0Sjcmad3EjUqP
         +PMzbbyN2a9m1be0e66duO3FZwpXmxxzlGTGXhHlciDw01Ys5CbZVS4XYDOPpG18VUjO
         Jpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740759845; x=1741364645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZpdt6SfKLnffkI9zi8NmCtVZiMpf5sWSLXSEwyV0aY=;
        b=CyGGwjBfqTAnRq7/7W9wxSgfK27BFYPuP9MQ1vZKmJxIX3CugShAuQzXBz8lCfslAd
         n1Ay8KwrMLCdQPSuOe7ZPUfoq3LD2c7LwKvPYYd0cRke/UUvWcQb5qnPxqYEaTB1dHCD
         3rXD5e04aXeDMtNttj6Jch29s9QyLp+mXGClhxIOz8KrdIl824IIn6scnZBq5ENSigFG
         Dsek0vdFGNl2Rkfg+/3pHBxEd5elbGM/KEwCi+D8wFnCJ7QXfHQVJBz+jvTXoTCfOTkb
         DNFFtU1eKgnjxhdhYNW4mGe2aVAWKPAMj9NKbNXT766ItnhWK7g2ZZ/JBORxi0yoH5oS
         5cFA==
X-Forwarded-Encrypted: i=1; AJvYcCW3p5q0U+mglPuc7PPzjEgqogIXcX5D0kSJ1Gl9gzdX1GBp+41DSep2xkFnIX7c4JY3swx11zBRIFHZKLJE@lists.linux.dev
X-Gm-Message-State: AOJu0YyeBUJAPlkaeTIGnnvCCQ5TgRUs7f0KBhEPmK+oD3I/xPf4TNHQ
	Xys9tKNhK0AVNxa5R1JmE3NdWFz4PKaA22Oo0Wa95PtqYfEEM6du
X-Gm-Gg: ASbGnctG69JSkBVIxalciXi2DS7Xe5CFAWlS8RK9SxnSxKx7KKHc3a1rxyDyq2KIg9x
	R4Dsq+zn/1KX90BmYR6TrXAN+Hxj+Z/NmU885Bp15VUeDDdvFIGvYDHfq353pZMpM6/QCAauHYP
	lrz7n+sqiu3XE/nnxcKNRg9Sdj8tS93VDMj5KIdUs2BXqzjQ4ag+EY2n61/MAKql+++nMYHPVi6
	M0sF4wXMu9oQ7OFYQEpMLVzDbuTYQQPF7tFvoDL6RWjHBPeLVHWWRYdIUdYdEHCtK9+i3d3Z5Pz
	DglSXXGuFBAkYFTqRGvNFtMvS2NB1Gsi
X-Google-Smtp-Source: AGHT+IHrtOlJgkuMI5Re9PzG8aqsWYDH3G9O4iLan31cBeWX+IS4/S5MnY7luo+6Iswn9cjuJoEaTg==
X-Received: by 2002:a17:903:98f:b0:215:9894:5679 with SMTP id d9443c01a7336-22368ac4102mr65842995ad.0.1740759845165;
        Fri, 28 Feb 2025 08:24:05 -0800 (PST)
Received: from Grommit.. ([2804:7f0:3f4:eda3:51e0:e6f3:28de:c05a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024d1fsm4084725b3a.103.2025.02.28.08.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 08:24:04 -0800 (PST)
From: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: sm750fb: Fix CamelCase variable naming
Date: Fri, 28 Feb 2025 13:23:54 -0300
Message-ID: <20250228162359.14029-1-lima.gabriel.luz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Avoid CamelCase

Signed-off-by: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
---
 drivers/staging/sm750fb/ddk750_power.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 63c9e8b6ffb3..33e852fe6949 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -3,10 +3,10 @@
 #define DDK750_POWER_H__
 
 enum dpms {
-	crtDPMS_ON = 0x0,
-	crtDPMS_STANDBY = 0x1,
-	crtDPMS_SUSPEND = 0x2,
-	crtDPMS_OFF = 0x3,
+	crt_DPMS_ON = 0x0,
+	crt_DPMS_STANDBY = 0x1,
+	crt_DPMS_SUSPEND = 0x2,
+	crt_DPMS_OFF = 0x3,
 };
 
 #define set_DAC(off) {							\
-- 
2.43.0

