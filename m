Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A5D3C585E
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402710; cv=pass; b=mFIRq9gkJY0ERdVnnHqMcssPG2XQiMz/8WQwk6w8i0r0q5SuGnUonktS9RW9NfdcRu/j30JZ3xuFCHaEg+NvQ9fe7GrW/uWSQkUGy3TANnpdF+iyt8fipuiwRQDjx8izovk8SulgOkdBdiCwckJ07Yrad7nMCXKgLsiXqTdHdHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402710; c=relaxed/simple;
	bh=rNT8uuAYIOIz9by9aY3qoAX6TR1FHkQuOah2tZDQCkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0ED0StfR4CKKOmEVCpNH0ecwd74s9hAEoFiLeCTI3hUqnUqO5oFzqbHNewTxMMIBp0jYcmj87rne4fVXckyBu0b++6D96C+UPymi37rQwfRfkSHdJxZe4SecMIZKuawdTRfadpqJZnQGBX83doYrmt4y0HKT3cung7tfJTKzVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsmVdPnh; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsmVdPnh"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1c24ec9525so323513066b.1
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 02:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785402708; cv=none;
        d=google.com; s=arc-20260327;
        b=QDnL2OxBWL3V5MA8LD6KZd4RF4Vahbr3tQkLHH1Kddc26qvRbsR3osW5NvJMzd6bn6
         rq3NGltnnalATn0+TxeCOxwqdRv6ijYV+mDCu4r+sQ+7Yz9bo0Jo4PzX0tkKNnmYsECl
         rqRNFbRI+YSR8ZuSksaiaLHv6w+Th3D3/nQAICPAyb6R+YoP8NscQJF3iZZCdBKp//CY
         DEvag1NMyWClgKpcz6rn/+Y+iHcs+ik2GtegCDHWaqN6XvugIcN+V+OW98A4uVhCSJGq
         6aEuS2oo/6t5gkxyEQLdHA09Ya7awY538wYlUMyTHND5BnsxTc4B4M+3AOCXw9tA9HqF
         yTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rNT8uuAYIOIz9by9aY3qoAX6TR1FHkQuOah2tZDQCkE=;
        fh=olhHsqm8I9B/el4VNd88jR0XP38jfCgCaHGhH6WxK9U=;
        b=k/q/30PLigifje/DE9RbVgc7awQtLAZ6hU0gy50L3g7ht+0y+65DBD5PMiwaHf/H7A
         oqlO67jbZpHhvwXpL9MzDUxb0w42/gU7icQ8EmD1HC5jCXs4SqyWPZvCfVd/AB8Y/ZN4
         pCu+Z4XUlBJNY54KaomglFMg1R0S1W4OOUNiF3j01DdnCXT2Ia1UG1meyBjDbpiMwYsH
         nGpkRiU2/cd/nkpnR3TScR+qrPuhnMCCtP94ZwUQX9G8dmkpYkyVxyWk15OoBL6A0CT9
         mBRzjH2wpQem4o+81bpzSh1IYozgv274mdwxSri/FVz5PnVtXln4Ha1WXNcp2/grzU+v
         X3Hg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785402708; x=1786007508; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rNT8uuAYIOIz9by9aY3qoAX6TR1FHkQuOah2tZDQCkE=;
        b=AsmVdPnhHRCA00qS7yFYXnh2bq928S4PLoQnu0rIdAnz50rOrNyBBbowTEqmLn3TxK
         bQ/JsFeeLh09dCXNCp1/pGZmIizU0U3zx0aulho0XmVn10+5ouutewt3hjTWWSJYnIai
         NJNfcdQiBLKb6+IpwN9uh2g0lDG9Efq3BDu2xiup65gkWo2QKNXox7zmNZB2Z184Y68m
         /s744kK2laHSInz4/7d7Bq2bGt6ZVuEgWRy7GWOj3dyQdgTURp7P0H01UZYc9Qngfvyn
         J2vKk4DA5W71WRSIToCdn8tu3LO/p+CblxEQBKw1Ke0nLamcpS7COJX5Asq0vn/tBMDn
         s52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402708; x=1786007508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNT8uuAYIOIz9by9aY3qoAX6TR1FHkQuOah2tZDQCkE=;
        b=Rl9FeiEPx2avk+MhKhYkIJxX+cf2iwTUqh0JZAbhbvWzgXl8KwGRM3U8jW9j9Nvuzu
         AgvKe5nI+T2eg5CXEHMFiHfDi6fEKa5ulHoJjStkhlm3ulSssfkv0du+LQWeod5IiYAp
         OA1zvU74ZSNKIVZdHMt6Yyq+M91MIVW2psPr+e2in9rDwKKKR4alRJ5EyW5zI/3IBf7g
         5fR/fWSrWSrD9anIuNUjBiFr4A7zrRPe0nubMCTT+2u9gTztnvYTnp9cNA8o5yWZb5ed
         Chj9IglT+iwvfvCQp8bHWJKnehnL0ZsQu8SxxkfIZukw443q4Eb4/1q+JBVr/WQcIrTW
         2tgw==
X-Forwarded-Encrypted: i=1; AHgh+Roy++yfbtcXb0SuPKz80rk3mVEDDIyJgIlWsY29zXn4ArDtqhPDYA9xQQ3LSs91Zwd74JAynS232RVcnU0U@lists.linux.dev
X-Gm-Message-State: AOJu0Yxlv0cpMihMMnT7jsf1/N4YnqiAoQxvh9ETfWzSCjOsB791unZF
	i8jSYtEG0vZHphQaYykU7D9+tkzmwfHneu/8ewnao8+ERi1UBQPEUDWMdSwUYDtkIxI7Q2Y9EUB
	QTsDq1+Y5kHUL2DdKHLuXDqTL27q8EmQ=
X-Gm-Gg: AR+sD13KreX7dvweeM3wjuQgnE/HBDDgbes5F6hFp0fdvei/yo+qoNe5dY2icG7bsuj
	DKIDbl9ZC9gPs/W1Jfa1eRWgrfOnzNSkddMSRou8XgDB5OI0DFo8hsDzJ68yKkLbIoWvmJZXHrm
	yn5yakjwmEKXNL/DtcSaH0D1sVMXMIbXwnmtw4sSCg9WW7tY9q79HLIJv1YP7cuGZPkDcq6F81Q
	dTBqhvp4BFUyy5i++orjRXgIoZwfPzQ8+Fff+pCk8nbbtK0Ded4Zb+71APhufILTG2YR81WED9T
	m9zHcmvpbZY2ajhQaEeVbH0DD7m7TKO026OlOXjumpXdR6TbhGP10ep2WY9hHc20NMftndFE4St
	fKxxZdE6rwMRN0iE1OpeE03iLkxO7GjMdFQikkziAKO6IVrk0DRN69eITlwzFSylQQuHKvoK1Fa
	oqwhASEs/2eagCtoJzSfBlR82IH2OA3k/PFg1Ou5lZ7ao0zqXdWZL1kUDQF909wU8=
X-Received: by 2002:a17:907:3ea0:b0:c12:631c:67c6 with SMTP id
 a640c23a62f3a-c1fa554de59mr85960866b.1.1785402707552; Thu, 30 Jul 2026
 02:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729-upd161704-typo-v3-v1-1-69c962e35d59.ref@yahoo.pl> <20260729-upd161704-typo-v3-v1-1-69c962e35d59@yahoo.pl>
In-Reply-To: <20260729-upd161704-typo-v3-v1-1-69c962e35d59@yahoo.pl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 Jul 2026 12:11:11 +0300
X-Gm-Features: AUfX_mzEOHyV3oJOY8-a69g92QJquL9A0mM8T77huwsnnp9py7IaA1ToOIFpAFg
Message-ID: <CAHp75VeHW7bB+0fSqO3fX=Wkb-216cdLfmd2W8dYD7Q2_hx1eA@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix typo in fb_upd161704.c comment
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 1:49=E2=80=AFPM Tomasz Unger <tomasz.unger@yahoo.pl=
> wrote:
>
> Fix 'cencter' typo to 'center' in a register setting comment.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
