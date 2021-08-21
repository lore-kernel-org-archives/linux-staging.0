Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260CB72
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:02:35 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so9313642pjl.4
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4HTFLhWisTNLRIx4NTlvnb8zMtfi4Uwgkrquy0wqd74=;
        b=CL4GyunjSvjkUb3nw9klbGSUZKKv14t780WUflmlEdS7mdCWLDZ0tl5NaGd39USl4Q
         ++OpD5POBw2IQr2lqQV+uL7wLgpKMMiCmWUQp35TAWm6wcY70KxtKwKFKgmYJZVIq1aO
         nQwQq1GsWsIkbQkRznKEZO2wWs5gwn4wfRhfoj6jyVZ1WiyOv9710kL070MBPOUZpMhq
         oon7xSg9Dzq1k8Q++D3u6/QGPEGsQT4q33hDS6uQM/A0MQyMCRHLDK1z+PZGHxgV8BJ3
         tRSO3a8nRGD1dU9VlNAL+DmufZZCL1BayjomDDTSQyLwjPljWhLNcnLWiVDV6jzyWaP1
         l1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4HTFLhWisTNLRIx4NTlvnb8zMtfi4Uwgkrquy0wqd74=;
        b=c9WsrdpZDDWQMv5qQfX0Fl2y4OxgzXO4azrB4xhQLAyGREpYU8Y7VSE8DvW6uVEh7Q
         jLsw/66EKqnEhXjhGNefkMIaz5vZifokjIQJnnIhUORhxch75AMWijtJdoXDbXu57e0U
         PYk7LrLv5p3NRh6ZQdztd0RO1nkDzJXdVvnHk73MjEy24sGJa+s6mnWgvxNxxDzzZ1wx
         dB5G45cIIuuUyL6tXe2PsBC34u3NoM3Y0Zkook8L62sObOLCH/VCgLZBoKC/k75QtYGN
         pEsoMdSw17ski69maUyZI01dYO4Flf4nkKUI9tdmkmoOvmsKltPQ1gkuSLjuEjJ0fLER
         9dyg==
X-Gm-Message-State: AOAM533uZ9YhgzYoixgvKWpzH/UaSiRhRQ71HJ1pvP+XTcjIMUBnhZXG
	wczsSFOhMtTlRyPY4V291c8e7Ft75T2szLQH39YHkQ==
X-Google-Smtp-Source: ABdhPJwQCZj+SdVJpFLkj9iH5Cwtl9rfF9GijnwS91rX8chEmvKxPq8upLIQdclNlup5JI6n5h21D6bbqUKcrxdh6Qo=
X-Received: by 2002:a17:902:6ac6:b0:133:230b:e8bc with SMTP id
 i6-20020a1709026ac600b00133230be8bcmr723484plt.22.1629565354706; Sat, 21 Aug
 2021 10:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821105615.6307-1-phil@philpotter.co.uk> <2360857.63PHMDANz2@localhost.localdomain>
In-Reply-To: <2360857.63PHMDANz2@localhost.localdomain>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:02:23 +0100
Message-ID: <CAA=Fs0=KXjYEJqPeuNjEdWEZQ91QC6gJSuSa4y0X9BqfOXEw5g@mail.gmail.com>
Subject: Re: [PATCH v2] staging: r8188eu: change declaration of Efuse_Read1ByteFromFakeContent
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Kaiser <martin@kaiser.cx>, 
	Michael Straube <straube.linux@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 13:17, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> On Saturday, August 21, 2021 12:56:15 PM CEST Phillip Potter wrote:
> > Remove forward declaration of Efuse_Read1ByteFromFakeContent function
> > from core/rtw_efuse.c, as the function is defined in full directly
> > after this and therefore this forward declaration is redundant.
> >
> > In addition, convert the storage class of the function to static, as the
> > function is only used with rtw_efuse.c, and tidy up the signature
> > alignment.
> >
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> >
> > V1: Removed forward declaration.
> > V2: Takes account of feedback from Michael Straube and Fabio M. De
> >     Francesco to make storage class of the function static.
>
> Thanks!
>
> Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>
> Cheers,
>
> Fabio
>
>

Thanks Fabio.

Regards,
Phil
