Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4767A;
	Sun,  3 Apr 2022 16:12:56 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id bn33so10022255ljb.6;
        Sun, 03 Apr 2022 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hxdxKUF/RSHkGuapqH+jXfJnqPmLO0jdDbBsgbNKCbY=;
        b=Ds4iHXgjTCZfVEy93RSwlwI+SDuIks25SRaKMs+hkkxCZnfgzcSEl3Lu2gfVuXr7Us
         7T/cQ9u2F0RaGR8LXF5CjDgdaMDsMEHlx0HmtahTc1a0Oa1Ls5YGFxdJX5hUFHY8M23R
         x3ed+wt018Tl0i+dgbjFoM8bVwKW1OQ4mAqJd7YMWaE4sCGXDeNUh+qj3kf5oLRKbyFO
         v3kC9kWUmyyuq4YULcDpyFdlgEVE5P6emem74FXA2hqwKB8ZRabDnSD9n7XQpBEancrY
         jlvt245X0z3Bc3uROA/MaC+4zu0UmT9FTVsW3upJ1qyJqxmiln72pQ2CIsfyHC7fK2vH
         IrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxdxKUF/RSHkGuapqH+jXfJnqPmLO0jdDbBsgbNKCbY=;
        b=FVjeP8LNevi2c30ER+/qS/JMWnjjxD7hUiXPMMz1aHKMB6wRI+CPxxL3yJcrPWwpfu
         Lzawv6S/Hrzmd7LKM6YZUZ5+it4hbGScDCwkp1zC8R40OIbhyYmnyxE9KrC/j0/oKbyG
         zoSl81H6Vzyk22WhnfS4miQSC0Oim/1LfmRWBdVSFqeQaiP6qLENoY54KBs5lI5LM8Vk
         2Xsss+BzOxQc37ja/1apCf/bRYqvObfYF71OHq4qkvetL1oaMHdODxRIuFpYaL7cgnmJ
         a45eCIJE6SxmpsUP50wx+GxWgPJ0K8Xs83zKgbsx/ycUKmNQK7dJctXJ7TR3i2hwLC0h
         55Ag==
X-Gm-Message-State: AOAM531huSuVLF0IGwFNbOWKLRJK0ZsJxLH83YANJp4lnhQch1CwkVA5
	EPmdSfaVkxTirbF2Ya3R4I/mR9y2cmQ00CQiWwuraYd9TvHTGA==
X-Google-Smtp-Source: ABdhPJxTywfhVQmcW1p1unfVxMh1Pbfc0xXlxBegon2lRQRw3kyIvrUpZg7FZrjAEypOegI7jybVwomoFIM035psFsE=
X-Received: by 2002:a05:651c:1543:b0:249:a2bd:4a74 with SMTP id
 y3-20020a05651c154300b00249a2bd4a74mr19161414ljp.375.1649002374610; Sun, 03
 Apr 2022 09:12:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220403155111.GA333187@euclid> <ed0e9f7b-9ba9-b0c8-8261-397bf793b9b9@gmail.com>
In-Reply-To: <ed0e9f7b-9ba9-b0c8-8261-397bf793b9b9@gmail.com>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Sun, 3 Apr 2022 12:12:43 -0400
Message-ID: <CAMWRUK6K77KpRkCkruL=RQcmA1opbvapyPJOA-EFpYdXxY8ujQ@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: simplify control flow
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Pavel,

On Sun, Apr 3, 2022 at 11:59 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> Hi Sevinj,
>
> On 4/3/22 18:51, Sevinj Aghayeva wrote:
> > The function iterates an index from 0 to NUM_PMKID_CACHE and returns
> > the first index for which the condition is true. If no such index is
> > found, the function returns -1. Current code has a complex control
> > flow that obfuscates this simple task. Replace it with a loop.
> >
> > Also, given the shortened function body, replace the long variable
> > name psecuritypriv with a short variable name p.
> >
> > Reported by checkpatch:
> >
> > WARNING: else is not generally useful after a break or return
> >
> > Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
> > ---
>
> [code snip]
>
> > +     for (i = 0; i < NUM_PMKID_CACHE; i++)
> > +             if ((p->PMKIDList[i].bUsed) &&
> > +                             (!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
> > +                     return i;
> > +     return -1;
> >   }
> >
> >   /*  */
>
> Looks good, but let's not introduce new checkpatch issue:
>
> CHECK: Alignment should match open parenthesis
> #62: FILE: drivers/staging/r8188eu/core/rtw_mlme.c:1645:
> +               if ((p->PMKIDList[i].bUsed) &&
> +                               (!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))

Thanks for catching this. I wasn't seeing this in my checkpatch
output, and after some digging, I could reproduce it with --strict
option. I think the tutorial at
https://kernelnewbies.org/PatchPhilosophy doesn't mention this option,
so perhaps we should update it?!

>
>
>
>
> With regards,
> Pavel Skripkin



-- 

Sevinj.Aghayeva
