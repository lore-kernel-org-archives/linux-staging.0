Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAD31FDA;
	Sun,  3 Apr 2022 17:00:06 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id s13so10113172ljd.5;
        Sun, 03 Apr 2022 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y9ueE08O4hgLJ/etsVdj1Kl8Il5FNA2+FWPSFvQRrPk=;
        b=U+HajK7vqk1UVA1fsIaKeJKFZd7cfzVEcwM4KyUoZ2V0Ugn+cZGoZLPMP0MtdaBWRS
         alyBTpxOK/kPBbB5H+BZ2edC9isgxq9HwRKLHFEe9+wHKvRCBd8A7EIafe5zLl6VBgX2
         5GpqjuD2PLXR72sXVIlqxmMGocx+ENmc+txeLLXT+WZlzKBAyjzuIo8YHi7KkfMBGPGt
         qmhnXv8IOnuyxamhdlB+PENbk9pErGvYi7b/v7sJ+hZpePT1DkGvMIqoV2gVXkQaQtL4
         u52lNn2EHzCx5x6Bj/vAvxqHRSYdUVp7PhscZGCHsSakft2rgstcYHKmdGc7fwFIzHb7
         75Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y9ueE08O4hgLJ/etsVdj1Kl8Il5FNA2+FWPSFvQRrPk=;
        b=HaqiDu8DFS/p/ffSilxzGJQ4/KWbjVpS3SBEqIbFZ6OOaQBnwmr06P1/we/4EJ1JWk
         FmXtJ1azioZaGR1d6NgZm95lz0ONSpLGb9igifEO3mVRQSRAFHKJy/H6tBhO1L5jBTrA
         XN+2Sm0sKwhhtLFphN4oc+nzbblScQ9GQ8VIcEfyK7eLIiVUQDfe0Cs+TzmAtzD/5mZI
         DY1HCYtfJFOBFPcfXlSTbnGIQDlyc6h0vvbXOvmVGkzzfNViwZNsV5fsea1bw40OaYh9
         qXs8+eSw1UU3liw2zz7lzoP9sgVn1juLIYH9MQFBkoRg/ocZwcwUjQmGk9Xp4wlgdwYT
         OP+Q==
X-Gm-Message-State: AOAM531u8PrSzaNCznV17Frj7xflCu+AMtpJh9OEloBBS9iyNoJ9qnnD
	TQPcadZ0hkJWXpKbhIe0t2zQoWIGDbAkOTG5HEw=
X-Google-Smtp-Source: ABdhPJzVZRAjSxF9zMVc8S+plYKgl7R00N+fdaod9HHbDZuUOJH2tuCfsHYzy+OmwFUTKicp8o9YIqILgdGyfi5wRvM=
X-Received: by 2002:a05:651c:1507:b0:249:83b4:9a27 with SMTP id
 e7-20020a05651c150700b0024983b49a27mr20023362ljf.24.1649005203378; Sun, 03
 Apr 2022 10:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220403155111.GA333187@euclid> <ed0e9f7b-9ba9-b0c8-8261-397bf793b9b9@gmail.com>
 <CAMWRUK6K77KpRkCkruL=RQcmA1opbvapyPJOA-EFpYdXxY8ujQ@mail.gmail.com>
 <4ccc9ac3-c542-cd32-0cbb-7cdabbf0dbf9@gmail.com> <CAMWRUK7g7BqUL1NziBfbc6Epx7G8Xos47sKAtcimDZYmG-hVgA@mail.gmail.com>
 <3e1dfdde-d9f3-9e16-82a6-7b5497981bdd@gmail.com>
In-Reply-To: <3e1dfdde-d9f3-9e16-82a6-7b5497981bdd@gmail.com>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Sun, 3 Apr 2022 12:59:51 -0400
Message-ID: <CAMWRUK5Ws=QvKvOAQ=iHtTNK8c3zvWJeOWoTEu2CUjrPCFuBEA@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: simplify control flow
To: Michael Straube <straube.linux@gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 3, 2022 at 12:43 PM Michael Straube <straube.linux@gmail.com> wrote:
>
> On 4/3/22 18:29, Sevinj Aghayeva wrote:
> > Ah, I see. You run it on an email file that contains the patch. I
> > could reproduce what you saw when I ran checkpatch without any options
> > on an email file. But my usual workflow is to modify a file, e.g.
> > rtw_mlme.c and then run "checkpatch.pl -f rtw_mlme.c", in which case I
> > cannot see the "Alignment should match" error. So it looks like if you
> > do not specify -f then checkpatch.pl enables --strict option.
> >
>
> Hi Sevinj,
>
> I'm also not a checkpatch expert, but on my system this works without
> --strict too. I applied your patch to my local tree and get:
>
> /scripts/checkpatch.pl -f drivers/staging/r8188eu/core/rtw_mlme.c

Hi Michael,

That's odd. I don't get any CHECK messages if I run exactly the same
command as above:

$ pwd
/home/sevinj/k/staging/drivers/staging/r8188eu/core
$ ~/k/staging/scripts/checkpatch.pl -f rtw_mlme.c | grep 'CHECK:' | wc -l
0

I have to specify --strict to get CHECK messages:

$ ~/k/staging/scripts/checkpatch.pl --strict -f rtw_mlme.c | grep
'CHECK:' | wc -l
167

I don't know why that is. I'm on Ubuntu 20.04 and it looks like I'm
running checkpatch version 0.32:

$ ~/k/staging/scripts/checkpatch.pl -h
Usage: /home/sevinj/k/staging/scripts/checkpatch.pl [OPTION]... [FILE]...
Version: 0.32

<snip>

>
> [snip]
>
> CHECK: Alignment should match open parenthesis
> #1638: FILE: drivers/staging/r8188eu/core/rtw_mlme.c:1638:
> +               if ((p->PMKIDList[i].bUsed) &&
> +                               (!memcmp(p->PMKIDList[i].Bssid, bssid,
> ETH_ALEN)))
>
> [snip]
>
> You can also run checkpatch on the patch files (without -f).
> Then it's easier to see if you introduced new issues.
>
> regards,
> Michael



-- 

Sevinj.Aghayeva
