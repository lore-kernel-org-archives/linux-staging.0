Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BAE7B;
	Sat, 11 Mar 2023 07:16:33 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j2so6988277wrh.9;
        Fri, 10 Mar 2023 23:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678518991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOeXrcTnNWbTzKi6E9l84Z2v2QMvdCtKFsEt5GB4CRU=;
        b=Hyh6q2afJ81eWMsTciI6oeov2twf4NTSgFWhvvm3jnGh1QYJO2VXkgiAVWM8/B7g+e
         xjoUyK70agYunrw8KHq85mq5RsvTdveeVbqvumPIeIOoqmY8A8sWKiVqNL+MXvrOWPIH
         oJIvaMpyGwp4rLAxUPzZKz4g/5ETHLsw3C0wJQNFnrFAKLBUN69Vh+7Vujl2g0wOcR9d
         mK/9/lcxXWmOW+hkf5oGhhw/oqGRaJ2oW1tgsTevQ5P7xjriBXZZzkntKEOHw3glPhX0
         MOdEEwjnXnmwr3RFSxC4I/tZjr9eRi5xNUkHwB3XlinT87hpi2P8OH/y6VxmL+yFLrS0
         EBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678518991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOeXrcTnNWbTzKi6E9l84Z2v2QMvdCtKFsEt5GB4CRU=;
        b=7jjt07bXIGNQz4zgc2D9PfPN4JYxuWU/xmLN/hueggGnglrjSkuVKTlpDN3QvAY4lv
         eaplKsGZdW+xgS+7mPqqtepAic1kBv0wVZQ12pqN6I1oqZp38J5o+h3TVlYysguk3zzp
         KlBb5lK0Uj+eWLjZotJ7R3dlp1LReVIfvs+HkVX1rOWGZccq5lZCM69MWHxzkHvUbbvL
         zX3tHQIDP2imfUo3ZmDhp6Ara905JMEQRflJSed6ZBZWm0AqmrBnfaU48YHqfRjkRgqt
         9zeayEJdETWYdFkOvGaC7/sR17WHt5WJwOW3LDDJsn+xghSklGmH5cQtZ2oS5gO42qv6
         Rt6Q==
X-Gm-Message-State: AO0yUKXAts1fT45fYxJRFQdKOn+BUyOIMQK982dFjUaJBBnKwmCGecL6
	ZwJtdL9ZRChXR/h0lePFjcQ=
X-Google-Smtp-Source: AK7set/MQHjs+2HnUEPKYvtMPFzjUMd8XL/gPJgsXRh4Zdcc0tiom//uHYHVwT7zGDPiVCsnYinlMA==
X-Received: by 2002:adf:eb50:0:b0:2c7:1dd5:7918 with SMTP id u16-20020adfeb50000000b002c71dd57918mr17307669wrn.28.1678518991270;
        Fri, 10 Mar 2023 23:16:31 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d4ecb000000b002c70851fdd8sm1655094wrv.75.2023.03.10.23.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 23:16:30 -0800 (PST)
Date: Sat, 11 Mar 2023 12:16:28 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: remove tabs to fix line length and
 merge lines
Message-ID: <ZAwqzPeLh1Dm10EJ@khadija-virtual-machine>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
 <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain>
 <ZAwelPOv45zThK6j@khadija-virtual-machine>
 <ZAwoTVeMDGu/44Ln@ubun2204.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAwoTVeMDGu/44Ln@ubun2204.myguest.virtualbox.org>

On Sat, Mar 11, 2023 at 12:35:49PM +0530, Deepak R Varma wrote:
> On Sat, Mar 11, 2023 at 11:24:20AM +0500, Khadija Kamran wrote:
> > On Sat, Mar 11, 2023 at 07:16:19AM +0300, Dan Carpenter wrote:
> > > On Sat, Mar 11, 2023 at 03:18:04AM +0500, Khadija Kamran wrote:
> > > > In file drivers/staging/greybus/arche-platform.c,
> > > > - Length of line 181 exceeds 100 columns, fix by removing tabs from the
> > > >   line.
> > > > - If condition and spin_unlock_...() call is split into two lines, join
> > > > them to form a single line.
> > > > 
> > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > ---
> > > > Changes in v2:
> > > >  - Change the subject and log message
> > > >  - Merge if condition and spin_unlock...() from two lines to one 
> > > 
> > > Apply your patch and then re-run checkpatch.pl -f on the file.  You will
> > > see the problem.
> > 
> > Hey Dan!
> > When I run checkpatch.pl on my file, I can see that my old CHECK no
> > longer exists instead a new CHECK is mentioned saying 'Alignment should
> > match open parenthesis'. I understand this from your previous email.
> > Should I stop working on this file and leave it as is?
> 
> Hi Dan,
> Not trying to speak for you, so please override my message if this is
> inaccurate.
> 
> Hi Khadija,
> Yes. It is not useful to resolve one warning and introduce another. Tomorrow
> someone else is going to try and revert it. So do not make the "remove tab"
> change. I still like the merging of the split lines. It appears to improve code
> readability. You can send in a v3 with just that merge change and wait for
> feedback.
>
Hey Deepak, 
Thank you for the feedback. Before sending a patch v3, I think I should
wait for more feedback.
> Also, remember to check your change with checkpatch. There is a section about
> post-commit hooks on the tutorials page. This will allow you to integrate
> checkpatch as part of your git commit step and do the job for you.
> 
> And also, always build your change locally on your machine. No new warnings or
> errors should arise.
>
Yes I will keep that in mind for next patches. Thank you!
> Hope that helps.
> Deepak.
> 
> 
> > Thank you!
> > >
> > > regards,
> > > dan carpenter
> > 
> 
> 
