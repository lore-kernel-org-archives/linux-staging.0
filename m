Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B71370
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 18:04:54 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id t193so12093806pgb.4
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 11:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NidPUCUgpxhlJmFSoQiTlrvVc3ediNgl08rsd7mdBZo=;
        b=FHYmYSkjd7B0MovdrbAK5NoFWijOX6nZQv7QppAJiV97r2Bz9HHAwnn4HKRZkGUZ7i
         yu6185Kdyf/n0Ko4cIMfH2FPvKRutAFZx+9y3J56qPjsAbnEzaV3e84Jtx02zH7bdqco
         e1jvzpIToJr0n9jALa6feCsajd37bOT1HTsRLqPsnGmgBWDldy7hdEthLYFJi+KfGe0m
         Zhs/9s90ihOVdN1x5Rv8pCYeZkgf6ho6ojaVV2KhGNBvDr2Lo+9G4e+znNn71dfJJ5bd
         71bCoWhtqn6R6hDXnXqNpIy2lhImzdNZVyGXHbYpnvD1uxOd1Qv33Bk3CCzMTSiTZTm1
         Yn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NidPUCUgpxhlJmFSoQiTlrvVc3ediNgl08rsd7mdBZo=;
        b=O91gb+vgeTQNRG6flkWCIeO0nQVjO+fJWcwrC234wm/kfF1IkGZYGjW//W8La7QeHG
         TiAHMxSJDz4EZ2LgcUdtyhOraspd0YdzbIt7FVmRJXIF3uzgsEFfjRMOFcgE0Ky05/lI
         +S0x5y85ME5Di3a7UKNB+A4B/nlEDexjyW7VK8WNW+ob7y3BsV+ghloRGWwgL6pQmj5C
         5QuOvTW7h3s0T/fRQoEceSwf7FRbgwQnSyRI1unq2EdJi1qh/3+7ljXK7tlStlG2d+rI
         /ADN9OA++s998O+G/ro22EPW4X89EbQmI10R1YYFplssjqENox45ChMcg1vcKtI4CtlR
         FIAQ==
X-Gm-Message-State: AOAM532BoBKa0sig3IjaynlJsbiyvoMigvAhlxGC/DfhzFYf+9Onb40Q
	Ii7A+JI/WZyowT+Bu8DJjwQ=
X-Google-Smtp-Source: ABdhPJwmB0kmfhZehu/YE85BQFDOZz9b2Ah6NEuJUNp/9i/wKInodznINo/8UvK1H3FC3rCdhVHIYA==
X-Received: by 2002:aa7:800a:0:b029:250:c8c5:64b3 with SMTP id j10-20020aa7800a0000b0290250c8c564b3mr46593179pfi.23.1621015494534;
        Fri, 14 May 2021 11:04:54 -0700 (PDT)
Received: from fedora ([2405:201:6008:61b4:4e16:5348:d963:c66d])
        by smtp.gmail.com with ESMTPSA id y13sm4473014pff.163.2021.05.14.11.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 11:04:53 -0700 (PDT)
Date: Fri, 14 May 2021 23:34:48 +0530
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix gb_loopback_stats_attrs definition
Message-ID: <YJ67wCBVnI21YbUc@fedora>
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
 <YJ582f3O9K9YD3QA@kroah.com>
 <YJ5/tqFfcjxOLsF0@fedora>
 <YJ6DrLiMsdkG5loA@kroah.com>
 <YJ6H/WsojYcN/bLO@fedora>
 <YJ6Jf+Z1ReVgDt64@kroah.com>
 <YJ6TUAowTI75h/sl@fedora>
 <YJ6XpUMliWQOS8MB@kroah.com>
 <bccbec1a0ffbf6c31b5e6a78cedd78cd64f2b8fe.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bccbec1a0ffbf6c31b5e6a78cedd78cd64f2b8fe.camel@perches.com>

On Fri, May 14, 2021 at 08:56:10AM -0700, Joe Perches wrote:
> On Fri, 2021-05-14 at 17:30 +0200, Greg KH wrote:
> > On Fri, May 14, 2021 at 08:42:16PM +0530, Shreyansh Chouhan wrote:
> []
> > > I didn't look at how/where was the macro called and missed a very
> > > obvious error. Now that I have looked at it, the only way I can think of
> > > fixing this is changing the macro to a (inline?) function. Will
> > > that be a desirable change?
> > 
> > No, it can't be a function, the code is fine as-is, checkpatch is just a
> > perl script and does not always know what needs to be done.
> 
> true.
> 
> perhaps better though to rename these declaring macros to start with declare_
> 
> Something like this:
> 

Can I mention you in the 'Suggested-by' tag for the commit? (Since you
suggested the idea for this patch.)

Regards,
Shreyansh Chouhan
