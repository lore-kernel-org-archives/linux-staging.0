Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EB313D521
	for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 20:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756066488; cv=none; b=CQH5JCBr2QvJdQ3Rn0trjX596mNa1UIseDp+0bi/iaElJ9vsk7FDdvBHyAZtIX/A368Eh0z0yT1mQU8/ysosIEL7Wj1LR9NDaqugp0ajSm8V2XmSpolfb5SdfW0LO55rkzBb5W6jbUUzB11O3zLSK1qgmOS9Ex8IViSiEyVO8yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756066488; c=relaxed/simple;
	bh=QA3gp3C8Tmg6/ZhibaeSLgfFuxniRbAl5rV1xmdXl34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOIeyBC5dDHZ2JJO2nu8LuBx1UjAKhvt2Yze5srOWM6PgpKtPe1gRlu9FTfO096/41d2tf3CZRTa/hPmJM4fuh0NjfenIlBMdNxShI8u9t/z8vPqTe1xvJmciAOM779zAdvR1E8FB5GDeOTb1e1DdVlG10aVBbJHT/F4r5kubVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=dietpi.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=dietpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b618e067eso138215e9.1
        for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 13:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756066484; x=1756671284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKTlnh4Q+KFGQxB1IpD8bcbVivdqkUNyppHsT6Wp7Mg=;
        b=bWjlOgT/9CsfXIdrc0/EDhZ5de+OQEqc/y2yv4iJzteY6ZPOY8dMABZjGDsAyAZW9r
         jnoWY9ik0cW9nLtAuzDKS7HhH5amWPSrSqH5UPhoHxZNvtjNnNO3v9lAuKzXXXdTt3ie
         IiixP8fJMgyzyCKC27wTegWcFEy4BK6hKw+qd2bh9GD0SIdwRzhB3RN4ROBaWXyu3DhF
         /Sc9xbajVcFLozMyPzbdSsQFAnA7U16ZRHU2IX2WZG0V8alBpl9z17LPZVhO/6eUdEbp
         VT+6FCF1e/egcqq5Nl/ab+MM3o5uGSimH6OyC3ovlPnT7i86hucjXgdS6mKDuzfiIplg
         AmdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfqnXH5xNGaKHfJoJzpNvFP6ob6G8s/EXo+bundXqWsNHWcGLg5FacLgTz7X4PLGIBrHYgYpncrVj1nR0y@lists.linux.dev
X-Gm-Message-State: AOJu0YzZRCnoPSaYjvw1WAXl07cZRsCe6KdK1bv0+15ZH2odq+e6S6NI
	jAbsUT4Ag4dbhVf6iG659c4lLSGx4gNoRTPIGUkBQ8Znw+6IPI7cj2Hb
X-Gm-Gg: ASbGncuOWFtBznLKPtfWAsCLlTGOYxDAyLu5X4j2Al5xrNZmPzETqKru059nX8sHm9B
	HNLLnBxCiWXhi9M2IIR6xjWWzD9H5QvucNORDj8s2OI6XT22P2fUsQ9W6OqM3DPHF3/lVO2QzRq
	x/AaBcyQ6qpO52siXIM4sQr3xENbdEYhvaa+4zKIdQ0GWDKO49kHnNPW6sl1AemUXt+SedupbJJ
	GkpO9fyzDoCVFnFVS4wMwbrUJPbbUr4e3gpdlaBeP8uaB8x2XMaJLPqDPq3fhUIT1LAZs7vaxd+
	00hRKYOCKNmwVVpuWyv+6WzE9KOZxSAxEOh8cfglL0J7u9lboqXlK03Z/gTDbjI3hmR2UvtsUn0
	jxev7dlLc2q2OWkltfarzHWedgVTzPV/9H+Dt1UsD5WI8HVWdBdqqjCGybZSPdtdvowVMuQRcj/
	shyvjKKWlJ2OL80KWLOSgObyNWQLpOb0WAbsaJVziig2+NCTcynJwAaroM
X-Google-Smtp-Source: AGHT+IGixne2CzhYsvhc1VjQmKs+mUxsx4fbWpFtf9KIUi0pdE5NkMGXTLYvUUMdJaxWALm+fOflTg==
X-Received: by 2002:adf:f7d2:0:b0:3c5:921a:f440 with SMTP id ffacd0b85a97d-3c5922a3763mr7540475f8f.12.1756066484512;
        Sun, 24 Aug 2025 13:14:44 -0700 (PDT)
Received: from ?IPV6:2003:e0:6f2b:f231:547b:d9c0:96ec:4a8d? (p200300e06f2bf231547bd9c096ec4a8d.dip0.t-ipconnect.de. [2003:e0:6f2b:f231:547b:d9c0:96ec:4a8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211cc8sm8563940f8f.36.2025.08.24.13.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 13:14:43 -0700 (PDT)
Message-ID: <ec4697e7-7afa-4b24-a5ae-cdf103aaae50@dietpi.com>
Date: Sun, 24 Aug 2025 22:14:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during
 probe
To: Stefan Wahren <wahrenst@gmx.net>
Cc: arnd@arndb.de, bcm-kernel-feedback-list@broadcom.com,
 dan.carpenter@linaro.org, florian.fainelli@broadcom.com,
 gregkh@linuxfoundation.org, kernel-list@raspberrypi.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 mcanal@igalia.com
References: <0c2840c2-241c-4f98-9518-6a3676286823@gmx.net>
 <dafff4b4-f022-453e-935f-6d79c4c57292@dietpi.com>
 <8e51d9c4-512a-4b98-8ef7-e08a259cbf07@gmx.net>
Content-Language: en-GB, de-DE
From: MichaIng <micha@dietpi.com>
In-Reply-To: <8e51d9c4-512a-4b98-8ef7-e08a259cbf07@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

Am 24.08.2025 um 21:58 schrieb Stefan Wahren:
> Hi Micha,
> 
> this issue has been fixed in mainline/stable by reverting the commit in 
> July. So downstream should have received the fix, too.
> 
> Best regards
thanks for the info, I should have checked upstream logs. For 
completeness I am linking them here:
- 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit?id=ebe0b2e
- 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit?id=228af5a5

And on Linux 6.12 branch:
- 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit?h=linux-6.12.y&id=ff62859

Hence next downstream build will contain it.

Best regards,

Micha (aka MichaIng)
DietPi project lead
