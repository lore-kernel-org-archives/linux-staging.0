Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6035E223301;
	Mon,  7 Apr 2025 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744059496; cv=none; b=o1bpMXEketoO/7lOEXf1JRfevMQqpDYL4EhY0u9LTnMV4mZuG9Uxq1TS6r1wLAUiAnQKZUKD9l53EWuw/lOAP1IrZtb70ObTsUJ8xTDoF2Rw2QXAs+WXChSPUudDd+cebOd4YVIPBQM2zMRoeQfMS6rbCSyb88fLSYDfqBDHTNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744059496; c=relaxed/simple;
	bh=zUJ41ZEdKneZmcfN4gKME3SUOvx/FlghYDIs7u5++dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ru4OWTGFOhBjEqCSWyQfrYGDkKv9yzSqqEtW8x7VBs7BfrCUSQsNwnKdyYTRWrr5OtNnnqjuXnaUl/TVijPU3FCGjUkAGcUIyOi4HoOBnCMldszlk8STI9tAdbou0ZMA8m2nN34mMv9NFHzZySobqLgYg1cSMHrVog3Tpr9F66I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbK8e8ty; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbK8e8ty"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523f670ca99so2170115e0c.1;
        Mon, 07 Apr 2025 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744059494; x=1744664294; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjQmcvDsvjEdE4QG0ylteb0iRIEFhO+OPGY6ri34DpI=;
        b=gbK8e8tydq7roUA8lfeJOv4AwBlTkn2ZaP/fA2GUloFMyfViVY1ns+pd4lwez9B+xc
         dsdtkcKnEeCh67LAT7F5lSlZV8YfjcQ6ApNGyNS7nyIgk4TdfCr1iZHG4+OezVj3q+6v
         X6Ae/PweokakzixdlUzs4eEj/tp/DbjzmFOPvKY1ZEet9DvGeTcNiRTXZ4KWj4niTmao
         7JhDu/FFZsESpkOOYyUn8ubdaMk1iqNKH5Gh79FgiR4F8LjJo1dv2U/xXNc2hdvUKKGe
         PeTltg7IYIuXuUR0iIBX8KXG6DV84Zosa8htxl+u4q7JdxN1jNpxabtaszQO+aMDJktA
         4PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744059494; x=1744664294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjQmcvDsvjEdE4QG0ylteb0iRIEFhO+OPGY6ri34DpI=;
        b=dm8HK83nhtfJUmsKEO11jltzV3LJNHQ7xmEwloVKJxFYlilZ6FyE8k3YwZJY3srG+6
         Fi5zT7acff8UQ+JEGSPYX76PfLjJZG5OlU+yMAQfDY9JsMjabvoMC41Lwdak4kUI0ZFO
         +JXvpkcKuPw24pZ7nzVEP51xN9rDumSPPe2SExyzncRwGQVRJykLdpo/Tlb2gzqVfnCc
         LrYqh670kIvA2Z2YuxXqmdNMdY3wpvq63U3gjyKV+wJJkw99Q0DNyxcRb7jbBr5ZlgaA
         RqT5GCibFgtKwnoxqn5TXtE0zRhu5m0NAe8sAhEIFmK2bM/VACe6dllfSBTt6m271eaR
         at0g==
X-Forwarded-Encrypted: i=1; AJvYcCUIYWTkmLzUgEFCR9y0p84Ob8sTmDluSIYo+GoOijWmFPe0/RWUOtN++aHb6ufgy84yhLPWSWX1ZTv5tV0W@lists.linux.dev, AJvYcCXN4ByQs371FCQvjTZby9UbfY4v6cykWYvNLFvQpvfntXWxgkHm1/JZNIfDUFbagj6X73c54+o5xRaN@lists.linux.dev
X-Gm-Message-State: AOJu0YyAMDERCJpt/Hr/NgAW7StbXyIaB13yjZdSILoS6wBpalmYIiZT
	kD9MBWzpS/lA9/fxEeBufwr4FnGFm/U1YKC69fvshMpBTC6fH1vVjZe2OB9EEccPvkJ2w6zM8hj
	z3PF753X2PalTkqzOd9o8InigY6U=
X-Gm-Gg: ASbGnct/JrXnyoqShzG/walN+lp0VnjPFt22xOjY81zTSo8FN3RCvc4THPaPP71/bCV
	5zVMGMUXI4SF7TUjRiAhK//gc221RT47Uv9p8Qk4pZPuTbAmobixwCrqlGLVzmEHA+4ChaNORJT
	fJ3gIhnRVURDyoAjSOaHUl7g0z9YSq
X-Google-Smtp-Source: AGHT+IEAXxVQkImXDwoA+ny5U7LSZBqlhE5wwveej72BW29iMwXaVRAZEfY7wQUyqXryMYsOBfpAGWxbu6ALI9dbteE=
X-Received: by 2002:a05:6122:660a:b0:527:67c7:50f with SMTP id
 71dfb90a1353d-52767c70798mr9537670e0c.11.1744059494148; Mon, 07 Apr 2025
 13:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/PyMXTjCHduOhKX@HP-650> <CAHp75VdtUhUBL5d103RunY5EvgmTQVH48S21N1-1KmDM0q44Aw@mail.gmail.com>
In-Reply-To: <CAHp75VdtUhUBL5d103RunY5EvgmTQVH48S21N1-1KmDM0q44Aw@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 7 Apr 2025 21:58:05 +0100
X-Gm-Features: ATxdqUFdd_Ptxa4GLZ49mQuV1WJ3ENWGee8KMNYcQF5pT5xDLfQ_PD6ytACWYog
Message-ID: <CADYq+fY5fbENFa9b53HKNPrCHTfR6YPDektUoTi8=9h5ZbxbuA@mail.gmail.com>
Subject: Re: [PATCH v5] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 5:17=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Apr 7, 2025 at 6:54=E2=80=AFPM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation `% 4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the
> > sequence number cycles through a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power of 2 value while
> > the AND(&) works solely for power of 2 values.
> >
> > The use of `% 4096u` also guarantees that the modulo operation is
> > performed with unsigned arithmetic, preventing potential issues with
> > the signed types.
>
> ...
>
> > -                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> > +                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (tx_seq+1)%4096u;
>
> > -                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> > +                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)%4096u;
>
> To reduce churn, it would be nice to have another patch _before_ this
> one that makes above clearer (by adding spaces) as we already new in
> practice that it's hard to read:
> So, this will become two lines in each of the cases, and in this patch
> only one of those line will be touched.

Okay, I will send a patchset for the change. The first one will add
the spaces, then the
second one will add the logic, and they can be applied in sequence.

>
> ...
>
> Besides that I haven't found in the changelog if you have looked at
> the entire driver code and checked that all usages of this field is
> done in the same / similar way and no need to convert anything more
> that these.

No, I have not checked other drivers. I will write a semantic patch to
match and transform such cases

Thanks
Adekunle.
