Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEF421170D
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744995399; cv=none; b=pLSStH62BTRSENsPfW8DwungIi01J9rqut+rTgka2ShDLv3EKoD0nCbznTXmpBAhbnpJxwN8aelFwiIkKs1RIXkMuLQC1w/iyl8o43irj5ItFLFq8fYUNTZIKm2gMCGsFS2bYMmJ1arfqmDHdjd7b/P/WP/HOTc6Q44wGQ8mBBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744995399; c=relaxed/simple;
	bh=O7T/++NqyVHJUCBmNizNFjjdmPvqntc/LpS5w6yPJoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJuo6saOUwe2LemQJSHoEcG4uGmq0dvzB6d6fdocQXDMtCNxoeseoTCdA3Q049xgcCgSmNl/FEjT4fWbfYFMOKhTVrutYJGusGb/5trnd5HdwNC+P6GFgBoZPvEqrBJefEZ4xCCPaaJx0HQslRz01Bf3eNJxvI897NUxFRHzC/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmD6stw8; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmD6stw8"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476a720e806so17435691cf.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744995396; x=1745600196; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jaGJsH+S8jpQO9hSU9jQZG5RILNp2wtg9XnJDjLa18=;
        b=LmD6stw8T4n8NAXSmZw7Iu6n1AQ4eEE5BNkoeDrn8CSrLVVQqPBcY4Cw5plSMkfyQA
         VNsmFA3F/SCzkC8stoVq43SPz49diF0k2HLHpuCO2F/dPp4Y4vbqU1MxUP/GN06ydFB2
         bY/LqyC8rLMlXussz9uSk/J+kgMSDVWSnjaOTQVc/5RT4VMhqWES0JEiWR7HmrA0tsbU
         Yb2Vg3uQurVgkk1vXjSUV4kGIyVOlWIkM633m8/tulvIGPtEM3J1lH0BtyO29YYjyarn
         h8311MmF/mFpnFGsvFFc4sK/zbMDrKfWOL53/dXD9GqHpP/NukxubqVX914uhOjsPzhQ
         mxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744995396; x=1745600196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jaGJsH+S8jpQO9hSU9jQZG5RILNp2wtg9XnJDjLa18=;
        b=eZa8sYsHPnZQ7TAkf+jeIsVvt8811dvLhSKxJa5T/mhel6AzThdNBXUhC3GZRtHYC8
         hM/vWcL0jYsJiqS5a4sTHcXj8LnBSMQ2eQDzPiW3foU+fzAEvaTPZjj8X735w2aN5KvZ
         IgEWYw2mybE6CHHy7jhqic6e/gHec1a7qiYF8U/VzBYfDQAP1DKz2vm3j66Q7EBwysAf
         FDxF8CacxZf8D72zPg0wJAfGjL0ILKRz65RzPfTZvc4iZmUeKG8cMKzhNmugJffXE/N7
         1zDr4TO4Wx39qQSR/CPR7J1GrbCCXqdvQRC90eIqoestlpnr0gHbyi+KVbvsg1F4djlr
         W95A==
X-Forwarded-Encrypted: i=1; AJvYcCW8mw1yLzbpJDpKq/XPuAq3X+PqN0qSa0ukr0IJg8OPwMyrG4TU6N3NjRy2qANDeqdrSWp/R+vMl/TQ1s2I@lists.linux.dev
X-Gm-Message-State: AOJu0YwappZFoacXMMMlfXJ5rKZpG12ntBXo2qrgmPvjZZIMNos6nnrV
	Y+xE2dg+ABlBTFsv9WTKv/1dOfCGBjopO9cM0A8pgNHC/8A+p+igJytaBlBpq04ED9YwRCNG53V
	HSTeBzIanM4+F96hG+7dCfXJAkfY=
X-Gm-Gg: ASbGnctoLr7BnQUfcKSSi4604/uTnJNKw6OnHt7WDpvnPeYQXHUGuiZEQcVf0D5JDv0
	bpnoFJDPLYAcX2y4bC7uFI9Jqibn3YGTkd4QYx+4OqZETnQvuQIAE5Kybmbjc0nooRRlikyiNhR
	NPc2Oht5XBs7fa5BlkpxLJTQFkevCkkIRPgrRo+leSMDJeocZAu4b2
X-Google-Smtp-Source: AGHT+IG2QUATXIP2+rB45u1mzURWs/cHRUxQnEqv+a0uOxz+PDpzzpxSpuZBbAQBnMkO/jkpMnF7kVt3ZbL257up+2A=
X-Received: by 2002:a05:622a:1a96:b0:477:6ee2:18ce with SMTP id
 d75a77b69052e-47aec3543c7mr63069171cf.3.1744995396324; Fri, 18 Apr 2025
 09:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250414154050.469482-1-gshahrouzi@gmail.com> <1fb5f1c5e61ce386cb431d48296e952bdd560a6c.camel@gmail.com>
 <CAKUZ0zLiP_w-4xOXfBDdZbm+M8yVYvd+A=M73fnRT_kMyWwk7Q@mail.gmail.com> <20250418161841.4ba1d05e@jic23-huawei>
In-Reply-To: <20250418161841.4ba1d05e@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Fri, 18 Apr 2025 12:56:25 -0400
X-Gm-Features: ATxdqUFg7My0cJl2r_WyXXpWhu1eFcrdLyqNpZBk2FWlOi3nyhGlEBznApakYhU
Message-ID: <CAKUZ0zLW-X9oNxEhh++65y1cjX5c77v=kqqvGTaATaBXCs-Neg@mail.gmail.com>
Subject: Re: [PATCH v3] iio: adc: Correct conditional logic for store mode
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 11:18=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Tue, 15 Apr 2025 09:54:00 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > On Tue, Apr 15, 2025 at 5:13=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail=
.com> wrote:
> > >
> > > On Mon, 2025-04-14 at 11:40 -0400, Gabriel Shahrouzi wrote:
> > > > The mode setting logic in ad7816_store_mode was reversed due to
> > > > incorrect handling of the strcmp return value. strcmp returns 0 on
> > > > match, so the `if (strcmp(buf, "full"))` block executed when the
> > > > input was not "full".
> > > >
> > > > This resulted in "full" setting the mode to AD7816_PD (power-down) =
and
> > > > other inputs setting it to AD7816_FULL.
> > > >
> > > > Fix this by checking it against 0 to correctly check for "full" and
> > > > "power-down", mapping them to AD7816_FULL and AD7816_PD respectivel=
y.
> > > >
> > > > Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devi=
ces")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > > ---
> > >
> > > LGTM, do you happen to have this device? It would more interesting to=
 move this
> > > driver out of staging :)
> > Unfortunately, I do not have this device. However, I would still be
> > interested in contributing if possible. I was looking over
> > https://lore.kernel.org/all/20230716144024.30ded663@jic23-huawei/T/
> > where the goal seemed to be to modernize it by replacing the sysfs
> > interface with the iio channel. I also looked through the datasheet
> > and it seemed to be missing some stuff like a channel that can be
> > selected.
> > >
> > > Acked-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> Applied to the fixes-togreg branch of iio.git but amended the patch title
> to start wit
> staging: iio: adc: ad7816:
>
> so people looking at a short log can see what it is touching.
That makes sense =E2=80=94 it's clearer for anyone skimming the short log t=
o
see what it's touching. Appreciate the correction.
>
> Thanks,
>
> Jonathan
>
> > >
> > > > Changes since v3:
> > > >       - Tag stable@vger.kernel.org instead of an email CC
> > > >       - Use the correct version for patch
> > > > Changes since v2:
> > > >       - Add fixes tag that references commit that introduced the bu=
g.
> > > >         - Replace sysfs_streq with strcmp.
> > > > ---
> > > >  drivers/staging/iio/adc/ad7816.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/iio/adc/ad7816.c
> > > > b/drivers/staging/iio/adc/ad7816.c
> > > > index 6c14d7bcdd675..081b17f498638 100644
> > > > --- a/drivers/staging/iio/adc/ad7816.c
> > > > +++ b/drivers/staging/iio/adc/ad7816.c
> > > > @@ -136,7 +136,7 @@ static ssize_t ad7816_store_mode(struct device =
*dev,
> > > >       struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> > > >       struct ad7816_chip_info *chip =3D iio_priv(indio_dev);
> > > >
> > > > -     if (strcmp(buf, "full")) {
> > > > +     if (strcmp(buf, "full") =3D=3D 0) {
> > > >               gpiod_set_value(chip->rdwr_pin, 1);
> > > >               chip->mode =3D AD7816_FULL;
> > > >       } else {
> >
>
