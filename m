Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C843FF5
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 06:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXhDvMpb"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50797cf5b69so811615e87.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 23:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697179236; x=1697784036; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gReBOXvZ3tuzSCoKI6cwvDchpAXHJGanFh39+fsImug=;
        b=YXhDvMpbnCgqhpCKucLF7iT1ngx5NiL+74nZqt5MKuEi/5ZVBeFc00Fyew5kcdC6GT
         KSWJKVMs0j5kLFDo9Xjqq6Xn0KbrlqJUuyUQIFCI7SgKvo+PXXwzQFaJjjPWxYRYXeCB
         07Qd6GHZ1J4mAA2SfPQOf1Le8QJr3rp35I8GuebCKBz4a8AJTiRjqZUklXWFQI2ioOoF
         +v2UILv53axhdXL8LSjXfKadGg/Iur8UUf8SodjIqInryZQBzyT+8UYZs9pgjXjfmutj
         rkjYTueCBj5u9ijnCwrKXJR6WGfYonvbtRbKJ6Ey1J0n4SEnHh0mxzgF0hZoLn/lk3/u
         oQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697179236; x=1697784036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gReBOXvZ3tuzSCoKI6cwvDchpAXHJGanFh39+fsImug=;
        b=UcSWYavAdf7OS2q4nBdoV5tZ/90Mkm6dv6xhy6fmlAhOBHdyz6NeTUieo8C8k2mkSR
         2PicUViokQC1BtoTP63Za6ubG00RCp9fI3hQt58xhXKLvgDzAH8XSGd9mMlwmLVZsRxJ
         UPenhdUsqyZ4Wke3b7nCIGhSwqAIstRL8es/EHsgvunNNaZz+VcR9WRxZpnGzh401MaJ
         tWPnv79ozNid1MhfQ43CGpQu5fkSx1QYsj8t3zqv/5YiqkelbM1ShMwvm2QHTbnMfwbn
         AR2YdGpIsZ2fFjQtoNKrpEyQEnBrsXEjjOg1AvDZetYqijOsiQmrQG16m04jPKAnGOab
         hCMw==
X-Gm-Message-State: AOJu0YwZkl1/7cY65wvoXbK2xv0mZgRFqfLGzqfhFvJzkXcvAeVCuv4H
	Dx468HkgGA9iBvKP1hIqkEw=
X-Google-Smtp-Source: AGHT+IEEXZNj7gA9pKyGp3kB1cpwy2NNSwDJ2ysQiG/gLgoNU99nw4a5RYfrqfMblrudyHiEknDiTQ==
X-Received: by 2002:a05:6512:944:b0:500:ac71:f26a with SMTP id u4-20020a056512094400b00500ac71f26amr16947450lft.57.1697179236002;
        Thu, 12 Oct 2023 23:40:36 -0700 (PDT)
Received: from GK0179 ([91.199.127.174])
        by smtp.gmail.com with ESMTPSA id o11-20020ac2434b000000b004ff9ecbf158sm3194203lfl.74.2023.10.12.23.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 23:40:35 -0700 (PDT)
Date: Fri, 13 Oct 2023 08:40:38 +0200
From: =?utf-8?Q?Bart=C5=82omiej?= Konecki <bartekkonecki97@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: Alignment should match open
 parenthesis
Message-ID: <ZSjmZpxVwsB7c3Mo@localhost.localdomain>
References: <ZSfi8nPauVatDm3E@localhost.localdomain>
 <2023101250-shading-skintight-28f7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2023101250-shading-skintight-28f7@gregkh>

Dnia Thu, Oct 12, 2023 at 02:20:04PM +0200, Greg KH napisał(a):
> On Thu, Oct 12, 2023 at 02:13:38PM +0200, Bartłomiej Konecki wrote:
> > Fix 2 checks reported by checkpatch.pl in axis-fifo.c
> > for alignment should match open parenthesis
> > 
> > Signed-off-by: Bartłomiej Konecki <bartekkonecki97@gmail.com>
> > ---
> >  drivers/staging/axis-fifo/axis-fifo.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Any specific reason you didn't cc: the staging mailing list like
> scripts/get_maintainer.pl suggested you do?
> 
> > 
> > diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> > index 727b956aa231..ab758a527261 100644
> > --- a/drivers/staging/axis-fifo/axis-fifo.c
> > +++ b/drivers/staging/axis-fifo/axis-fifo.c
> > @@ -381,8 +381,8 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
> >  		 */
> >  		mutex_lock(&fifo->read_lock);
> >  		ret = wait_event_interruptible_timeout(fifo->read_queue,
> > -			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> > -			read_timeout);
> > +						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> > +						       read_timeout);
> 
> Does this now go over the max line length limit?  Does this patch pass
> checkpatch.pl?
> 
> thanks,
> 
> greg k-h

I have no reason to not include staging mailing list.
I fixed my mistake.

Patch lines do not have more than 54 characters, but one of line ends at column 100 and other at col 99.

After this patch there are no more 'Alignment should match open parenthesis' errors from checkpatch.pl.
checkpatch.pl gives one more error connected to documentation in this file, but it should be treated in separate commit and I am not sure how to resolve it:

WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.1" appears un-documented -- check ./Documentation/devicetree/bindings/
#916: FILE: drivers/staging/axis-fifo/axis-fifo.c:916:
+	{ .compatible = "xlnx,axi-fifo-mm-s-4.1", },

Thank you
Bart

