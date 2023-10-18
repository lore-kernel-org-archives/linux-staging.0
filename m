Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD463E;
	Wed, 18 Oct 2023 06:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag9FJsYZ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6934202b8bdso5614073b3a.1;
        Tue, 17 Oct 2023 23:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697609208; x=1698214008; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V5q09wBAssZNTSnPI9VwZLnGSrKz4v21dohqlLwCKM=;
        b=Ag9FJsYZNa+ewPoOyjfDFsJxC6P7g2aJ9iwfN31hwX2jHqyD1kjbWrXDcV5ihn/xqX
         4968CRK1naAytd/64it4U4P751q5vePeTy6diPTY2UA+x6lmvQfgQaPLvkhoAs00C7m/
         YdrSgIsqZYrxdqmfaBGBVG45l6k/YgwlEaTH8WEjuRE9UBj8t4oTs3mxJDHzu1YrW6zQ
         Z+9T/Z7FSatbU+LpXyeh1CukQukf87MNAyC/Uoclx/Sc+gff3K8Y2YvzG0Q1DTnTCk8H
         LRsL4Is5eT71cWJDHOM5SxXu9FXudn/gcpcSLu/jUgKYWso5oDG7KILVSlrXnhrBwMee
         4sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697609208; x=1698214008;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0V5q09wBAssZNTSnPI9VwZLnGSrKz4v21dohqlLwCKM=;
        b=j88gpe/4zaq3hT/FzqftwRhP0hdsuWGTwmLPCYrFr2jwpTY7+pUK8USH/vq7lFD0LB
         ei0tSLH55hEdbujHbIxPmtFge+rLFG4xa38Wy/3iNfoESSRndEBhUm72B5fBQ7OFj2O3
         001WlGTl/05329Kjx+Ah2DfRHq95vhk1RxGA1NMF0fHQW/D9av85Unbwr3gj0Q9fZeb4
         kkeym/26CnENPnRWtydDG7io/jJa9o4jtTR4YgYWQ2w3I+cla8yTMBwWyjVdg/5bDNre
         PswB+HqziGRXksAYH1dX9Zl97HNb2sql3K16XT9KwR5r7J3doZGLNhfThJVFzxKhWmDu
         S5hg==
X-Gm-Message-State: AOJu0YxB/YQjXqRVGW+oPqnRDrtkuPJ9+PZX8muxlt+PejHflovcePqG
	mP8p8qlvAsVvOcKvNE3LjQYLc8jZuFNbfw==
X-Google-Smtp-Source: AGHT+IFUPRKjHqUD+X8en3uArtC/c70An4KHv4Tcz1oWSq2BhC9DYf3VVMqHEObhnsgdxtJ5b9M06A==
X-Received: by 2002:a05:6a00:15c4:b0:68f:f741:57a1 with SMTP id o4-20020a056a0015c400b0068ff74157a1mr5520627pfu.7.1697609208349;
        Tue, 17 Oct 2023 23:06:48 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id e10-20020aa7980a000000b00690c52267easm2470087pfl.40.2023.10.17.23.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 23:06:47 -0700 (PDT)
Date: Tue, 17 Oct 2023 23:06:46 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/2] staging: vme_user: Replace printk's & cleanup log
 messages
Message-ID: <20231018060646.GA1868@Negi>
References: <cover.1697601942.git.soumya.negi97@gmail.com>
 <85af8b2d-6246-46c5-c6dc-582807010fa@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85af8b2d-6246-46c5-c6dc-582807010fa@inria.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)


On Wed, Oct 18, 2023 at 07:49:22AM +0200, Julia Lawall wrote:
> 
> 
> On Tue, 17 Oct 2023, Soumya Negi wrote:
> 
> > Staging driver vme_user has a bunch of printk() calls in vme.c which
> > triggers checkpatch warnings. Remove all printk's and change them to
> > the appropriate logging mechanism i.e pr_err()/pr_warn(), or
> > dev_err()/dev_warn().
> >
> > Also, cleanup the messages further by using __func__ in the string
> > instead of function names.
> 
> "cleanup" is not actually a verb.  It's a noun.  The verb would be clean
> up.
> 
> julia
>

Hi Julia,

Will update the commit log.

Tanks,
Soumya

> >
> > This patchset fixes all checkpatch warnings like:
> >
> >     WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
> >              dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
> > &
> >     WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
> >              this function's name, in a string
> >
> > Patches must be applied in order.
> >
> > Soumya Negi (2):
> >   staging: vme_user: Replace printk() with pr_*(),dev_*()
> >   staging: vme_user: Use __func__ instead of function name
> >
> >  drivers/staging/vme_user/vme.c | 175 ++++++++++++++++++---------------
> >  1 file changed, 94 insertions(+), 81 deletions(-)
> >
> > --
> > 2.42.0
> >
> >
> >
