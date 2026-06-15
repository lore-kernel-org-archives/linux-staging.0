Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9EF3BE17C
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509260; cv=pass; b=Gl1UWBPwpmsVx7u73gRgHCRJZMANxCdQZDQ0rJHV/b8KkCKd2xPVkj7+Ftfz0pzgApghWly4OftZlaEuKRSVLNMaq72aYuTPs7dsdIaMNjkdoVD9A/IQBU5y8GqTW3JifAfJd6M/UsNaDMdkKrNHmpFTsMtZ92rWkqXzUimGTGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509260; c=relaxed/simple;
	bh=qVrZbe5/3EpS9WVsxIHK6elR5r0CHewdl5PcbHGi64I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiTs8eNhaDMkNmZGw7zWDiM4lVkw/Pg53okn8jr9Aee7LpRsqrE51fYOJq23dhYVChOZczHakInhpRl63TJUg4i+z+E20nA3TKgJTs4Mu6rhmk7x2IzkiiDFDn2bbYG8NYlo4+SWbqDe9oGXaPueJMCfF2Bg0VUweyeOxPwpmx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEEk4mkq; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEEk4mkq"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-43d3a0dabb0so1997836fac.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 00:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781509258; cv=none;
        d=google.com; s=arc-20240605;
        b=ES4uSc3IVmEpVq8lOOK75S/GUOUUM48eTBhzS8Qj/aVcYIDqyYhfA4K5/Qew/3IAV9
         xrmbgsCxzI1IVkfrfvh2JeX53veHDsXkNIJaibx4pwMay4eWSpZ1aCAsEyTnH3FJxw3p
         JeqcCQw18kH0bmALV82tG3NdBeqrF4p7CCnUI4zyUnqUBAA4FgT4yE/lLii3XHtOLvCu
         KHENB5SZp5kPI33GErsrzWfsaJd5xREMzvsvPGS8/yTAmrdfQVvW3PxyOcZtyF9cB77l
         GFUqz0kqDFlf40K2SJsMd8Vqs+kzo6RXCNKRss1QkXbDpenxgYVam0z0oRUt6TtUhW3s
         FZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IE8HobeaUqCnA7mGs2Q3M8sbMuPFsFo0Jzi7k33xENA=;
        fh=KgnWCwkQuiQWjmSC8luuIhB3J4XC74PPEwl7Fn4lzU4=;
        b=GMTigME0aZeUAyjI0SXXYJ4JkIg/g6Bc6cWNml4Up6+FO1S2BalGgCZF8fcNkjNBq7
         6O/wI2RKX3Krv+FdOyzVxG4DF2rN3voAMJZj6v4hs4NGmBPcEnB2E9r4smkEA3O/mBH3
         WkapHzt7CgeIhLgor1qeW6I/0zPl2noFptfF9P76sI5TkNS3TjuiTx0rN4eId1nMFNz6
         YBBHJuRc/7ngzqCY2uLNYDPYt0QLOj66idW2Q4NdnQ0rWQfmVPrxEi2jtL7eAMhLNUZM
         2Winaf0pXOrFENLe2Dm1xy0s9eTxn7oKxBThk/Gx5LSv4y1BPx5gu6/moBOVhEfvg3SX
         KEKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781509258; x=1782114058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE8HobeaUqCnA7mGs2Q3M8sbMuPFsFo0Jzi7k33xENA=;
        b=DEEk4mkqoq8tpYGNc77lA3rjnb/1gwDIO78uyQbFRoXBWV6EI+fuqJotltQtZQ9yGm
         BLYXylYryuEVmow2ydArmYWi77D0s/H+K/g4FJjXb8gRZb5ZDBGFnZzL9kn0zPMx+bA7
         PPmqo8XHR3OvLQ+bBTPP+kI3O28Bxvn460vzMRRlhc4anhgXXFurix9LofI1q+AohQut
         vXK4BlmSq2xNJr2xG6qcfP8JvZEnwRllmfrwl0GCOu9RIH5ntPr1VY281f9JW7pxkNEg
         xuJ/QT4Vf72DoImw+SgcZ3O31ZoYci/cXIQHMali90biNu38HFq6bmO4ZY7tzp7KVWAo
         bE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509258; x=1782114058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IE8HobeaUqCnA7mGs2Q3M8sbMuPFsFo0Jzi7k33xENA=;
        b=J9dqlUL1Du+7ZQL/hooz/Rv9aFj4D3v3g/fSuh99YmZnJ8qhOsmfs+/1qNWvYTdxp0
         YqQzSQfysg3cPUOCZM0yuX68B1rmyYktbs+yYmPHZpN5qUZ9dSjYKNFwPlh12zSjyv9f
         KwVlcv/GJNExDPpFPuUktpgjO76xniesqliV/xZ2HAEV/xkgH5hazwZmlZk4MyxHRLpg
         6326PjZuAnayv9TldnZ/xnYsXWl9DgytwLe9ExI6lbrQcX0T5QoS1aAY1xeAwgnMexjZ
         OXImE1yUwEoq8hKuW4DSn2rjXurp+kBLEFer9TbIqKrI/mii/+pCZ6gJGopp1yFeHKlt
         J8Tw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZkUJsY8M7qJPE5vssCexlxQJPYoPUOAAU14V0wnPhjmRBc9RbBF1HQi9kMLQ/KCpTlo1Esd1gRZgxn7E0@lists.linux.dev
X-Gm-Message-State: AOJu0YynSIDpYmqsebiTPTrRqTpsfYvWY1FRWPCV57SwtNxhD+Ty0vIH
	ldDQBpNrs5txFC6SOt1FZczLLyZDBRUYufQAHAGzWZBi78e14AY/WHDBvAnHKpqS0odyfKF+1R/
	dUtusbp7jWMWHIGt2nn8f/zJd5AsS9mA=
X-Gm-Gg: Acq92OGXGGhoeUmV++HCvfF1EcRZ4xAFlxx/y8JX0Cq/eU0sg7l0p7XZefrtm1VUFBw
	g9NDtmY+XiY9o58WceZ/JDKilRr6muRr5JNddb+O6dq7w+GqYvazFBKg29U4BzT5zk7o8cuQu8Q
	EHbJacjPnQpw+K4D7Rb1P5MBjP4oqmizXH8RkBF5VOmZ252H4Tb2vNG053jnNa9sFIVkkY986dD
	G8CUznNp1ZZ2T9xxq9ljihFsdteC7fESTyBqNU6gZlByN2+LhXIdeJzAQfIk54cwWfV7SwfWmro
	bcDy1tkcsw==
X-Received: by 2002:a05:6808:4f4f:b0:485:6015:adcb with SMTP id
 5614622812f47-4872f607be7mr9109815b6e.41.1781509258059; Mon, 15 Jun 2026
 00:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614060857.15366-1-abdelnasserhussein11@gmail.com> <ai-n7jNPT862Wscj@stanley.mountain>
In-Reply-To: <ai-n7jNPT862Wscj@stanley.mountain>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Mon, 15 Jun 2026 10:40:46 +0300
X-Gm-Features: AVVi8Cd0ZhmYYuHMTy6NJD7swxol4CahrZskhHcUGlPTi6_xrUEbZWC2MSOEM54
Message-ID: <CANpqX3ZdbboYZNe5N1e4VmG_En2ZJ=1S5XHPJR9tcpuiF3HN1g@mail.gmail.com>
Subject: Re: [PATCH v2] staging: greybus: audio: check sscanf() result directly
To: Dan Carpenter <error27@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thanks a lot for the explanation and the valuable information. I will
definitely take your advice, learn from this, and focus on tackling
more important issues going forward.

Best regards,
Abdelnasser


On Mon, Jun 15, 2026 at 10:21=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Sun, Jun 14, 2026 at 09:08:57AM +0300, abdelnasser hussein wrote:
> > Smatch warns:
> >
> >   drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
> >   warn: sscanf doesn't return error codes
> >
> > sscanf() returns the number of successfully matched input items, not a
> > negative error code. Compare the return value directly with the expecte=
d
> > number of conversions instead of storing it in ret as an error code.
> >
> > Also remove the redundant else-if check for snd_soc_dapm_aif_out. The
> > widget id is validated earlier in the function, so the remaining branch
> > can only handle snd_soc_dapm_aif_out. This avoids a compiler warning
> > about a potentially uninitialized variable.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp=
@intel.com/
> >
> > Signed-off-by: abdelnasser hussein <abdelnasserhussein11@gmail.com>
> > ---
>
> This static checker warning is triggered when we propagate the return
> from sscanf().
>
> >  drivers/staging/greybus/audio_codec.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/gr=
eybus/audio_codec.c
> > index 720aa752e17e..6daa4e706792 100644
> > --- a/drivers/staging/greybus/audio_codec.c
> > +++ b/drivers/staging/greybus/audio_codec.c
> > @@ -311,8 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info=
 *codec,
> >       }
> >
> >       /* parse dai_id from AIF widget's stream_name */
> > -     ret =3D sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
> > -     if (ret < 3) {
> > +     if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) !=3D 3)=
 {
> >               dev_err(codec->dev, "Error while parsing dai_id for %s\n"=
, w->name);
> >               return -EINVAL;
>
> So this code is fine as-is since it's returning -EINVAL.
>
> >       }
> > @@ -323,7 +322,7 @@ int gbaudio_module_update(struct gbaudio_codec_info=
 *codec,
> >                       ret =3D gbaudio_module_enable_tx(codec, module, d=
ai_id);
> >               else
> >                       ret =3D gbaudio_module_disable_tx(module, dai_id)=
;
> > -     } else if (w->id =3D=3D snd_soc_dapm_aif_out) {
> > +     } else {
>
> Yes, this is what the static checker is complaining about.  It thinks
> that the if statement might be false.  But to a human reader, the
> else if or the plain else are equivalent.  It's just a style choice
> which way to write it.
>
> I would just leave this as-is since the original code is fine.  To be
> honest, most old static checker warnings are stuff that someone
> already decided to leave as is.
>
> It's better to write new checks.  Just look for simple fixes in git
> log and then you can vibe code a check.  Better to work against the
> devel branch of smatch.
>
> regards,
> dan carpenter
>
> >               if (enable)
> >                       ret =3D gbaudio_module_enable_rx(codec, module, d=
ai_id);
> >               else
>
>
