Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B29326D51
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226114; cv=none; b=qcP2ANXI73NSF70KFtHcfaGaYDou/aF27AP/drgzbdviV6OUgbhAC0qp5Ok569JFxqvhPmfukRhibB/9m5Ur2nyIDirMX0vrL9bp6Fe+HvI0MsofJgaR7Co5E7YX3R+cCFYkXQu8W46luzvJngoJtuFkgHnfGNEn6zt/vX1ed0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226114; c=relaxed/simple;
	bh=Cg06gMoy2UPUsLWbxGNfQ6PtyckbDHioBOofQYRpgpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SX/DL+T/WggiSx8GItXunwiaqwXiJj4frRaPfa+GlDEL4pQNqL0GX1nq6Ua58c8BPLHezzW15uxpkOoZlF+7eOQDp7AFJnNMK/rZDekdC/gtRTocTjcedmhzpK+voVqJXvDKp9ytoCjQj6PYLdN40Oa95hK0OgfOwzOK9tTQCDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfLLv4Gq; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfLLv4Gq"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8422f395a4aso806097b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782226112; x=1782830912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWLFd0qYGyHbJXs7zUAAkc3s92Y1yJY1XXn7+MiKd38=;
        b=gfLLv4GqIQdDKzIi5cTtdxWGVjiPIS7WuhhFOh+KlO0wJZkxz2xT1G4lI0/pJf7HqF
         QQewiuOs90uI3NZXkDZV0sTAZhWE3OwcUWENoigzpmFQBvAgVBAQSvL6Plu/a6ZU+JK+
         rlneEv5nyeu9E11ejTC7+gnJaSZLm9lXw9YTVS1NlnUeHSRSXJAV5C5DdkW59e4Yw7ga
         xRZbSxATQm9urU/N7SqTMt29WwHXyaysKGsqXRbijdefpCQYv3no72k3eGPZJLrN76JK
         ljYXPRubJs3ehVMwXJv0QImiwWeChUaeyhF18MOGdCfxNwUeLUfqETJRVfqR17mKGhn0
         txBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226112; x=1782830912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWLFd0qYGyHbJXs7zUAAkc3s92Y1yJY1XXn7+MiKd38=;
        b=VHab448+nBH7xh2/iKAghfY7Npdmuu50JTxFJbiM/nJvZNGGRQCgmoNPmwrePrNOo7
         cmKkPVIWmknxbQyiYHwcvXqEEDgtIcI3gQvLl0NWsYz3PT6o7Zznl6CKY+UGLT5QeUuQ
         8A0WXCe9dCAtmA/w1Bde03xxc8pl0VrjH4eTkJzMmrBXq8i3Y9/ILWn/HHXWEAVcd9KL
         L+PDKvDtsw1WqrpD12NDD/NymKy5BWfoQHSa5GSeMqYTAtdKz6Y3yuqlk2vZ97E6Zr4T
         uC5iuZ91PghG74hEWPFX9EsrL3nbS/rM1AZO2kt6iImf99gtYNemWUt0v7l9F9QYnN/Y
         sM/w==
X-Forwarded-Encrypted: i=1; AFNElJ+BY01uJm/AUbQ77RiTU9/RRmJGjSUAVcXlfrWlq3judNcd/R19NnBRcj8kFg5QDvOrGF1RSbQqHDZUszAH@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7hQKXyzamQeBtAumlmsHvcIz/Z8U6O3nGPJxiW2AhtoHpDbza
	aXKHy+VQ7aH8lB0QH3mnoydk7ltZCj+mssWi37J0yin4ZplUd485gfhq
X-Gm-Gg: AfdE7cmRl2QeFjDrSoWFRHk5ny6fwMrDWqcAlihZhBqqat6Au5xxf/1j8pRCGQTjMtd
	4TUHPcTfN4P12V81xmzolcWc3VNz9zggwxiytQIg07HdrYPZoek8IG71AM13t/F6xIolBOjD1Z2
	4EgcX/ubxcsmHkq4Pir0nKDKuUlYNGwuFpxEI/D5yhaIT0f/TpV8fnd+w2bdQgdTmVQnc35nEXt
	KCuV3xMgnuafndLMXBPnxvaN+4nMkZEqTmejZCtJJgEOnKQEe97PqKu+QsUsPxM1EvFjnInwRYy
	OkQywt+T0Z59xEl03wwE6KYFRXZyFCAtGZE6yAH/bAmCHMu/9AOSVv0a8gFjudTid9o8ypq0O3p
	WhjotU8XMtKwB0rDSyKwihfgZgier67lPbaBL5larKqjXK47fxKj8qOegpXDYOk9okUC5IEOW38
	VNZYYchYzGbfacxlZr6a2aaCreEkDb/5M+ZSg=
X-Received: by 2002:a05:6a00:300e:b0:838:5145:c1c5 with SMTP id d2e1a72fcca58-84591c76125mr4027972b3a.21.1782226112397;
        Tue, 23 Jun 2026 07:48:32 -0700 (PDT)
Received: from dellyboy.tail49fce7.ts.net ([2401:4900:1c0a:3ce3:195d:f9cf:5342:9970])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed3bd8sm10373675b3a.56.2026.06.23.07.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:48:31 -0700 (PDT)
From: Ambar Chakravartty <amch9605@gmail.com>
To: andy.shevchenko@gmail.com
Cc: amch9605@gmail.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH] staging: media: atomisp: use %s with __func__ in debug messages
Date: Tue, 23 Jun 2026 20:18:19 +0530
Message-ID: <20260623144819.78595-1-amch9605@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAHp75VcOo3=U_FJc_Mpfwq=oxAo_LkmsEG+CbLCr65w8SYSkKw@mail.gmail.com>
References: <CAHp75VcOo3=U_FJc_Mpfwq=oxAo_LkmsEG+CbLCr65w8SYSkKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

I found the recent discussions in the linux-media archives regarding
moving from the current debugging messages to tracepoints and trace 
events.

Please disregard this patch.

--
Regards,
Ambar
