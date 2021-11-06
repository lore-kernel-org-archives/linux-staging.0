Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B862C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 19:57:21 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id f10so12998206ilu.5
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 12:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HVpvbT1THHGtjRK1v4IK2okCRCYxg+5c8XiaaHR0lRg=;
        b=nj6/3uHtmOPRbdo848go6fFXaLbdA6rriVABW2WLH4T3DQGK4jHkQYVHaXY/Ub5AXX
         xFGW4rxM7xTaxCPLepuZM0CLk0Sk8NN8MJfviJUBlaPIuW/PzVUAYWP0oNmGFUD+slTs
         6/UNDESFdvQRvZQQWuH5oBRfTKP5xji4RPWbxB8gdWA6Sov3OCwmvCsy7q+z9SHJtElU
         vOVnhEh9twESGr89pCinBj0Z84sEKyjqQq2SN8zOwAem992ccn/JpYjDMhNdWJAZwyqi
         1pwHFJqEPiIjB2AzrwDOLw0XwKWmKb3UWOqJk7eskLF9rcs2iHNaiYQjQZsDtF5eJPcy
         tIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HVpvbT1THHGtjRK1v4IK2okCRCYxg+5c8XiaaHR0lRg=;
        b=SqJFhFIW8LSiLT+RbIwdodpvzpIU64i8fb4B4A3VheaoX/4kTQ+adi1CejpbApCLYh
         H0IzJVuGsIfH8FH5k5pW/33wWpn4Pkc9HoRJzfBNAriFYQMRtDIz+Dx+qQfXCM5KRgMO
         n7m8T+TAPKf/cFu2XZ65QJTMO455RNC1RgMWYX963DoBAQXyT1hTHvo6WcyBnAOxVBLc
         /69MKLAWmQiQUUuzkkL3yvt4itIfNBrcvz2h1kU3bnw3xJhPFC2kRGlR5BOdqDReZ7Kc
         bd+53LPj3vsmO2uP8PqFCMn4ZrOP0m3+fRkWm3Xkc/oiyEoS9qZP5yOHTlLyH0sO9YCB
         YqKg==
X-Gm-Message-State: AOAM531CaYVgfQVB6/e6eikWkDbYAzRTs968a/rwl6Jp7OULGL/Ain/n
	UQI3PgyIlTmhQgRYyb0oh+Y+lSj2ARLt67ocDr4=
X-Google-Smtp-Source: ABdhPJw4UoKc0vpxgdolkyILbRrYJfDGYNQ0cuO+nw5tK+HXnky2lOpiN9fzgCdfKA0hSVUsumZpYt/Xm0Qv3aioNF0=
X-Received: by 2002:a05:6e02:12e6:: with SMTP id l6mr18694467iln.231.1636228640831;
 Sat, 06 Nov 2021 12:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com> <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>
 <YYa0e98JTsE0PPDL@equinox> <CABtXzjTkER+2KzsfhcYVN+gDGWUTmpX=2smdfine_fa-b+nsRA@mail.gmail.com>
 <21b97629-00b1-0fed-a4f3-fc318372aea2@lwfinger.net> <YYbJxFAAFuIA8t6W@equinox>
 <YYbOI9DC0pYQRQVD@equinox> <CABtXzjTCb+Qe9tiVVoJ=3P2yTxdZgAwd7_rnbcY7N7ByOguRsw@mail.gmail.com>
 <200c2fa4-176a-c48d-ae13-08bd35e8095b@lwfinger.net>
In-Reply-To: <200c2fa4-176a-c48d-ae13-08bd35e8095b@lwfinger.net>
From: Zameer Manji <zmanji@gmail.com>
Date: Sat, 6 Nov 2021 15:56:54 -0400
Message-ID: <CABtXzjSSQXBRuE+Zmndjmu07XkYQcYj=D8pCsmZPkFU=Xj99Bg@mail.gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>, 
	linux-staging@lists.linux.dev, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Martin Kaiser <martin@kaiser.cx>, 
	Michael Straube <straube.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Larry,

For the record, I am in the FCC domain but on my device the regulatory
domain was
not configured. When I was debugging the issue, I did set the domain
with `iw reg set US`,
however I now realize I set it _after_ the module was loaded, which is
probably not
what I should have done.

I look forward to the release of the patch.

On Sat, Nov 6, 2021 at 3:46 PM Larry Finger <Larry.Finger@lwfinger.net> wrote:
>
> On 11/6/21 14:29, Zameer Manji wrote:
> > Hello,
> >
> > I was able to build and test a kernel from Phillip's github repo and I
> > can confirm the patch fixes the issue I observed.
> >
> > Thank you Larry and Phillip for your help. Would it be possible to
> > have this patch queued up for a 5.15.1 fix? I was
> > testing out 5.15 because I read it would be the next LTS kernel.
>
> I will submit the official patch with "Fixes" and "Stable" tags. That should get
> it propagated into 5.15.x as soon as the patch hits mainline. In the meantime,
> keep using the kernel you just built.
>
> Thanks for bisecting and testing. I suspect that most of us are in the FCC
> domain, but that you are not; which is why you were affected.
>
> Larry
>
>
>


-- 
Zameer Manji
