Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93475E4C7;
	Fri, 10 Mar 2023 22:23:42 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id p20so7100293plw.13;
        Fri, 10 Mar 2023 14:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678487022;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKLsTjbboNr3JZyGjBDURtUNYpO0ZZ2dX7lvovz04Dg=;
        b=CcfiKC/L9YjtU91mWdND3mJ37Sk/ctXeGF2pOnqkfJXrS4e80XRepKQ9urQ4/NI3Rk
         OEj+GpnkNMy9i8CZsj9BUKRqHqhm9ORAl4eboNDqTKfEgt7iPCtuDRswc1aQFtRQqExX
         X9pjeUA5+T6qC4zwmdCLvCo5cITGbqS4c8vfSEtGRZZjZiN8wfGfSOP8NunXNi0kUfCf
         mlWwvlEflKe+Wb2lijo01YWln3nqeC0Ztetu1CVN+bsityDZmV4yDRBZNWsTFU99E2E3
         kocfWpczynIgjxgvjqti9PYraAaxRy20p0nhxixfM7nVlhFoRXXaLIXeEPu/+d4QcaxY
         wYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487022;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uKLsTjbboNr3JZyGjBDURtUNYpO0ZZ2dX7lvovz04Dg=;
        b=JDhuacLpuClhjPlARllCd+bI8UG3V4pxb+2TBUs6w9ifbuWHifdTdIw1Or2x5O7oAI
         KwlO6QDQGH20uhdOuRFMLlAQIvHQDksG0LK7C2HwQYmLHoYvv2VjHPFQzmH7LY8aT5ze
         gYOLVNOKlLbAs7x9tORz8uhlHKRezVjaV8Y7EeeU44z1oRNgxMFdroSFaNfoaI5Oflzv
         IyR9DbiXSNPho4MbiOanZoGIPNFEc2/KiZme2P+MO7DhC2yduLGxEzpnfQkkZpw+gxX7
         jxlKTR3y9FkYyxYjNMfrOT/dcBpzVyLQigWoiAsXdk3QVERzLb9MazUAcCQai+TrQwvv
         48Ig==
X-Gm-Message-State: AO0yUKV1Zxg+Fx79rt73Q9G87rCOL9m4Tk+477fITmzbNJHtNIR1vnt+
	ViWcewhfT14wLJ6oOmVVraU=
X-Google-Smtp-Source: AK7set8zSZvon37o6sCBJ9UJyWK3ko7kVhvTIbJxZyf289K8RjaGxbk/nw4Fi3a2ymdpCx0L+lialw==
X-Received: by 2002:a17:902:efce:b0:19b:110d:28dc with SMTP id ja14-20020a170902efce00b0019b110d28dcmr22122207plb.19.1678487021951;
        Fri, 10 Mar 2023 14:23:41 -0800 (PST)
Received: from CloudiRingWorld ([122.231.69.163])
        by smtp.gmail.com with ESMTPSA id ku3-20020a170903288300b0019aaab3f9d7sm457608plb.113.2023.03.10.14.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:23:41 -0800 (PST)
Date: Sat, 11 Mar 2023 06:23:38 +0800
From: Kloudifold <cloudifold.3125@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750: Rename camel case functions in
 sm750_cursor.*
Message-ID: <ZAut6vnYur0Xi4Nj@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


On Sat, 11 Mar 2023 at 05:39, Julia Lawall <julia.lawall@inria.fr> wrote:
>
> You don't need the filename in the subject.
>
> On Sat, 11 Mar 2023, Kloudifold wrote:
>
> > This patch fixes the "CHECK: Avoid CamelCase" reported by
> > checkpatch.pl by renaming camel case functions.
> >
> > Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
> > ---
> >  drivers/staging/sm750fb/sm750_cursor.c | 14 +++++++-------
> >  drivers/staging/sm750fb/sm750_cursor.h | 12 ++++++------
> >  2 files changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
> > index 43e6f52c2..ff643e33f 100644
> > --- a/drivers/staging/sm750fb/sm750_cursor.c
> > +++ b/drivers/staging/sm750fb/sm750_cursor.c
> > @@ -58,13 +58,13 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor)
> >       poke32(HWC_ADDRESS, 0);
> >  }
> >
> > -void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h)
> > +void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
> >  {
> >       cursor->w = w;
> >       cursor->h = h;
> >  }
> >
> > -void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
> > +void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
> >  {
> >       u32 reg;
> >
> > @@ -73,7 +73,7 @@ void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
> >       poke32(HWC_LOCATION, reg);
> >  }
> >
> > -void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
> > +void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
> >  {
> >       u32 reg = (fg << HWC_COLOR_12_2_RGB565_SHIFT) &
> >               HWC_COLOR_12_2_RGB565_MASK;
> > @@ -82,8 +82,8 @@ void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
> >       poke32(HWC_COLOR_3, 0xffe0);
> >  }
> >
> > -void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
> > -                          const u8 *pcol, const u8 *pmsk)
> > +void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
> > +                           const u8 *pcol, const u8 *pmsk)
>
> The indentation of the second line looks random.  It's not a multiple of
> the tabs, and it doesn't line up with the right side of the (.  So there
> doesn't seem to be any need to change it for this patch.
>

Acturally, if you set tabs be 8 characters as it said in Linux kernel coding
style, it lines up with the right side of the (.

The checkpatch.pl didn't say "CHECK: Alignment should match open parenthesis".

It shows up didn't line up the ( may because tabs are 4 characters in
mails.

So, should I just change the subject of the email? If I want to resend this patch,
should I make it a reply to this current discussion string or something else?


