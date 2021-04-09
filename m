Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B16E70
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 11:42:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id y204so1363636wmg.2
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V5+pjzHfePdkc4rtRN/TOnz51urUM/UQ0GOzVCwaFA0=;
        b=unziX4wdDag2c1dvpdPDY18YWmm7+w3iEw0aEe1mfWmeg+GAdFsq+UUd88Lkk6IU9L
         xqhIt58qE+bHOCfCK/3+S2U2kFxffNRanLV/TkyAB270FWkFP5E7CTDRiTMayJvV/R6P
         dK33s7Ftdqxqy9yRKFs52pBPF0ArDKqO1v3FfRh4UbcxmxtcwhFbgZqVmKvQYCWNXzcr
         PGqsg61tbGwy0Ldf1MVqshWKTFlIRdRGC62NB4eQVZhoFOmMsA+qX1EAFsgQ7uR0zKoN
         H2wdIA7ckGo29LbNRf1+m61+t0jJAlsEcxVyUrPMcSTKnyD2iLhToqZ8y1vqoR8ENovK
         b3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V5+pjzHfePdkc4rtRN/TOnz51urUM/UQ0GOzVCwaFA0=;
        b=CDVhAQNm5WhEbl7tYE9pFCJ+TTFggY8ysjaC4bTe0LHFnuAbxsm3yZwJT5CcdKAINu
         WJB7HdBK9gLat3PLTPBH3/PaI8I5v5iDkpDU9GmaglD1ELMt6n4frKv14RIfGOwSKLnw
         f7UEWSm2X4gHmcAAohxchPblGe4WkkxRYWMWrrzJ5+MgeJR4QHtqYA9NkQbCvUt4EobO
         lcEhW2yAkP9YrvDjezZ1iLb9Px6M1oBniHSXXyblN/2SNDiFplgttvSUo0+7o7B0LbpG
         QtxUyMzXONpoB72uMCfctQUN6FQ1SlA5KW8WWlDN4fQDI+yQFi7pjb0MCsbZDnqLUAuf
         QtsA==
X-Gm-Message-State: AOAM530kYz3ZHwfNBQfTDJnWUXEDyjAnNZGq5miGRK4YVSVa5m4EqgmA
	HMiSrXvdmUuNAB3a9YkKVwc=
X-Google-Smtp-Source: ABdhPJwmdAyg9Fb1luYslkM5DiD4Uk0tt40oDvZh1cRvcM9dxHhY9t/F6CW6g164NdDbUUhueFVqRQ==
X-Received: by 2002:a7b:c417:: with SMTP id k23mr6569549wmi.186.1617968521597;
        Fri, 09 Apr 2021 04:42:01 -0700 (PDT)
Received: from test-VirtualBox ([87.116.165.76])
        by smtp.gmail.com with ESMTPSA id d133sm3604331wmf.9.2021.04.09.04.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 04:42:01 -0700 (PDT)
Date: Fri, 9 Apr 2021 13:41:59 +0200
From: Sergei Krainov <sergei.krainov.lkd@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: fix wrong function output
Message-ID: <20210409114159.GA3122@test-VirtualBox>
References: <20210408234527.GA6893@test-VirtualBox>
 <YG/1MyfOrHgCi5sr@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG/1MyfOrHgCi5sr@kroah.com>

On Fri, Apr 09, 2021 at 08:33:23AM +0200, Greg KH wrote:
> On Fri, Apr 09, 2021 at 01:45:27AM +0200, Sergei Krainov wrote:
> > Function r8712_find_network() were returning wlan_network even if it
> > didn't match required address. This happened due to not checking if
> > list end was reached and returning last processed wlan_network.
> > 
> > Signed-off-by: Sergei Krainov <sergei.krainov.lkd@gmail.com>
> > ---
> >  drivers/staging/rtl8712/rtl871x_mlme.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> What commit does this "fix"?  Or has this bug been there always?
> 
> thanks,
> 
> greg k-h

This commit fixes the bug mentioned. 

And this commit is based on staging-next and has nothing to do
with my previous patches, for which I'm sorry, I was wrong.

Thanks a lot for review and your time,

Sergei
