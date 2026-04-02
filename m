Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20C8C14A
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 21:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775166191; cv=none; b=kiBU6yXhBboHbEr6likhry9PQmMMQXxf+r/Wzb1lvXjizHHFRPZ4BZmuiW01KH2F+0G5aB4TrgKj43jghKIb+rLjJv0YwHYoNz6hjgy8ol9YYIS0ynSWpNb7jhbwLXwCkEAWkNgpZbogaA+H2nKrwo1qH2saQ30SrlPvlCKIPtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775166191; c=relaxed/simple;
	bh=qx1UUCnlZOYZBoA7tW734D3lRqA/swWcXd8wm8yTVdY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=owzsLobCFSGhriXpqdCYLDEfBp70wByct0X9EKVGS282UBpqXSXyz19bGALgeeDHp2+3r3OqNwmpFWKL2XeINdnJEybnn+yA/UGi1Qy2JsIZhwbeN3FrTEKSpFwRB6TJWrb5ztVqMkuAPssdPeWLDjP3hI2j2noDbnT/3ubJZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qU5htS5O; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qU5htS5O"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7986e0553bdso13984857b3.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 14:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775166189; x=1775770989; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXGsJEbSSMT8CScjg0202P8B/FmAO+dotnHRI/lWR2s=;
        b=qU5htS5OWrpksI4u9EaQWUCjO7ZeNbl3u4HqJs7mA/GHFro4JVxJJqUhTqNnUnsnMr
         M2+wxBtbbNk+gjLIPwJv3qnS10ur8sGUkFz19FYcuVW1MhMv0xOLq2nw0EeTQ1QMx0BL
         1OfXKxasHAmtgqbbOKoDyew4e0/bO3b0uD38DTGksa8SUHNtyBcii1Pgw2ShNJiPI9U1
         XJWlGJJTa0/C3jv3rHIrNzJNV4ugIfZe5YPItOwFcieTtSXR0bcm/hqa1G1AjMSADwC8
         BnEiiz2aHzdNL5qEZ6CltRUfzgmZkVBeN5suagAMdOD5CyhI8FCgtWUf5dCPOP17pzBt
         eJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775166189; x=1775770989;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXGsJEbSSMT8CScjg0202P8B/FmAO+dotnHRI/lWR2s=;
        b=bc50ewXDJs3vxCYzpQf1GJoS4YspwDpzDSlonuvjbv6jkFNkcyNjGsqMy4jTrgDaW+
         BIP/zpdgeCDAwa/C05a+XRY2PDW/DKcF1pUzNuCV4kJci2vuemA+0HRtJSCGGULfWXpv
         26ES3DPS5N+xYKZOjSHtJQbQZpdIotZSsb3tZ2O8Z4bZ86x9vbwnAQnAd6D6wNkYgHv1
         XePAhE7G1HlJ9NFkXE2j97ib8JEmfny/EONWVRcD7zlvMhn3DapsNtIFWlvKJImqBqqV
         iKynFlJcWuXNEdTfAKrC2HYCBWOoyLJf9xLuZVdneqlh673FUX7XhipvOxKGgQp6fVyQ
         wzyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfUWms7rBxxEDhnAuOv9/pmacM22/yx0oFlUnqOxB7dXt5vmfl2I36E2ZydLex7P7dBQsC1Jp9lEeTuq8U@lists.linux.dev
X-Gm-Message-State: AOJu0YyHkCZzY1U/jEARw+E1Q8H6TvnIYE+rMVv+QAi0OevA9UBjNRmK
	rLJES9Shp3+wi7kaqxIIYYB4xcdgbG656luhmiXn1+vriL03ja05rk5N
X-Gm-Gg: AeBDietyVsHkLlQpJOethkmiNWXO0x6dcFCdoxhqmsbo57JE5oKXZcOtsCFI26jzjEu
	8Tp8EMceaTYqA0zkAxsG6OmJujZhlTGiZszHwmCWSNxjbcCI3pfDfIfDBk7p5b21TCeOUjpbOIY
	UA6VMIPRAWu3rMMnkH+dc9kZYh6abnxoE2nyqtWVDLe0rlYFPmFfN1975zmZyAHsomUtMLRheMd
	xFbDZCOSWOVIkMT37uck226uGqhH0/tHlTbklLry+nXLt9jCNXgCG13DlJn19Ruke+zYL+vCIBF
	NdbMbOGodzz7uZV7Wkcq+2zocVrYM0U0vZMK4qlWNc+Nz03tOeyq5rPJv5NieYZRWHrQ3Iwwyag
	EsyoMqr2YnVTIdn4xBXJoPYZdYXn+LF+Cp2L9G2l1tEhOUa89Uk+JMRzqACWI0sY7Pro+A4jftK
	FReH4HJqNX4nC0TZtdG95R/uesD6Hotbw/AsUv0hnlJs7Y7HVbgD5af3T7oGy0XgQmGR0vJil5y
	t9i/x1z6sfjn0ojEv6GXwdFRobOL/OU1cYBsLcGNtU=
X-Received: by 2002:a05:690c:c10b:b0:798:7309:a427 with SMTP id 00721157ae682-7a4d536d265mr8835037b3.36.1775166188757;
        Thu, 02 Apr 2026 14:43:08 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e42ff31sm14990067b3.6.2026.04.02.14.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 14:43:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 16:43:06 -0500
Message-Id: <DHIZW7VQ8J91.ON752XZ2E2L8@gmail.com>
Cc: "Luka Gejak" <luka.gejak@linux.dev>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>, "Dan Carpenter" <error27@gmail.com>,
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3 0/6] staging: rtl8723bs: cleanup code and style
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Andrei Khomenkov" <khomenkov@mailbox.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260402150429.14761-1-khomenkov@mailbox.org>
In-Reply-To: <20260402150429.14761-1-khomenkov@mailbox.org>

On Thu Apr 2, 2026 at 10:04 AM CDT, Andrei Khomenkov wrote:
> This series of patches cleans up the rtl8723bs driver code to improve
> readability and better aligns with the Linux kernel coding style.
> The first three patches simplify boolean comparisons, and the next
> three perform general code cleanup.
>
> I figured I needed to split the changes into directories, so I did
> that. I also think each commit should do only one thing, so in the
> last three commits, I fixed the style that wasn't related to the
> logical changes with ' =3D=3D true' and ' =3D=3D false' that were in the =
first
> three commits. However, if both the logic and the style need to be
> fixed in the same commit, let me know, and I'll make v4.
>
> Link: https://lore.kernel.org/linux-staging/20260330184640.17795-1-khomen=
kov@mailbox.org/
>
> v3:
>  - Split the commits into even more commits, each commit
>    affecting one driver directory.
>
> v2:
>  - Split the single patch into a two-patch series to separate=20
>    logical changes, as suggested by Luka Gejak.
>  - Cleaned up additional boolean comparisons found using 'git grep'.
>
> Andrei Khomenkov (6):
>   staging: rtl8723bs: core: simplify boolean comparisons
>   staging: rtl8723bs: hal: simplify boolean comparisons
>   staging: rtl8723bs: os_dep: simplify boolean comparisons
>   staging: rtl8723bs: core: style cleanup
>   staging: rtl8723bs: hal: style cleanup
>   staging: rtl8723bs: os_dep: style cleanup

Instead of "staging: rtl8723bs: os_dep: style cleanup" do "staging:
rtl8723bs: style cleanup in os_dep/". For this driver the standard
prefix is "staging: rtl8723bs:".

Thanks,

ET
