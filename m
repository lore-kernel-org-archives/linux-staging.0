Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6694C7D
	for <linux-staging@lists.linux.dev>; Sun, 20 Apr 2025 00:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745108727; cv=none; b=hJLTT4LcgsAocoJmwkUZgl8En8IVljVyXLjcHW6ajEjvDpyWCGmRwsX92w9/cu6toOsLi3QcFrv7y6lRoY7bu0SR88qWRB4VqV8Z3gERUsb1p2TrkHuh+eGcJOUdirjaNLjiBJAVvQW90ivyudmEE3/aIt+482Y7dmW9J/FCMmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745108727; c=relaxed/simple;
	bh=6PByxcc4Td8BBzc0VGIKPud0vFBe8ka/3jiUWf2Xm3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uy6uI8pP3r+t9vQigCdaxLvPKLUG18nL4kKUx6rsuDPcLmAg4WfTjjy/Rrc+U84H+y0Hy14tDmImO6oRAcxeMFPhRZT6N3R/RRNaA2PF9SIvGUujbmVqisGEBnFSB41x1QDvwKHEE5yt168Y40yzti/uM19zds4qVEQyUwTa1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cd1bNN6F; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cd1bNN6F"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4766631a6a4so31823901cf.2
        for <linux-staging@lists.linux.dev>; Sat, 19 Apr 2025 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745108725; x=1745713525; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XV1imopr04k+GMqsWaTVJVnHaSrZQmxg+CiKNjaZJm4=;
        b=Cd1bNN6FhSEB6Jcg2WxiU3mH7D6gvUOh0qbenlEe7c+o5DBYX3hlK8fxKlHzCz6IUQ
         5MEMG2AnpAdxyaf1UYh14i/sHsO2z+yp3mf5bWK6RGcmNQs4nAH/QCdXAoDlOD3sSiuP
         y9rmXfYKoNMs8XgmiyJXKkwXArBJEA1u2kOvdMMR4oQoCzW7bn7IGCck+dkfGALZ0NKR
         3VuO8f+GyiJN4RPa1ppXflpYZ9j/zxDuB89eKSf2SfRDpPP6xVvFHXrMkbyP+hkiSB4E
         ZNiJ5iP6037oT/pqxal3YMCURrp4zI9QrlxIS396OmMd9wMB1O4La7uArFL5/zIjR/hZ
         lWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745108725; x=1745713525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XV1imopr04k+GMqsWaTVJVnHaSrZQmxg+CiKNjaZJm4=;
        b=sxeCVZYoSOEq0qPfztQp9riZvFyssDJQm+Nw4qhjw+JOq9+xm7HVxzndhJDd5RxAvh
         NX9gNFRayjX0Bpf7uNK48LQ7ul6ABVyaHu1pO1NfTIT9/NtrbPa+4vlQmLtrBPDtNt5J
         l8+g5llp9bBQ7Nex7bQ3b12U8wmQKH9gjQmIVFQsDqboIO8RtM96+re1yBkdLt50cxF3
         jt+C5ZNo78KU8pZD8vNbHdm2nmxWm2b3gqf69qwXy0puKn5FLZt6VlS3J293O+kc7CAK
         twjDwmHzlvKFHN1ka5JTlVGU1PPSzzbXlKHKSKXvyZMSxqQWZW8aTujTPb8hRW5XDHqM
         McIA==
X-Forwarded-Encrypted: i=1; AJvYcCXT/O1+qrrI70EUdQLypSmAWB0ezywCPRXYOOhPQVZzlmE4MxPdBSpTpLsL+brRPwgSUrc6VYWK0QILahCY@lists.linux.dev
X-Gm-Message-State: AOJu0YxpgtucB8xPzglrBVGYfuXBPINoTCEOP2qmqSEgpOx96GFhhF03
	bAw7Wmbp3FW7xHWFCFt1elLzs2S4PFAi0jina+c3TZuQF7l0TrNkMtaLVpBhVM7vq9Gkt5C0tpK
	TWcf8L7tFwsBwy0Z83XHJ2ML0t5M=
X-Gm-Gg: ASbGnctKp6ddpPsgY6rPoglkAFCSX8/nI2XrIlKjtEDzVyWUBTdJYxiXWLdoNkZKVhX
	LQzC+r6DxZ1eERJ+uHjmBWJxJqTdtQz4PjT9zaauMNHo5k4upCgvSMQiifMdG453lcruwCu5qYx
	Ss9VakqQk9Vxq0A18bv5qCUF2P16AaLATTniCr0dnhmIg8ZGtP77AJUQ==
X-Google-Smtp-Source: AGHT+IEZ6JrdsM+X6/oFiMELcQZOnF5rOEZgJb6IzcMXMMfODVI7x3d168v1mEgadxYfIgeevyRoHP44LTPpiWTt5To=
X-Received: by 2002:ac8:5f89:0:b0:477:4224:9607 with SMTP id
 d75a77b69052e-47aec3a6358mr115518641cf.12.1745108725089; Sat, 19 Apr 2025
 17:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416142219.554938-1-gshahrouzi@gmail.com> <aAPEUUAHsG2CvFbr@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <aAPEUUAHsG2CvFbr@debian-BULLSEYE-live-builder-AMD64>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Sat, 19 Apr 2025 20:25:14 -0400
X-Gm-Features: ATxdqUH4YSXlCHUZbebFf0oSKBKSNCeNe5rwbgvi-T6eASenCZbI8CI1A1SqyhU
Message-ID: <CAKUZ0zJoV6pLEFh6mEjz5awousn4o8Mq2D9AL8CfvqqW620X4A@mail.gmail.com>
Subject: Re: [PATCH] iio: ad5933: Correct settling cycles encoding per datasheet
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 11:41=E2=80=AFAM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> Hi Gabriel,
>
> Probably a thing for a separate patch but, would it make code more readab=
le if
> use masks and bitfield to set register data?
> See comments bellow.
>
> Regards,
> Marcelo
>
> On 04/16, Gabriel Shahrouzi wrote:
> > Implement the settling cycles encoding as specified in the AD5933
> > datasheet, Table 13 ("Number of Settling Times Cycles Register"). The
> > previous logic did not correctly translate the user-requested effective
> > cycle count into the required 9-bit base + 2-bit multiplier format
> > (D10..D0) for values exceeding 511.
> >
> > Clamp the user input for out_altvoltage0_settling_cycles to the
> > maximum effective value of 2044 cycles (511 * 4x multiplier).
> >
> > Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 =
Impedance Converter, Network Analyzer")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> >  .../staging/iio/impedance-analyzer/ad5933.c   | 21 ++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/=
staging/iio/impedance-analyzer/ad5933.c
> > index d5544fc2fe989..5a8c5039bb159 100644
> > --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> > +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> > @@ -28,7 +28,7 @@
> >  #define AD5933_REG_FREQ_START                0x82    /* R/W, 3 bytes *=
/
> >  #define AD5933_REG_FREQ_INC          0x85    /* R/W, 3 bytes */
> >  #define AD5933_REG_INC_NUM           0x88    /* R/W, 2 bytes, 9 bit */
> > -#define AD5933_REG_SETTLING_CYCLES   0x8A    /* R/W, 2 bytes */
> > +#define AD5933_REG_SETTLING_CYCLES   0x8A    /* R/W, 2 bytes, 11+2 bit=
 */
> >  #define AD5933_REG_STATUS            0x8F    /* R, 1 byte */
> >  #define AD5933_REG_TEMP_DATA         0x92    /* R, 2 bytes*/
> >  #define AD5933_REG_REAL_DATA         0x94    /* R, 2 bytes*/
> > @@ -71,6 +71,8 @@
> >  #define AD5933_INT_OSC_FREQ_Hz               16776000
> >  #define AD5933_MAX_OUTPUT_FREQ_Hz    100000
> >  #define AD5933_MAX_RETRIES           100
> > +#define AD5933_MAX_FREQ_POINTS               511
> > +#define AD5933_MAX_SETTLING_CYCLES   2044 /* 511 * 4 */
> >
> >  #define AD5933_OUT_RANGE             1
> >  #define AD5933_OUT_RANGE_AVAIL               2
> > @@ -82,6 +84,10 @@
> >  #define AD5933_POLL_TIME_ms          10
> >  #define AD5933_INIT_EXCITATION_TIME_ms       100
> >
> > +/* Settling cycles multiplier bits D10, D9 */
> > +#define AD5933_SETTLE_MUL_2X         BIT(9)
> > +#define AD5933_SETTLE_MUL_4X         (BIT(9) | BIT(10))
> In addition to making the above a mask as suggested by Jonathan, we could=
 also
> have a mask for the number of settling time cycles. E.g.
> #define AD5933_SETTLING_TIME_CYCLES_MSK GENMASK(8, 0)
>
> Would also need to update defines to something like
> #define AD5933_SETTLE_MUL_2X            0x1
> #define AD5933_SETTLE_MUL_4X            0x3
>
> masks and define names up to you.
>
> > +
> >  struct ad5933_state {
> >       struct i2c_client               *client;
> >       struct clk                      *mclk;
> > @@ -411,14 +417,15 @@ static ssize_t ad5933_store(struct device *dev,
> >               ret =3D ad5933_cmd(st, 0);
> >               break;
> >       case AD5933_OUT_SETTLING_CYCLES:
> > -             val =3D clamp(val, (u16)0, (u16)0x7FF);
> > +             val =3D clamp(val, (u16)0, (u16)AD5933_MAX_SETTLING_CYCLE=
S);
> >               st->settling_cycles =3D val;
> >
> > -             /* 2x, 4x handling, see datasheet */
> > +             /* Encode value for register: D10..D0 */
> > +             /* Datasheet Table 13: If cycles > 1022 -> val/4, set bit=
s D10=3D1, D9=3D1 */
> >               if (val > 1022)
> > -                     val =3D (val >> 2) | (3 << 9);
> > -             else if (val > 511)
> > -                     val =3D (val >> 1) | BIT(9);
> > +                     val =3D (val >> 2) | AD5933_SETTLE_MUL_4X;
> then this would become something like
>
>                 reg_data &=3D ~AD5933_SETTLE_MUL_MSK;
>                 reg_data |=3D FIELD_PREP(AD5933_SETTLE_MUL_MSK, AD5933_SE=
TTLE_MUL_4X);
>                 reg_data &=3D ~AD5933_SETTLING_TIME_CYCLES_MSK;
>                 reg_data |=3D FIELD_PREP(AD5933_SETTLING_TIME_CYCLES_MSK,=
 val >> 2);
I currently have:
                        val >>=3D 2;
                        val |=3D FIELD_PREP(AD5933_SETTLING_MULTIPLIER_MASK=
,
                                        AD5933_SETTLING_MULTIPLIER_VAL_X4);
which assumes val only has bits within a certain range which I believe
is the case here but not completely sure. Would it be better to clear
the bits regardless and then apply said operations?
> ...
>
> Though, I guess it would then be preferable to use masks and bitfield mac=
ros for
> all other places where we handle register data in ad5933 driver. Probably
> something for a different patch (if worth it).
I separated the original fix from the refactoring so the patches stay
modular. I can apply the use of masks and bitfield macros for other
register data. Should the refactoring be all in one patch or spread
across multiple?
>
> > +             else if (val > 511) /* Datasheet: If cycles > 511 -> val/=
2, set bit D9=3D1 */
> > +                     val =3D (val >> 1) | AD5933_SETTLE_MUL_2X;
> >
