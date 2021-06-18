Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A79470
	for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 18:37:02 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z12so9934088edc.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 11:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ekt7Aut3pbPnsGjycKsCk6iV3UU+d516hwM721Obk3Q=;
        b=jBRXPNa0dHbOGnhJdkkRiXiRvCYK3N4Q8EAKJfo7RR/umKj8e/jwD0A07py0jjs1g9
         xo4euodvDf86EF0YWM9A5Jr1RQiHo8Ve46TiqEwIXlpyYC1gr8iBL+UHPeJziS7FfY6K
         B84qIJX+gQHnrQddq9tRwgvOCvF6O3pqIts67MUvEghFcan+bwhuP6rIDbv8k5un1IJt
         nN3YqYg7UTzpwAJGf0HiI2/UN7ONHJr+TGwk2eiYVqFrLtZ+GgwH2lxfV98hLpbCmW76
         J5VpWkwuS0zT6T4SInV2GPBqcLNFYcBdV0krsgZMNwkckGGgIWJrFNiZDYrRo3JMKX7S
         00Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ekt7Aut3pbPnsGjycKsCk6iV3UU+d516hwM721Obk3Q=;
        b=qa6SQpYLUE5EGMzM8bdOEJz3hQbCFSGNM0Kjl6Znl/EhPTPmb59CrqeEUnizSCOURu
         AtEfeUBWF+7A4MEuexA9MCooSF5ayvgV5K8oagmDH6TumsifWdK2VPNKXuviF54KFSf4
         BD5ZtIZRt8u8zYSjxSlG2tfklR5GCWk6la+r3oDdGe6OYTNDHGNXEaK4vCXYTWD0Rb8a
         d6RxqF7AHOwV9WZr6hT6vMpfLPFeINx6vUzjp1zoeug9sR+J3QD7xPUmwJXXdAkf5EMt
         5zbx3jG898TtWcPOzir47yVmyKQVJ2jsn3iVsYOhBwxNAEWT/aXrL0bqNnkDOjgNnCk0
         2tQg==
X-Gm-Message-State: AOAM533ji23dgGaMNOQ7pFBUBrCRztkqvK8ZV+YNozZlAP9Yq0+WtBiL
	hoGdP3OU3jh8CUD+8f1zCS6aA/7UcjOQ3JFNkQA=
X-Google-Smtp-Source: ABdhPJzxFbIUov7kG4A6bLF3AGJlZ813KPZ11AXwRTOmjaQyYGXMb+qVKr5uMq6bYqMFCkvhF/doQS6SsLbFPo7h91I=
X-Received: by 2002:aa7:dc4c:: with SMTP id g12mr7149764edu.258.1624041420817;
 Fri, 18 Jun 2021 11:37:00 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210613102229.1424495-1-fbihjmeric@gmail.com> <8974a58823d74d118595d4f8db5ac870@AcuMS.aculab.com>
In-Reply-To: <8974a58823d74d118595d4f8db5ac870@AcuMS.aculab.com>
From: Jhih Ming Huang <fbihjmeric@gmail.com>
Date: Sat, 19 Jun 2021 02:36:49 +0800
Message-ID: <CAKgboZ_G+46OL3_foSnJ8ZQ_MOR2nNK_rfuqcXc_AjQN63Qk+A@mail.gmail.com>
Subject: Re: [PATCH] rtw_security: fix cast to restricted __le32
To: David Laight <David.Laight@aculab.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"fabioaiuto83@gmail.com" <fabioaiuto83@gmail.com>, 
	"ross.schm.dev@gmail.com" <ross.schm.dev@gmail.com>, "maqianga@uniontech.com" <maqianga@uniontech.com>, 
	"marcocesati@gmail.com" <marcocesati@gmail.com>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 15, 2021 at 4:48 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Jhih-Ming Huang
> > Sent: 13 June 2021 11:22
> >
> > This patch fixes the sparse warning of fix cast to restricted __le32.
> >
> > Signed-off-by: Jhih-Ming Huang <fbihjmeric@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_security.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c
> > b/drivers/staging/rtl8723bs/core/rtw_security.c
> > index a99f439328f1..2f4da67e31c6 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> > @@ -121,7 +121,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
> >               arc4_crypt(ctx, payload, payload,  length);
> >
> >               /* calculate icv and compare the icv */
> > -             *((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
> > +             *((u32 *)crc) = le32_to_cpu((__force __le32)~crc32_le(~0, payload, length - 4));
> >
> >       }
> >  }
> > @@ -618,7 +618,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
> >                       arc4_setkey(ctx, rc4key, 16);
> >                       arc4_crypt(ctx, payload, payload, length);
>
> Is someone using 'rc4' and 'security' in the same file?
Sorry, I don't get it. Could you explain it more? thanks.

>
> >
> > -                     *((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
> > +                     *((u32 *)crc) = le32_to_cpu((__force __le32)~crc32_le(~0, payload,
> > +                                             length - 4));
> >
> >                       if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
> >                           crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
>
> In both cases the *((u32 *)crc) is also very dubious.
> Casts of pointers to integer types are almost always broken.
> Given the code that follows the second hunk I'm guessing you
> have 'u8 crc[4];' (or equivalent).
> That can be misaligned and then access will panic on some systems.
>
yes, I've sent the v3 PATCH and used Al Viro's suggestions.

> There is a get_unaligned_be32() (or something similar) that can be used
> to read the crc from (payload + length - 4).
I also used memcmp for checking.

thanks.

--jmhuang

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>
