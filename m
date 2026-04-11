Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684003B95E4
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775927643; cv=pass; b=SyEjgpIg1Jj+RFdP/IDIp41nz99UkJyXVYhLVDr2xoRQuGz0hq0AwhLdguYdlbVe1JVhYCs4hAzbn4f/YzbuXQZnol8q4l/UmdobMQFdymY9Xho0o6t63qXE54JFbY0aX41ftrLRfUDxqg3Jx9GY+U8OjMi+pQZItfm7sF4oR2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775927643; c=relaxed/simple;
	bh=CuOrpIa+6SHU5p2bWRfT8xZ/Hmi+guVdnfGSMrmhCxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCym2BTB97DlyhkB8gHUvBUP86as1lcoPy7uYMOUs+p65NbDs0kNncYTbaLotU/QfZKHBQaoJXBrFIQXsYMa1bqaTqlPG7maUfWy8DeaOX9+wuXYRa9ieMiOlgByNEBIxjw3J1FsaRtYkqE+kluRNbR6v4xsTX1Sg6irKggjy9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEc+3o+K; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEc+3o+K"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79a60975dc5so33870687b3.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 10:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775927640; cv=none;
        d=google.com; s=arc-20240605;
        b=ZpiGXgePy4rtaLL9JGDfKudHi61bObsQQ+oXHRDk1LtqA038Yx9j1ues/pdimAxudy
         qtet5ZUAqdvAOKaNvtEXrs0GFi+5vqmlLbzB8NEcOKq9Jzm9xpt+YvbTKMlzBIqLa6II
         KTWIV3R2bmRHkzw8ZtGVLRduwzLuPzLTA4noRSVLJmcNKoH6zgCyW6xSMr1OLNUT4rgq
         6QdY02kj46jwMrCIz9Z0+0MFZ8tGHawZV0njwowgEZjaNk2+URqHhEiFQLw9dm4QkajQ
         uRvnJWZhYR7gibbZk+GdkHo/mJYhFOcV5yI1zB44kgYkkp/rDFJYvFfrbkOl6NrIjDpp
         zgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QN3ph+rJ2Hq6R7ZAU5OE19GiG1+NPfYTXZ7jwsrW8O0=;
        fh=3EIAmgvLy54kSAeq9kBKGMjVcfrsyUO9qDPolsBhMwg=;
        b=GiJMRVOZafbItxU9mdjjdCmVO0Udb8Bqd3QHHQBrK4+sadeUPgl+b99yLDXBpnSfIp
         aOx4m9uowWaPxY6suWhexjTrw3n6JfDdSLndLrEkjaBR7+JxsvhKSbUn5X4x6sBjwApt
         pqfiLfiXIcrMKNpXFuYIj8r8xfiMLw5fBF4cxofJfvVacYPGn8GiOcgz6T53CBT1cUFN
         vJ2E/Oo5JOz0Mgxfy2vA1SrQdLGB5gS4mO7FL++8joERHkOp42WuGqDmLZnuXbDrF9wU
         VWtT+lGDNYsqVpZqYmUT79O6LnBMBZYDbR8woqulx2bLQwkuFx43oitIGx2BF1JGzdLR
         Jggw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775927640; x=1776532440; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN3ph+rJ2Hq6R7ZAU5OE19GiG1+NPfYTXZ7jwsrW8O0=;
        b=IEc+3o+KkyF8b8uIMtilvHGQxOwsQQu92t7vLvjIIBi8zeOpdHlOCQHuSzqoPoCuoj
         kNe9BJVeaZwUtHjBuA3QBjmWIotITPZFhriLg/K8bwBz0Y4i2zsWsaF8jtc6yDIDMJzi
         W0oJF9VU48LcS4v0kEiuw1HtnIVGlfe0pQNaRt0Ce6DmPvRN3fbXviAAg81syp0OfyDW
         NhMz2+Z6KUhiPmzA7Wo6vMDytxcgec4p8ktIy4iJP+vYbjQC1xaPzYF7sefdXxxbi3c5
         LN55jvd3t5cgy/P9RIt10IOtHfyEH1I1PsEwuwMRM4qQziita19NylO0qHUVNWC6yBTc
         YpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775927640; x=1776532440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QN3ph+rJ2Hq6R7ZAU5OE19GiG1+NPfYTXZ7jwsrW8O0=;
        b=e5HqljtIDuq04Rs3JpCG35T1kuDFgO0U8UMiYS/dzi8++C002g2A8+rb3TsgLU9tvT
         h0M+LcfSmWphPs8+tLs0zKqtIUj7SbaMxikd8Hq3ZtPdfp9wlNWH4t7JiaE81O+gWvwI
         ZUGT6uFQLVPK5fKdKxvJwxCDgGm8s3Q1MfPwyuJc+78dkLgkDcYKWpz5ngbs/WL4HSnS
         5jFA/gS5JyVM4Aok77RAqddDskfOgSTzUf0WYjuoK2FDB6VDe9xE8VeScnasdFiC/7n7
         dpEeaLI2Xnh0B9ngSA2jkvyavhwZzQH7GRuQkvmWQWuvK2iL+Xm3HMcj2gzepw31ynMn
         KShA==
X-Forwarded-Encrypted: i=1; AFNElJ+dT919TNGe5aU3kit+Y5Sir8GzswwFrtP09PGwvzNk0cH6NEmVNosuDXUp+pWHXsQenCYfIfxTBiKamg63@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4+Ni/avcxDDpJQ2c5XJDBcW3DdQZeCymYxWQje/cg+FgcFM9+
	Ky/+eWD9emfmr1Tb+VieiLiY7LrRomgPrejHTKb2KA+Sz20jgrOT0BhJkckmqjAv6wdvfs40ODI
	Pzis3C6qr4hfQW/BAmnmowNbrt0P8PQs=
X-Gm-Gg: AeBDiet5f0D4Jlx7CoMI6UAPxFRM5iyNRfaJzVocxN+tZ/knR/A1c+msH8nAyFiqJkO
	2XSW8tEvgTT3AMC/3k+uT4VoPiYDUWlrX0fvSk2jVZg77ikRRoZjIPyrCuw914XoXa9xT7R3ntS
	sYlbDnnFgu6ZCMFt+/a+FvdiQlaTzUrV7i1iJHhvndlrXkvwJHnmtSGgA9NG/n5SnTpZwvPdqrT
	5JmHuhvOwBZcsq4RELN+EtfCMhzpX/zq32Sl1+MgSngFjVbGOi9GYvzdvB8BPG/mVnBsyX6OSZF
	B4hPGLeJTWYZJXMR5ukofIUViNJC6yUDFjyOsVigeRSVnWhAUmAEmm0a3Nn4KBzYdBrn7T6+
X-Received: by 2002:a05:690c:110:b0:79a:da70:864 with SMTP id
 00721157ae682-7af72637e82mr85310437b3.49.1775927640339; Sat, 11 Apr 2026
 10:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411005512.46142-1-mugrinphoto@gmail.com> <adont11Sr92pi0_N@stanley.mountain>
 <20260411154223.3091eb45@pumpkin>
In-Reply-To: <20260411154223.3091eb45@pumpkin>
From: Michael Ugrin <mugrinphoto@gmail.com>
Date: Sat, 11 Apr 2026 10:13:49 -0700
X-Gm-Features: AQROBzCyBmwsMvjQSjRkfrc4MqWnZf8XPyvA6rhHE6cCS4H_9LUOw23qbQ8zwuo
Message-ID: <CAEiYE9hBGiDgP9FmMAuU0qyVygmwU0FrxVGcuy5g7JLO4KWMLQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix indentation to use tabs
 instead of spaces
To: David Laight <david.laight.linux@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review, Dan and David.

I'll work on a v2,replacing the ternary with umin() for that strscpy
call and the other strscpy calls in the function.

The larger refactor to eliminate the stack buffers and build the
output incrementally sounds like a great improvement. I'm a new
contributor and that's beyond my scope for this patch, but I'd like to
come back and tackle it as a separate effort once I'm more comfortable
with the codebase.

Thanks again for the guidance.

- Michael

On Sat, Apr 11, 2026 at 7:42=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sat, 11 Apr 2026 13:51:35 +0300
> Dan Carpenter <error27@gmail.com> wrote:
>
> > On Fri, Apr 10, 2026 at 05:55:12PM -0700, Michael Ugrin wrote:
> > > Fix whitespace issue where a continuation line used spaces
> > > instead of tabs for indentation.
> > >
> > > Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
> > > ---
> > >  .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_c=
ss_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_deb=
ug.c
> > > index b411ca2f415e0..966d4efb200c5 100644
> > > --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debu=
g.c
> > > +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debu=
g.c
> > > @@ -1257,7 +1257,7 @@ ia_css_debug_pipe_graph_dump_stage(
> > >                                     p--;
> > >                             /* Last comma found, copy till that comma=
 */
> > >                             strscpy(enable_info1, ei,
> > > -                                        p > sizeof(enable_info1) ? s=
izeof(enable_info1) : p);
> > > +                                   p > sizeof(enable_info1) ? sizeof=
(enable_info1) : p);
> >
> > Better to use:
> >
> >       strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));
> >
> > Same for the other strscpy() calls as well.
>
> Or refactor that code so it doesn't use 600+ bytes of stack and
> lots of scanning of long strings.
>
> From a quick scan it seems to be generating a string of xxx,yyy, with the=
 ','
> replaced by '\n' to avoid anything longer than 25 characters and at most =
three lines.
> I'm sure you could write and use a function that lets you have a lot of l=
ines like:
>         offset =3D add_flag(info, offset, bi->enable.reduced_pipe, "rp");
>
> Oh, and none of your char_enable_info[] arrays are guaranteed to
> be aligned either.
> So all the snprint and strscpy calls into different buffers are pointless=
.
>
>         David
>
> >
> > regards,
> > dan carpenter
> >
> >
>
