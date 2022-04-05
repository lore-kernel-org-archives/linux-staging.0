Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B447A;
	Tue,  5 Apr 2022 15:45:42 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id d5so23926655lfj.9;
        Tue, 05 Apr 2022 08:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9SdlWzsJedRjMRqCUZiZSLZb2q+ZGrqy7aRPJWfCTI=;
        b=fJXw9eqsOgdBlZZ+bDVO85i8RLMF/x5p8l8STvxnoBvVwuBqjJeGJ66vmj05j392K4
         NXboPqMpJuk99eg222wu+ckKVtFOTR0XQOj3vhGuRDX5qMOhl5E+V7xSCsGP31Dfi0oB
         nv0UX8FPtpN1FwcsHvdkj+z0k5zGg0T833+BOFrxqysdkUYZyJy5N1DVbmYbTsS7jzpS
         CJdpfInmXKJ6qnAbCnejlUNZADWpkLjdfBddsRFSbt+e25TFYoJ31B9l5UfXMTM0DvyV
         baI2StGJgaeYSfhVkc4uol95G4dO4Yv/zG3Pr4nEgzrANIoo6wSDC/mk4zk6SXXoOvPR
         2KzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9SdlWzsJedRjMRqCUZiZSLZb2q+ZGrqy7aRPJWfCTI=;
        b=aOvFeeqeCe94ZZTR9le/iQh70qweRlEwsWI6ppKy5U0vn8LkPLmRaE4xYARCq0KCTv
         gHJcoFiqkGJVj9iRTxxVWWp626qQ7vKaJzUDS2KCGkFomqBJ6OmFiZ6Tkuqhd8LE8G3/
         2fPlL01wivW87BER/f7i+xXL2uVg98VdKNNo+zEvChxPalRH2rytNLTDduFZb7U4MXtq
         fCbLjkfBRJIg6Vfs2anyCOgjhC2XqXdKMsKvhk+bAxZdjYOi6/1d1/+61gPIvHZEG/RX
         AQqm69I7WIwjMVutLeC6n61y/4z8fRSWppzeaNDrpWq4AxAQdSKom0m8oITlcjogbpin
         gpSA==
X-Gm-Message-State: AOAM53339HXnDyk8kcXM0z7eY6ei3vdg+emuBZgmaQugpvNQAgKE6QmR
	cjAo0nRb9rXsTq4XFiqo35c4S9Af6QyU/muKKIoVPmoFD1QFew==
X-Google-Smtp-Source: ABdhPJzHwO4rczywv/pgbxm8UYtOW/tXMXJfEqoiCugYVp/7165dKvIw6ECquFAPQBWsdhZjhJRYGSCx9BXdU3dav8A=
X-Received: by 2002:a05:6512:33d6:b0:44a:7966:d688 with SMTP id
 d22-20020a05651233d600b0044a7966d688mr3014884lfg.11.1649173540873; Tue, 05
 Apr 2022 08:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220405150912.GA625670@euclid> <YkxdasBGZ3m2Yu66@kroah.com> <CAMWRUK7c-hqiz+KEFkqBuvu1syCwSnF4UZzbkPFw-VWABm9qOw@mail.gmail.com>
In-Reply-To: <CAMWRUK7c-hqiz+KEFkqBuvu1syCwSnF4UZzbkPFw-VWABm9qOw@mail.gmail.com>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Tue, 5 Apr 2022 11:45:29 -0400
Message-ID: <CAMWRUK7Jgs3evt3bC0pnRkbRw3CS1XCULPi8NzjgGh7aLTFKCQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix indentation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy linux kernel <outreachy@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 5, 2022 at 11:19 AM Sevinj Aghayeva
<sevinj.aghayeva@gmail.com> wrote:
>
> On Tue, Apr 5, 2022 at 11:17 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Apr 05, 2022 at 11:09:12AM -0400, Sevinj Aghayeva wrote:
> > > Adhere to Linux kernel coding style.
> > >
> > > Reported by checkpatch:
> > >
> > > WARNING: suspect code indent for conditional statements
> >
> > You are also removing unneeded comments, right?  Please explain that as
> > the documentation link the bot pointed you to showed.
>
> I specified that under the --- line:
>
> v1 -> v2: Remove the comments that became irrelevant with proper indentation.

I think I misunderstood the bot's response. It looks like you
triggered it because you wanted me to write a more complete
description of what the commit is doing. I thought I received it
because it was the second version of the patch from a previous
patchset (the last bullet point in the bot response) that didn't
include v2 in the subject and a v1 -> v2 after the --- line.

I can do a fresh patch with a complete description and no v2 stuff;
please let me know.

Thanks

>
> >
> > thanks,
> >
> > greg k-h
>
>
>
> --
>
> Sevinj.Aghayeva



-- 

Sevinj.Aghayeva
