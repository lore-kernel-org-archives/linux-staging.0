Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F8E7E
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 16:06:27 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id mx15so655478qvb.1
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 08:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvAz8VTWEj1QZNwzkHkmPpJH4VWeA6kRnRjefoqZBuI=;
        b=siiBwjmTISWvcH1fIolXvj73w7RcWORIRQu0oSowoy0/YiogMWX+8xLtVJ10+7gr0u
         FJG2bDv/9QFBzMBUWWQ2IYfV+0ucSWBKv9NjpmjeA4Dr1znKXQ+QfpHPnSHV/tyQcE3a
         k81P+0V0T5z30ghBfQ6H53iOakZl2k0sPzPk7gOdigWkxbXxNt0e/gAufYKc02rO2DiI
         IsAPZ3Jyy2BEZtj1KapgfKdUv+48z5WBDvarT/3PHCKbxAPneTJh6KmGgQ3NonrOVElw
         5NzjPw2ZmMc8R028LwBKXT9068zvIdbUjhpqs1CaG+FdraDMcCC+JaIq7K5z9qDUg7Y8
         DvIA==
X-Gm-Message-State: ANoB5pljPUpa3xrSn6pkEexwQq51U6IE3spgb4QlpT3VV6xOBHbsgqVP
	YKyCawtGFvxzVDWoFkOO4oYY7Txj49G7rQ==
X-Google-Smtp-Source: AA0mqf6F+j1V+wOs4c2MvxM3DF3kF6geX6erquNp9wGL34Z3AXNnrXj/sg+5smKf76FU0Zlgfei8/Q==
X-Received: by 2002:a05:6214:2d0c:b0:4bb:93b8:ef0f with SMTP id mz12-20020a0562142d0c00b004bb93b8ef0fmr26935801qvb.48.1669219585969;
        Wed, 23 Nov 2022 08:06:25 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id bz14-20020a05622a1e8e00b0039cc22a2c49sm10057776qtb.47.2022.11.23.08.06.25
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 08:06:25 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id y83so4803328yby.12
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 08:06:25 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr9144415ybq.89.1669219585142; Wed, 23 Nov
 2022 08:06:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
 <20221123100831.GE39395@tom-ThinkPad-T14s-Gen-2i> <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>
 <Y344AdRANmS3STsd@kadam> <CAMuHMdVRZhBECgABtTxe00gM7_EqBaX5auZhmjUfmcLx4zoetQ@mail.gmail.com>
 <Y35Bm8bhKojxzdox@kadam>
In-Reply-To: <Y35Bm8bhKojxzdox@kadam>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Nov 2022 17:06:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsqpG2GsYn_Pa_6me+vmYKZ6C2vrXLRhSWCDefezw=hg@mail.gmail.com>
Message-ID: <CAMuHMdUsqpG2GsYn_Pa_6me+vmYKZ6C2vrXLRhSWCDefezw=hg@mail.gmail.com>
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
To: Dan Carpenter <error27@gmail.com>
Cc: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Wed, Nov 23, 2022 at 4:52 PM Dan Carpenter <error27@gmail.com> wrote:
> On Wed, Nov 23, 2022 at 04:49:05PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Nov 23, 2022 at 4:11 PM Dan Carpenter <error27@gmail.com> wrote:
> > > On Wed, Nov 23, 2022 at 11:13:31AM +0100, Geert Uytterhoeven wrote:
> > > > On Wed, Nov 23, 2022 at 11:08 AM Tommaso Merciai
> > > > <tommaso.merciai@amarulasolutions.com> wrote:
> > > > > On Mon, Nov 21, 2022 at 04:58:33PM +0100, Geert Uytterhoeven wrote:
> > > > > > By moving support for the USB Syntek DC1125 Camera to staging, the
> > > > > > dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
> > > > > >
> > > > > > Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> > > > >
> > > > > Patch itself looks good but we have some style issue. Applying this
> > > > > patch I got the following warning from checkpatchl:
> > > > >
> > > > > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")'
> > > > > #10:
> > > > >
> > > > > You have to pass only the first 12 chars of the sha1 commit into Fixes
> > > > > msg:
> > > > >
> > > > > Use:
> > > > >
> > > > >  Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")
> > > > >
> > > > > Instead of:
> > > > >
> > > > >  Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> > > >
> > > > I always use 16 chars, to avoid these becoming ambiguous in a few years.
> > >
> > > If we assume hashes are randomly distributed and that people commit
> > > 100k patches every year then with 12 character we would have 17
> > > collisions every 1000 years.
> >
> > So I can expect to see a collision before my retirement day
> > (which coincides with the signed 32-bit time_t flag day ;-)
> >
> > BTW, does the above take into account that commit hashes can
> > collide with other object type hashes, too?
>
> I assumed that `git show` won't show those other object types, but I
> don't really know if that's true.

"git show" is not limited to commit types:

$ git cat-file commit eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
tree 0e320b5ae477efe1c9928057762bf63d730204ce
parent c6c67bf9bc2714d9c2c2e7ecfbf29d912b8c4f17
author Linus Torvalds <torvalds@linux-foundation.org> 1668988936 -0800
committer Linus Torvalds <torvalds@linux-foundation.org> 1668988936 -0800

Linux 6.1-rc6
$ git show 0e320b5ae477efe1c9928057762bf63d730204ce
tree 0e320b5ae477efe1c9928057762bf63d730204ce

.clang-format
.cocciconfig
[...]
$ git show eb708
error: short SHA1 eb708 is ambiguous
hint: The candidates are:
hint:   eb7081409f94a9a8 commit 2022-11-20 - Linux 6.1-rc6
hint:   eb708b0ff972bfe0 commit 2016-11-12 - arm64: dts: Add ARM PMU
node for exynos7
hint:   eb7080213d0fee54 tree
hint:   eb7080d36f660012 tree
hint:   eb7083e15bcb5eea tree
hint:   eb7083f45a088bf3 tree
hint:   eb7084a7ae5f486a tree
hint:   eb70866f5c60a477 tree
hint:   eb7087c754052a42 tree
hint:   eb7089eeb5f67a5f tree
hint:   eb708a906ceeea91 tree
hint:   eb708c1853ce1355 tree
hint:   eb708ca4d77be915 tree
hint:   eb708e4839466fdd tree
hint:   eb708431cb964d36 blob
hint:   eb708b77c4a54a68 blob
fatal: ambiguous argument 'eb708': unknown revision or path not in the
working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'

I couldn't find an easy way to count the number of objects per
type in a repository.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
