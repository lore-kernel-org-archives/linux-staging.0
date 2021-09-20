Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADCF3FC5
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 13:54:55 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id v5so60931254edc.2
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ago48Rpx2s0FA5kJM2lxWBXF4wmn4ZxkGTX5NYeA3xk=;
        b=OPkpOlpOI0cKLBaZYHDxS5Py1PuZu0k9JisRRpyo8vUabXajREiZLRibhylW7O3Cvq
         3fn2zYtJK9ZBJdYV4YlCWyPc8DUbMnWQcvRG3NiiGKjzKRwrrpKeijd890S7p2wsB0Ia
         k34Y6FPCxptuEp+OH4m3ROhDoG2pdIlMKoYZs2PvfOXdl2GBs3Bli3e9yVygpmFp2qEm
         Rz+ocAWrHEu9RaBFgRZDvJRypyDiKD3B4ZuSXF2E+Xl//WC+9lK/0lD/YtHcbFjapkUC
         k0gwCVVlsPjvI8/N5tjp+1+MtnXDCTXpHF8jtSkPm0yZJcUPaEnxcXDJZXwc6st9m9yD
         Y3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ago48Rpx2s0FA5kJM2lxWBXF4wmn4ZxkGTX5NYeA3xk=;
        b=AxkORqzj9L3ig290/oTEzQhHbAuI3NofWVMMZrC8T971ZFg9VYlugGvzcaOoBOoSs3
         mwocILrzwZKFkmQ9dvA4pVS6ZDczuFTK0W86xzko5LhAaPVH+n2kaSN8DNr2FA0RoTNB
         HGjUOkpqYU79PApRcCd9opYMmsDk465AOJtHUCovYUknxPdZnkUJfvCQQvOvTynRQpER
         UHGcmafpdS7X1UXTk3C00ZCt67Q7xetukB3z8aFBD+DcRnpZsEon+BNUt3LXzdgeV83r
         geh6SOXR5pXJoFhzb4EQ8RVr0rboiDfD+q9OUC4E73vHdwpMWo/REO6tCBGzb83gbGbW
         g6SQ==
X-Gm-Message-State: AOAM533ekB7/zE7zfGjvgGLW7n1BpJE3mdFzgHPCOyhV1LQv91hXnY67
	z8Nl2kdGs0hBpXb2RPKBDus=
X-Google-Smtp-Source: ABdhPJxmvsfS6nF71sy4H20g5P+EHRJ8FhgIDIgsmqdKioEvCUqqVZGrI7X4kqPxJxIWjRu5M9c/lg==
X-Received: by 2002:a50:d581:: with SMTP id v1mr29488085edi.210.1632146056206;
        Mon, 20 Sep 2021 06:54:16 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id t14sm6168932ejf.24.2021.09.20.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 06:54:15 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Saurav Girepunje <saurav.girepunje@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, saurav.girepunje@hotmail.com, Larry.Finger@lwfinger.net, phil@philpotter.co.uk, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: core: remove the function power_saving_wk_hdl
Date: Mon, 20 Sep 2021 15:54:14 +0200
Message-ID: <3091070.onRVGqex5P@localhost.localdomain>
In-Reply-To: <20210920123910.GQ2088@kadam>
References: <YTub30ZRG3oLbxQW@user> <2311011.CixZWWR6MO@localhost.localdomain> <20210920123910.GQ2088@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, September 20, 2021 2:39:10 PM CEST Dan Carpenter wrote:
> On Mon, Sep 20, 2021 at 02:31:28PM +0200, Fabio M. De Francesco wrote:
> > On Monday, September 20, 2021 1:32:21 PM CEST Dan Carpenter wrote:
> > > On Mon, Sep 20, 2021 at 01:13:54PM +0200, Fabio M. De Francesco wrote:
> > > > On Monday, September 20, 2021 12:36:06 PM CEST Greg KH wrote:
> > > > > On Sat, Sep 18, 2021 at 10:52:50PM +0530, Saurav Girepunje wrote:
> > > > > > 
> > > > > > 
> > > > > > On 13/09/21 9:48 pm, Greg KH wrote:
> > > > > > > On Fri, Sep 10, 2021 at 11:24:39PM +0530, Saurav Girepunje 
wrote:
> > > > > > > > Remove the function power_saving_wk_hdl() as it just calling
> > > > > > > > the rtw_ps_processor().Instead of power_saving_wk_hdl() call 
> > directly
> > > > > > > > rtw_ps_processor().
> > > > > > > > 
> > > > > > > > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > > > > > >
> > > > > > > []
> > > > > > > 
> > > > > > > Also does not apply to my tree.  Please rebase against my 
staging-
> > next
> > > > > > > branch and resend.
> > > > > > > 
> > > > > > > thanks,
> > > > > > > 
> > > > > > > greg k-h
> > > > > > > 
> > > > > > 
> > > > > > Hi Greg,
> > > > > > 
> > > > > > I always do rebase against your staging-testing branch. Can you 
help 
> > me 
> > > > to
> > > > > > understand.When we need to rebase on staging-next. Do we always 
need 
> > to
> > > > > > rebase against staging-next..!
> > > > > 
> > > > > Yes, you should.  When you are working on code that lots of other 
> > people
> > > > > are working on, there will be conflicts like this, and you just 
need to
> > > > > stay on top of it.
> > > > > 
> > > > > thanks,
> > > > > 
> > > > > greg k-h
> > > > > 
> > > > 
> > > > Sorry, Greg. I'm confused... :(
> > > > 
> > > > As far as I know, everyone here make patches for staging-testing.
> > > 
> > > Nope.  It's only you.
> > 
> > And Saurav (at least) :)
> > 
> 
> Nope.  Saurav is working against something old.  You can see the
> #ifdef CONFIG_88EU_P2P stuff that was removed in commit 102243f893ec
> ("staging: r8188eu: Remove conditionals CONFIG_88EU_{AP_MODE,P2P}") was
> applied.
> 

Oh, I didn't notice that he was working against something old. 

My attention was drawn only by the fact that Greg talked about staging-next, 
while I was expecting something like "please rebase and resend against my 
current staging-testing".

> > I've been misled and in turn I misled Pavel. This is due to a guide in 
> > kernelnewbies.org that explicitly says to use staging-testing:
> > 
> > https://kernelnewbies.org/OutreachyfirstpatchSetup
> > 
> > In that page the is a section ("Set up your Linux kernel code 
repository") 
> > which says: "[] Then use the revision control system called git to clone 
Greg 
> > Kroah-Hartman's staging tree repository: git clone -b staging-testing 
git://
> > git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git".
> > 
> 
> Huh...
> 
> Those aren't *bad* instructions.  Working against testing-next is fine,
> but just be aware that it can rebase.

Good to know. For what the series Pavel and I submitted we'll complete our 
work, that is sending v9, against current staging-testing. I suppose we'd 
better stay consistent.

For new work, since you make notice that we have to "be aware that it 
[staging-testing] can rebase", we'll switch to staging-next.

Thanks for pointing this out.

Regards,

Fabio 

> 
> regards,
> dan carpenter
> 
> 




