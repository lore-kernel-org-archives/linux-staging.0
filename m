Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81263242D6A
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779396434; cv=pass; b=n/02r1bgDaLxz4l3NvNFizzLuhO6LGwWUCcfyhoESJ/haDf8nSdcbSB4aJW6Cn/YszXPcgSyGjL58MALQGeIaA+Nd7OYlIPZVHgfK9QDMKzk2bm+2UfJuoCfcmJSwJhutszE9XE60AYfGq/cdb4ISPCxSbB6TjAYZYnxmtX/0og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779396434; c=relaxed/simple;
	bh=2xcDJ5IMJgCkJMw6bLeE3H3kIk07O3Hvl1VVW/5ehI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXyJ2BmmMPEzcT2Oa3pvt/idkW5G0DPRIHOCEwuPQgA6J2OfmGt6tIja08aOtwfaAKTClJ+pwVu6O2c6+d4juIvSfA92QQrl4zQImJKUkDNkMQkqcoHyRphWk+HszI5tebPAQwHP8AETyzWLC1CNuHS2OSAQGu6NppcSBo7rKOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMhz2zaT; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMhz2zaT"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5148cbdea08so54659661cf.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779396432; cv=none;
        d=google.com; s=arc-20240605;
        b=cvgOmyc8ZjbIDh613+yPmKbEqzkZYMAbBPYtrPEKODz+GniMt20R1lzx8Pz+V+DRjR
         7Q+koD8/ThjvlhuuWbnTP/q31bTsBWeEoODCWD6lHFQQTHJFokmoDVA7kA+0K8A3p32H
         dbObDIHWYz6HxCDKSUPSgj0J+uz6hT9DEixis/4G947BFiIlJv2tmt/vLI/lAl1GHiPx
         10RffkLWbRF9mmO41uBETcmzXcPhfUuRvl7i18YamIK8Q9OTXX0EhlYCWawVcqBemJ15
         iRBxGaVzFuG9/C3iXF/NZZPoOr953gGFsv9fB0dhEiVZWbfjntRP5/2ZzyQsWEuncgT+
         L/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I9kWb78y0UyupKmH/8kF9vHfYOR/cIh2LNhnlYNnlRU=;
        fh=3Er7gBoSrX46580Qm7o++UD1A0ICuUL8QshMh5Ncado=;
        b=flyvYnToDRvzbaUV/x8TdG5gHe8l9RnFlCsjDeEpmAfsR4s5s4UGj7+RAGyDs2ZR3X
         q4B4XVufDZWf17NdCvHhRG+CMq2Qn2YI6R0ep/68xWPXma6xLLPbgyTpcIWyOQfeUtPB
         PFyAIIsN9av1gRdD1xWHomD2rLr3Xv5yHHNyRFpfpMZbi6UKwC/5JvydzkTcoxunEneP
         4o0GIRj4MG+nzW5h8kJJDJNG38niHiphwTX+rtE4mecM5e0yfP5RLBi4BsDPgrl92sv4
         zAs38rOphGKbRqtsQiVJGpohV7aQx4H22ybRRot9/EbifBB9AnAyBSMVs0Gj241MjY0f
         BK7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779396432; x=1780001232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9kWb78y0UyupKmH/8kF9vHfYOR/cIh2LNhnlYNnlRU=;
        b=fMhz2zaT/g5iFzUiXNl1dKKBtUwFLwO8CSE0kydGdSiCP5ItJSGFOkUSHlu9FheNNz
         FAuL9na0bsAJzUAQ1ad7cWcH9MIXwwAXKYW1E5kICBZ4JLc4Ik2vTNnIYJ3qnum8JPpZ
         fEufZqBsyC/F3x9c1WorRpxYHiaZASOTBiXRHp2ZSPBmC4ycIHetuVwRX9DguBsNsLHp
         m9aYDPm+hNFTlmaRblFKCkj9DabbDPON3GPU1ECThIYG/tWT7T/7gOfTMwjfA3oL2YBA
         cSDPj9ttjxf5F2HZMhgOED9QBYK+y2BGv6+AiGH1cmA0d3AuLiHpfmhx4TfjZKDXeD++
         YUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779396432; x=1780001232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I9kWb78y0UyupKmH/8kF9vHfYOR/cIh2LNhnlYNnlRU=;
        b=YV6Rzn47R6//uZXQwP6aPif+Mx4+n/+FVNEnO3zQwQRuS7kcHkikOx5l8vEmrJRd6R
         FSWL3dOpZak9McDZAfey13zhtHqUGcL1i81D6iRr5UdjMQlYAzjoQap49nKChiHCUPlg
         vwjPTbvLgVjX7g6yQ4KaZWkjDP/ssb1DOfu37XoJmLFYxFiv09S0nIb75rXbbgyrRyui
         0OsYEi8wpXvgmHdRTq/c7uXQ3cqDhzdT1bQy3Fwi/eN8MhUHGFYUNkw7sPmcXPsIPi7h
         a8M8DoWXubcysWeK+lFKA07ft7PYZ8rg5lon52tflt51iqXP+9bu7Yy+aiDJjBcukx5H
         RU7A==
X-Forwarded-Encrypted: i=1; AFNElJ+QvPZVEyYGONtbZpk6LLxp4hPwgdVr2UBycobvuJ0oKkcFduCxj3Fkj2bvdDZXKjAJLA5fDTFJfh/Jq2QT@lists.linux.dev
X-Gm-Message-State: AOJu0YwHSG6WfL6M3RP+Ux/dmJdriCnsiX8hbmX6bI/g+8ge7kRvLbNO
	/HrRARSO9ITSDDiu9yoVwshBp+vro++nJgiwA9coxC01NGBwONsi65tgILXY0pd3vnxKsQecXML
	XHfIxAqOcxJ/kqhgRRKOEekKYrq7diMk=
X-Gm-Gg: Acq92OFa4HJq73LH+aDy+M/fXHRS0lC32huF1uqagBPLD55ZLgTAT8E7b0OJJOl5SFU
	6L5/oQpPO6HtqBoNdy6OAT3wyXSL/9xQfgo8x5+6+hjFwCBFPq0xf0j7HfmHN8Bx+cavsFQX4+d
	//4RKltROhz7hjv9U6/HXhTnXNN0X5lmip5jglSCBCcZp2OTGseQ8vb0FKnU1BAb1ry98Lp22zn
	t/Hs6+hVk9i8hMH0Rlvk0TJ3NCAWOu7tmV27w+b4Q5VR6osni7Jd9CnfP1856P4qfIjAnzeeBw5
	l4GOv7FZG5bhYm+SFjGyVNfRrAclz9r0NCGuTF+bMh3CaEHeOwU=
X-Received: by 2002:a05:622a:4019:b0:516:d612:d1d0 with SMTP id
 d75a77b69052e-516d612e01dmr4130061cf.44.1779396432358; Thu, 21 May 2026
 13:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521142655.24408-1-diegomancera.dev@gmail.com> <8c739c37-d94f-4fc1-82a7-9575f85236d2@sezginduran.net>
In-Reply-To: <8c739c37-d94f-4fc1-82a7-9575f85236d2@sezginduran.net>
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Date: Thu, 21 May 2026 14:47:01 -0600
X-Gm-Features: AVHnY4LQ3nNVylC-HtDVAZhqTXMzlr_d9tF4Gp_KAOVOiGz_1f4ATaZZXGzU7Ao
Message-ID: <CALruWrVXXD8Y27X5=H6BGeFcOEQZr9hc76QVqr0duYq_oa2m3A@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: add const to g_fbmode array
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 2:33 PM Ahmet Sezgin Duran
<ahmet@sezginduran.net> wrote:
>
> Can you make sure that you had enabled the related module?

Hi Ahmet,

You caught me. I sincerely apologize.

I forced the compilation by running `make
drivers/staging/sm750fb/sm750.o` and immediately saw the errors:
`error: assignment of read-only location =E2=80=98g_fbmode[index]=E2=80=99`

I realize now that adding the second `const` breaks the driver because
`g_fbmode` is dynamically assigned at runtime inside `sm750fb_setup`
and `lynxfb_set_fbinfo`. The `checkpatch.pl` warning was a false
positive in this specific context, and I failed to verify the build
properly before sending the patch.

Please drop this patch. Thank you very much for the lesson in C
semantics, build discipline, and mailing list etiquette. It won't
happen again.

Regards,
Diego Fernando Mancera G=C3=B3mez


On Thu, May 21, 2026 at 2:33=E2=80=AFPM Ahmet Sezgin Duran
<ahmet@sezginduran.net> wrote:
>
> Replying an off-list email:
>
> > To: Ahmet Sezgin Duran Subject: Re: [PATCH] staging: sm750fb: add
> > const to g_fbmode array
> >
> > Hi Ahmet,
> >
> > Yes, I have verified the changes. I compiled the module using make
> > M=3Ddrivers/staging/sm750fb/ and it compiled successfully without any
> > errors or warnings.
> >
> > Regards, Diego Fernando Mancera G=C3=B3mez
> >
> > On Thu, May 21, 2026 at 1:52=E2=80=AFPM Ahmet Sezgin Duran
> > <ahmet@sezginduran.net> wrote:
> >>
> >> On 5/21/26 5:26 PM, Diego Fernando Mancera G=C3=B3mez wrote:
> >>> Signed-off-by: Diego Fernando Mancera G=C3=B3mez <diegomancera.dev@gm=
ail.com>
> >>> ---
> >>>   drivers/staging/sm750fb/sm750.c | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750f=
b/sm750.c
> >>> index 89c811e0806c..8f533f3b1b42 100644
> >>> --- a/drivers/staging/sm750fb/sm750.c
> >>> +++ b/drivers/staging/sm750fb/sm750.c
> >>> @@ -21,7 +21,7 @@
> >>>   static int g_hwcursor =3D 1;
> >>>   static int g_noaccel __ro_after_init;
> >>>   static int g_nomtrr __ro_after_init;
> >>> -static const char *g_fbmode[] =3D {NULL, NULL};
> >>> +static const char * const g_fbmode[] =3D {NULL, NULL};
> >>>   static const char *g_def_fbmode =3D "1024x768-32@60";
> >>>   static char *g_settings;
> >>>   static int g_dualview __ro_after_init;
> >>
> >> Did you compile these changes?
> >>
> >> Regards,
> >> Ahmet Sezgin Duran
>
> Please reply emails using `Reply All` and avoid top posting.
>
> > Yes, I have verified the changes. I compiled the module using make
> > M=3Ddrivers/staging/sm750fb/ and it compiled successfully without any
> > errors or warnings.
>
> Can you make sure that you had enabled the related module?
>
> Regards,
> Ahmet Sezgin Duran
