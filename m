Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAE92C96
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 21:33:54 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id i5so19615370wrb.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 14:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eWSOPmJ2txTH9XmAF0IHrPDATwpukn0Tp+TzTnG7ZkU=;
        b=8QaAnfgv7gkMVmHs6Zue2lCj7UISeSJgDwAN4A+EXwXUBQV0Urin1rMblKvsVStZ0e
         ub+wo1VstmZuoR+h20N3XbyfG8pf/XLYf6mUquvYazc3W+NCc9KDOm9VMuQO4R1W+J9D
         6QEsoAKBrJq1xOpIInKWYJXMdSIWDS+HZDOv+JL2gTwGkKYksIxQYLz5VdRdEDq940CE
         k5U+yWPQxUSBksVYDasD8vEqav/587Ybe7qtDwbqnng2HGrCV1pkSQaQRo3xAwBrMRvQ
         dGBzI8yPSJU8z6DRlsvpQUS2GSDSpTcj4+imX24qmISNr4P+S2s3Y+XD5NppEyZMfjqx
         pBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eWSOPmJ2txTH9XmAF0IHrPDATwpukn0Tp+TzTnG7ZkU=;
        b=BvGSr2ZK0Itf6eqfi1yBPm8M+atRy2qpTKWv7EZBcCojYbLJGkHYxIFduKkcn+Abwu
         j3L2IZ1/xuiS9Qygs35EwEfcWAjzstKs+2eKDEDw9OPNUAt9cUsQi0P/mDLJHHRi7pKY
         NxnvfUf3FZD+t/qX42gC9Nz+Npu4oNP6wjKqE8IsXZOerTrmLRDTVS7Y4gn3W8siy/5w
         ol0P+GuMOmmuoeYsbhxbKIhvhapQJHcyH54mrw5oMGfjGI6Aj4hmLnPJs72gK904qVm+
         fRvquxPt5eBk5iae97hXaWdP8ynNewQWYTnwzJCR6gcFft+pQM5foMX6SzcZIqzEI6hI
         jrPw==
X-Gm-Message-State: AOAM532AsWrN5LOv5C29wMaYt+EZ2yK6Og0W5pDsN/lYXF5LI9pOfaXx
	wdObOctxEzJsduJKFO0H7WQTDg==
X-Google-Smtp-Source: ABdhPJzz66g1hKTzWSCHLruu/NX2UQbHyeSaYOwwM/SbHnJ4hwJdSl2p3/U41cPFRImL9VYoaQvWDA==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr84444165wrc.417.1636234432733;
        Sat, 06 Nov 2021 14:33:52 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id y6sm12461672wrh.18.2021.11.06.14.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 14:33:52 -0700 (PDT)
Date: Sat, 6 Nov 2021 21:33:49 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Zameer Manji <zmanji@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Message-ID: <YYb0vcjy04kIY+OH@equinox>
References: <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>
 <YYa0e98JTsE0PPDL@equinox>
 <CABtXzjTkER+2KzsfhcYVN+gDGWUTmpX=2smdfine_fa-b+nsRA@mail.gmail.com>
 <21b97629-00b1-0fed-a4f3-fc318372aea2@lwfinger.net>
 <YYbJxFAAFuIA8t6W@equinox>
 <YYbOI9DC0pYQRQVD@equinox>
 <CABtXzjTCb+Qe9tiVVoJ=3P2yTxdZgAwd7_rnbcY7N7ByOguRsw@mail.gmail.com>
 <200c2fa4-176a-c48d-ae13-08bd35e8095b@lwfinger.net>
 <CABtXzjSSQXBRuE+Zmndjmu07XkYQcYj=D8pCsmZPkFU=Xj99Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtXzjSSQXBRuE+Zmndjmu07XkYQcYj=D8pCsmZPkFU=Xj99Bg@mail.gmail.com>

On Sat, Nov 06, 2021 at 03:56:54PM -0400, Zameer Manji wrote:
> Hello Larry,
> 
> For the record, I am in the FCC domain but on my device the regulatory
> domain was
> not configured. When I was debugging the issue, I did set the domain
> with `iw reg set US`,
> however I now realize I set it _after_ the module was loaded, which is
> probably not
> what I should have done.
> 
> I look forward to the release of the patch.
> 
> On Sat, Nov 6, 2021 at 3:46 PM Larry Finger <Larry.Finger@lwfinger.net> wrote:
> >
> > On 11/6/21 14:29, Zameer Manji wrote:
> > > Hello,
> > >
> > > I was able to build and test a kernel from Phillip's github repo and I
> > > can confirm the patch fixes the issue I observed.
> > >
> > > Thank you Larry and Phillip for your help. Would it be possible to
> > > have this patch queued up for a 5.15.1 fix? I was
> > > testing out 5.15 because I read it would be the next LTS kernel.
> >
> > I will submit the official patch with "Fixes" and "Stable" tags. That should get
> > it propagated into 5.15.x as soon as the patch hits mainline. In the meantime,
> > keep using the kernel you just built.
> >
> > Thanks for bisecting and testing. I suspect that most of us are in the FCC
> > domain, but that you are not; which is why you were affected.
> >
> > Larry
> >
> >
> >
> 
> 
> -- 
> Zameer Manji

I will leave that repo up for the next day or two, and take it down once
Larry has submitted the patch and it has been merged. Glad it works for
you :-)

Regards,
Phil
