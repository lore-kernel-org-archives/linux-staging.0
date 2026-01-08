Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809246620B
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 11:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871446; cv=none; b=dX6uuQdeMRoPiB7bybaoRRtRtnrari93eFR9thzGJsOgWBXy31q8DhRF8bPZuEfnQUskwuAP9L8F2CY85obr7P6L3iEned5KrPrYlpAA0OWmgMHyFK2e8mBdS0zz4y6pYNLdScUbxaDlg68dKOUO2SoschVq9t64mqnrEEhhEtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871446; c=relaxed/simple;
	bh=5WXvG2sivJUedadCwI1JpOJD13VRPPzOQp7fn0PLzUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAE42Xt2bcA6wDUY/F5U6B2nkPJ7VB6mQklBPNPQCviRhMk7YZe07RiRnEBoeHouvWZYZqT4fewHh+D43XWbJHzmOuZ2+p9uZFpMZ1WDqjbuURuumGNCzYL/PYvA9GhxkMwcjnELFwceozid7FHXzvG0YdNVosJ3UkhrmcUXxyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCl2lqtR; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCl2lqtR"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so2224310b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 03:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767871443; x=1768476243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WXvG2sivJUedadCwI1JpOJD13VRPPzOQp7fn0PLzUg=;
        b=ZCl2lqtRnymFajazbDAd4M2AVGJPb2JAst3miOW2zd4XD5f8boGkqTjBJ0Xm5M1orn
         vPrspztIAQf9JT9lKQHh92zNFsNiVNiudhlc5hE4vmUhReG/h8SmeYodNFADQuU9AJut
         QkMWxaIDQFfQY3Sk7ywMjXWfhocqg4ryvGxSaeb3qgy5QqdJ4AJcnDxMLX4oxKin89Up
         OyaVWIDGM3qQ8CKkr8jOFG75Z3s6iPxSm7kxJ5awhvztexEjB0e6P7PahV24+kojt6HE
         deXKIv0dBT2oqnEOMs7hCIKHVlzFS9gg76+VrGoMipn8aoUDaTZoAEWgN2VUGEiwVsO8
         2HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767871443; x=1768476243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5WXvG2sivJUedadCwI1JpOJD13VRPPzOQp7fn0PLzUg=;
        b=Q7mM5nPdi06L9qhyG2KE+27ss3a/3hZpmVa8p+boknyYtLNFnP5SRaRtwKluP4HDyw
         dAgLORxbg7TZXlhSkMMuj7qL7R7nKhGydTKLiRY4b2rVLw3lLYX81GAjRu3YaiycD0rj
         yMLzaBTF5qDU8sMMJsoFyGGpD1fOorHElE1nbKJiZBnHAzQa46Maiau3dt+HNJKTkhoP
         Qracx+B1WO6fJiKB9yTmtWk9X5n3SV49MngwZqXp4wxwmuHfmPdc9++Y4FmXIolT4vGJ
         d4cx8fpjsIa20sDrA6bFNfsdhyKdHKN15vSxjLEevKnSvq/JMOXNT+TQkUHd9F0gFrsL
         L5yw==
X-Forwarded-Encrypted: i=1; AJvYcCUvcMFHFE3FwPL9jbiIK7mjBFc4lWGf74/1eMVGFiD+l6V+qtlEfA56QwzFb+3Kcm3Vyw3gIiYDHopM8oit@lists.linux.dev
X-Gm-Message-State: AOJu0Yx60KjMgN2IN3hvDPE6UBCByM3JXULa6VovRv6OAO9hFxsbNEFl
	KQdobwJIKpk9TVz/d84ezyD1aHMNk9TViVq+MAdQGsKCJ0LMC/8tBDcN
X-Gm-Gg: AY/fxX7D1wDpg8EESvGRF5l6A2W41MRZjP5bQejj5Yf/gT9MwgxHCTcKXvZp7uaiKTS
	RBjjamyEdvwy2kBKLcx7yvwB90dkPWZdzedpi/L0Sw4ckRgOzgbgLlCRBJqWDuyy/BYIPQOrrId
	LKto6r3nzOUq2dV4h43uuvjGktQAjq2G+ueOqyPNqew1G4ZhUJH/H0OPnN5Skm109PAwr9xlAE4
	sytjBGPN6OnaYO2kxeSgdDAT5M20sk7rGWtLSMlVE5XC9qxRXpd7jVGHExe2SoK8uvASDbiENsV
	GxTxj6H8vS/HeOSMFquB+KrCkwXxJ64eotBz3bJWIiydjIQcek1y3tTqz9f/hsfCX89xKpjFzOL
	67wKYDvR9M7uFSnFe9ppESpSR3CjRDojZ4ruqqbd2BB+nLZWGsjRQJnuWSu3FmfQyPAG4nOUfpi
	Jwf5SncFG4pyDDmLkOJ72vM+K9atQz3Mf0elNeWT2S2Ml/xChuR/z625yInBKUuwTwthgldQ==
X-Google-Smtp-Source: AGHT+IGKuYwBmlhlCYtAYw981XnwdeWRJdx0Bm8L4c8y4lMKOtLuRjVVmLsx1BzFIDgT0v7mzsQJMg==
X-Received: by 2002:a05:6a00:8c10:b0:7b7:5066:7f9 with SMTP id d2e1a72fcca58-81b7e928742mr4725994b3a.7.1767871443098;
        Thu, 08 Jan 2026 03:24:03 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0de919sm7443289b3a.28.2026.01.08.03.23.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 03:24:02 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rmfrfs@gmail.com,
	rui.silva@linaro.org,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chaitanyamishra.ai@gmail.com
Subject: Re: [PATCH v3] staging: greybus: lights: avoid NULL deref
Date: Thu,  8 Jan 2026 16:53:56 +0530
Message-ID: <20260108112356.32068-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
References: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

You're right on both points. I don't have the hardware; I was walking
error paths in staging drivers to learn and look for obvious bugs, but
I shouldn't have sent a patch without a build test. Sorry for the noise.

I'll set up a Linux build environment, rerun at least a module build
with checkpatch, and wait before posting any v4. If a respin is still
needed, I'll add a Link: tag to v1, include Rui's Reviewed-by, and keep
a proper changelog below the --- line. Please ignore v3 for now.

Thanks,
Chaitanya
