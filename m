Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B452857D8;
	Thu, 10 Apr 2025 17:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307074; cv=none; b=XRtwsI1UAEThGsA8ErCoc83y0gWT1P9JZcCoailj1SbEyv7hUHlLJEP8251iwgsPtuV41e/nsKQl2filZSOnbKg+C1jOIbhUnPG4dq6ks9/WGVfoHrA7MoKYG2KRCKKBRcxRmUQUWS36i020PTI5xiHyzi3T35pLPbpvYA1sVcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307074; c=relaxed/simple;
	bh=xUxiQ4Q5+6RLC3QRv6BX6/IDgu96e2jqXLwCQl0lOAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ob/0wk1eL1p6XrwPnqnhsH/ydm/P//NePwp/F8s0D4AdnVBLwrWlq9A4GNHBNHsg7pvA/P+HLP+4XREp3EOzviBlit38UoPp9sW2a5Eg9LvDWiZ655mcNCFvNraLXhQtegQ6EXdL29qmXwKXeKKj1ZT/BB9slmO9NO+lpsAPaPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7pOSfsm; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7pOSfsm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac25520a289so190768266b.3;
        Thu, 10 Apr 2025 10:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744307071; x=1744911871; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUxiQ4Q5+6RLC3QRv6BX6/IDgu96e2jqXLwCQl0lOAw=;
        b=d7pOSfsmIUyk6i+JPZfBYiTwY7HF5pespE4O/OCAMszus/JcNgQT3ebWfsqKIc6REi
         lrM+AiP8DQYKdcxp3XltGK8/JOZvKxqAHQClslfNEWePQhM6kaDzccWs5ugGjdLmM8Wz
         ZSahOJoE3A90f5maAcc3xokoyUHn/gRN9Ng5mPeGfjj0XrQ0MFKxhlrVEn34ZPzekUuu
         RQJbbXzq+RRXPxWkr1/n+OCQ/AM3DQpVND5a//9d0YJIgL+UNJvoaOf998AbAUkIEZu8
         Fjvn5WO6wqr82tqEPeQaQcWKhiG/l02eHRL5sfDMqjdfVkH8jRAXLFfgVZuINl1osERR
         02Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744307071; x=1744911871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUxiQ4Q5+6RLC3QRv6BX6/IDgu96e2jqXLwCQl0lOAw=;
        b=AAb5qLicHOKctQjcVvvmonuiV6jDYlVmgnip5wjoY1LMj4V69/bfWBAiuXnbQr+B3N
         +N6YLcMBqUbJ3c1kiEDRGZhrv0paQCbURIfDv9SA3UPJ1sm6iJlksUrhtB7lYpVL/kHJ
         frS0TaNKBgRuUh0Qfh/XPzQUvoZyeJI0yqPAsSgzzm6LQTOSfa1pOjhE1M3EGUrhKdtb
         pJsYQY7BqvnZoUsiCU1dlLLEhCAN50ZvoP800wswnBx4R21OyOLHuW7nECAG22oroFEa
         sDvotK1HzJGDZYDKwpU2KyiSc55vZEgzc5KwwZfqecFFYyx+9if8fJR/7aGMz3k7C9y6
         bDeA==
X-Forwarded-Encrypted: i=1; AJvYcCVpgRO8KWYRm9PGfX0BfOV83NpNEpfqPnQMRCAW9PiCIccqDp6Fjvb2JTmzIhf2Bp/OgtjFbaibNhZzzM1A@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgn4LM76jfL00RzXyMoY3JIQ95/843fyNbSfpBzn8ntC8GyF6w
	qoudSlVwKIkLFNGGKX17Y4EWSxVzYnTmn89O9m7vPH7cNY7XIlqRZIUH5y42ctrzCR5+LS84+Df
	z9ndSIyqp/oW1dzSOuNyqK63//BM=
X-Gm-Gg: ASbGncvDKpfZTTSxE7BPVUGQfAWs3A87ixvYeqUy99UD0KPH4x6jcAcTRq4tt07SKJW
	BbTbqJlOcM7hqusdauD4lcvHhneUc7JNySf9dtlm0orpg5KwOPQr78wYY7KY5Zum35DouSdlg0J
	NX6AkuigqTlTKgP6CJL8GvNQ==
X-Google-Smtp-Source: AGHT+IGai+2iQma1v2ML/vmpldbNN87lYaO+i9MyFhR/mev8BzsVZSMB8PjTqxdyLC9BpAbqz80qyNUO9NjyLftm6R8=
X-Received: by 2002:a17:907:2da1:b0:ac0:6e7d:cd0b with SMTP id
 a640c23a62f3a-acac00c859dmr248885866b.34.1744307071104; Thu, 10 Apr 2025
 10:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu>
In-Reply-To: <Z/bA4tMF5uKLe55p@ubuntu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Apr 2025 20:43:53 +0300
X-Gm-Features: ATxdqUEQ6x82ggKBkTXOkdVXbmSTS8JdhJGKblrlfmSSA7OXmeEZzvZ_zLSv_lg
Message-ID: <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	dan.carpenter@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 9:48=E2=80=AFPM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `& 0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
>
> Using a modulo operation `% 4096u` makes the wrap-around logic
> explicit and easier to understand. It clearly signals that the
> sequence number cycles through a range of 4096 values.
> It also makes the code robust against potential changes of the 4096
> upper limit, especially when it becomes a non power-of-2 value while
> the AND(&) works solely for power-of-2 values.
>
> The use of `% 4096u` also guarantees that the modulo operation is
> performed with unsigned arithmetic, preventing potential issues with
> the signed types.
>
> Found by Coccinelle.

This should be folded to the initial change since it's the same driver
and values most likely are related to each other.


> $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> $ cmp rtw_xmit_before.o rtw_xmit_after.o

cmp is good but not good enough in general. Here it shows the 1:1
binary, but in some cases code can be the same, while binaries are
different. To make sure the code is the same use the bloat-o-meter
tool instead.

--=20
With Best Regards,
Andy Shevchenko
