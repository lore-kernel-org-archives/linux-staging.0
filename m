Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4762C9D
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 16:36:29 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id h1so7902022pls.11
        for <linux-staging@lists.linux.dev>; Sat, 08 Jan 2022 08:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XvXSaj2zeUMV5gu1zDCnUuXXW18H0oit6FmC8vDPjvA=;
        b=iGkQAeeBFRxLCjXlK7BRY37ALdjccxhPJ3PSopYuGyxD5aLrjRQmuH6D6Uv2v7RFC9
         RBfuFRb6n0vH3FZSZCIRwv3CxfyYbFJpFoLRT3PbA80YMciR9NZBsY1+kr7r5popNxeP
         EPe7OIz3MpJcAfU2ujrnBHccjlfesO9BOiXCd3cnvoQCu4jFtxe9haq7bLVbNxBIyISP
         VS6ezhBRJkXeRLpWCZTWvInZd+W9M3WYjDkNsGEPJqInomzyrNSgvOKFRW1KjbHAZJ0E
         gd62tvHeOmne2av4Ta0n9RXScLiA4wdE8sMmIbkRkMSZwy8EON4z6qxyH5RFOZtdoYwe
         kocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XvXSaj2zeUMV5gu1zDCnUuXXW18H0oit6FmC8vDPjvA=;
        b=jBouDBCT4Zt2GxVkdj97HmDW6nAODtPmFBZDvD6a7zup6cGCF1mgW+MdCZGOiziAr4
         z4lns3cH60E4CO3e35mNve2VirG9hKtsg3KntlKw+eZ/bZoIbyaEMpNuJkEaRedu1FlS
         kiKCaib4iowrcxyqdwv6yFoT8KFQ0HtXV2SWD6S3VlnU8bQ8xdRlOVWJXtLxIVQtfom4
         c5ZE3n+DF+8emVRH3j5iDWdp1+CUx0BsYjKQWsT8mATTsB5wHdUx2QQ9b8zmONSusBiu
         LafTc/6yB8fH+6N7FlMdHDn++79ukyZSqMWZsKk6Qg4q1ZkG94x2OkDYXFXYSRUzKCSK
         vYbw==
X-Gm-Message-State: AOAM531P2I4uK05mY2COB33PPqTQwKqrTuGwPOZl2g+ZsO49v0/GTv2B
	rWHkl2tQqKUC7FnVR5EtRPc=
X-Google-Smtp-Source: ABdhPJwo6okPb9QZ8f70X4vvIP1d9EnTARDX/m6CwIFyPpxLKZIrld+qwvd8vNVklN/OSYm8MN0MCA==
X-Received: by 2002:a17:90a:bb91:: with SMTP id v17mr20206722pjr.238.1641659788756;
        Sat, 08 Jan 2022 08:36:28 -0800 (PST)
Received: from realwakka ([59.12.165.26])
        by smtp.gmail.com with ESMTPSA id z12sm2627183pfe.110.2022.01.08.08.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 08:36:28 -0800 (PST)
Date: Sat, 8 Jan 2022 16:36:21 +0000
From: Sidong Yang <realwakka@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: pi433: move get version func to where all
 other functions are
Message-ID: <20220108163621.GA26654@realwakka>
References: <20220106201430.GA3416@mail.google.com>
 <20220106213325.GA10767@mail.google.com>
 <20220107085343.GP7674@kadam>
 <20220107192438.GB2693@mail.google.com>
 <20220108111910.GA1978@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220108111910.GA1978@kadam>

On Sat, Jan 08, 2022 at 02:19:10PM +0300, Dan Carpenter wrote:

Hi, Paul.
Thanks for applying my opinion. And there is one thing to metion.

> On Sat, Jan 08, 2022 at 08:24:38AM +1300, Paulo Miguel Almeida wrote:
> > On Fri, Jan 07, 2022 at 11:53:44AM +0300, Dan Carpenter wrote:
> > > Just say:
> > > 
> > > 	retval = rf69_read_reg(spi, REG_VERSION);
> > 
> > atm rf69_read_reg is a static function in rf69.c.
> > 
> 
> I would remove be the static.
> 
> > I do agree that this is technically possible to write the code
> > exactly as you suggested but on the other hand, that would be the only
> > exception to the rule when considering all other higher-level functions
> > provided in the rf69.c
> 
> There may be other functions which will benefit from this later on.  So
> instead of "only" a better word is "first".  Some of those high level
> functions make sense because they are slightly complicated and have
> multiple callers.  But in this case open coding it seems easier to read.
> 
> > 
> > are you strongly set on the rf69_read_reg approach or would you
> > be open to keep the original approach? (rf69_get_version)
> 
> I think my approach is best but I don't care.
> 
> > 
> > > 	if (retval < 0)
> > > 		return retval;
> > > 
> > > Deleting the error handling was a bad style choice.  Also preserve the
> > > error code.
> > >
> > 
> > I just want to double-check if this suggestion is taking into
> > consideration what was mentioned here:
> > https://lore.kernel.org/lkml/20220106210134.GB3416@mail.google.com/ 
> > 
> > If it is, I'm happy to add it back but I just wanted to confirm it
> > first.
> 
> Yes.  Keep the error handling.  Your way makes the code more complicated
> to read.

I totally really agree with it.
Because the switch clause under this patch catches error with 'default:'
but it returns '-ENODEV'. I worried that it lost retval from reading
register if it has error.

> 
> regards,
> dan carpenter
> 
