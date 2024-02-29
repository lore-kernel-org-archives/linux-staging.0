Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43431137753
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709219757; cv=none; b=F9x9CgwRr8yil6cs1kYfwGMS9SRyVfeAiL8/He6v8/GlZNuc4tnjA+ZJObEK69rVStzzE9ERsA2C4U+zyvpwK2gJY2HweKpBgyM2gsA527n2Fc04snFMeGEGsmXSIcYrRZ2mb0oWYNj9rmJTFSZG/aFdDGOOSQaG+J3JhRy3Bas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709219757; c=relaxed/simple;
	bh=CMg56geOOc7u+9Ot72DBWXSDwNyJX1YOqqE0Ry+xNaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnQEdMDtwX+VEPpI0bg7OpYEGgUeMO/Y48h77M24VzTXoTXv9PxXplJEtFBgpSmV2LlTDn4l/Bvpy4/lStZ8Ag6yyKPepbeXzM8WyuaeSJquTZ4Oyx1rt7cJyhtWM/NnAsDEvHCaRWKDAryRPuWrxSYLFYmMy292LMgwBO+5eEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBgdnDf7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBgdnDf7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33e1207bba1so458107f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 07:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709219754; x=1709824554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wui/V5y8FOLo8YiI+83F7lgNFV8HwNcsEwhvDRA3dk=;
        b=cBgdnDf7SdN8SOyW1IdX0dnlrUzarqvXiOGoXTzsxOcOFhS1PmeaUrwOzZiQWfJHPj
         xcvI+Pffpi9EW9HLGxw5hLmqD9Dwu8N1QexcWNAiD4e+ByjeXZXYipJ5N6Xc+CytAzo3
         HJr2WFatlthyBRWAmQTeTim4vCHZ0/MyLC5wYxHWNwsbfoCTmwa8VUxhaO6jH/hdN1TX
         BUlg4m95P1CltoKULgYi2IHeOR9KVdkshXxXIqOvCQzdDNVoUJgMYUgauZQLevazk0Ta
         f6J2FY06Gx0yCh6v/Q0iTm5TfqImcLY5o9vw8XpPFTvWzZBUMNfENFzcBZytbruSgGDC
         hwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709219754; x=1709824554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wui/V5y8FOLo8YiI+83F7lgNFV8HwNcsEwhvDRA3dk=;
        b=aq8EBWuIkO9UBPCHF9QN0AV2lzsIxjaxwPOAKRt2DKz17iZysKWUxIoX5vCpY5iDZC
         dHMPuzwzE9Di2tJpKhLhKDK/MxGUaEqUtA/xSYCK/0fUr5v9RwRtMheCrz3S1HE3BPU8
         8qMZxLvf++6+A88vlgp1wx06C6oXV4UvvEB5HaJjFxErr/enyhhTJF9stbS0C+vRPyjM
         0EYo4LWYWI3vWHIv2Ww1bzcy13lAU1PPXNA61c0xhP7YzJbgBqu0IsaJ52Oqg8msw7Ay
         FliG6cGY934BFPz8LO5bUiZjyW4rIUX1HOmM3+LN4OSgvmI1KTtLOSWw1TI87cbp0/S8
         n5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwU04FlC4cPeBrNSKPrfbGSqYOR0cHHw4TU2mrBlPHuZv3ZKQ6hrhcwQanMtk6TlOthue8cXmLR1W2XNyVszRRSXO7Trdwz9I6iOGzyA==
X-Gm-Message-State: AOJu0YybtrptiAfY88+Vxo3I1+VkdEO7qNMHSNmpZp9UB3eHamOFC/th
	BOctWRqUTwPuQCfNiu4TY0BjSZejX4/B7YzL+3ktyzB/3hL/mKg9FFoxWJs3hxA3iFdcRvKb1gV
	7a85RIedypBc3ky2ceD8orME6/cU=
X-Google-Smtp-Source: AGHT+IHBfx8h6PdIH43PxYY+wWK3aRQjRg+CgGijUqZHtNSgcpoCMEjUhxFG+Ur8m68bSm1/0QI0M0MWqrtcFGzwaAY=
X-Received: by 2002:adf:ed89:0:b0:33d:afbc:6c76 with SMTP id
 c9-20020adfed89000000b0033dafbc6c76mr1609517wro.1.1709219754260; Thu, 29 Feb
 2024 07:15:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240229120541.219429-1-colin.i.king@gmail.com> <f7b36055-a710-4d57-b952-33431876e221@ieee.org>
In-Reply-To: <f7b36055-a710-4d57-b952-33431876e221@ieee.org>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Thu, 29 Feb 2024 20:45:17 +0530
Message-ID: <CAAs3649g_nr5-6PLnGL31ouo5GMhn7o0zuDOjSO+HmG6vUnkXQ@mail.gmail.com>
Subject: Re: [PATCH][next] staging: greybus: Remove redundant variable 'mask'
To: Alex Elder <elder@ieee.org>
Cc: Colin Ian King <colin.i.king@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 6:51=E2=80=AFPM Alex Elder <elder@ieee.org> wrote:
>
> On 2/29/24 6:05 AM, Colin Ian King wrote:
> > The variable mask is being assigned and bit-set but it is never
> > being used apart from this. The variable is redundant and can
> > be removed.
> >
> > Cleans up clang scan build warning:
> > drivers/staging/greybus/audio_topology.c:764:15: warning: variable 'mas=
k'
> > set but not used [-Wunused-but-set-variable]
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks Colin for sharing this patch.

>
>
> This is a reasonable change, but I don't know this code that
> well and would like to hear from Vaibhav (if possible) or
> someone else whether they think the mask value *should* have
> been used in this spot.  It doesn't look like it to me, but
> I'd like you to get a second opinion...

The original intent was use the mask field while maintaining regmap entries=
.
However, I could not push changes on "maintain regmap" during ARA days :(
Anyways, for now it makes sense to drop the unused mask variable.

>
>                                         -Alex
>
> > ---
> >   drivers/staging/greybus/audio_topology.c | 3 ---
> >   1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging=
/greybus/audio_topology.c
> > index 08e6a807c132..5dc4721105d4 100644
> > --- a/drivers/staging/greybus/audio_topology.c
> > +++ b/drivers/staging/greybus/audio_topology.c
> > @@ -761,7 +761,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kco=
ntrol *kcontrol,
> >   {
> >       int ret, wi, ctl_id;
> >       unsigned int val, mux, change;
> > -     unsigned int mask;
> >       struct snd_soc_dapm_widget_list *wlist =3D snd_kcontrol_chip(kcon=
trol);
> >       struct snd_soc_dapm_widget *widget =3D wlist->widgets[0];
> >       struct gb_audio_ctl_elem_value gbvalue;
> > @@ -802,7 +801,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kco=
ntrol *kcontrol,
> >
> >       mux =3D ucontrol->value.enumerated.item[0];
> >       val =3D mux << e->shift_l;
> > -     mask =3D e->mask << e->shift_l;
> >
> >       if (le32_to_cpu(gbvalue.value.enumerated_item[0]) !=3D
> >           ucontrol->value.enumerated.item[0]) {
> > @@ -815,7 +813,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kco=
ntrol *kcontrol,
> >               if (ucontrol->value.enumerated.item[1] > e->items - 1)
> >                       return -EINVAL;
> >               val |=3D ucontrol->value.enumerated.item[1] << e->shift_r=
;
> > -             mask |=3D e->mask << e->shift_r;
> >               if (le32_to_cpu(gbvalue.value.enumerated_item[1]) !=3D
> >                   ucontrol->value.enumerated.item[1]) {
> >                       change =3D 1;
>

Acked-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>
