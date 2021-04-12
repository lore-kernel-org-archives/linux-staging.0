Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7880C72
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 17:40:03 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 130so877596qkm.4
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 10:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iHFqjFCRbV77geF1NfusgD5m4a0gjV5MYV0QS53h8i8=;
        b=KOqc3a1bNp8/Hs41BsrMrrQ8Kyer4kA12jgbjBEKZh5rzx4lDzkVAF7YCobsN1c9fR
         VXHmAY+FQcMskTdOKlsGF32JJ1fkKnLTrkChYYJW2JfBH6kScW1zUOrl16P35sT7Im8E
         8qXOy0E5xNA2LanIUcx0JkZ8nCOend0LPtrK/G7WdAy7cqJU5K8L47w1/ELoJjvYG3Qa
         YCTl8z6s2tCAe6Q+NnJp4jeuv1tNbzBSMBS7iltqvTbylO+SVqnPlztC0Hhmy+0fuAtP
         qytQkVV+6nybDpv+SaFiHgrrDc+26zyHfGe0/yYw989WNofcTiR2v7wKQAj1uOc96O/V
         7D+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iHFqjFCRbV77geF1NfusgD5m4a0gjV5MYV0QS53h8i8=;
        b=N/h/HoaV4A7sUQBtCFuMHI2CDALQtQFp6ZdE3mYMh1YFxrymviyTu62IrOpACBIVg6
         kOM6o6yJ3LSXYqDBHFfDWvAILlkJVHd9p8fHYx/5Aucra9wjbMJ/MHfm+ODs7vhg5o+M
         Da7iqYwWWqQARFEdNqwD93pcHET28Qg561t3B92msMhWF5LpK6mjEcWEQ7d12Fpx0Xqr
         sgfy76Ldhm5/xsJwTTiGJ4Kv0aZmVMntbhxab97YjqFVM4tFcVpMATZiFQf9mDY4wI/m
         zvdbTsWXSAsOTALu9DZnyONWyWm+A9rZcge+B6gbHxBFpDdZ3LXPByXKSfkm6yLLwsx+
         J3Iw==
X-Gm-Message-State: AOAM531z1YPxOAp0P3jhJhkvSNk8vI5d4gWWaozWzcoz70ro82dBxqlh
	7moZmM2KSKdSayvNSNmspm4=
X-Google-Smtp-Source: ABdhPJy1fojLalaL/ckKGfFP68UfWntnQL/g+7TYjjdzqNuyqH0vzUY7jbc/9nDyia3Zp/Xxclx35w==
X-Received: by 2002:a05:620a:1645:: with SMTP id c5mr27581347qko.63.1618249202608;
        Mon, 12 Apr 2021 10:40:02 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:29a:1b49:fcb:5776? ([2001:1284:f016:a037:29a:1b49:fcb:5776])
        by smtp.gmail.com with ESMTPSA id h7sm4597183qtj.15.2021.04.12.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 10:40:02 -0700 (PDT)
Message-ID: <53dad29aee8925b3377d48b4c97b06ba6d05de43.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH 1/4 v2] staging: media: omap4iss:
 Replace macro function by static inline function in file iss.c
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Date: Mon, 12 Apr 2021 14:39:58 -0300
In-Reply-To: <alpine.DEB.2.22.394.2104121935590.19780@hadrien>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
	  <e302566a3d9e5180ab27eb2c2824fd1b678a6d99.1618231618.git.alinesantanacordeiro@gmail.com>
	  <YHRNzq3h3LEp3Dgc@pendragon.ideasonboard.com>
	  <7457fd4eb5afbf66b3a6f2fed4dd1e440e6ed422.camel@gmail.com>
	 <YHRjPpMVVrhTF7Tc@pendragon.ideasonboard.com>
	 <babb019f0950cf11857a4bcf20a572f2eace1777.camel@gmail.com>
	 <alpine.DEB.2.22.394.2104121935590.19780@hadrien>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em seg, 2021-04-12 às 19:36 +0200, Julia Lawall escreveu:
> 
> 
> On Mon, 12 Apr 2021, ascordeiro wrote:
> 
> > Em seg, 2021-04-12 às 18:11 +0300, Laurent Pinchart escreveu:
> > > Hi Aline,
> > > 
> > > On Mon, Apr 12, 2021 at 10:58:45AM -0300, ascordeiro wrote:
> > > > Em seg, 2021-04-12 às 16:40 +0300, Laurent Pinchart escreveu:
> > > > > While testing on a device isn't a requirement as you can't be
> > > > > expected
> > > > > to have the necessary hardware, changes are expected to be at
> > > > > least
> > > > > compile-tested before being submitted.
> > > > 
> > > > Hi Laurent,
> > > > 
> > > > I thought recompiling the kernel would be enough in this case.
> > > > I recompiled it in native Ubuntu 16.04 without errors.
> > > 
> > > Did it compile the driver you modified ?
> > > 
> > I'm sorry, It didn't. I forgot to enable the option to compile the
> > driver as a module in "make menuconfig" and now I'm seeing the
> > problems
> > I generated.
> 
> You can easily compile a single file using make path/foo.o and a
> single
> directory using make path/.
> 
> julia

Ok! I'll do that from now on.

Thank you for the help,
Aline

