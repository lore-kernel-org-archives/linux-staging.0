Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52052C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 18:49:11 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id i5so19154205wrb.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 11:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oeS+f6fectLbyZsC/3jaokUStHEv113Hms2rWsnc8B4=;
        b=eiuAjPWmDsztW8s+YZ2qbplGtysvt378M8ShSSsk+SqlFU7LzjWMWM3WZaoPLhpJJ7
         /9Niv86tm8J0mx2Tpk+DfKkGAGIVXzyOkSg7A7rVyg6ZieFnBFt7VmHTO+WERlMUdLJX
         ACOhusen5NtWtOenl1GFtNQyHK3veahGNV5R7Y2K+jjYDVN9yJD3xaWd/+CkUgyl8DTF
         LFvPhF8DXh6uel8LLsLs7wnAiL0AknlF4Z2LpPsDWF4Pkd4HjxUUMTeQXTGBwQAsm6Cw
         PDs1cABMLkfxBFV2HjjyRYgFG2KXhENNz7ptlLRdSe4KF+scr6x18kPcUrRXGoE16QzZ
         QTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oeS+f6fectLbyZsC/3jaokUStHEv113Hms2rWsnc8B4=;
        b=8AJfTVNnzH2knIoVHiGAMquFx86oRPqY9PUYtmdM9NSx5rgkDPeEkKIZ2ylVh168em
         7LYr/9HciQp4g6Q2mQd6DiSEU5/sgDywv5kB6kQyZbpSok3wf/OF60u6EFLbl+I72Poa
         4EYZp0/JGt12KM+PyFYztJGfwhS24J3LeUGP9VUzq84lI/De55O5DzMNM8ZsXpp8kdZI
         8BlwgcWPmA/y5FkmZZEfX48ww5dmytRTdhPGVmFDtp1d6C8zoqfWNPeLnRqFEo/8srqy
         kBIe81uV2SEAm9f/H0sQBsKgBpWWQPEbDI31m7NF4ron50jyod/yyzrAH0LX9dA/djab
         7IAA==
X-Gm-Message-State: AOAM530IjB+cIQnYSlFtpgVqV9PhhiqtigUCApMYMOD2D7zcxPkQCBYm
	2F+kf5RCxCt3cjUywhVTZ31iVg==
X-Google-Smtp-Source: ABdhPJz284TC3ZuUlsDpSnCoYN3Qogg6hicoloxY4bbvf0XW8S2wUmqdHhXGTeDlghsTnruVN5Gy8Q==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr59266484wru.34.1636224550259;
        Sat, 06 Nov 2021 11:49:10 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id x4sm9596651wmi.3.2021.11.06.11.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:49:09 -0700 (PDT)
Date: Sat, 6 Nov 2021 18:49:07 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Zameer Manji <zmanji@gmail.com>,
	Larry Finger <Larry.Finger@lwfinger.net>
Cc: Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Message-ID: <YYbOI9DC0pYQRQVD@equinox>
References: <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com>
 <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>
 <YYa0e98JTsE0PPDL@equinox>
 <CABtXzjTkER+2KzsfhcYVN+gDGWUTmpX=2smdfine_fa-b+nsRA@mail.gmail.com>
 <21b97629-00b1-0fed-a4f3-fc318372aea2@lwfinger.net>
 <YYbJxFAAFuIA8t6W@equinox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYbJxFAAFuIA8t6W@equinox>

On Sat, Nov 06, 2021 at 06:30:28PM +0000, Phillip Potter wrote:
> On Sat, Nov 06, 2021 at 01:09:23PM -0500, Larry Finger wrote:
> > On 11/6/21 12:16, Zameer Manji wrote:
> > > Hello,
> > > 
> > > I would be happy to test the patch. I am not an experienced git user
> > > when it comes to
> > > taking patches from mailing lists so I would appreciate it if a commit
> > > was pushed to a
> > > git repository that I could pull down.
> > 
> > Sorry for assuming your level of familiarity with Linux. I find that anyone
> > that can do a successful bisection is pretty adept. Unfortunately, I do not
> > control the repository, thus I cannot push patches.
> > 
> > Please tell me how you read E-mail. Do you use a local mail client such as
> > Thunderbird? If so, I will send a special patch form that can be installed
> > with git.
> > 
> > Larry
> 
> Hi Zameer,
> 
> Just setting up a temporary repo now with Larry's v2 patch applied. I will
> share the URL shortly so you can just clone/pull from it.
> 
> Regards,
> Phil

Here we are: https://github.com/PhilPotter/linux_temp.git

Just clone from that - that is the current staging-testing tip + Larry's
v2 patch on top. No commit history to save on uploading 2.5 GB worth :-)

Regards,
Phil
