Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1354363C6C
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063614; cv=pass; b=HiVyHL7p80/KyMIswuGB1/gnSKErPg/64y5C6vMkOCP2vLiMA7+FvpRYxRz/Wvds1YshhgfuGtjAgH0ru3mh8lg6ewR7FuCzobXJL23epoDHBaHUzH2ZP3oFbS/7GFr85kxFMl47tqGnpucmtK2gLkiUTJNjlcPWdk5SqkHIHIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063614; c=relaxed/simple;
	bh=DNxWK0L5MVbngPTtX4ZuKM7+uvDs78OElrIwXLEPfAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1xawWXgTYHJRTOnXDKjgsE3tv5gsEkuaBzita4xQIdAJXsQkmtgK6BLUw1uab1Z4452pyG0ztRzTbZrig6EdPJ+dpsqeRyBgD3O59weU3anDrC+3ACXFjcMOv8OLeAYP5n6B4fN/Eh32Oxjp/vAffouXy4nlWe37aLSkXJ21dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBwBsP37; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBwBsP37"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66f8f556f39so5376430a12.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776063611; cv=none;
        d=google.com; s=arc-20240605;
        b=doHh0Z/vMHUQGwv+PLHIVQQuoRSPDUvEWoXR+HmL+bHolz5X4H43IwFg9xYerPBV+O
         eg3HkCr61SEFrvT5AYF1w/8r1IPSIg/YSwpxxtJs8peR7BfNqL5wD6vocjhxC3btMOLr
         zpR3g4yCDXunSIslicCI9ahLRFzHuLqzWpBnCULct3hRV0s4F4vEzn6TcOCQ5Y9GLKWS
         c6SByCi28wZGgXjd8qNPXpuyrnnI5JVC1PtnCikSj5fkmW1rAlRcAIAeWB2N9avM2UN2
         b4fBl+VxeBl6DTk5GaPwUz1K+oGQNTs4Sas87iD96tJ2DzD38x7gipPj0oU5uCaPXptR
         RIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X6pSeBoMwbk97qHNLEiiR0g4dw8qT9zFAczkuZLFIic=;
        fh=3KuR2BJo9fXaNaKZZHJBPPXBmcbsGmlY1GgkreLCRh4=;
        b=OTfO6s80FBDskfta2GjmXFcLhzO/iZL7jXf6tPX9LmC2Hl3KmldudkEYjfewhfP872
         rHtQ6Dcey6VDfrh6BI6V2vYCJFcz6f0bLrNkxO5AQY4HJCCpuqLY6KFSyCTkOHpywkH7
         cJto0fg3cdM2jwdodtHutsN3p7ZTqC2icE4ruskVQg1Jxb8frmP4APVm6sl1Se7zt0iR
         GyrmC23ieqRyp0mMEji8U5NlSN8vbszrvO+GACw0n9LOsAhJDqIb8lBx6mz2qkWwJSNX
         OMdNRwEUEMbNnzJF/AJ7NWCMqPQ5hB5EpsCMJdaNlUaM0HCbOVd/Bf/cmVr7EoDoLmvt
         Ft2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776063611; x=1776668411; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6pSeBoMwbk97qHNLEiiR0g4dw8qT9zFAczkuZLFIic=;
        b=WBwBsP37QwmEq7mX2EQhE/QxueX0s6/2rye06hbbf2hZ593U4vdlhreEscedzWf3Dc
         WLIoC2jSoSeiio+UAFlgukpqhBiI3rIfgZeYJlOcSCalRNgj+OV5BRqcrg4tOA2Ct7CH
         Ve3tEx3t9jqdznSgAiJeaPx6Sa2q6E2oNjMbjtc/DTVEXP/1dWOXzNGX+Zu4iJv2Fbhm
         1Bl1JzJlnZoRH3Cbhw9fcVg6688SJxWMlvpIIFad8OnnqUSowCRIwJgATdCYxwwum9a2
         uYAcH/PZpP+vnH+6wuv6x+csYH5a7mk9oSPqaANSgdf9BsSZS2HJuHaqOh+s8zy1CZFy
         b2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063611; x=1776668411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X6pSeBoMwbk97qHNLEiiR0g4dw8qT9zFAczkuZLFIic=;
        b=LqRaq4XqqS+5AXj7CDVdUnNk7qvsU85rby4iB6JE5+DmuTzMmXzhdjDdDh5tjW+kYl
         SyA5cwQDpf5jO8jbw+I5o1GU/umfUEBjmpvMaNhugnltXTDihmtula6OcLHj7lFdlnEQ
         oAtXuKLjRKhoaXFstbqOYOLewtZ0s5Y46mYxVfnlSaFSXcy54Ud11w8REkUnRMM7OtPy
         gEdB17mxGZ0jFOGibgfmYs2OERr/M0jkDGn8wZAxQY1ZU/AVTEOsxleNmjMDEP+GhdrL
         8lWRevdUn/tgFh2S1gnPxzeVci3QUBfhO9HHfPvXQsdkQl14JvGIh3/edG+zj62QT2pD
         vkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3bSfqKWcb3WnaktC1cI/7PLolWgStdy6iF9/5wmZYr82mMhrsMA2QuERxNaBFLm3LumokrxKB0H7tom0a@lists.linux.dev
X-Gm-Message-State: AOJu0YyFlg4Vn6JXMrSmr17cLi1HGBX9T43oSfJseTEM1oDAdwUMcaH6
	YsoGm2NC4fnBH51FHgyejWeOnaA5Y+KLI1DgLYfkbjixgIpEEoMaWx/P4ThOIPYKWV9bm5QUXTR
	sKi+ELhAVY7gPDiO4H4nCuOY4lep2Vw4=
X-Gm-Gg: AeBDieuK6OX6rl9s1tKvJi0IsIuAWqOSQzNT6FOqpRVzUD95rsI6BS8rIxkCGj/PulE
	ipdSD20TXI5CMB3lJYeYaUHP3rz0NRfgccltgkAJfqB4KrxqkD4n1cISroW88pIf1ncUOzMtMCu
	5Ko3XUIiYyXPwKIubGKbQn8QoZmNmcn1Ig2wnk/WbwYiyhq1QCBtJEZmzzpSf4Xr1tiNlgwDc9g
	ouDMvs0fFSmgMEECYsACr5dbSuQl3W5OckRE6NgTtM90OpdXrqwX+/Q+opOJeKrWisIKtNuy8kU
	FYOWLibk/aOnW8Y3aQ334Do+IEQETcQI2F+fC7ZJKcMYd+RKLNvpyQ9ZYrEzKSdG9oQ0F9oSJME
	XwOIsYR8=
X-Received: by 2002:a17:906:eec7:b0:b9c:69df:4d99 with SMTP id
 a640c23a62f3a-b9d72ad8da9mr652948566b.46.1776063610650; Mon, 13 Apr 2026
 00:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218061406.8043-1-arjunchangla7@gmail.com>
 <2025121827-lubricant-salad-860c@gregkh> <CALO5-psPGGxo9bu4Yjs54Sj=Hpq4x4Zgvp6tEY2MzV+utUfGpA@mail.gmail.com>
In-Reply-To: <CALO5-psPGGxo9bu4Yjs54Sj=Hpq4x4Zgvp6tEY2MzV+utUfGpA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 09:59:33 +0300
X-Gm-Features: AQROBzC-kH1OmWCu3fYOKS8_sAHANFaz5pop-O-JWmBJ0plqPTqCm4ToMsiAjdg
Message-ID: <CAHp75VeZyn+55A3T2_VCGUrvsRwODp2hJpL21Z46UeyOeYyQbg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix spacing before close parenthesis
To: Arjun Changla <arjunchangla7@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, andy@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 9:58=E2=80=AFAM Arjun Changla <arjunchangla7@gmail.=
com> wrote:
>
>
>
> On Thu, 18 Dec 2025 at 11:50, Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Thu, Dec 18, 2025 at 06:14:06AM +0000, Arjun Changla wrote:
>> > Fix checkpatch error "space prohibited before that close parenthesis"
>> > on line 65 by removing the extra space.
>> >
>> > Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
>> > ---
>> >  drivers/staging/fbtft/fbtft-bus.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft=
/fbtft-bus.c
>> > index 30e436ff19e4..2f7c891177fb 100644
>> > --- a/drivers/staging/fbtft/fbtft-bus.c
>> > +++ b/drivers/staging/fbtft/fbtft-bus.c
>> > @@ -62,7 +62,7 @@ out:                                                =
                              \
>> >  }                                                                    =
         \
>> >  EXPORT_SYMBOL(func);
>> >
>> > -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
>> > +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
>>
>> But you just changed the function definition, does this still work now?
>> If so, how?
>>
>> confused,
>>
>> greg k-h
>
>
> Hi Greg,
>
> Thank you for the review. The change only removes extra spacing in
> the function parameter - no functional changes were made.
>
> Before:
>     const struct ia_css_output1_configuration *from ,
>
> After:
>     const struct ia_css_output1_configuration *from,
>
> I verified the module builds successfully with no errors:
>     make M=3Ddrivers/staging/fbtft

What are you talking about?
The original patch we are discussing is totally wrong. Please, compile
the code before submitting.

--=20
With Best Regards,
Andy Shevchenko
