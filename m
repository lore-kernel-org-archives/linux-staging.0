Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F467C;
	Fri,  1 Apr 2022 19:14:00 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id s13so5161124ljd.5;
        Fri, 01 Apr 2022 12:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VTRBtZGT8BtVw5zsFhiWCluDgulKA3oSoE7nkZmGGeQ=;
        b=bWkcNX1SCGfk89/b1oIPtwcBZ95PoBCpab48p/a44RYoYskq8HlTYvf/+WBMZsyeHm
         v8Mmtb+JqFjqDNT/GIrEsfL6Yu6p/h7LQ6uss7CLSBzDlqgFiVwo1DDmEw09dH0hGNg+
         NNljgzDmgpfwBld1PX8Mig99uGEfvh7v13cgPH6isWQQW3u3/LUCbaIR0JM7aPXWrapn
         1wOmaZqF7zhpcXZYk1TEokfsNnkvA9xMzF3wpURXmxXEGWpOcHeqwNX6m43S0hfKmfAK
         JhcqpImnfitPKpSZxnSr87vwHCVtiMAw7xaGoFN73W4MTNmKUK5QoeYOkuMw7hne/kyA
         BHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VTRBtZGT8BtVw5zsFhiWCluDgulKA3oSoE7nkZmGGeQ=;
        b=TihLi3iAyt7Er22pompUz7XezM6CZQuqn7Oa1UdrfXIbQC9P6jxQIuWkzVWt3RgNH6
         ZiMLGasjmGr3VKjUOifNuiLIltFamlWVPFP0MuvXbgS3SKZDovil+8W/lf+XRyKt3HY9
         R2jwdhMgfif2/JEWnF4kDbsOAqwP1mqvhrLM4dlT8PXfICNrPbuN/+XcDmVxnwnSi6Lg
         yue3rQ0J8+fQbgU9x5rhkvUsI14vv14j8iH5J1dDEgQRcAzSFNOZz/383PM6j4s21W+N
         J13BDZ8gHN1/Kbkqb0S0jEM4QASPunm8E12GrX3dVFtLNnGgQEmsoEWutJm6SsOV+Bcw
         UIeA==
X-Gm-Message-State: AOAM530eawic5XbQuXVllZho8xaH+PilujU4676xrFsHw7FYhnWuPYkE
	aBLgy5xtAeRj/VSnLvQnhEiqP7VmGGtgfQBwMZ8=
X-Google-Smtp-Source: ABdhPJw/1BErJf2YsIXa1Kl5uY4Bob/skl1WnEf3+Pb+Ap2phub/DgN1mXZqGV+3lFO1vfsRceu9D4X0N32XfymeAWU=
X-Received: by 2002:a05:651c:1507:b0:249:83b4:9a27 with SMTP id
 e7-20020a05651c150700b0024983b49a27mr14819100ljf.24.1648840438681; Fri, 01
 Apr 2022 12:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1648839305.git.sevinj.aghayeva@gmail.com>
In-Reply-To: <cover.1648839305.git.sevinj.aghayeva@gmail.com>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Fri, 1 Apr 2022 15:13:47 -0400
Message-ID: <CAMWRUK4W6rRe=6dfZg4PsvD6nAxNSqtc0Q=6M3Ho=0JAs2hKWA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rlt8723bs cleanup
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Oops, apologies for the noise!

I tried to send v2 of the patchset but I had older versions of the
patches in /tmp and since I specified /tmp/*.patch to git send-email
per tutorial, it ended up sending all of the files there. I will send
a v3 ASAP and update the tutorial to prevent others from repeating the
same mistake!

On Fri, Apr 1, 2022 at 3:07 PM Sevinj Aghayeva
<sevinj.aghayeva@gmail.com> wrote:
>
> These patches fix three categories of checkpatch warnings (redundant
> braces, redundant else branches after return/break, and constant
> placements on tests) in file rtw_mlme_ext.c, which is part of the
> rtl8723bs driver. False positives, such as
>
> if (foo) {
>         /* TODO: ... */
> }
>
> were not altered.
>
> ---
> v1 -> v2: Removing a redundant else branch left a variable declaration
> mixed with code, which was caught by the kernel test bot. Move the
> declaration to the beginning of a function.
> ---
>
> Sevinj Aghayeva (3):
>   staging: rtl8723bs: remove redundant braces in if statements
>   staging: rtl8723bs: place constants on the right side of tests
>   staging: rtl8723bs: remove redundant else branches
>
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 167 ++++++++----------
>  1 file changed, 70 insertions(+), 97 deletions(-)
>
> --
> 2.25.1
>


-- 

Sevinj.Aghayeva
