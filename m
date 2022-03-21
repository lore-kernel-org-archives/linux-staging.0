Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E6229A4
	for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 18:39:20 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id w21so781139uan.3
        for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 11:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xBJRgrM679+/JjxLGR3nmTFCym20HMB6VhWhqGNgFiM=;
        b=PG4fWDOFfqEb1cwl16UhzR8soGx/W8RjDVStZmUeC4FwIcYryWXGxnsdv1Ow9axY81
         bxpnYdM6gvQoBzNfVHavE9RJ1rhzFY2bgdrKXZM67pk8Cm6GWQge196yxugatGSxluhc
         ITwHb1hO57OAmG/YExVgnAIJ21FiLIY86ZccvhKPOzXF+jsPz7MsvfQxX3bdZJp4ddMG
         ykDG5QDX759NXwK48Xbtaq2qGrKySqxWtnm7zSrLhHI0FqtSw7u+ErnKRKfX5Bn+DFmO
         LpZCrNKSHBbnxgRXX+X6N9B5G+Ssyt+hkwScD970Y/M0mvpS2g0X2FGTaJaCAzcU4xPe
         5b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xBJRgrM679+/JjxLGR3nmTFCym20HMB6VhWhqGNgFiM=;
        b=x1Q+WU/5iaQM6Icl315tu7AFjtvACLLBHWj+vF85T+6XgUxfqGdKt6F0Q2pMEaijeJ
         XSVbnb5dbns2s6Gd24jV4BaB10qUIbRvCmCxsKMJ9VcHGiWz4w0ePfOe4RCcsC3Kehsi
         aFXFdmHtc7L2pALNs1pyWrXd5N0+GKyXtBEzB6C21Fi3KmVNmlWbTOEJiAjYEvJdtuOx
         L7zcsJEIAD3/It3zrr7AARwpee//6olLbmC0+v/qA92QmD5Ewelmv2A1DhXxcISrAs/e
         yUei5U90cHuInDaxN1OzFsh2l4PrUC3TMeE1bFRhrulFtOHXnUx+RnLC/E1ZQgeb69xd
         ASCg==
X-Gm-Message-State: AOAM5309xa3SO/7C2npWyYsCVdF7N0o7CTGin2YWfFLWqJK/h4iZL9f5
	xeI9LrsQmTsfh8GZvjRsVp0ZJNxsG1nhuvQsc8A=
X-Google-Smtp-Source: ABdhPJy3o0R7d0CgN7xEA+Au05PBORG0Q+g3G0JhxDNMmfabfHU01leM4tN2PHTNKvCLRr+FX9ndznByCnN+fisaK6A=
X-Received: by 2002:ab0:20d6:0:b0:356:9691:c3a4 with SMTP id
 z22-20020ab020d6000000b003569691c3a4mr2966622ual.116.1647887959449; Mon, 21
 Mar 2022 11:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220321123626.3068639-1-jakobkoschel@gmail.com>
In-Reply-To: <20220321123626.3068639-1-jakobkoschel@gmail.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Tue, 22 Mar 2022 00:08:43 +0530
Message-ID: <CAAs364-0t4rF4QPywshd2-CnkRmOpP3xZ_K7zZay8UqNOCo1vg@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: codecs: fix type confusion of list
 iterator variable
To: Jakob Koschel <jakobkoschel@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>, 
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, linux-staging@lists.linux.dev, 
	Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, 
	"Bos, H.J." <h.j.bos@vu.nl>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022 at 6:07 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> If the list does not exit early then data == NULL and 'module' does not
> point to a valid list element.
> Using 'module' in such a case is not valid and was therefore removed.
>
> Fixes: 6dd67645f22c ("greybus: audio: Use single codec driver registration")
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6b1d03..e19b91e7a72e 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -599,8 +599,8 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>                         break;
>         }
>         if (!data) {
> -               dev_err(dai->dev, "%s:%s DATA connection missing\n",
> -                       dai->name, module->name);
> +               dev_err(dai->dev, "%s DATA connection missing\n",
> +                       dai->name);
>                 mutex_unlock(&codec->lock);
>                 return -ENODEV;
>         }
>
> base-commit: f443e374ae131c168a065ea1748feac6b2e76613

Reviewed-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>


> --
> 2.25.1
