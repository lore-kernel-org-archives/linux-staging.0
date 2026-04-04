Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963E5175A6E
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775341569; cv=none; b=HEImmmBkQ597bGold3XWwWaoH0/3bdZcjNhrYGV4O1Qgen1YmSNeSe5RdooMClIcWTxb+5iabEzJDYMe6GW7YznuHFNEVo999NzOBCQp4ar39Nv9ZmZMHVd91I3wqTfc4JboeQ32oSnzNJIZr4JfzuwqVt/ocat/QAxkVQwB+8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775341569; c=relaxed/simple;
	bh=6TXh8DGA2Iql+jn8Sj0qQupqafnc26el1Z4mW9Jm4JE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dOQ4Sbmp+Zj2q2m2jGi2BoZduOUzsNQNm1t7iqquGKsVzE5K3ulwV18fIyGhFapFD6j5ypmRhAqhbpij5ZPxH43BlC8BOgRTLXfN+Nz8B6ZJAqZYZZC+YOBgrwp3Rs7S0nm6IOt4nNeX0ph3QlCq+L5JoiYw2JhQQABzps06qWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbrb7q3J; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbrb7q3J"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79ed2fc6ac7so20821937b3.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775341567; x=1775946367; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TXh8DGA2Iql+jn8Sj0qQupqafnc26el1Z4mW9Jm4JE=;
        b=kbrb7q3J5wuwMerZXyZ5FiSR38g5ida0/4q8aNCYHXNmU0OocXVcqRVfmn0MfeIOt3
         4Tp4mTZ4XfIQklFpXmRWsraZEg0OpoMIctN7yXqybiHT6N3m6i+NzwQz2QeOITeXt9Lz
         f1gE/S6QltdVOtq3VRhOCWq9NrHmUcFb114IEdat1K8kQQ9sAKp1+NY8WzvbfIOOTSBF
         7noC6ruddyfYUZJVQb4yjp0dSl14AM7FtmcCxlIPG9i+hxrpkQv+fEkz2qdq7/w+oywJ
         /EMNFYocS4tEfQvurNgrU8QwHiB6W7HePZfvdsW0mDzb/ZOgFllfpJPcnamEJQhA4/tL
         WvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775341567; x=1775946367;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TXh8DGA2Iql+jn8Sj0qQupqafnc26el1Z4mW9Jm4JE=;
        b=fr3MWOYGh3qU2CbVDoYObLi0tOXMUidcdsWZAGEw/QM3W+VHe4FJs962SkyzdyX6zO
         YMwJYupNFzw4HYRTmV9W4q/pRMH6/A5YtOLE4RGUp1K1J3b4uw9byQlbYG9uEONImGSI
         OI7Vs6O9K0XTsSllxWy4gzHODnlan9d945bCpI0aVclvp3XgiRUULlATw0lGjIQt0k3+
         E3KNDk7jy1/xB3ndgDbSgdq1bAr5kY7BCPDiL2JFDhYzxaaa56WhQRLSBNUDJ6W4P+/q
         cpDzbEa0hQn02HDVTp4r9tto/HiK+bF6dvDVjlKFhAQKgZsr+mKB4WbIknbOJmDixdqX
         oB9g==
X-Forwarded-Encrypted: i=1; AJvYcCXVCLMAnK3ALUqXa9Rnid3YqVcKIGrI47Vt2FbinCMlJmiRZZaDq3qFgmRR3aUIvD8p1njXc2PxM1PDvH5r@lists.linux.dev
X-Gm-Message-State: AOJu0YzSi7kmCOOZqjtqE1alJYLDwLMci1/4hw6taLwSscmF/FihavFY
	vugbsrppdEOcmf1dUrO0UjJ1wzJwfcufKRbJPMK92XtKA0O2ZiVapAxq
X-Gm-Gg: AeBDievuc5a6I36f2qt27u+mGemRvRHuUBnuiWAU1kUXVyBC0PS5mbnLBZjSBI2CpRa
	TnwInOHdkgeF6Pp3pIr6hTLmpFxzf0Tf9rysqwxCgRYoewySjJiGVbLVI9JhkT1Eo8r4HdcIrsZ
	A6HlNnXNw01N1Ld0YZhPKyWGay5Jqh28yPWwipliAGYZ2kge3N/CuV1bJ8HOmDomzXUs4TqJj1c
	zPmtvoJGNviChDm4UdBghRulD1pWNeLXgL+myl5pfJMNbvH67iiD4N5WO7gbef+MMj4jY51Tkky
	9OsIWSNqAMXvKgg1zYMch4ahgRmcw3WKoteZnDnJFIJUf3QQZLkClpAM5NG8UD2VlqJm/qdz5MN
	TauT94CEnDfdZVk9L2100AM8GN3VZoHDWMcSeJu1gIjsfOFc7ZYVD6DMN50Tw5gPSAeKRcZUb1d
	jYebw2U0+QM+Y3tfmEKcsbHupZk9wGICVzZnF0/yAvNRn2r4GPMTrNvemOMRSlkof1iLUgzxuXI
	+BeJBy25So+dmmc0HCGkixmIKn8RwIg9s78VtX6pNA=
X-Received: by 2002:a05:690c:4c0a:b0:79a:d067:1b45 with SMTP id 00721157ae682-7a4d6e21e50mr80022697b3.22.1775341567476;
        Sat, 04 Apr 2026 15:26:07 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a3709075besm35562857b3.25.2026.04.04.15.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 15:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 17:26:04 -0500
Message-Id: <DHKQ27MDZEZ6.3TG030YKHRLAH@gmail.com>
Cc: <gregkh@linuxfoundation.org>, <ac100@lists.launchpad.net>,
 <linux-tegra@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix logical continuation style
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Paarth Mahadik" <paarth.mahadik@gmail.com>, <marvin24@gmx.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260404072626.134642-1-paarth.mahadik@gmail.com>
In-Reply-To: <20260404072626.134642-1-paarth.mahadik@gmail.com>

On Sat Apr 4, 2026 at 2:26 AM CDT, Paarth Mahadik wrote:
> Logical continuation should be on the previous line,
> move && to the end of the preceding line and align
> the continuation with the opening parenthesis.
>
> Signed-off-by: Paarth Mahadik <paarth.mahadik@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
