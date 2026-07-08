Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8132EBB9E
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 03:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479905; cv=pass; b=qbE79DtSBYuSLHIvoWFO3/EgjAbAh3+fPAswZD7a9wjJY7YLT3en0iLAHiax3hb1mtUjj+PSIfscCeGwSHuiQepcn17hIUwDVcB2S+SQteu9oie4hODPRbCvhU/4esEd7sLoS7uYdcs5cnXI/FQuxlVX/BHCEpo/olff3SAwFyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479905; c=relaxed/simple;
	bh=chsPa3PrXAEUEgzR2gIA/zhhWCOgC3uVGg97PvuoFgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyDiNkO9b0FNteEmzU37wrnLkGpoS5G6YJgD2x7iTz6Nl90hjI61C2LMSAKKXXTmpitWXYiTlcixA/RdFZZlF5JxY0D0qbl0aPblUSiCiMOeD9Gv4VusOKjx9XEe5EcVV4tsyrvLdtaUxVkFDxkcM8wG7enZHYEWap1SjAwid/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQ1SbDKs; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQ1SbDKs"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9b24c46caso5674a34.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 20:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783479901; cv=none;
        d=google.com; s=arc-20260327;
        b=W2fn+3QfPKl6O9UQmE+KRUw6hspa/yl812o54VTBEIE9AgeLmqD62cLeUPC/kBiggB
         +rVw8S8g6iivjLU/aqO4jsU29plHQxwtn+1NAeGRYhylo2DUcdwlHOm3tWdjrUkY/4/8
         SSu7H9cSje5oyIA642dOK6nWIXXSpmbG5ovGIZQP21ZO6FyTkTsqNMLLrxDIAMoV+o1K
         2baxdAJESHtUivslYammM8hJs0ncDaN3HfoQWowdLV5j4sfOg8bkpvYhTjUxjeQCkbE/
         D8lVOAEwUazNeFSTxD0lm6JY1W6j5czdjNtX1UDa2UDWxd+KhaaEpgldg9eXQgu3RgDc
         B1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t0Oxs6yifRrQtckE7lh7MhuoDMg5v+QCzZUpFln4pLs=;
        fh=f+pyddaj693UPnjUqaWW7t+p6PHd/KgVSRwQkBjXf4U=;
        b=Et2uM2akIn36/aGFWEPYLmeaiW/XwARGi9ARJsmv+sIctN9v2kGcwtYWdyFY+FXou2
         fV36Ml4aWlGhn1U8+Q8dDMWd7UW7bWEgXvZDQGbMnt8tHrDOmurbSHE0i+R7E7ulEoEM
         hhqAvGXJipwSZ+H/6zCttgtnnomTNsUM4adngwu9iZ4JFp2CMRJCi3Xs4SVLG72CZycU
         or+0ouHBdriqjp8bVt1OLD19sPK+b41vnZc4K3j7ffDutMIxh9xyYPBstAJTCTt++8I0
         HkSSAt51H/5lbcUOTZltX6uGEyZ+vWw++ENZUy0fHyNGjTjwjzGjFKPUCI9mjbQ1QKWO
         ErRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783479901; x=1784084701; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0Oxs6yifRrQtckE7lh7MhuoDMg5v+QCzZUpFln4pLs=;
        b=AQ1SbDKskqlmGnGdAv43ucsqHgtbJR3fELr7SN90hDdhuIRoUoW0DhYoqcZn6q8UOO
         LgF2L4RP86+zQtrz6m2mUp5LtyB2ExITcvLAX/c3RBBUdU6Svs5b9BspcSJXfnvOfXCb
         r9oaNLraAxy4y5nYYGsKTSwBs+i4lFUYwG1Xd783jY6gInyXFEspjo2jCRheu/NZ6QAd
         bI9A7OdYZBV2GjyaXxSxCQBrpqv2esGBdTKDGsi/Hws8z47JEnS0Gb4dZP7Timmedxp9
         lpVBPkI1LldNpFBYAb51lRTf5hdU2bEYbwQAyRbkBfF19h+/jcNhGtPKHmF8+Nsty+k4
         EfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783479901; x=1784084701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0Oxs6yifRrQtckE7lh7MhuoDMg5v+QCzZUpFln4pLs=;
        b=P8lEtO4/ezWmqcxbxe82fxmNFGAUGqAgZewgYgUboz/8apyfonnJcG0E9KdJ81GbZG
         Xanc537rbHr+Vd46gnmarEMSHF2hzk24+VdC9rOEimdinim+YCreARsY0CJEDathk/xg
         HrC3Mt7Ih8js48XN8IVgw+6qgIa7xYLgTck0b2UQo0ZmGsSqCEiRpycBVOpJe4Ez5ruq
         CtVoQrLY/Ce7Yb8UpOBHSKv6BqMThEtcs3x4ZyETuD/U18Ips7qTxV0KxYdRHvgtlzKN
         m9T1ypHXuJMy8c+2ifXkQtv9uL9qVOHV5bIstowZxI2WwfMDIfuszEKXqrU1jT8LzV9p
         VlbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9msLaQ2u8BKIdlCBwYRTTSM77YLu5K7ExhtkiKdd8fmNHnJagRm2HoFGM/FznPMOOhg7ILwAEqvZpgEMu6@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrq3+t557BUFpZ6wKOHjlN2awDvmcBuMxRwfOgdZ35YbImf83h
	7BISUATeY+gzJOi6YIlNggZoqvIDqRcUUNgzKtGBYr0V8rUVJVh5XkFrVECgdrAle7JbtbBoh99
	3LlcPeqYvl4rWzF6B1C/UH41BXESYebU=
X-Gm-Gg: AfdE7cmMjO+a+epdEcyPsx2OIdg+Ve1Wwa+Et4FHPFxCFl4/phI9XknrSpJWSteMbSW
	0jQGyccd06a8J8VVY7xGe+yYOTgP7m+1V/o7TBmBNUUQYInGzcq+OMTKTK81eBDFtzJhlmFVRqH
	x06WS9QfP+B30vup706IrcpiJHOWwqdyyzHwevyIl1Z86WrUruWf07Ku2/EOwVXft5DgFNG3+ay
	sCarT9HbvSyMWzEDJ5eG7ZnUOyhOdXT9TZ3ewniQAyP48eVKgwtD5C4VM8KBMx70AwNgcCjzWM4
	nGvLT9csGVhWPmk0DPA=
X-Received: by 2002:a05:6830:81ec:b0:7e6:6f9f:7445 with SMTP id
 46e09a7af769-7ebcff80811mr293192a34.3.1783479901517; Tue, 07 Jul 2026
 20:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706000738.18478-1-nealpatalay0@gmail.com>
 <CAHp75VcSGXC=x3hFXt8qvyRQjPzy3uLN9iBTURp2yA9+P_jibg@mail.gmail.com>
 <CAGjuiT9gu32wvx2Vf0U0g9deyAzzGtwwCNEdW_R4JVarO9x4JQ@mail.gmail.com> <akyoLqy98pt2iRkP@ashevche-desk.local>
In-Reply-To: <akyoLqy98pt2iRkP@ashevche-desk.local>
From: Neal Patalay <nealpatalay0@gmail.com>
Date: Tue, 7 Jul 2026 20:04:49 -0700
X-Gm-Features: AVVi8CenugNcpfN2pyvUXiLwv0I1FUqz1UIw41O-1bzFWgEPuSLhJGSeSI7uiCg
Message-ID: <CAGjuiT82_sXhEQ93FftK60qg20-GC-8q5NRN8Xrif8JVx0KGnw@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: refactor pipe graph dump
 stage formatting
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com, matt@mattwardle.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 12:18=E2=80=AFAM Andy Shevchenko wrote:
>
> On Mon, Jul 06, 2026 at 02:59:16PM -0700, Neal Patalay wrote:
> > On Sun, Jul 5, 2026 at 10:37=E2=80=AFPM Andy Shevchenko wrote:
> >
> > > Please, slow down! No need to send a new version immediately after
> > > replying to the previous one without settling down all aspects of the
> > > change.
> > >
> > > This version is no go, sorry.
> >
> > Understood, no problem.
> >
> > > > +static void ia_css_debug_build_info(char *info, size_t info_size,
> > > > +                                   int *offset,
> > > > +                                   const char *flag_str, size_t fl=
ag_str_size,
> > > > +                                   int *line_len,
> > > > +                                   int *num_lines)
> > > > +{
> > > > +       int len =3D *line_len;
> > > > +       int off =3D *offset;
> > > > +       int lines =3D *num_lines;
> > > > +       int len_written;
> > > > +
> > > > +       if (lines > 3)
> > > > +               return;
> > > > +
> > > > +       /*
> > > > +        * If new line length exceeds max line length,
> > > > +        * replace the last ',' with a "\\n".
> > > > +        */
> > > > +       if (len > 0 && off > 0 && info_size - off >=3D 2 &&
> > > > +           len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> > > > +               if (lines >=3D 3) {
> > > > +                       *num_lines =3D lines + 1;
> > > > +                       return;
> > > > +               }
> > > > +               info[off - 1] =3D '\\';
> > > > +               info[off] =3D 'n';
> > > > +               off +=3D 1;
> > > > +               len =3D 0;
> > > > +               lines +=3D 1;
> > > > +       }
> > > > +
> > > > +       len_written =3D scnprintf(info + off, info_size - off, "%s,=
", flag_str);
> > > > +       *offset =3D off + len_written;
> > > > +       *line_len =3D len + len_written;
> > > > +       *num_lines =3D lines;
> > > > +}
> > >
> > > This makes helper too ugly and unreadable. Again, study the case
> > > first, when this can be true. Do we really need to cut it? This whole
> > > thing AFAICS depends on the dtrace facility in the driver. Is that
> > > HW-related? Is it pure SW? You need to perform some homework.
> >
> > I've taken a look at the driver in greater depth. The flag wrapping
> > functionality being refactored here is used to construct a graph
> > visualization for debugging.
> >
> > > >                 dtrace_dot("node [shape =3D circle, fixedsize=3Dtru=
e, width=3D2.5, label=3D\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
> > > >                            bin_type, blob_name, enable_info, blob_n=
ame, id);
> >
> > Each one of these calls generates a node in that graph, and the content=
s
> > of the node are decided by the flag string we build in enable_info. See=
ing
> > as we are just collecting debug info and populating a visualization wit=
h it,
> > this refactor seems to be software.
> >
> > Seeing as it's unlikely that every flag is enabled at once, and even if=
 they
> > are this only causes a slightly more unreadable graph, avoiding 3 line
> > truncation seems to be the best option since it leads to more readable =
code
> > and avoids omitting information.
> >
> > Additionally, len > 0 && offset =3D=3D 0 is an impossible condition und=
er any
> > feasible helper function use condition. This can be documented in a com=
ment.
> >
> > Given this information, to me it seems like the best course of action i=
s to
> > revert the helper function to its simpler state without line count trun=
cation
> > or the offset > 0 comparison. What do you think?
>
> I agree, just add more comments to the code and elaborate in the commit m=
essage
> the (potential) difference in the behaviour.

Great, I'll send in v5.

--=20
Thank you,
Neal Patalay
