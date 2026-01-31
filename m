Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A4436921C
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769886751; cv=pass; b=I2r2m8wl5n7hhK9ZEqdrXmMSH86ztzK3A1iDPQ0JsCTzMocTncXuI5vQpkfjoBxLId8veTbAaa/bbGavJPBO+r+cUMqwrz36NBf9pYQJ7Plp1rjbqKONoKsKn7q2B7tPeolqas1jNR8MyL6wSKNgxXx6StYWuIv7VZoOLz6tlnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769886751; c=relaxed/simple;
	bh=erofji1e1CWtzqljw0JcvduMKVWY7GT4RFfbJKogxSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGQ2lvAr6d5eJXGVEZHW/LNcFplcuwmgbWLaOdYs94gbkUpXjkILufYEODI1Xz/ObTvp/xioUwAfcQr5lfHeMA5RbMudRiCUmlPJG73Uek5p3xy6SxbTjnpxA6Aix04HV+GE8C0U0iA/vAa/O/1h/5V1rK5h4P0G2kYpPJu29Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ap/v1+TW; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ap/v1+TW"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so5531003a12.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 11:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769886748; cv=none;
        d=google.com; s=arc-20240605;
        b=JAObxp7OcZ+eg6RP293/fJc9oitdO8l7EXsUo/EIXeyTOpEe/YcoXGEvomsEWIY+4r
         VMTxhJ4GK/VrPwM3a+t/lNbdJBWGDq66/5aGYXhu928c6k3s+PsKcJo4TpcGR7fj+Q8J
         AZzF/Ox4lLmpYN/PIh/ZzpG6QLRnlfXEswIrcFcqKJFZ6YC8D8d8rND3N/7tRYuLxNjh
         ZyI6GjOmQ8UtFBwy1ma++o1dvY/tiohiPNjy1wwk2JBYV0hQM8RvDEzku0PczyD/AtEQ
         w5EU3L9L603b3G0ZAS5vg6xFb0nDT9ch1yhW15EfJqMaE7qIs/EZHrBtq2Ndq6CGTCpB
         KCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ryjSph2VWAx8aP6E2wZb6hfrlVeYYMRCjjAip5DiYB0=;
        fh=wW9YPpj8LF9h9erVnLJLY5oMUCe6mJrGqT1Pfi6lOYU=;
        b=RzKvdcR0U9qzDKwmOGUD7r+ggsgXESLh5a5aXJA6x6mBdhGrrIyQEHmMf9biMxl4WK
         epi0U8C07ejsowIlqhHHIaR0IP+doGsAIFu3H0qMHn3Rg1wNTv7cJtJo8FC+klLxWB9A
         ScnQLAaORrCME/uX62HKaadpJBrXx7s2cpMyf5edmYhpoLREHhJSijrJjIosMm27vBaF
         WMn+iiXyQNF3jxdQaha9WdiBxPLXGE6YjyYeaNE2A/QW/v57Lvp96HP5Rw7cRLWRZ3VS
         W5zi6Iv4pg5AeTQjI68osqXEV2LRaoBx7oVl+CtjntZWbq6W2PbEK1VfEq/MDThlR12G
         1kPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769886748; x=1770491548; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryjSph2VWAx8aP6E2wZb6hfrlVeYYMRCjjAip5DiYB0=;
        b=ap/v1+TWXaulQNiCRcr6Wb+IrbJToqsv4WoUrywoaAr8ptRZmDkEjhlBUmT87LKv0I
         I76SZPmichzF9rsgMifwa9S1npUzC1uSnH/vJpIXdsEX7oZba1SXBwpdF4sLqgrdLJDB
         z4024uq6nOAB8PtHLUM768pwOKs7EJzbHJO+zjOEQF6f4KOtKiMv9+Q0TkfoRAFwy0ao
         gCQ9DJShE74GIlcGxUBtKXJamPhWGLTUvxA2aMnG5Df8f52f1VF4unrlqlxooNXwjOIK
         fY9JuDobVdt4TDyj+F5zzyymb+UuebVuhxgQFxwNN8mHO+rlcBg5Ei6pYzDezmiKd3WF
         wyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769886748; x=1770491548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ryjSph2VWAx8aP6E2wZb6hfrlVeYYMRCjjAip5DiYB0=;
        b=e6SP/cFsOCvoyWGgoWrQeMNm4kF2UgAaU6lCZMfBHBLYDLwhaLjDzXqCUekX42kLqz
         SjbsilFgukxcRCGJn5BEtMwe/Z6V+T6t7wMXoeTb3wXKnQtam/2ZdGAKe5uRqboWgjos
         RzzfcniPwhb0Wb5hMf01a9vBkGkdBziYTB7yuOnX06Gvz8oaaeu3jxYz5A41sHf1nyBI
         5tzQZykTuMSCq8l248rrDvgMk56wVp/0tPeqdv1Ev64QOyfOsOpx1R6DUjJwqL05upoo
         fcj5mWaoTilKsTH3aDx5oKeEUlY4A+f8CATJif9ETWQPmHLRUTMtdUKzGwvUbyNY2vcd
         t1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaL8WttVCJIaW5fPG86VLJBT8lGl+WSNC5mpYrho/8/s7ffXKTQOp4LHSPDTTImOLH2+YoCA6uIJqeJgvR@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl/rysW2i5p4Xq9QY3fKho03ODCDp5AYdvtNwXc9jpTLXoaO+T
	k/+zKg1xlv5VVsJyBEOXDNlg5jXLCvL70JyKxcYMF1aPhAsgpPL7ApPwmGVUeZ5TgaqXs/2hXyd
	yv+dSG8hN2HzaM4UNCFQJT0/M+80SIXI=
X-Gm-Gg: AZuq6aJVhekTzsChejaaq/BCe9BEEZvhWb9bVt0j4M7/iNhZIy+xh08zpcRvMf3XhsC
	ih0E4vrIOl5MM9HjDggpoMGBHam0ZMoO48uv8/dfE4fH9WpOWhfEg/Xe/p8i61WNJ27Xj0XeJzn
	dDaD4gs+ldMPlzPiPr8zKwGLPo5oo0IaMcMSMj+UjoUbKDCiXH+ED016MnvMyWYOD61WZAt9kkk
	Uk1YO9H2UF7zn53LsFVwu9sE6eF8l1tFP4sWt2U85zyNBJjHel7RH7adUCRcsTPRaWDTJ0f
X-Received: by 2002:a17:907:608d:b0:b87:1ed9:f58b with SMTP id
 a640c23a62f3a-b8dff7bf37bmr448894766b.51.1769886748241; Sat, 31 Jan 2026
 11:12:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130-adt7316-correct-macros-v1-0-8a71df1e42f1@gmail.com>
 <20260130-adt7316-correct-macros-v1-1-8a71df1e42f1@gmail.com> <20260131155413.28fcc701@jic23-huawei>
In-Reply-To: <20260131155413.28fcc701@jic23-huawei>
From: Michael Harris <michaelharriscode@gmail.com>
Date: Sat, 31 Jan 2026 11:12:16 -0800
X-Gm-Features: AZwV_QjkmTAfviYlLDkr5vmmzNMLS23n1WBgBDovdtM5ZBamSNIsME9WJwag-TI
Message-ID: <CAHXWO3R4_18dxw8s5S5-7nbT8xjX6hZ5jrTmG+5csePOvdmfjw@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: iio: adt7316: remove unused macros
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Resent to include the mailing list, apologies for the duplicate)

On 1/31/26 7:54 AM, Jonathan Cameron wrote:
>> Delete macros that aren't in use
> Why?
>
> I'm not against driver authors only introducing register defines they
> are using, but I'm also not against them deciding on comprehensive define=
s
> or at least making sure they cover all the fields in a given register.
>
> Having only parts of a register defined sometimes makes people miss
> that they can't just write the whole thing because there may be other
> bits they do not indent to change. As such it can be useful to have them =
there.

Hi Jonathan,

I was under the impression that it was good practice to remove unused
code (including macros) for the purpose of reducing clutter. Hearing
your thoughts, I see why it would be better to leave them, despite
being unused.

Please disregard this patch.

Thanks for your feedback,
Michael

On Sat, Jan 31, 2026 at 7:54=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Fri, 30 Jan 2026 23:38:27 -0800
> Michael Harris <michaelharriscode@gmail.com> wrote:
>
> > Delete macros that aren't in use
> Hi Michael,
>
> Why?
>
> I'm not against driver authors only introducing register defines they
> are using, but I'm also not against them deciding on comprehensive define=
s
> or at least making sure they cover all the fields in a given register.
>
> Having only parts of a register defined sometimes makes people miss
> that they can't just write the whole thing because there may be other
> bits they do not indent to change. As such it can be useful to have them =
there.
>
> Thanks,
>
> Jonathan
>
>
> >
> > Signed-off-by: Michael Harris <michaelharriscode@gmail.com>
> > ---
> >  drivers/staging/iio/addac/adt7316.c | 11 -----------
> >  1 file changed, 11 deletions(-)
> >
> > diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/=
addac/adt7316.c
> > index 8a9a8262c2bec34f3c3e79d8174f492b9a23fb70..4173c8822fff495e8c69d9c=
f6c11be9e9227a8c1 100644
> > --- a/drivers/staging/iio/addac/adt7316.c
> > +++ b/drivers/staging/iio/addac/adt7316.c
> > @@ -111,7 +111,6 @@
> >  #define ADT7316_AD_SINGLE_CH_MODE    0x10
> >  #define ADT7316_DISABLE_AVERAGING    0x20
> >  #define ADT7316_EN_SMBUS_TIMEOUT     0x40
> > -#define ADT7316_RESET                        0x80
> >
> >  /*
> >   * ADT7316 config3
> > @@ -154,7 +153,6 @@
> >  /*
> >   * ADT7316 value masks
> >   */
> > -#define ADT7316_VALUE_MASK           0xfff
> >  #define ADT7316_T_VALUE_SIGN         0x400
> >  #define ADT7316_T_VALUE_FLOAT_OFFSET 2
> >  #define ADT7316_T_VALUE_FLOAT_MASK   0x2
> > @@ -194,15 +192,6 @@ struct adt7316_chip_info {
> >   * Logic interrupt mask for user application to enable
> >   * interrupts.
> >   */
> > -#define ADT7316_IN_TEMP_HIGH_INT_MASK        0x1
> > -#define ADT7316_IN_TEMP_LOW_INT_MASK 0x2
> > -#define ADT7316_EX_TEMP_HIGH_INT_MASK        0x4
> > -#define ADT7316_EX_TEMP_LOW_INT_MASK 0x8
> > -#define ADT7316_EX_TEMP_FAULT_INT_MASK       0x10
> > -#define ADT7516_AIN1_INT_MASK                0x4
> > -#define ADT7516_AIN2_INT_MASK                0x20
> > -#define ADT7516_AIN3_INT_MASK                0x40
> > -#define ADT7516_AIN4_INT_MASK                0x80
> >  #define ADT7316_VDD_INT_MASK         0x100
> >  #define ADT7316_TEMP_INT_MASK                0x1F
> >  #define ADT7516_AIN_INT_MASK         0xE0
> >
>
