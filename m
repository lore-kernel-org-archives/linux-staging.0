Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D300615A6;
	Thu, 14 Apr 2022 06:07:07 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id bo5so3968171pfb.4;
        Wed, 13 Apr 2022 23:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FsVNlmo76coFyDtRUEkwklGp3gT9bCDAz+fEnEz9lfA=;
        b=HXxkXiotQoiTFZM3OV1IPhsqwrRnlwKKdhwXsStXIFoPNv8hoE96ziQy9cnrv407F8
         lfsnceJfHOc0tV2YLNuRkk21Tn3RsVlWnxu9qgYnQxZJNVO6nkjFgPvxgb+7Fc5pXXA5
         SwQNE/3ctsYFFJj+sNgAxm2qJj46SIFnOG4/G1D2fBkDlm/xU5Kk2tS1AY38raohjB3a
         zwCaUmb7d/rDiHLVqknqqba0fn3P1CG8CE52+IyXEMV54FPyVIqEGhrOY6mQrvSYeQ5B
         lg2Vtp65tC1YbqQCxklAPB2mwg9X3mKY0bhzqwTM57L0kWZq61XdI69iKusf73wBaUHZ
         swUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FsVNlmo76coFyDtRUEkwklGp3gT9bCDAz+fEnEz9lfA=;
        b=HOffXj4kAgjomJJbWhk60slEguAZ1JUsw4FRD2ObSlYH4rJQxMy8gckVneFqbyG7OK
         /Mtpy8Rud+GzUlRTYOFz//mxKPhX/v+hf/aE1oC6ubpPMYYD+tRF77vSqUjFo8a2UX7w
         bJx5RKGO1S1WvKM3Hk/+Wn9nIvGQaha9cBCS9pu8AaI63sL8b07+8mbVl07AOjoTgnlA
         UGVBANuOaxOPHjIrxfqNy+CgCKSk860cbqQJKD0wJPSY3SYN0Xh9yYTIMdb6AWHvlEL6
         LUSxPEBLpOKt9LZRO6oTbG8JE844aa0alKcTZzgRDqplgiudmzuy5rrDMYeXfL+C0HTW
         ZuGw==
X-Gm-Message-State: AOAM531fo1gEzGpPDL1p4DeCyU4FHIPi9UkaH5b2GnDXjdOrF8P2Mbi2
	JqA6uXSDKYJIUbi0sSBxyrIS30FZnpwafb7KJnE=
X-Google-Smtp-Source: ABdhPJyNb2NHZvzPmlLrW8QatcbD7K1uL3uwObckZgEka8AARyRjRnlDAclwRQV4DYcNskA2+HbKbCMAkF9t5ztW5r0=
X-Received: by 2002:a63:788d:0:b0:386:361f:e908 with SMTP id
 t135-20020a63788d000000b00386361fe908mr1019712pgc.395.1649916427148; Wed, 13
 Apr 2022 23:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220413203914.59533-1-aliyarahmani786@gmail.com> <20220414011156.GA1243803@alison-desk>
In-Reply-To: <20220414011156.GA1243803@alison-desk>
From: Aliya <aliyarahmani786@gmail.com>
Date: Thu, 14 Apr 2022 11:36:53 +0530
Message-ID: <CAGTWmRGPyD8_zSQu17eQ5MQnYyxFaLQuL8L+H5=J-Td9n5VsOg@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: Remove volatile
To: Alison Schofield <alison.schofield@intel.com>
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 14, 2022 at 6:40 AM Alison Schofield
<alison.schofield@intel.com> wrote:
>
> On Thu, Apr 14, 2022 at 02:09:15AM +0530, Aliya Rahmani wrote:
>
> Hi Aliya,
>
> Wondering why the recipient list different than this:
>
> $ perl scripts/get_maintainer.pl --nogit-fallback --no-rolestats -f drivers/staging/sm750fb/sm750.h
> Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Teddy Wang <teddy.wang@siliconmotion.com>
> Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> linux-fbdev@vger.kernel.org
> linux-staging@lists.linux.dev
> linux-kernel@vger.kernel.org
>
Do I need to include all the maintainers and mailing lists?
>
> > Remove volatile to fix checkpatch.pl warning.
> >
> > Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> > ---
> >  drivers/staging/sm750fb/sm750.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> > index aff69661c8e6..7a11f8593596 100644
> > --- a/drivers/staging/sm750fb/sm750.h
> > +++ b/drivers/staging/sm750fb/sm750.h
> > @@ -52,7 +52,7 @@ struct lynx_accel {
> >       /* base virtual address of DPR registers */
> >       volatile unsigned char __iomem *dprBase;
> >       /* base virtual address of de data port */
> > -     volatile unsigned char __iomem *dpPortBase;
> > +     unsigned char __iomem *dpPortBase;
> >
> >       /* function pointers */
> >       void (*de_init)(struct lynx_accel *accel);
> > --
> > 2.25.1
> >
> >

Thanks,
Aliya
