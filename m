Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4145A3FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:14:00 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id j13so59897524edv.13
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p5az8nB81DwwNgXGTxU9ukK7VAEPLsys0uqjmS5Tnv4=;
        b=jY0gnQxKtfoHLReTbt5tv1J2b8p8UMD4UpXbJp0u5T/PV/r2z8u48dBkTvV0gO2ZUj
         /LiRt0DewGx4DPgmtD9+lIe1x/4dwr373259WBlybTWGt3Cnak+l+YEqXN7M0zfMDVu1
         3azCzuk3zNEQsRoI3yw4RP8eDTEvdNFSqu2fat4MGWc1AgALPC3gX24prJgVHA6pnBVT
         0TqkiKPjyJvdwTDu82RbawjQQFASYTeToMas16awrm9Mbq0RnbIg42i8XFIyNmJlknzG
         UBQvzrvQNW+qzeAX0yuWvDRMEU8AdfIZyNRPEHRnHzjPFYi865bxQtw6vj5DFpvj3LXo
         a5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p5az8nB81DwwNgXGTxU9ukK7VAEPLsys0uqjmS5Tnv4=;
        b=bdHzoqjMgq0b8x9CUS/I36ykjNdBdLoVhKx1wyLnh3dAXacR5O6PHtGBC1zaZXAPVt
         Gd5NrI8/wYDAJQ8MLMv59JgelC6Rs0QIEx6kFm22dBPl2Kuu8JToXSormwLeEDsq61Pt
         W8fB/elZrDyKIl02B+fctUf9fdfzg3CSVMFVkdV+wefLTS4VRQQ1rukA8/7STu4XOEkQ
         C5IV7GItBjq6+OKC93jyCNGS4/TippMiekqNgPEvOUvOdpGG536XzZxxMR1iWJnMrU7b
         pCtIfBntI8pzXb/kP+FR9hFNZFaPctaySceBtTt0oMy/JCbxKbYXx+u/5r8geKXodvRu
         OioQ==
X-Gm-Message-State: AOAM532F757RL5zPw768WRa4ndePLw9x0w/ht7SPHWh4SYrb+qoHXoSK
	NnICG+ARc2NDY0Xo2EpJC4o=
X-Google-Smtp-Source: ABdhPJw69bCPeGc+pArhaAIB76bErwEstQbaX/JKGGqb00nLLe4X/r85yGsdukQFaixTebA+OUxOhg==
X-Received: by 2002:a17:906:c2cf:: with SMTP id ch15mr27480613ejb.107.1632136438450;
        Mon, 20 Sep 2021 04:13:58 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id la1sm6020197ejc.48.2021.09.20.04.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 04:13:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: saurav.girepunje@hotmail.com, Larry.Finger@lwfinger.net, phil@philpotter.co.uk, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: core: remove the function power_saving_wk_hdl
Date: Mon, 20 Sep 2021 13:13:54 +0200
Message-ID: <1651026.4NJzAxWbHA@localhost.localdomain>
In-Reply-To: <YUhkFvz4BpLv0eoN@kroah.com>
References: <YTub30ZRG3oLbxQW@user> <45c4de06-f618-4352-91ea-885edecdf8bb@gmail.com> <YUhkFvz4BpLv0eoN@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, September 20, 2021 12:36:06 PM CEST Greg KH wrote:
> On Sat, Sep 18, 2021 at 10:52:50PM +0530, Saurav Girepunje wrote:
> > 
> > 
> > On 13/09/21 9:48 pm, Greg KH wrote:
> > > On Fri, Sep 10, 2021 at 11:24:39PM +0530, Saurav Girepunje wrote:
> > > > Remove the function power_saving_wk_hdl() as it just calling
> > > > the rtw_ps_processor().Instead of power_saving_wk_hdl() call directly
> > > > rtw_ps_processor().
> > > > 
> > > > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > >
> > > []
> > > 
> > > Also does not apply to my tree.  Please rebase against my staging-next
> > > branch and resend.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > > 
> > 
> > Hi Greg,
> > 
> > I always do rebase against your staging-testing branch. Can you help me 
to
> > understand.When we need to rebase on staging-next. Do we always need to
> > rebase against staging-next..!
> 
> Yes, you should.  When you are working on code that lots of other people
> are working on, there will be conflicts like this, and you just need to
> stay on top of it.
> 
> thanks,
> 
> greg k-h
> 

Sorry, Greg. I'm confused... :(

As far as I know, everyone here make patches for staging-testing. You apply 
them to staging-testing first and, about 24 hours later, you merge them into 
staging-next. 

In fact I receive two distinct messages, one after the other, when you apply 
to staging-testing and then to staging-next. 

This is the what I've always done here and you haven't ever asked me to 
rebase against staging-next... So, why are you asking for doing that rebase 
on staging-next to Saurav?

Thanks,

Fabio



