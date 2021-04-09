Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5605770
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 17:14:03 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id e14so9778097ejz.11
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+KsrNGMheQyZi6tgUyj6QXCX6Kc00oXKAtfc1s77Sw=;
        b=sZYo2nvCM4l6vMu3KfhEwMtWHpcMwuW5poG9qPZXIF8hkF5nQHvd4rkz1M+zDN5UJ1
         LPrQWgwKrZ10cd8jr7TgD6B0foDoB+RqcrdFMXEdaH2dupWyUbAoNlLgyI2nwxHuVTSN
         /2EwZj8DpaBBz/9RWWW8C7iQ4AKoXByFXlTKAvwiWoQqAIUkvR3/AEttkTVsQ1F8qi9d
         /A+5nwNZHEO7atzA7NNfY9eWYuqTDdEISW1Y9fhU9dMwRn8YivdgmCDf3F/bVbRxwfnj
         qv3FKpAI1wkzq5au8CFMJpm43Ju7nz8rGRKZGjOgShKBTbLfqRsqwBnv5BvYCxeP48Hv
         UuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+KsrNGMheQyZi6tgUyj6QXCX6Kc00oXKAtfc1s77Sw=;
        b=Ep8CjExQgl+70tIEFeYyu9nTfbTZ9FCoZzF6dvrRY+qp4zIuTHsC1JidarES3+mO1e
         3SX2IsyUWD5kuOf+rbB3oWki/c4TrRENAKnOA1W4gvyqwstcNPLXmixGR+Koq2P9Qcd4
         oyNtFmXY3OXaUI7Bzw8tTC0b2z1nHMiUzcfHxXPKOgyTiSmp52vSmHFtWoUVM7SQLtuc
         aHi9kZsk4dED1KvpEaEFrRmuwbq0gnENMPNS//mVbPIBv99dTrRG8K4UmrxIu584PRHo
         pOFg49E5SM4YeEi2LAaQKeCoaCzBeeTgWadUdHZenAdHhBfj20ir2lutkJqZaI0Q5WOY
         15nQ==
X-Gm-Message-State: AOAM533fzLlcEb+JvI6l3G8ZDoJs2WrVT9Fm2+oO37x9onYel9Qo/9uS
	k6tljM2S8cX5jCZSKUhtpdOcyQy4wgHiUKuj
X-Google-Smtp-Source: ABdhPJzbeU2BPiQjV4xbjv2bNbjvRmMmf9xCB+mMv1+4RHhWLc7aosOiI5xpIxtJA83tyYNYINCigg==
X-Received: by 2002:a17:906:4f15:: with SMTP id t21mr6385260eju.338.1617988441921;
        Fri, 09 Apr 2021 10:14:01 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id m29sm1512592ejl.61.2021.04.09.10.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 10:14:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: Change the type and use of a variable
Date: Fri, 09 Apr 2021 19:14:00 +0200
Message-ID: <2106328.ujm4fZfeqs@localhost.localdomain>
In-Reply-To: <YHBg1Sy2509vBtrA@kroah.com>
References: <20210408111942.19411-1-fmdefrancesco@gmail.com> <YHBg1Sy2509vBtrA@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, April 9, 2021 4:12:37 PM CEST Greg KH wrote:
> On Thu, Apr 08, 2021 at 01:19:42PM +0200, Fabio M. De Francesco wrote:
> > Change the type of fw_current_in_ps_mode from u8 to bool, because
> > it is used everywhere as a bool and, accordingly, it should be
> > declared as a bool. Shorten the controlling
> > expression of an 'if' statement.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/staging/rtl8723bs/hal/hal_intf.c        | 2 +-
> >  drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> I now have 3 patches, I think, for this same driver, from you, and I
> have no idea what order they should be applied in.
> 
> So I'm going to drop them all.  Can you please resend me a patch series,
> with all of the outstanding patches sent to me from you that I have not
> applied yet, so that I know which ones to look at and what order to
> apply them in?
>
I just sent in the series of patches you requested. Hope the work is as you 
expected. 

Thanks,

Fabio
> 
> thanks,
> 
> greg k-h




