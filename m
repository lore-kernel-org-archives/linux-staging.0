Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE172DB794
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 21:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783375170; cv=pass; b=CBj5iddMtuogmFSiF92AonYHHB8lgZsQ7PHF5rPyBme+u7eHyGsmI68xwLZC+UoqGlm7Mtvr+J1mdknW4ESUWfLMe90moC/MDb74rNXpsgVrdpVZ83oEZjkC+kERNT6L072sefCPM4fo7sMAMR6xgBVax8M/YDXz0SIkEwZXGg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783375170; c=relaxed/simple;
	bh=jdKcNjPTLk4t5sB7vBYT7B94qVTUT2yntEybL1W759g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXtTx9oKAGroDLgCr+Ns+4pfTPIDqhHDhitAcl3W8baLrMbd3ToZLNGwVl3w/W3460Gqi87qCY2dUit9IUqFIlJ7Ef5N64H/DnHByYVHa4W2GveUPKM3Ay8HdCVu1sjxx+b7sDXBoVw4eOg5CV2GUunPTnCfGykciFu590/X244=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVrOCOmb; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVrOCOmb"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-49cb5f51b01so178783b6e.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Jul 2026 14:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783375168; cv=none;
        d=google.com; s=arc-20260327;
        b=YyJl4WiHHgJcqhgbJ8pW3YqbV4lWvvLPqIhxH2u4yWves+Q02SiUUE5OdsdWVov+Wv
         PKtfqJ1PpbBKxNhPkntREbfX8+WFg7RNghFk3X75dzy5WPYzYIeZX2lxwS1YIFCte55O
         ptFG8yjwrNev278kSV3wXHQHzbNKH/6lhPHTlFy/RYj5gjvv2wMBP8Cqm8w3rTYTGKwJ
         bb29rIl3pNti6bng9w7SiosSHKkorT2+uujda2f1JTVL1Waw+wYsCUHw5hAWG6J3aBR5
         3rNAdvoZp4lgGrGbNrFQBjEw1DI8fZFZb0hVg+8xUEzZktuomqB1+SaK4wTKlnlSxwAY
         +jIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wdCTNR4NAcbt+UHljJQJGBCWlwecJPFZO5UT6CqBrWI=;
        fh=+xk4Eopnu8KLKII8xNlQ8PnQZX/Pa8BHsNWtdE4vYjk=;
        b=mGkEyCnnKM+9lfsCoxgqD9HctgqTSYZdsXymWz5Id4ypcJrPuIxVORpfQaKcNxWHTn
         FzaG2fiVC+WzBq3AoXPRBXsiE2CzwdjeaVx4muYUphTp3UArg+Ut0YcaDesH2hVj9NnI
         7H1eHAKu2EhOwwRthyhgWCv3MCnetSEMahw1plGXWj5uURz3rRMZPwZBd0vW61MREdzM
         D2pBxcTnKM4oC6mgco8QXeP4kJGuKI7PfrOn7uhG6fNz8PZECfYAsXuOKCz7sMfBD9Hy
         sINVmADfcTJs40vPox4OCoMWeMcp0Jxwja2VOoqsf494EHdW9FT6AcrSfXskTKPB7+P1
         ZruA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783375168; x=1783979968; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdCTNR4NAcbt+UHljJQJGBCWlwecJPFZO5UT6CqBrWI=;
        b=eVrOCOmbugPwkqD6qlEezsXJZqfwubuqgai53Qc8R0XSna2N3cM96A8VidZgUdTxMr
         RqcJXVO3dHsGft3gr9WbNwY7suybW0zyP1hYuATn+yfLO1/j+GLf39LI/E0sDaho3OQJ
         NnBLNKLtM1Re7ZziE658X+opKoXbIqgQ47Y/9aIzkMelWFtGqeUvG3udcOq9VzCjHJRC
         Xxt6R7mYgOsaXf9Lxlp9tIzhyf75Z8tVZzP3xyLYiJzGOA5y+k4fu6ygcXLAq9c3M8zi
         TRrl9Mj9ToCIwxZAO6ydPWIAeypSanci0gIIRYEgDObIw94FTLlOC2mfqzeaR9q+KMpl
         3+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783375168; x=1783979968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdCTNR4NAcbt+UHljJQJGBCWlwecJPFZO5UT6CqBrWI=;
        b=iMVfph7YWxKUv1KvSK7zMoYrL2ry/SKPkKprlkbg7GKKno2hfHgfN5E/WnLVdh3P0Y
         UDE/NbDaftR73wGWpvNzeHVn7ufLVTqnCqwKbjpKlOKJa7RZWy6MxGSx8CpIbG3TyU6/
         oOHoimAHwqpFD7xBQsbO5sibd1rrK0m+TEGNTUAy7QwHukBUlwYEBGzYjW3BDJf8BUvf
         osAcYvuihPtzRGZNRxhi2j6ni7fJQjlpp19D3dwgqtFE6UK/RJl1AbE6VWFRulGoJvlJ
         BbXV0dHKbVNt7S92HjVgGP05UZBqXCG6OFJM4BCEvpf66XSE4e9Hhh4kEZqAitojc1Qv
         iYnw==
X-Forwarded-Encrypted: i=1; AFNElJ/hNFnxLxQ0oPFsZ+tONp3SN/+eiOxmNUbVhgyRqwFyQ5i/fIBbfoXNX6/0b6sERt2PIB2sIzmZR0RwuC4s@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9lMN1sjPr6COU+L5UE9DGNAidDY51bF6QCMfYcSHwesy7z4pQ
	egSpwHaCFf14e0J47JaErhG4uxCG3+U9zGpaHvAA3mTcL1rSg90uVkAgRVJZ/qIiiqSzvRGAKix
	HuXc6ouDUGPr3r3oVRUgbxBpXoG7tDbI=
X-Gm-Gg: AfdE7cmxiV9vVfCJ15qPrl03cp9itTynY/gWZCNipjhWEY3SLNsDWfYuKpz1HZJwKOq
	A+TrKxDDmvfiK/yF5RiWA4IxXXfmDXxrUx9esIjEG7rZn8W8Ujheogm/2sjclzNs6r6y6wyXqDB
	IVrMnu6iBPbD7OcJfxitoJ4/9xRg7RNyYS5juvhBz37jDmUSku1oJr3noKAO7bYdGHY1SSD6VeS
	fE3OD8E+aG7SD/mj7zfc9euEKPcqad1Lh/AAYR44vaaSXb3mcvEUOtQJRwwVAo0fexAgWR+nvOn
	ennnQ3Ie
X-Received: by 2002:a05:6808:1995:b0:496:c5a:e126 with SMTP id
 5614622812f47-499bacb258amr6099961b6e.4.1783375167763; Mon, 06 Jul 2026
 14:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706000738.18478-1-nealpatalay0@gmail.com> <CAHp75VcSGXC=x3hFXt8qvyRQjPzy3uLN9iBTURp2yA9+P_jibg@mail.gmail.com>
In-Reply-To: <CAHp75VcSGXC=x3hFXt8qvyRQjPzy3uLN9iBTURp2yA9+P_jibg@mail.gmail.com>
From: Neal Patalay <nealpatalay0@gmail.com>
Date: Mon, 6 Jul 2026 14:59:16 -0700
X-Gm-Features: AVVi8CdG0PfkX4vD-oqmzTQi7x8RBptmf2YrKOaT-BDXOM7UHShSIEj9USx4BO0
Message-ID: <CAGjuiT9gu32wvx2Vf0U0g9deyAzzGtwwCNEdW_R4JVarO9x4JQ@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: refactor pipe graph dump
 stage formatting
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com, matt@mattwardle.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 10:37=E2=80=AFPM Andy Shevchenko wrote:

> Please, slow down! No need to send a new version immediately after
> replying to the previous one without settling down all aspects of the
> change.
>
> This version is no go, sorry.

Understood, no problem.

> > +static void ia_css_debug_build_info(char *info, size_t info_size,
> > +                                   int *offset,
> > +                                   const char *flag_str, size_t flag_s=
tr_size,
> > +                                   int *line_len,
> > +                                   int *num_lines)
> > +{
> > +       int len =3D *line_len;
> > +       int off =3D *offset;
> > +       int lines =3D *num_lines;
> > +       int len_written;
> > +
> > +       if (lines > 3)
> > +               return;
> > +
> > +       /*
> > +        * If new line length exceeds max line length,
> > +        * replace the last ',' with a "\\n".
> > +        */
> > +       if (len > 0 && off > 0 && info_size - off >=3D 2 &&
> > +           len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> > +               if (lines >=3D 3) {
> > +                       *num_lines =3D lines + 1;
> > +                       return;
> > +               }
> > +               info[off - 1] =3D '\\';
> > +               info[off] =3D 'n';
> > +               off +=3D 1;
> > +               len =3D 0;
> > +               lines +=3D 1;
> > +       }
> > +
> > +       len_written =3D scnprintf(info + off, info_size - off, "%s,", f=
lag_str);
> > +       *offset =3D off + len_written;
> > +       *line_len =3D len + len_written;
> > +       *num_lines =3D lines;
> > +}
>
> This makes helper too ugly and unreadable. Again, study the case
> first, when this can be true. Do we really need to cut it? This whole
> thing AFAICS depends on the dtrace facility in the driver. Is that
> HW-related? Is it pure SW? You need to perform some homework.

I've taken a look at the driver in greater depth. The flag wrapping
functionality being refactored here is used to construct a graph
visualization for debugging.

> >                 dtrace_dot("node [shape =3D circle, fixedsize=3Dtrue, w=
idth=3D2.5, label=3D\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
> >                            bin_type, blob_name, enable_info, blob_name,=
 id);

Each one of these calls generates a node in that graph, and the contents
of the node are decided by the flag string we build in enable_info. Seeing
as we are just collecting debug info and populating a visualization with it=
,
this refactor seems to be software.

Seeing as it's unlikely that every flag is enabled at once, and even if the=
y
are this only causes a slightly more unreadable graph, avoiding 3 line
truncation seems to be the best option since it leads to more readable code
and avoids omitting information.

Additionally, len > 0 && offset =3D=3D 0 is an impossible condition under a=
ny
feasible helper function use condition. This can be documented in a comment=
.

Given this information, to me it seems like the best course of action is to
revert the helper function to its simpler state without line count truncati=
on
or the offset > 0 comparison. What do you think?

--=20
Thank you,
Neal Patalay
