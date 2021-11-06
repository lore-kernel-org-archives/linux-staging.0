Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8EE2C85
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 16:59:43 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so8603289wme.4
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ASLagh+KzWa4E9Hyt8o234OFb1UVf7vi2wLWr2x0tBY=;
        b=TtKqVufeDkcnaAaMlGSaQSgdQlK10IlAPQX/mfKbR8bxJ5IjSbtYJ2zC8A//PrkA1G
         MGiUR6co5PpNR/rS/bOVdO82lh5MpA3IVb/X5+xImV7AlqiOTRJdpnEW4kbUFum2ZwKC
         1u8hNDKz6Kwo1mwFDLvyOycSoMuABfRmmR2/dSE+MbPg8y5069lFgOk8C6TV/f4EV/ad
         jk4WUbFUZaB5frOzwqOxvq6U5gQ8j2x8zJru7qYHa8FV5yO0JP8YBNi4efynKu3mFlAt
         7nCryV7XMFglun4cxV464CpC6ZLTWtPp4ttYJYiDi73nVQSgiEeLpp56EIitLBIx0eOK
         KwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ASLagh+KzWa4E9Hyt8o234OFb1UVf7vi2wLWr2x0tBY=;
        b=CXLhV2dKjRMkGzz0S6Rse3cmlEslZTEsdI/aTEzTz4Z7GcL7mZmFVipLJc/SqrVShr
         bCZ/1HpohVMOEZJj7QV77S/M6vWfUlIOy25mFZZO2O15Sh+ArDahdOil/UtgsBKr5/Ff
         cpbvpPTsmE3a/GnZxbKLCyI6S4P3NcIYT90Nk7Wdp0Xv3jwygVIlqjjhln6g3C5H7e/l
         Zp29lJJ6dlUuPt+9s57f9b/Hs+ie3aj31w5GnZXKfqlx8/WNqKBEo+jlMzX9UnADnn4D
         iYS/z/yKGoFRTKQKL10gB58cJN5esq81wAv+xXMjO746uNx5WX5lvK0xLqD0Jgl7Ue4C
         XkOw==
X-Gm-Message-State: AOAM532TYXsQ3LFGGsEJd03xa4X+qmr4/5WRdR83XA49/1kvoxZBigiD
	6WmV4gM0flDZUaAb0Xyx5PNu/g==
X-Google-Smtp-Source: ABdhPJzSCioI0VWG07BRDC2CYW5c0UJv6dLX/tPJapMgPKpS9yNNn4NhfQ9pwPpzKssrPGChBxPjiQ==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr39261408wml.186.1636217982046;
        Sat, 06 Nov 2021 09:59:42 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id e18sm11077766wrs.48.2021.11.06.09.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 09:59:41 -0700 (PDT)
Date: Sat, 6 Nov 2021 16:59:39 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Zameer Manji <zmanji@gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Message-ID: <YYa0e98JTsE0PPDL@equinox>
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com>
 <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>

On Sat, Nov 06, 2021 at 11:48:08AM -0400, Zameer Manji wrote:
> Hello All,
> 
> I have bisected the regression to
> ```
> commit 221abd4d478ab52fd17de9287fa302ac0e06f7b3
> Author: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Date:   Thu Aug 12 02:25:19 2021 +0200
> 
>     staging: r8188eu: Remove no more necessary definitions and code
> ```
> 
> Prior to this change the device can see all networks on all channels.
> With this change, the device can only see networks on channel 11.
> I suspect this might be specific to the RTL8188EUS variant
> of the hardware. Unfortunately I don't know enough about
> this driver or the hardware to understand where the issue
> is in the change.
> 
> Full bisection log is here
> ```

Hi Zameer,

Thanks for doing this bisection, super useful. I will have a play after
my daughter has gone to bed and see if I can see anything :-)

Assuming me or someone else finds the cause, would you be happy to test
a patch?

Regards,
Phil
