Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BFF15493
	for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 17:59:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe12baec61so4308655e9.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690567155; x=1691171955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nBFXkAvWa+aXsF7eSgVNSwTnXiRmGqg72Px7o+vU698=;
        b=gX0YCrz6pmK3ry1xC0Zf6w79H0bLGB8w5z2/6DxdWVZWK5IwccQjQ0uHo23kPd+B6o
         livSgSJcaM7Y99xB70UDUF2jUN8Ylt4UGKnEVoWzmOpIG47K+jsJufgZioGRmrmPqnh1
         kqTY3H8Ej5AOU6x9HZa5+Gjf7QkKu8eyQmqips+jdswOp6M+WVTMtsiYaycwzpskf4Kt
         HNZ2YP93OHVsxktreHeY3qRFjqjqK/g1NXDjOCdtnLDdoAwTnSkU66EeMDD1PffKiD0W
         uMp2wAjvBxfdjIxMDo1RtymL8jwnAXu6bJUl55+8y13mY8Thc28XaVxom2zDOAtqL0Xz
         kjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690567155; x=1691171955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBFXkAvWa+aXsF7eSgVNSwTnXiRmGqg72Px7o+vU698=;
        b=Qv7ocJA4jXoGYnY/cDJJMjLo/tMpRj+1o+2mwE0ScXtb6VJ6os0zBAto80fGCnDBnu
         gFJZ1jJyExLka7r6vqXEJYDm2VWFJL9RCn0uxzuEUTXH9GIXpZJqdHjftA4Wp+vXNxD1
         ZmhaW6EAQQ07dRAwochYqS2seKUlBaUHBQTxIVJ+i2/O0ijfe3WvAgpxOhdcWCy5OjqT
         RdeDEf2kOj+9JfijANIGELoRBtPv5yakUieGeo/xsaPk0nOib6CoSdKs5KosKCA702qW
         /Ub2B2UEKZGalhHqtp4KAr6LqmNWKn/Hweu9A15YcHDOkdDWw14lq3cI+FG10U9CGXiW
         mA3w==
X-Gm-Message-State: ABy/qLaIhSpsUxuhrf+wo3DnrCgltcAZRRpwY3pTIytgvJYUDskeOZo4
	JcNK42PLtS/eoZwsMg6chkXPZw==
X-Google-Smtp-Source: APBJJlHzraxaXLJ82YOth2sjomKi5XTmeP574pxXQWxZZHaHnA2C1yV4FlMniC6vxu4o9dhNjGvtLg==
X-Received: by 2002:a7b:c84e:0:b0:3fc:3991:94be with SMTP id c14-20020a7bc84e000000b003fc399194bemr2274248wml.24.1690567155447;
        Fri, 28 Jul 2023 10:59:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a10-20020a5d508a000000b0031773e3cf46sm5388803wrt.61.2023.07.28.10.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 10:59:15 -0700 (PDT)
Date: Fri, 28 Jul 2023 20:59:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <5be80f9a-7dc9-4f56-9b8c-467321321d48@kadam.mountain>
References: <ZKjeHx/zqrNIqaA6@alolivei-thinkpadt480s.gru.csb>
 <2023072729-sensitive-spyglass-ec96@gregkh>
 <ZMKDeyGaPQHm6/pr@alolivei-thinkpadt480s.gru.csb>
 <2023072741-mankind-ethics-b95b@gregkh>
 <ZMKkgItqf8r8BcRB@alolivei-thinkpadt480s.gru.csb>
 <2023072752-stem-pupil-76ab@gregkh>
 <ZMKrcvpu3b15Hdif@alolivei-thinkpadt480s.gru.csb>
 <2354895b-c127-40eb-8f16-b19e4750e1d0@kadam.mountain>
 <ZMP+MPdQ2IjJjFCE@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMP+MPdQ2IjJjFCE@alolivei-thinkpadt480s.gru.csb>

On Fri, Jul 28, 2023 at 02:43:12PM -0300, Alexon Oliveira wrote:
> On Fri, Jul 28, 2023 at 08:24:56AM +0300, Dan Carpenter wrote:
> > On Thu, Jul 27, 2023 at 02:37:54PM -0300, Alexon Oliveira wrote:
> > > > 
> > > > I would have thought you would get a "line is too long" warning, that
> > > > didn't happen?
> > > $ pwd
> > > /home/alolivei/git/kernels/staging
> > > $ perl scripts/checkpatch.pl --strict -f drivers/staging/vme_user/vme_bridge.h | grep -i parenthesis
> > > $ 
> > > Nope. I didn't get any of that. Check it out:
> > 
> > Heh.  The warning is there but you used grep to remove it.
> > 
> 
> I only used grep so as not to pollute my answer with too long
> output, but you can validate the full output by running the following:
> 
> curl -ks https://people.redhat.com/alolivei/kernel/evidence
> 
> You'll see there's no warning related to this patch.

I checked before I emailed you...  The warning is there in your URL as
well.

CHECK: line length of 121 exceeds 100 columns
#133: FILE: drivers/staging/vme_user/vme_bridge.h:133:
+	int (*slave_set)(struct vme_slave_resource *, int, unsigned long long, unsigned long long, dma_addr_t, u32, u32);

> As I mentioned, there are other warnings that were already there before
> I submitted the patch, and I didn't touch them (yet).

No, these warnings are new.  Here are the relevant lines from the diff.
Originally it was short and now it's a bajillion characters long.

-       int (*slave_set)(struct vme_slave_resource *, int, unsigned long long,
-               unsigned long long, dma_addr_t, u32, u32);
+       int (*slave_set)(struct vme_slave_resource *, int, unsigned long long, unsigned long long, dma_addr_t, u32, u32);

regards,
dan carpenter

