Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D0279DC3
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 03:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222097; cv=pass; b=FyhrN5O6NUux/vHL+c0dLRAKc4M2UZ2vctBRXiMfiixs+ZbfE2ttzvPlIxgKqEhsDWWbk1YTobIvN5uDqTIYn3+1/LCfAY4+x3JsJ1yCOD6iepodXeuf4Hqf07bycB6CkxG4ROi0+gfeIAhLU4A1HCMzhZz9REEkJLZ6LReonYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222097; c=relaxed/simple;
	bh=FGR/BzjhZJ05hunNoEYZDaafqJ3pIUvyyuRcNCtA2HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDv4qVYT3RdhrUfhSZGYW6BZvvpLfX4grG1ZL83+vKaPYo6Dj7Uw44kFhzd0kTJFpVkvjiNZTkOn/m+wDdl4nSFcy0HRsq7z++ibNCv6cfug1Et6lJvNOjH3kjxcLsKxaW+oLfmc10RurO3voD/V/i0uN8jO7xjhhg/tVTyKkdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qO3PO8xb; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qO3PO8xb"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-495e5f0f428so51215b6e.0
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 20:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783222095; cv=none;
        d=google.com; s=arc-20260327;
        b=aUlyOJcSaIzs1JNIgX/tzcZ1jlge+eLcfG4mfpNsYHhlFrqhDAFeEuadStYyXKjVDW
         cYsoGbupvU4YUwqkX6bXmE1RLJX9CZvFsN6Yg3mw6M6C1HB4vSP7E156+NGSKw45pi3M
         WbozTdS815r3KCtBmWzUVYKE28th01chfts75YzjjOIiXSCe9XL+3BxstfSpWXXNLAGH
         oss9gmCK5NspPWl92iZdw6v5CUpbLs9j/ZRnuSKIAd54+6XN2foGTUuS8d94pqT/RxNc
         4/hmqR3zJdWls3VjmJOCzbNmujYfXjSp6XlZeIFqf0pWquEtjGonOd8bBfzxoEZN+n+o
         U5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieXxQCfc9jK50MrQp+fvJnmXcIOmw3L8HnaFw9KiD2A=;
        fh=Cne6nbrXLU2psfUWd+yAbJ8N0XvYMmUxm7c5G3wZpkk=;
        b=C707nLgB+hBmOo5Wu0mIbYHfU57rrZhYl0HinSDy2kUnsiIN6HRdHwzIE2Hq/ZfRsJ
         g7zhf6SgXjLycQRE54VtLDEO2a0mE2eZnX6jRTJTT9x0UrZGlzHvE2suP9Cs/gzRA8bQ
         FEpcxDwA8z5ArvwuEZJVzT+BZFZ0Vk1nDFJZ1dY/PPcU4ic/IYpAJp3w8IIgAqLNk8l7
         JVRz1l/JefZCvOjg0K2vWm2M0jC3BIhkiUQFlwoNigkpfeE650Ktft68hc2ozCLSMTC2
         jtKef5yovJ3uHmQks5JwcE8w5IJAZtN+tIz/J5pffVyrVGUTb7zS/4GXM2Tb5syN1C8k
         asdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222095; x=1783826895; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieXxQCfc9jK50MrQp+fvJnmXcIOmw3L8HnaFw9KiD2A=;
        b=qO3PO8xbaMhAvtWNglxk4wFy+3k3pKVed/fqrmzlIUQlJz4EUwpJTKlAPScO7XPLfu
         mlames2TgrAAsnV4WWb6l1AKMtNJvx8IXr96kODbRt9L6f3HU02BsWrQvAgyx6RrdVJP
         69nm2wntmIYBYVsIB/JPmZ0XMz3RHr6HAtbjWDbAcz8XUSYrqAYLDwvAWdx4GTI4qAOs
         L9WQKtLPZysB+hzN0OpXRspvMVrSldbt30X818AjNumO5mI1w18KP37PRIAu3T7qnLBv
         jdbuINUWKlZd+JbOfaB+tpdPhsOvvMDFG/ePDH/a+aq7w8JTAQ0R5Ghy39qSA6iRf+z8
         e2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222095; x=1783826895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieXxQCfc9jK50MrQp+fvJnmXcIOmw3L8HnaFw9KiD2A=;
        b=QKhrXVW0+nlLVCjO4/y4dhxOdjdN3UqdEvysGa//hDngFSjFDxb4BsszF8xnKeOmZc
         t0xqLqj6tANRk2q/KPnHDO5Pcs0AKa3E+j9Zh3ImGPCs2g0dindivAoITwyTmlQL6i+V
         7oev2dPufQ80a1ImJCezZZjDii6ryEO5b28f0RYaK5OPcqeYNBTkfLrD0SgHvZMMco49
         ccD70Af+YE1YdV4lgq8glhScpxomeOhqt4Ee+mLru4ZE3l8x17/IhhYamKQYJetrHwYi
         U9nzZSVRTX9tIPLenFGx00XbHFYQNJV438DOM2rdQnBRGXvlh6hNSGOgeWqQiEFKvvHH
         1Tkg==
X-Forwarded-Encrypted: i=1; AFNElJ8Uq6iuptlK3bAF8bHAO3aIpfUJ+2IEQrF/FhfKjBVWpdBspvEFG1NBJGry0E4U9f7WL3fDsqKWFN0FSD5z@lists.linux.dev
X-Gm-Message-State: AOJu0YxF8aakSwIsSdMaL4W78Is1lO1Zd0IbgTlzUkfwEdno2awyO07F
	stFU2BOkmRmejMAQEdlgOOxvsi2a1xV7cg0YNbJl17T8TDqWYBpJiEerenl1wxhwRGfZg83e181
	RcGDIShWN9sGECVk1AlDR01N/0v2VgTw=
X-Gm-Gg: AfdE7cn7/6gQvQfXY8Ss1UP7V4IMb1+nBeSdU3+WuGP1g/NfM90NQC4xISzTsofkbdt
	REXisOtapONvnAbNg7wknNctI4xRWDkctMviYps+etzPZSonF4v79TLrVZ3V8u6Y7LM44qlVs1V
	qjodUV4J4NzYNknJXzGYiKnTzq8JdCX6o1F3QDKqo42xRRbOC3EYEDwsKidEf9ytj+/4T5GtmGq
	G8fNKt7x5TwYnTOpKHKT7xnxX2Ao5hmAO8B4nVbdVtinV7DCjb3aU8NA2K4arR/VPSeAK0vbeBU
	mPCa1dqKw8COuh1noR8=
X-Received: by 2002:a05:6808:1241:b0:496:7ba:89b2 with SMTP id
 5614622812f47-499b666d50amr1870672b6e.1.1783222094991; Sat, 04 Jul 2026
 20:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701161534.31152-1-nealpatalay0@gmail.com> <akYrPsbQnjPfAPkq@ashevche-desk.local>
In-Reply-To: <akYrPsbQnjPfAPkq@ashevche-desk.local>
From: Neal Patalay <nealpatalay0@gmail.com>
Date: Sat, 4 Jul 2026 20:28:04 -0700
X-Gm-Features: AVVi8CdKS8A_0PEDq-0xGErFWP6IwOg0JBlkLmDX9uGpXBqsTqxxNlc9zRMK8uw
Message-ID: <CAGjuiT_FOaVrcH=2Y6x8bfcjk5bTkUCntU5_F5giaLsdjdj+Tg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: refactor pipe graph dump stage formatting
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, matt@mattwardle.net, error27@gmail.com, 
	mugrinphoto@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 2:11=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> strscpy()

Thanks, I'll fix this.

> Nope. Find the actual commit in the history.

I'll fix this too.

> So, this makes code much better if
>
>         if (!flag)
>                 return;
>
> BUT, the usual way of such functions is to make check in the caller(s) an=
d drop
> this "flag" completely.

I'll drop the flag entirely and do the check directly in the macro.

> Use logical split and make this all to be shorter.

I'll shorten all of the long lines.

> Instead of doing this way, consider making an string literal array and ju=
st
> loop over it. This might need to reconsider representation of those flags
> as well. Yet, don't come to the conclusion, you need to try and see which
> one is better. The current approach is okay if my suggestion will look le=
ss
> readable.

I considered this, but I found that the string literal array based approach=
 is
less readable in this case as the flags are less obviously mapped to the fl=
ag
names compared to the macro approach. However, I can implement this using
that approach at your request.

--=20
Thank you,
Neal Patalay
