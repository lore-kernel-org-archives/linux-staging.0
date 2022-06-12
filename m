Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3151369
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 19:29:52 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w27so4688037edl.7
        for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 12:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WznPRpctTIv2zdDhb4zOCo3OtZZJR1xJ9rl6aDA9cws=;
        b=qiDeMLXJpobmkAUebxqC+z6uq/XVcTzMKhn/yJSX83rszfeiZ4mTQft70fdqrQ3gdO
         2DKTWR3BUHAkgSlqxN1ALi9LYG7iMn3AkTLF3PZnGENVBn6lnm5QgPjKSTXh6CbmJ4Af
         9YC2PBPPzPva5Nxaa2MxGznfCnMX6fCsIg4p0xA+Gzyx+gQ9wewbEURNd35XRc0Fmp9w
         9oOg60HAUbGJllA2eS/ZWkG6HVAAxYukY1M6druCVKvU1Kp5lPmQ8wutK4niP7e2nqRu
         lR9bObqfsovbUZaPuecEdVSN5fqul1qy7QXJ7cQaqVFwZqFdWYPmm82Lfc7uexbRgpD1
         W66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WznPRpctTIv2zdDhb4zOCo3OtZZJR1xJ9rl6aDA9cws=;
        b=B5KtUPbJIMDDA7fAm8rXJFcO0vjBKoJofI/2Iwx8GUvykZT36zjtmMQTyJ6nmT1k7q
         CJSkPepmXcWP2pbpf6PF8buiE4NuHEVAtWeY7aGZec82xdqwCKoUpr3YE6Pd/pGB483F
         Jtz51ElXilSEEbonHGKsT6OV5y6I5s65YmyqymPa4hXECVxfGGeCxqsLf0uKEpBYA9M6
         kB/pw60ErBGmhqWBGr9ZXu40a1OdLa8sJrhZe7JHonkB1FVLL3h66qzwGNhHIpXpJnDc
         oLAmqfRNEFs9nX3mmnHWlaKUNU0J76AydrQHU32ps323/cDaj72+zjVTIcH7xm+g5sdT
         rymA==
X-Gm-Message-State: AOAM533imlhJ2JqZU+yVEIqFSgsxZdwmKEyjuAz4P2UaSjc+7rKTsNtu
	QX/psZPba8DlaGVyCHDKIX/cFvxN9r+OrMmCnOdyOo4eZHl3/Q==
X-Google-Smtp-Source: ABdhPJw1FbcomwSSXixBhJrM+uP33cpcyF5rtjKutFybBX5KXbS7P50C5RhnvYBhjRXr92iPgNtWTR3m8kEpnnQhUPo=
X-Received: by 2002:aa7:d481:0:b0:42d:d5fd:f963 with SMTP id
 b1-20020aa7d481000000b0042dd5fdf963mr62189255edr.209.1655062191211; Sun, 12
 Jun 2022 12:29:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220612160556.108264-1-hdegoede@redhat.com>
In-Reply-To: <20220612160556.108264-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 Jun 2022 21:29:14 +0200
Message-ID: <CAHp75VdO_kE_5B+tXNmsvr1gUOoXg5EutYCp=PFx2qRKKqKCcg@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: atomisp: fix "don't pass a pointer to a local variable"
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 12, 2022 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> While working on other atomisp stuff I noticed that the recently
> added: "media: atomisp: don't pass a pointer to a local variable"
> compiler warning fix broke things.
>
> Here is a small series reverting the troublesome fix and adding
> an alternative compiler warning fix which does work in my testing.
>
> Regards,
>
> Hans
>
> p.s.
>
> A while ago I mentioned that I was working on also making the code
> work on Bay Trail devices (vs Cherry Trail) and that I had things
> working with an older kernel based on Alan Cox' first merge of
> the driver into drivers/staging. After a lot of work to keep the
> code working rebasing on newer and newer (less old really) kernels
> I had gathered some fixes and decided to just try the latest kernel.
>
> And it turns out that the latest kernel already has all those
> fixes and it just works. I don't know why my previous testing failed.
> I might just have been unlucky with the hw which I used in my previous
> testing.
>
> So good news, the code works on Bay Trail too, which is also good
> from a pov of being able to test on both platforms while doing further
> refactoring.
>
> Mauro, you also asked me to try mmap on the original code as merged
> by Alan Cox, unfortunately mmap does not work their either, it seems
> this has simply always been broken. More about this in another
> patch-set.

Thanks for the fix!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Hans de Goede (3):
>   media: atomisp: revert "don't pass a pointer to a local variable"
>   media: atomisp: fix uninitialized stack mem usage in
>     ia_css_rmgr_acq_vbuf()
>   media: atomisp: fix -Wdangling-pointer warning
>
>  .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 22 +++++++++++++------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> --
> 2.36.0
>


-- 
With Best Regards,
Andy Shevchenko
