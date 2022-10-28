Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BFA1FAD;
	Fri, 28 Oct 2022 07:43:04 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id l190so3859852vsc.10;
        Fri, 28 Oct 2022 00:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KFL9adKihekM8F4k25d98PC2Ll0xHE9L3wfiEmdcsI8=;
        b=ja4yWZKyRolktBga8ujdVEg5//IwG7IHFxFwFCKwBbuCsZT82D3fGh8l4z1YaRu2rc
         FtlLWEr09PyYdtIl/Jk+RlGoSFX7PvvRO8VomL0QYmFiB9/Trv6nuXbLLJgsX1qlWoll
         6YIfEplsbqikpMStY8KLTY8hFfouX6VMvRIPpGt4VHcYxEawlZ79ddo4uEJSXtOLOUHV
         b2sDEJztYSA304XkegQ90g5MbHvhohx3cqIbT8nCl4qR+7qFDw4SJri4Es57Yx9mT8r8
         H6KrPjhQOVetwenmhL1Kg486RH7YIYSORaKvMroM3Sfq+2aVDHkNIbeSusOxV1P1oEG8
         v3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFL9adKihekM8F4k25d98PC2Ll0xHE9L3wfiEmdcsI8=;
        b=4lLNyQ2Jv3lYwk1vQjIdlxQsaj1XJmK6W6QASqFsoWDZUsESWq6tLn1Z+YY8GAWTaE
         ZXsemUQ6B7Nzeq7jAzzHqao0InQpaHzu5yHczyfpANMIN/em6us4Cfwe6fPiIumjPuiG
         lY8dLw6IZT1VQSoKSzhe40YVgW6fgmuNae/9+88wIkKdeHvz4FUUNZUrG4X1V9ENFfWg
         4N5XCgDBy3rFdOhe7QPC6dQkmydqIBVuy3I7MGk89oL0QIKM8uRoheqQXmWTw9u0AWQI
         WdiWWLcAEcsIagp6sw6FhzSlyI0EnQjyTKARiHAhBtYt+h5MA8/49TAWTWL5/QnCt0N7
         VYPA==
X-Gm-Message-State: ACrzQf3hoiIPPqqlz1MjxFtt85E4lT0XRuDvWDOaf17p0VRX/Wm7V6m5
	eHTLpIK/AQMcseKNCCEUyMNyOhhA08+sDlMwqhg=
X-Google-Smtp-Source: AMsMyM7tXiJc82o76JD4AaikiR4k2fSve2dBxpFxJoHlHd2ppquul8tY7yZ3tXhlK8qHYge4JwfGKS3I0TlFU7uvpYg=
X-Received: by 2002:a67:1902:0:b0:3aa:3c4c:72c4 with SMTP id
 2-20020a671902000000b003aa3c4c72c4mr8457483vsz.67.1666942983231; Fri, 28 Oct
 2022 00:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221028063711.GA35659@rdm> <alpine.DEB.2.22.394.2210280918550.2845@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2210280918550.2845@hadrien>
From: jovial umwari <umwarijovial@gmail.com>
Date: Fri, 28 Oct 2022 10:42:52 +0300
Message-ID: <CAMk1CBN2Vf7XLw-J_XLTyZwASg3WHNXdnv7NxKSJDGszvu2kwQ@mail.gmail.com>
Subject: Re: [PATCH] Remove Unnecessary typecast of c90 int constant
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

let me again look in deep into it and see why
Thank you for the comment

On Fri, 28 Oct 2022 at 10:22, Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Fri, 28 Oct 2022, UMWARI JOVIAL wrote:
>
> > According to Linux kernel coding style.
> >
> > Reported by checkpatch:
> > WARNING: Unnecessary typecast of c90 int constant - '(int)2.412e8' could be '2.412e8'
> > WARNING: Unnecessary typecast of c90 int constant - '(int)2.487e8' could be '2.487e8'
>
> It's not ideal to just include the checkpatch messges verbatim in your log
> message.  It woudl be better to say what you are doing and why, in
> complete sentences ("According to the Linux coding style" is not a
> complete sentence).
>
> I also suspect that the checkpatch message is wrong.  Floating point
> numbers cannot be used in the kernel, and the case of the constant ensures
> that the value will be converted to an integer at compile time.
>
> julia
>
> >
> > Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> > ---
> >  drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > index fdf867a5dd7a..4fc4fb25d8d6 100644
> > --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > @@ -41,8 +41,8 @@ int rtllib_wx_set_freq(struct rtllib_device *ieee, struct iw_request_info *a,
> >
> >       /* if setting by freq convert to channel */
> >       if (fwrq->e == 1) {
> > -             if ((fwrq->m >= (int)2.412e8 &&
> > -                  fwrq->m <= (int)2.487e8)) {
> > +             if ((fwrq->m >= 2.412e8 &&
> > +                  fwrq->m <= 2.487e8)) {
> >                       int f = fwrq->m / 100000;
> >                       int c = 0;
> >
> > --
> > 2.25.1
> >
> >
> >
