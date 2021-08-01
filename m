Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E272
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 11:41:17 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id s22-20020a17090a1c16b0290177caeba067so1718685pjs.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 04:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V7CbcU24c2EcgEh6gPwl360Lbo6a4Vh6iTk5nFSY/dA=;
        b=qZkxBAhluE0p43cVISH+ol5q1lT+cnqxEql+NIpY08L6/PwowG/tSK7brsoB2dM+g4
         IsHCS42s3dWQ01GIdqQ2VK4IM4bOGJ/yx24/hAOvNqWJwbxbsCpKnF2rkFffMdNgwFrC
         6NjZdCRVEFlKZINxUnEFV2Xkrte76bs6chq7lWN6s9gbkliRtcbETJiv3JjWBY+ROuau
         7QBHcX8eOM8aLEoJRqNtPiQlkpD6wYCOuSCf3CNuwnvCF9AIupQzAS+CZdWu+b/WV2XR
         qiQPlqwMe4USOYxSrqo6WEDk1pAoQV5dne9UdThjajtzvP3R06+MzqdQCnGXvELPeNu9
         9QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V7CbcU24c2EcgEh6gPwl360Lbo6a4Vh6iTk5nFSY/dA=;
        b=Cs5G0n/j+CKQgdc3meUvZHn2kwo4PEbgrQ1VMvYOqhpzEQJpW2u6PBNAnegaWF0nHd
         gnEWFMVLaNXub/IwDyQk93X842IJe3/DlTPKMHDrm8f3wMwPUW+tVKwNZElStYgcm6lV
         lzvh5iqr0DSkZ5JsvX1WsgfbJjhcVdyK8ruOZzAuk5kdvjaaDDvJkyKEsJ1ZZ4f8HbXz
         TPsHXSuIne1SrfyCq2Q77UT8I/qV281awM+smlZOJWxESKeYRzI400WgOsYY2Cj3Bp8I
         ANLpTxyiwIXwRuMZj3AryiHuwQYiVSqnvWT+AvYjIDNt2bAMvjtyizk+H0KHgElQ+We/
         ELhA==
X-Gm-Message-State: AOAM531qXXezhKYOqkKorNCCOhlrBj4d+j3TpCIEd6tjWrawF2fJI0qj
	ZNYhTMsKAATmbV0ZClJAHiLR/a7rK16OI5bOSPc=
X-Google-Smtp-Source: ABdhPJydhwxZ12g/won3lYfp7ROJMWycWxQ5X9RiPATUxhjXxXP+UgIyRIZYxpjob21kv49ZmMn2kBq09Ob2FCmxc98=
X-Received: by 2002:a63:1457:: with SMTP id 23mr1761825pgu.203.1627818076930;
 Sun, 01 Aug 2021 04:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210801085155.3170-1-len.baker@gmx.com>
In-Reply-To: <20210801085155.3170-1-len.baker@gmx.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 1 Aug 2021 14:40:40 +0300
Message-ID: <CAHp75VcD_Kqedpkw-Pj+uQbWqdu_9FhXqJS5TuGUPoVv2x45-Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Remove all strcpy() uses
To: Len Baker <len.baker@gmx.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Phil Reid <preid@electromag.com.au>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 1, 2021 at 11:53 AM Len Baker <len.baker@gmx.com> wrote:
>
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. So, this serie removes all strcpy uses
> from the "staging/fbtft" subsystem.
>
> Also, refactor the code a bit to follow the kernel coding-style and
> avoid unnecessary variable initialization.

I don't see patch 3 (even on lore.kernel.org).

Greg, Geert, does it make sense to move this driver outside of staging?
I would volunteer to maintain it there.

> Changelog v1 -> v2
> - Add two new commits to clean the code.
> - Use the "%*ph" format specifier instead of strscpy() function (Geert
>   Uytterhoeven)
>
> Changelog v2 -> v3
> - Change the initialization of the "j" variable in the "for" loop and
>   update the code accordingly (Andy Shevchenko).
> - Improve the commit message to inform that the "%*ph" replacement
>   won't cut output earlier than requested (Andy Shevchenko).
> - Don't remove the braces in the "if" statement due to the presence of
>   the comment (Geert Uytterhoeven).
>
> Len Baker (3):
>   staging/fbtft: Remove all strcpy() uses
>   staging/fbtft: Remove unnecessary variable initialization
>   staging/fbtft: Fix braces coding style
>
>  drivers/staging/fbtft/fbtft-core.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
