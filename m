Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3228E47AF5D
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480263; cv=pass; b=S1JqwFOpmP4xtUJLCaP2v5LV0IjV1MCOUEbz8Tnx5s3hi4ZSnUgQKPOrBO5phFBA4zXGOaVGRbXXzOzHcopWqii9fnNR0ste9bAkLkLEZsiTZUVqLf97lPDcqbbEcHlyRTKU5AlED8d//AE/QuEkgJuIsCtOCDLci9SLOCIzp5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480263; c=relaxed/simple;
	bh=4wPcRrMFAq+5dln8/Xz92CdQ5x3DJk3HiLHlwR+yBQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQwmE7GC/+dctMXeXmO3LwQBdJSv9LWLpMOgjRPKc51zmrDJ5rdvks7F+G5s7rpx9vqziIpofdxXJacQatez4dmIEbVORAilKN3+UE4+YcpkriGrHqlqRTLT9vatcYHMvZJoAtNeoek+HR22dTTl3CB4SF3utOqmzVUl6pHPpLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zon9aa7F; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zon9aa7F"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-805440319deso205148a34.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 06:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789480261; cv=none;
        d=google.com; s=arc-20260327;
        b=DS4qbipyFAClYFdPmoFfXX54rm0dUBMKCO9eD0VpZu4lhs57n4X+t6fO0+r8Tqe/dd
         r+52mQhfJZLo6MOu76buSJB4dTRCh9Q8HTrUwQEFkDOTCesjvC92OfOjcLfafgIwKTPw
         QBEMqf4h7nMCwGXorkqPRAifIwzPFV1qtFKvVVtSQBKeWhjRW+tph42Lya0QEH3GxmP0
         4oXb4ODF1x1Sm0PZmfZ/6sWrpxtIcLRyFJKRa37y2Q/gk1DLIahDK4LzsPDDERwGmnDB
         4oumHDNDXY+8gRVdROR5AmikMffpXudClCcHZGdJ67tSPRF51dh6okB4HhGo3cYluPxE
         CNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4wPcRrMFAq+5dln8/Xz92CdQ5x3DJk3HiLHlwR+yBQg=;
        fh=erKKmJhqb7J/8GJEK3XLFRPZTiCRWBiUQqvuIGttT3A=;
        b=TZPEkz0qykGD+Ie4Gzi4I86OkpD2HcuR2UdLczLG0DY1+3w6fKaI0TYPVbdhfek5mh
         gQHLWu9ql6K14PiSnFXnptrG1Bmg4VJi8jKbiLIV5+EcGalfCE65Eqca+cFr5KB8LIxq
         NCYJiuT26y2WdavDxEx8SwQ1vcSUSk6M5PoBKk6/0ayk8ucluCmD4ur054P9XPy2h58l
         JB3J0U8krfjsqlZumrQT6wJYYpz+2oEvcfqsNjyhQAiCDwJ7N0lzh+IEsO3VpVWjpaOS
         CBoe1KxpX9KJAeeOzE64rLUbb2nZoQpA2HvQT1kWrlv6ueR59PT4ATibjqp8aNWmcnnd
         NCng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789480261; x=1790085061; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wPcRrMFAq+5dln8/Xz92CdQ5x3DJk3HiLHlwR+yBQg=;
        b=Zon9aa7FeYdacbH5BKxXY7/RUrKcc8z51KpLOZiGlU4O2a7kYH0HQiiUMXIJoHY0IT
         Fgsdq/mcQc60fW9e1Hp/5Ofy6JkghQ0ZJ3XmFK758u/K0KyU/iWme9mLL6mIQrEgVPPR
         fz9GsusB9o8yVZJCWta4sD7yPGHL0qb13pUopGGOJ1tLl/RSnn4YT6Pw78ewzFm85tfs
         BDeRUiAjCTcRGtQs+/BIFDzqHXLjxSjuMRH2koUk2RkeeWQOvy0c6oGp2bw4OM1eMLPr
         g5BKUiwenLrfq9a1sTrH8GbVGcu6JPRcFU7K9MsL5Hi+rDQYpUIW9EWIPtBe+CdJQUNt
         Yo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480261; x=1790085061;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4wPcRrMFAq+5dln8/Xz92CdQ5x3DJk3HiLHlwR+yBQg=;
        b=T1jqp3IS1wrkBSMrTTb8SWMuQxGwq2NW60hdd8XCRIKmu9VlFeuXzunNAYd5mvXaMy
         Ppci+Ors47Sza5W7VizBDDEd6Q6UaKRLKCQU06w5CulLQ1kjkutlJ3bdflUmFcYH48el
         HRX8pmm4VeKHVZ+Yx/JYaRnsyebUreiP++XoGS4RP18FA7K5VXC93G70+SVvzKfg9z5i
         scnmk+jLEli+GXrsqvcD+d74GfKOXCVjRkmksyjkSMyY5qnFas3D4KYLlFaZ3uzAFvAL
         /vSXYyh1OZrzH3H3HnQ5+CdoNVs8zAcVlD0HK5ggMNQZCGyf+Us2SGh5lG2m5YC4P0M4
         edag==
X-Forwarded-Encrypted: i=1; AKwUvBxFg+Zd0tqkJr2lhLKyNgALPK/HXex9zcslX7nXvFJ2jOyndWUkjn9U5qF1wlC3vNtDc+8vtcS1S5OxtuDZ@lists.linux.dev
X-Gm-Message-State: AFuF++nlpj34xMdRKVRMH8+hac2h5J6c4WSKTwWMTtC0jPUAf7ej94ZO
	LkF/eknHrmELn/uF5lqKbZLaQRTuZ/eUlC5o5isuwiFNjLjq1nkxsWDRVuWQdFVr2ky8qTUkPCD
	+trg9E8MQZTb9NXNZ2d369YbrTHUUjHE=
X-Gm-Gg: AYBFou2GoTcWuQIck+yNA+qwPpdSKgWAVYmQb0hMlq55DM8mcjbMJSc9E063MfMGX93
	02tKMVcuMFpx8DxHDz++wwbcr8rDzT0JOefbBlYF2pS2ldZwbjHtV/Pzf88qqydHi4Z4Q6+5eY2
	NwNT8KG/+yBhk2eZWQIG1AR6dXURBVtM81fj3VrtMS01OSLP9xxsuqcna1NWHPG87yiNbOieGC9
	4sLyvrTZhtCc7NQY66NWMfH563yMJtKiKUQSBhGR5Kxtfpf+Tl96/uR5KTgr/SgRriDrdjSfeNk
	tVNC9fF7YXrI1yreWFsKgmf2uF6FHdnLRbkkik9a2PAr4SgofNKr83M=
X-Received: by 2002:a05:6820:4df2:b0:6be:dc4:13ea with SMTP id
 006d021491bc7-6c739c74aa0mr737467eaf.50.1789480260532; Tue, 15 Sep 2026
 06:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
 <20260915075939.18180-3-abdelnasserhussein11@gmail.com> <20260915151634.0000787e@gmail.com>
In-Reply-To: <20260915151634.0000787e@gmail.com>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Tue, 15 Sep 2026 16:50:46 +0300
X-Gm-Features: AcwNN1VOemZ51WsQAP6jqp3alJcLgnYJqt7-z-lPu_slORPzqQPRWDZ6MAZ2e5Y
Message-ID: <CANpqX3ZkzU=+qmd4RRwwBbX2UvJOzeLhRi-hfXRR=FyeH6yD5A@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] staging: iio: adc: ad7816: Serialize SPI operations
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi Joshua,

Thanks for the review and the great catch!
I completely agree that securing the sysfs store functions against
concurrent access is a logical next step.
 I will prepare a separate follow-up patch

Best regards,
Abdelnasser
