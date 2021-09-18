Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185E53FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:13:54 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id z94so39844556ede.8
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 04:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4vr2U1g0cHwYjPOSj/zot+rofFLB5h1tCK6NQz/LyYE=;
        b=ktJ6F95cTA1GygDzE7c5ZtbpuPy6Uini85+rNZuEpmM732dC56TDIuHQ42No5D3rNq
         xyLHzOa1lykeFa47OuvPsmpoSPWjjrYyQZbfqiLeOCgCPzuMSiDCfxq48e2VGCfzXcjX
         C5F5E15K5+3DLlNcprvf9L3JkXkD7r58aYYJw4/KiEEnQvH8ud/kGhJEBFIoyLig7yKM
         aDgPjViPmAiFNx/3S4MzcI5MIn1zDVhzZNxykhGOnizx9CksOpRbfxU1oFIVhPtGh6Gc
         aamk33p1cAkCqpI0dE5m+mrmKKUM/EHQyy4iNwfmh2qaWVwQgzoeyP2LNS2/ESmYVmp6
         /ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4vr2U1g0cHwYjPOSj/zot+rofFLB5h1tCK6NQz/LyYE=;
        b=6JjK80wVLm3p+kS5HS1KxUWE3AYHrQOoem010OQm25JJbAyvV6tVN6Qe2ypMcT/mW2
         TxEQPseHorD5vJpy4VNiNAfXQ/p/JX8i2yd1VHB2XgVdSrkdUFNDWrrU9Vvb5hhFURdW
         qwt3+crffeQypinDcxR/iMEijHAxuzv8sSM8lxIPXcZPMfphvtLBJkeVnvMGI9n1CB/a
         N2w7u3/J2SvrxYkb4roj85FBCnwjr+vPTDrZPQEAoKPhAGgA87TPAg2qxtwtWywEl3rj
         xXKuD2crNDGoFPZas9RWUtHcfR1ImukY5aiicNPk5ma+aOkr5CLCx7Q1TJD3ZMpnM/Hr
         rvXw==
X-Gm-Message-State: AOAM531wPHsnyPkJd3Ml8DPMVsN2Se1qvuwlY9V6q1nM4La3ugH5Hle1
	yK2i4oYH4oyq4HhKNEpwvts=
X-Google-Smtp-Source: ABdhPJw+Wub1Nm0D6xiJKPChmzA+MVSq3jw11+5fT1PMrsC8+XDpKgxxZOHPfzaabMZg03AVVX8OcQ==
X-Received: by 2002:a17:906:3fd7:: with SMTP id k23mr17245844ejj.176.1631963632371;
        Sat, 18 Sep 2021 04:13:52 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id a24sm4055999edu.49.2021.09.18.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 04:13:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v7 15/19] staging: r8188eu: clean up usbctrl_vendorreq()
Date: Sat, 18 Sep 2021 13:13:48 +0200
Message-ID: <1988292.s3joEKjhKX@localhost.localdomain>
In-Reply-To: <YUSpwTneDgRtUBvM@kroah.com>
References: <20210917071837.10926-1-fmdefrancesco@gmail.com> <20210917071837.10926-16-fmdefrancesco@gmail.com> <YUSpwTneDgRtUBvM@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, September 17, 2021 4:44:17 PM CEST Greg Kroah-Hartman wrote:
> On Fri, Sep 17, 2021 at 09:18:33AM +0200, Fabio M. De Francesco wrote:
> > Clean up usbctrl_vendoreq() in usb_ops_linux.c.
> > 
> > List of changes:
> > 
> > 1) Rename variables:
> > 	pdata => data
> >         pio_priv => io_priv
> >         pintfhdl => intfhdl
> >         wvalue => address.
> > 2) Reorder variables declarations according to the "Reverse Xmas Tree"
> >    style.
> > 3) Remove unnecessary test for "!pIo_buf".
> > 4) Move comments one line below code.
> > 5) Remove unnecessary excess parentheses.
> > 6) Remove unnecessary extra spaces.
> > 7) Remove unnecessary comments.
> > 8) Fix grammar errors (checksumed => checksummed).
> 
> When you find yourself listing all of the different things you have done
> in a single commit, that is a HUGE hint that you need to break this up
> into smaller pieces.
> 
> Please do so here, this should not be just one change, as it's almost
> impossible to look at this and "know" it's all still the same logic
> happening here.  But if you had broken this down into 8 different
> changes, then it would have been obvious and I could easily have applied
> the changes.

Dear Greg,

My first thought when I read you message was to simply delete this patch 
because usbctrl_vendorreq() is going to be deleted in 18/19. But then I 
rethought of the original purpose behind this patch and (after talking with 
Pavel) we decided to do the task you asked and split this patch into 8 
smaller ones. The only reason is because, as you noticed, we "[]are moving 
code around", so, although I'm not required to clean up code in 
usbctrl_vendorreq(), I'm required to make the new usb_read() and usb_write() 
the cleaner the possible. This preventive clean up helps me a lot.

Obviously I guess that I'm required to split also the next patch of this 
series in 3 because there are also there 3 different kind of clean-ups.

So, we'll have a total of 11 clean-ups.

> 
> I've taken the first 14 patches in this series, it's great work, thank
> you all for doing this.  

Thanks to you for the "great work". We appreciated it.

> But this, and the remaining patches in here
> need to be split up more to make it obvious that the changes are correct
> and should be accepted.  Please feel free to start the numbering of the
> patch series over now, given that the first 14 are now merged into my
> tree.

We're working on this.

Thanks,

Fabio

> 
> thanks,
> 
> greg k-h
> 




