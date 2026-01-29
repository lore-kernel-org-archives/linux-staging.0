Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034E37FF70
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680492; cv=pass; b=CtqGdrTyqYeIXpI0HisnxUBghuOlNaMPmSBKGEeItYxnAJB9IDOors85khbvy8jrxo8HuGSKHm13/mVs4/WRLyh36GBO3law9kiZ+zZWF9I56lECvqJsk6bI3RCnhnCMYCoOUfR8VHtsCyunVxNjXA7FQ4R/fvKF6Q+1vc1s98w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680492; c=relaxed/simple;
	bh=Kdaassq+qSy4sEqlROtTUeik9OW7PFAIn/pTcJl69T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujgEIRtPbQWFE1hTTP1hj9n6+cgeAoS9e7liu6EB0TzdBHQbO8W2VkiXu3SKQvx2V3xeN4rjYmWrcVOvFmiXBVo9FFIAFntjuiq71knQNsGvN6EoPDz+pVDn5sgz+dQFKbrJYMRp510qz5RcXzaXjHVqpITcHXg4zG3gyWQtAD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKPjWnvw; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKPjWnvw"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so1374110a12.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 01:54:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769680489; cv=none;
        d=google.com; s=arc-20240605;
        b=iV7NLkFv0RheW1qs/QoxqBb2uFiu3epsB1kLSE8C+i+1Tm2T4XKZDEfplASzjvu/ja
         0Tr/MD6kzbDIP0SuR3zEYBLOBlP8u2OutmqzdJwZbgKBOhAsSTWZxRkmkeOhAXkOzaDI
         gd8NWwMfhPMCpOIAFF7Ci+K+0qGhyjtxZFWGnn2ak9uFnjDOmBk3cICp+oBBTe3RVGkN
         vCndG8N4XML6Rk/NkNqf/bgV5YoTgHeN5WjgBagU45m/haq6vLKyn/A7QqpEEa66jAim
         wOStfw2+bkdkKA7zCeLumyQGYP5lqRh+jte1ZBijtIRkRZilQWL/HkC5qqPO4RhLstAi
         OXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XeYxUvicnOzVVZwmGFrz01+A7zdjkK6N4biFG/ArP8=;
        fh=LP3ARHM4PgyNfu/qrfosB7PVOiHSKx0b+ZdEcQEhRyU=;
        b=RFINeKzmsg/SK4q7dxMLBJQBY2xXGJvSjvBE7uBO8uZvqDpJVP0AwmPegF//YaJQgu
         e8rlRE+StotuVGTsLu1Rd5gfEJMYFZQ9beZpp1EJLDiwYGK9aE9J415n9ayaEpnOggYf
         TFs2McjPAcPx3tC093LMpjjGjRXxsFgZtveVW9dvyNDEYWJi7341PGCMOrkSX7YUW2cM
         kKbIhPV2ypvOeLPG/Dh564Ar5qAMmTeU388qzW95GwtQjwCdzz/+p23VZPLofVG+mng3
         9Eh5/iaL71sZKElJKZ4/L2+cfJDOdCW8jrKDb9IY3zvZXIHqdz0F/NXsiPVgqKAxhzgg
         2n2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769680489; x=1770285289; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XeYxUvicnOzVVZwmGFrz01+A7zdjkK6N4biFG/ArP8=;
        b=kKPjWnvwsAWg3+Vwr/+YXP1VGcNfkjNB13rHwiHaFdNQ6fn1yDxUFiVePAshQBcDWJ
         0M9Z/nDEb51U9Kz9NelneapJeGqEUnRrO3mAn7HsPXM9Xpa5SlJ1ExzTl0yThzM+mB7b
         gNIKShW0Gpb+b1dYsj+cu83bhiPgsrnpjJ2uEmpX12FA3CAbJw+gLM6/j/w8mkPkQywe
         AuD7pnfvxESHf9TvqKbGi3tIYsXIuMOHxwP1ezzy8k6ThLmZW5ChB3Cu0LH7UUQpR67f
         IfkkwPafaCAqZ9aMrQ727LevhlNxLENJSKmxB+2I4vyR7cSaCbJqx7KyK9ouQCUd5Yfz
         trYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769680489; x=1770285289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XeYxUvicnOzVVZwmGFrz01+A7zdjkK6N4biFG/ArP8=;
        b=c37SYinI1ky3Y/JjFu89y2GZcLG+XfJq23hNIlbqqf8CSsfGtaslpwbLMloDBSHPWb
         Zl401P782m8B+KaZYnN2u53PbeyyEXLdqsgp2bsJ54B15K7EaabisMsM2EvVUxvfEt3t
         o8LCcXyMj+xyRWLsNazjHDFy82wZY4VdRsd1RgYjefa7BPHVm1XQtXHd+Pv0o17ktRmo
         ++pQXLGN1P1IllWLRJ29VsoTD0eh+IrOTxZwyUXJkLO+I/1BGmhahodquHccElGpbxUV
         W9ixWm8xGcRBE8oPY9o4d7dZ13Ku3eCL+v9o1nTqAjl2y+C62oR6B1XWMo2MegIK5FzP
         zX2w==
X-Forwarded-Encrypted: i=1; AJvYcCWQVQPjaEj1NVgA/UKuMj9Wzy3YXaEm0pU3tAy5+HJm4Ko+3vdNtO3ra3XxSdbAdfJPXEPhTZ7l5jOFthvS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5njzNX+4uOc5BEGo4JISw0GcTJGICrZvZfMM69dLQgebRHwzN
	kZRt3a/5PihheC+B8c/H1aelHtUbgwbYUFacpA8S7DYC6U7N8IKl/8rAXoTbc6SgkbU5ydf9h+u
	Siaqq8y78491IOz1Ff4p8FspSa7+uSE0=
X-Gm-Gg: AZuq6aJhVpnhNNcX2+BiZiQhmAsTFO9cGqMYc0FjUhIukLrAuxXwOvpKJO9tPP/o5Bf
	41cUXTl3udfFfT6C+Ox48Vqgbi0hJvfZeX5qXPTe3d63YwoAF2YZOioODzucD4JxqdlPMAYeWQv
	O7juw6d8MHhY1+LSgGEf0r83mSjYIdK6aw6v0u4NDZOkoCFArqNPoBkT6GA4v0WkndiFJ8pXqLp
	GzEhg+iNSYXtrLahIJpRkYM67Wepk5rjqxD9vp6rGzOI1Qh2m0ANTRma16ytiDSNcKNjgI=
X-Received: by 2002:a17:907:d649:b0:b84:1fc7:9457 with SMTP id
 a640c23a62f3a-b8dab15be96mr508124166b.8.1769680488734; Thu, 29 Jan 2026
 01:54:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aXsEd2bzf35y8i_E@stanley.mountain> <20260129080110.73884-1-tehsiu.huang@gmail.com>
 <2026012943-danger-tweed-8f81@gregkh>
In-Reply-To: <2026012943-danger-tweed-8f81@gregkh>
From: Te-Hsiu Huang <tehsiu.huang@gmail.com>
Date: Thu, 29 Jan 2026 01:54:37 -0800
X-Gm-Features: AZwV_Qj6yF5KV2nHzbpE9JV4R2pX3nWKIacPAnOQ2TAJnRIz7N9-VzTx-Anfevg
Message-ID: <CAMbZB6NhWzPhNB2fiyxyNoqd+=y93JYp0NdQykyEgsL9=qT7-Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: refactor BSS Coexistence channel
 report logic
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Joe Perches <joe@perches.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 12:54=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> That's a lot of different things all in one single patch.  SHouldn't
> this be split up into different ones?
I kept these changes in one patch because they all work together to
replace the old ICS logic and remove the magic numbers. Splitting them
might break the build or make the code inconsistent halfway through.
I was suggested renaming and using a bool array structure in the
earlier patch here:
https://lore.kernel.org/all/e87acd109ea5eb4e3f8fc233788cd0dbd128407d.camel@=
perches.com/
I kept the 2D structure to maintain parity with the IEEE 802.11 spec
as original implementation. It makes the code semantically correct and
easier to extend for other Operating Classes in the future.

> And did you use AI to generate this patch?
I used AI tools to polish the language of my commit message and to
perform a parity check, ensuring the refactored boolean logic is
functionally identical to the original code.

> Also, how was this tested?  What prompted you to want to make this
> change in the first place?
The patch was tested by:
1. Cross-compile the module for the rtl8723bs driver (make
M=3Ddrivers/staging/rtl8723bs) to ensure no build regressions.
2. Ran it through scripts/checkpatch.pl to confirm it meets kernel
coding standards.
3. Since I do not have the physical hardware, I performed a manual
check (by AI verification) to ensure the logic remains identical.
Specifically:
    - The original code used ICS[0][ch] to store channel data.
    - The new code uses ch_present[0][ch] for the same purpose.
    - The original ICS[i][0] flag is now explicitly class_active[i].
    - Verified that the loop boundaries and index offsets (0-15)
remain exactly the same as the original implementation.

Motivation: This follows up on the cleanup tasks suggested during the
previous discussion in
https://lore.kernel.org/all/e87acd109ea5eb4e3f8fc233788cd0dbd128407d.camel@=
perches.com.
I want to improve the readability of the driver by removing magic numbers.
>
> thanks,
>
> greg k-h

Thanks,
Michael
