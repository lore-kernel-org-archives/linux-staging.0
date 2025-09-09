Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02B922756A
	for <linux-staging@lists.linux.dev>; Tue,  9 Sep 2025 06:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757397786; cv=none; b=Ux3M5hcXRppVeRxaM17gSWLLH0J3sLsupy8Yv5Q5I6e6zDGA/kBf19ygE+Rb6pIldzZz+pZZ29x/q2rbaNTz8dfQc4CJHGagXvAZzXnEuFA1/jFgSFFjkCV0sKsNYtLJEtUz5/lFv8kM3oJt9CvofLl1OUtaxULpJFhfbBS7KC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757397786; c=relaxed/simple;
	bh=1mv0aNBNacoR8Z3k1QWoVR0SCJGhdYSQQ+8O3o2QeEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnHnt3iPMPCX6V3M7nVYtK10aYWi8nzfqHoyZ2mvskEYH6fiDcvJyFvMxJ2v/fJCEybKpSCglvoOoRdKgAEqBiUBdYPA7w0yvciaSKaigGvGo2E6NqbaSt1QEqlk47bxMjoZ1NXaw2cQICL646L0U262CtWslWIWsv5Jz9W6U/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtRtLETp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtRtLETp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32d9f725f68so768270a91.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Sep 2025 23:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757397784; x=1758002584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMTAsIx4EXrT2ijx0IpLSYA8rxhXY+w0cxt7phZoGjs=;
        b=HtRtLETpgKr4TGHr5hVsqYZgo6+q8+HhmevLoTIMt7Ivpm6eec8M168Z7nFORLxg6Z
         plQJtK9BbuLZ81uI65VhNWnMBHkvKprOoOwkh5zS+3tX5eBmQm0IiyZm7fT6S5nABdMS
         jmZr7VELuEZrHP5XPIUdGVS/L9rD88ydfEBHuxj9tuvXgXVuCNwoSCWIVYIwt2neTEzQ
         k6OQ62lQxItvwTaWZip2NS965+IMPCtZ49u5AkGEIW4BQbONFvLf/4e1FhHEPgDtjhwv
         OK8x7THBSOwGZgv8DBul4Vh489nJYeS99y07E9hCJux21uTWMITDTaRQ/8x7oJcecdXX
         9vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757397784; x=1758002584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMTAsIx4EXrT2ijx0IpLSYA8rxhXY+w0cxt7phZoGjs=;
        b=vBMOtucqa/O0JUn0ogH9EZdY8tGRbHXZt6ykSPX9nTnwg6AkJp/vfItqqKc2kdfvf4
         I3U8wNUMD164gelK4GmKqQHBnQFdQ9RImf4z+TZUzRj7KJ0FBO/INuXERpb4eE09Mle7
         3G05JH/82zdlohEx2vGEujtKRI1NvRFK5JoQdVzsJygIjjHQriryDRuOUnDmoMG5R0GS
         DK8j1/YLC5TXsKUvjKk2tfLOW8G+yjogtVmq7c2vhuUF+4Jxrrb0M2aFe7iSyvNUP0eK
         UKg5SKeQXVJeXWBPyLpwFzKEy5B5jx7aA02GhJ6TyUYG3Sg1WbZIlc3F1x4NXoG9klUf
         fnzA==
X-Forwarded-Encrypted: i=1; AJvYcCXMvFP+9jGhYkoWR0p63o0TTn2DxEHWvsaVx63XXI57xtxeotxcP0g2aTjZ7v+ESAGZ2Od/S1CyklITQJrn@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1POGT3tkvSnTmbCtD9baZvECPm7frIuv/y5hwfS0/HtIcYyHH
	aHNVgEb8raIGUpZv1PSfSaKuwIlXqXPuZHHbLkN+H/vwUnfnY2LwwYe5
X-Gm-Gg: ASbGnctZLfiWQNl4gdFkPpu0b/P5vSPynx24UsO7CFKNmCZ3vUZC4eTEo+EJXLZESk0
	xYnqG5qzmuGMY4+nhl090AxTNsFYpqXFq31nTSujSIANt/MUW1JK4rxK6prB16CJ/BNrMzFIo0p
	LFpWSo57aCUIene3UoAhIb+FPNMl4QH0IU5HyFoM6qkDloHFUcgLiE8LJmOo/A7X9HSOKX5rBL5
	KJo7YHgekcD1JPscao78fwMyznkgOGQHzSNK1PYQtahOEzfVyqm0YsFqvyY3TY1rUv2hlw5wkqS
	3AxN0eeSphjkHgEkhtm4Hd+vwvLTi6EMu/aApbhh/4IBh9UaXolvqYD998r1xKyqm42wi2wiQ8b
	U9NQ54qBmfiDclAVK9NXIx+6x7kMI9rODDXAnTGNXxfkIr1D3Kn4sz+aNGyGVKiyHn69KFLFIHD
	4qXstBKeoLi392
X-Google-Smtp-Source: AGHT+IFJBO3xDoLj4DlYD8W4yc5VM+vGGJ5bvgBXCAj3dFstVJS+RDiOm5nuaXCn8SgmgAj0jpnn2Q==
X-Received: by 2002:a17:90b:3fcb:b0:32b:bac7:5a41 with SMTP id 98e67ed59e1d1-32d43f8e8a7mr14198668a91.37.1757397783936;
        Mon, 08 Sep 2025 23:03:03 -0700 (PDT)
Received: from klmny09 (n058152109064.netvigator.com. [58.152.109.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32d69bd489csm6938561a91.17.2025.09.08.23.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 23:03:03 -0700 (PDT)
From: Yiming Qian <qianym1996@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	qianym1996@gmail.com,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Subject: [PATCH v2 0/2] fix coding style issues in sm750.h
Date: Tue,  9 Sep 2025 14:01:28 +0800
Message-ID: <20250909060130.12919-1-qianym1996@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aL5tjv_2YkvHPs5C@stanley.mountain>
References: <aL5tjv_2YkvHPs5C@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix volatile and camelCase issues in coding style:

changes in v2:
- Split single patch into two separate patches as suggested


Yiming Qian (2):
  staging: sm750fb: remove unnecessary volatile qualifiers
  staging: sm750fb: rename snake case variables

 drivers/staging/sm750fb/sm750.h       | 6 +++---
 drivers/staging/sm750fb/sm750_accel.c | 6 +++---
 drivers/staging/sm750fb/sm750_hw.c    | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.51.0

