Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47435248F73
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771437104; cv=none; b=s4JGlvtPfnR0NFb1TC6uEHI1dDUBq9mSLoU2hQFXe05wARH6XrM3OrhR3y5FL8VesA8T1OUpCsTSAGbnmI+mD+yJLPkh/kBRqIub9pmvOWPf1MxhzN6E87FJirj4Z3A5QB1Q7zUnpqSxtgJBF2lvO2PZ5+yuzEc+dN6R9JXhQhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771437104; c=relaxed/simple;
	bh=SW0P5inFOnqTZRemazxlikUuLWNeRFAsI7PLv+7teWM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=olGs71Txt7wD2J1cvtej6Nw7I3pWbJ87R7kw577ovdRUFc+q0XGA5RUq3gHMBAjiDnv2wNgEkl+WZMDn+5Oome1EAKq185ggl5yYb6N0V7d4ql5j64BDSdI0jShRlpG51kI3Z0dNPjkJRwCi8D7ngVa9fi6A/ZXslxIphVu9048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0vO2++M; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0vO2++M"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7964f1405a0so854217b3.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 09:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771437102; x=1772041902; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW0P5inFOnqTZRemazxlikUuLWNeRFAsI7PLv+7teWM=;
        b=W0vO2++MrxX2SCtw551dEBzO0lwEjxaEbtwjEwzkfzFpuA8Uu8+Z2gZMZcsvDIMkCW
         pbrnQkEV2WohjPIcsOuppspcFuIK3ATjfe859Q/I9+d2s1ri7/2wB8nawye2YEgDXLGh
         ND91AXt59JaTNuGeqAkaZVoaUHq0N/WWMWECwIfP/8GXY9vliO1TKRzQDwNqm1Jj2+8U
         S/dCQZv0CMaqv8EzwKNSC1nlEXK3l/qCr8Kg0j19MqNcfZS6NfLVC4QLHujrMLbCAb4h
         artc9kr6u6xgn86aXMB7hfDmtJQdxvCz6Wo3xhA1A40M/1KIOo72smIpZJgskb/jHx3s
         B55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771437102; x=1772041902;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SW0P5inFOnqTZRemazxlikUuLWNeRFAsI7PLv+7teWM=;
        b=WkTIPqLI0NOLbtsa5ah0wo61k9T4jAzWk+GSoH7UQSD55VZH8GSjaUy9wszufbtZoy
         mVfmihC491iZ43cbp90SoTegkeeJHpKrkwx1h6S4y0m48tZd657Cknfk5me2bcJqcAcN
         AXEsoUJ51GNyV3rc0bYLkAebGBeNuO+IgSc9RE6vWtM7Ccy++suxmGAOcqP5EP6ihuhU
         Y83tJu8HZuEqn57A/HCJSVS1rr0Q/UqEAl0oG6/T2P1hu0iouCi4Q7UfMyVKkqDOwBIL
         ZINU/7sC+A/wIAG3TxpQwDTQdE5ntzdyI8C7DDgFD8mIntEuaiojO9FEwUAjfqsKOx9v
         cScg==
X-Forwarded-Encrypted: i=1; AJvYcCXzdZk8TLo5ZpCda7TxpNp6l0dYrSr4AcYfugGqFmXUtYaeCF+YqtQshHwQvZGu6F+AqPiRLuphcPHUZS7Z@lists.linux.dev
X-Gm-Message-State: AOJu0YwEVpoGzUekbeFu4TyF9+o2OaJcUjK6AT6hNB7/CHitvC6vE7gd
	psaxHx/MMzcglA3kGqRbHTbqOQkd13u2HnP4NfYV0qg4ibJVsYDys6cL
X-Gm-Gg: AZuq6aI+ovYRsB/kn++uVRpoH2GveibG3ZrZ7R1CQEoRVlcRJwzfAGQR4lTMlPAaAQb
	Wpgfy0nMbBWiCBW/CL87mp/EArA/M2Prg8DCcJ8PIOwKI8xsvEdaNMInCQW9QgEGLXF9JDF4LMB
	TCA8+rsEDNnX4MrgC1KQtNhN6tgIWCPKSVBMfxo0T+zhWkunlpR3+Jw8LdrZjmpbpKHrs89n6v3
	v3XSmELqn0KIwuDerm0Shod2/wwJnCvX6FWCX04Clwjtd74mR8YFcnhH8QNDa68oBoTvFG6u3vR
	9fvZA/gR2MvN1oKtLIZWWlgtRuDl+tCPokRrktzhtxOteKLvqcRFJyZZ2BHVx428LrDGW/ZP2pM
	dNnjsApvwrp6zZZk5TYFFhzehme1Ts6Y4SV9JJNjLQv5yVXKtdZqpTBh8t3qu0hYa+26dSr0BDq
	3wkiDhP9RKRMHz87SESn/2o9vPnyCxqLcGqawQHXdkTSh/HR7Xxv+2dptziXkxrHlUsU6P3PHoK
	dSz87cXS/FMELHiesR8Cfd6NwlDYjKWlp2eeHRA3eWy16xyi+Z1gUgmc19QZg==
X-Received: by 2002:a05:690c:350a:b0:794:7184:a634 with SMTP id 00721157ae682-797ac5d9ab4mr122147957b3.36.1771437102221;
        Wed, 18 Feb 2026 09:51:42 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c18bd49sm124836147b3.16.2026.02.18.09.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 09:51:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 11:51:25 -0600
Message-Id: <DGIA1EKNRYYN.3G2A07SLZ9XP4@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Giorgi Tchankvetadze" <giorgitchankvetadze1997@gmail.com>,
 <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>
Cc: <johan@kernel.org>, <elder@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging : rtl8723bs : Fix typo in comment
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260218081908.53776-2-giorgitchankvetadze1997@gmail.com>
In-Reply-To: <20260218081908.53776-2-giorgitchankvetadze1997@gmail.com>

On Wed Feb 18, 2026 at 2:19 AM CST, Giorgi Tchankvetadze wrote:
> Change "inclued" to "included"
>
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---

Your subject line shouldn't have spaces between the colons. It needs to
be:

staging: rtl8723bs: Fix typo in comment

Thanks,

ET
