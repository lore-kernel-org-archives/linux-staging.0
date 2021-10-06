Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EBD2C81
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 10:20:37 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id p18so2214917vsu.7
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kVwkMAhpGeKWfHIGRVhGfdjQIS6M3v/qiruYCfRl4ZQ=;
        b=Fn7gKu4+4IEORoUORMFCJHy9Qvbfh+YZ2AYlQLDQGopzmQWOKy98a2sKKgcbbvkBAd
         4kplWr4d6szfH7kkRBYt9WcmP8RO50bFySfkLwpqKZl7TqiKMHjpQYHyww5VFdh92Mxy
         LWBAkQW/1HmSPDBRtREMdrqkZVo/vItN5K05XP0mhu/+WIL22s85zIfpyJ0eFr6g0Igt
         HTa9fql/ZGRwH/jy6yjHTf+LeZIQzJxz92JBSJeW3ifx8uHRGzfuGqZ7TYP3VHudD8Xm
         Si30rQBw31Aixnyy3Uuj1Ay2bO7D0ARWEGEGnZSWoyedHPTmGCg3sGg0m+CTiVD/DeLF
         3oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kVwkMAhpGeKWfHIGRVhGfdjQIS6M3v/qiruYCfRl4ZQ=;
        b=5ZXLfrNeVtxpnKvS+SZUkc9hRYavHJ+Ofc4XWUjeS4T+kgq3LMEcIPk4/r6rzq7u7R
         PUsQFGhoAPFSPb+uJyKF28+IcPy1VOstwx/WC2gtfV5MC2PP7I1HV7uuaUO6WNOSKW28
         LpY3qdKLl47SO19SD20u9wRkkavoKlLsBuDqg53lp+qYNles4sYwqCnjU4LNAUZPhSUX
         KGH0YxXInjAeD77/+bPkjSAPXd4xmhUAXMvgPkrgnsvz5vCTzBWYyYn2WQ/gPaO97jyV
         0MXEo6ExWNblyUBhwSkpdPHc5wvmEqweht2oMc8Ym/zip5rG4stJX2jvcVFBX0PLMFEY
         OBaA==
X-Gm-Message-State: AOAM533IDWSmZqRfoS389iI5Mwh2kqaWwAvSjcT3Y6dG9pMAGAraoEzs
	2N/6Pi4NJxa9apXrAlWHaPoxugFOAi3WyHcMxyk=
X-Google-Smtp-Source: ABdhPJzXP25TjAIXrqLn5eklFu+AuOJ5B3LGYksvktvAiW7q5gA7oRDRXvy3vMHFNxiTYNTdefBo1VkNiyZomeUWXAU=
X-Received: by 2002:a05:6102:3ec3:: with SMTP id n3mr233627vsv.48.1633515636080;
 Wed, 06 Oct 2021 03:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211006061204.2854-1-sergio.paracuellos@gmail.com>
 <20211006061204.2854-4-sergio.paracuellos@gmail.com> <20211006082903.GZ2048@kadam>
 <CAMhs-H_qb=goRmfhO1P+mt_NKhJFuJgH6a483-6Wk8M9MA1cJQ@mail.gmail.com> <20211006101458.GB2048@kadam>
In-Reply-To: <20211006101458.GB2048@kadam>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 6 Oct 2021 12:20:24 +0200
Message-ID: <CAMhs-H-isGf2Wq9FsnFPtGNK6gwObz39BC1ak-4DBXJjYebcNg@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: ralink: make system controller node a reset provider
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	linux-kernel <linux-kernel@vger.kernel.org>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 12:15 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Oct 06, 2021 at 12:02:12PM +0200, Sergio Paracuellos wrote:
> > Hi Dan,
> >
> > Thanks for the review. Comments below.
> >
> > On Wed, Oct 6, 2021 at 10:29 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Wed, Oct 06, 2021 at 08:12:03AM +0200, Sergio Paracuellos wrote:
> > > > @@ -398,6 +401,76 @@ static void __init mt7621_clk_init(struct device_node *node)
> > > >  }
> > > >  CLK_OF_DECLARE_DRIVER(mt7621_clk, "mediatek,mt7621-sysc", mt7621_clk_init);
> > > >
> > > > +struct mt7621_rst {
> > > > +     struct reset_controller_dev rcdev;
> > > > +     struct regmap *sysc;
> > > > +};
> > > > +
> > > > +static inline struct mt7621_rst *to_mt7621_rst(struct reset_controller_dev *dev)
> > >
> > > No need to mark this as inline.  The compiler should do it automatically
> > > or it will ignore the inline.
> >
> > Ok, I have other functions to_* with the same inline syntax, that's
> > why I have added also here. I think I will maintain it to be coherent
> > and can be removed afterwards with another patch not belonging to this
> > series.
>
> Consistency is never an important goal.  It's better to be different
> than to be wrong.

Pretty clear, thanks. Will change this also, then.

>
> regards,
> dan carpenter
>

Best regards,
    Sergio Paracuellos
