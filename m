Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F8B29CA
	for <linux-staging@lists.linux.dev>; Mon, 20 Dec 2021 19:32:02 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id f5so19572730edq.6
        for <linux-staging@lists.linux.dev>; Mon, 20 Dec 2021 11:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MpsgppUSFoPZhIJl2SnW8my3RwTRZUO3jm3yedovwCw=;
        b=jZf7RwAhl4FsNV0mmR8HFQVjMO8+XasHmk4N1spDsroEawvLukKGM6KxVD/5giCHu7
         KxaRhqYnAxibnQqtezfdGqTQTAra1tgQIx+P38IPYJhkkwCRwHC0Av7N38A5vmNZlJtB
         hw+GoeicQTN/lfbqrBjZLI6jezyIc3XqWfcS9MXZ7Ai82cvbfxr1jCzRj+ysfYKeEQTk
         dIsWd6RBG9O5nWof8UVKydkW4GM8WmJ8vthorciwF5e63WqqDh4D3EHo2KyYlYaYVYUR
         16evFhOW8B+25pgIH4S6BM79fAmzQjVMxI3EMQfUW6Y0DEGoAEeA19Z3qQJszKUNmyEv
         u0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MpsgppUSFoPZhIJl2SnW8my3RwTRZUO3jm3yedovwCw=;
        b=qlPQIJBuvI+qEwXkCOle9bW/JKPGTevO3FHHda7Udf32oB/XRHWdiaAWZiyhLbgQKC
         Vd/cZ1J9UUjI0BpMX5OvOneApn2YeM1AeG4OA17W3Q56DLGYmzRj1PD/chKEyAgzFWGy
         THSbPCCFK4qYdCbG/m1DSW12qPWV6QsYaoE8HFhVJHOeNcBDglph022J3+/47VBNx9oN
         kEn34ZM81U0aLEw4eUe4dIS1EUfANR6P3nbsEDOR55CH4e8a875gfldXzTv1V6yKxBB+
         /D2YxZz3ULli1S9+NI4p1O0DEICaJwr+ecect1UDujARcfH3ZAeJiPYm4BKlVgFlo5O5
         J6sA==
X-Gm-Message-State: AOAM531T/RJ082pm2YCoG2BmT02gPHJUOJfpy/BaonGQo/uRtrub5why
	WOKEF2F2qmCRvTjz/+iEpoU=
X-Google-Smtp-Source: ABdhPJzKvc/MSW6zd1ePYHAHL3icUqe+cW0CX27OrFKvjJ+GHGloAITAHbQAswBU4g+37Wr3qMS6oQ==
X-Received: by 2002:a17:906:a20e:: with SMTP id r14mr14164190ejy.376.1640028720615;
        Mon, 20 Dec 2021 11:32:00 -0800 (PST)
Received: from tom-desktop (net-93-151-129-173.cust.dsl.teletu.it. [93.151.129.173])
        by smtp.gmail.com with ESMTPSA id 4sm5596273ejc.160.2021.12.20.11.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 11:32:00 -0800 (PST)
Date: Mon, 20 Dec 2021 20:31:57 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxfancy@googlegroups.com, Forest Bond <forest@alittletooquiet.net>,
	Alberto Merciai <alb3rt0.m3rciai@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: drop off byRxMode var in device.h
Message-ID: <20211220193157.GA4401@tom-desktop>
References: <20211219182004.25656-1-tomm.merciai@gmail.com>
 <YcCxtkNJKhFWONv7@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcCxtkNJKhFWONv7@kroah.com>

On Mon, Dec 20, 2021 at 05:39:18PM +0100, Greg Kroah-Hartman wrote:
> On Sun, Dec 19, 2021 at 07:20:03PM +0100, Tommaso Merciai wrote:
> > Drop off unused variable byRxMode in device.h, this fix following 
> > checkpatch.pl check:
> > 
> > CHECK: Avoid CamelCase: <byRxMode>
> > 131: FILE: drivers/staging/vt6655/device.h:131:
> > 	unsigned char byRxMode
> > 
> > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > ---
> >  drivers/staging/vt6655/device.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
> > index 4706bde1ec1d..84b1dcf80e47 100644
> > --- a/drivers/staging/vt6655/device.h
> > +++ b/drivers/staging/vt6655/device.h
> > @@ -128,8 +128,6 @@ struct vnt_private {
> >  	u32                         memaddr;
> >  	u32                         ioaddr;
> >  
> > -	unsigned char byRxMode;
> > -
> >  	spinlock_t                  lock;
> >  
> >  	volatile int                iTDUsed[TYPE_MAXTD];
> > -- 
> > 2.25.1
> > 
> > 
> 
> Did you send this twice?  What is the difference between the two
> versions?

Hi Gregh,
I send twice for error, sorry.
> 
> And you have trailing whitespace in the changelog for this message,
> please fix.
I'll fix and send v2.

> 
> thanks,
> 
> greg k-h

thanks,
tommaso

