Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5CF3FC5
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 14:59:08 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id c22so4716714edn.12
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LUyNTvwye+kPafaOnI2efXLTbx8D91gxZhFPaGgBa+k=;
        b=ain0M3hd5IPb69qG/03ea/REqMNY4Kp9RDkBg6Z4d9hYXfrWI2kFqsARfTjr0wCoVO
         xmiK20FF7bUui0ZXn5Xxw+UqPj514FqfBIP/C7k9nYOSIh0Pk3mjBBD6/6Qk9wRYPutM
         V9S8Au1toYSQCArfKQEEPr6AGJ9CARGPCpGQ5v2r4hV9u/0ddemK1sC4fAjEA+TO58Tx
         OoM/soU5y5zHD4x3xQR5HR4MUgA8l7q75c52k6n5geeUMpZhaC2fYwEboTFZkO6mh4ud
         ebQMAD/WjemqHpAmzaWgrNlecBjzr+EtivaD5VOz/h746n60/iMkQ1X3h2QteI047XTX
         QQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LUyNTvwye+kPafaOnI2efXLTbx8D91gxZhFPaGgBa+k=;
        b=KFZGUcI07y3zabOo9npP3A+4xI2KW1QQo1JGNOlrUGmECUKag0lTLIpbxa1HeM+ymA
         wIs3ahrtjr2tRV7KFy5gHAvln4VKviFfwQHZhEl00IcTqX6PJjlUzDaBOyDxpo+zu1xw
         Rf58V4bSWL6F7/CMEX8KLzK+KKoEzI5aXHyMiFvdoYbPxYFW1G8YZoKzMbJIVuAeTpf4
         TBLWuQXDvftVgvhF1UPqxvvnJT5WyOYty45eJuWDFiFPRf/4gp/pVEMuIVsIY4HEBvjM
         Lg2UoNRlTgx/j/lVhcGfmT4T9Yoebz4GmwdsnKz5gxhhoM/5OgNVoGZUycdwfcaSjrq+
         QAOw==
X-Gm-Message-State: AOAM532Lk2aFxgkVhxs8MHMP2ErW1GXMduusJo/ADaETguEzRIDH5E1y
	P7l8rFN1wD0JmNjTArVfygw=
X-Google-Smtp-Source: ABdhPJxMLnU3ZIJKNIZnhw9R15iaT5x3M37FMGTazy54fNU+vcmFffcZJ/v4fKVjDmfrZl6xoDNOHg==
X-Received: by 2002:a05:6402:42d5:: with SMTP id i21mr490103edc.14.1631717946682;
        Wed, 15 Sep 2021 07:59:06 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id la17sm90688ejb.80.2021.09.15.07.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 07:59:06 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Philip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>
Subject: Re: [PATCH v5 15/19] staging: r8188eu: hal: Clean up usbctrl_vendorreq()
Date: Wed, 15 Sep 2021 16:59:03 +0200
Message-ID: <3504293.VdliR8Xgxp@localhost.localdomain>
In-Reply-To: <20210915135301.GF2088@kadam>
References: <20210915124149.27543-1-fmdefrancesco@gmail.com> <20210915124149.27543-16-fmdefrancesco@gmail.com> <20210915135301.GF2088@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, September 15, 2021 3:53:01 PM CEST Dan Carpenter wrote:
> On Wed, Sep 15, 2021 at 02:41:45PM +0200, Fabio M. De Francesco wrote:
> > Clean up usbctrl_vendoreq () in usb_ops_linux.c. Eventually this function
> > will be deleted but some of the code will be reused later. This cleanup
> > makes code reuse easier.
> >
> Thanks for removing the URL.  This commit message is no longer bad to
> the point where it has to be redone but it's still not great.
> 
> I explicitly told you to leave the irrelevant information out.  I'm
> trying to help you and it's frustrating that you're not listening.  I
> wish that you had just copy and pasted the commit message which I sent.

I'm sorry, seriously. It's hard to listen carefully when I need to do my 
*real* work while trying my best to contribute to the kernel. Sometimes I'm 
so tired that I forget something important or what it is said by reviewers. I 
know that this is not a good excuse, anyway please don't ever think that I 
don't mind of the time you spend on reviews and writing suggestions. 

> This relates the discussion we had about reviewing patches one at a time
> in the order they arrive.  Every patch should be self contained.  It
> should not refer to the past except in the case of explaining the Fixes
> tag and it should not refer to the future except in the case where it
> needs to excuse adding unused infrastructure.  Reviewing is stateless.
> We don't want to know about your plans.
> 
> On the other hand, the commit message doesn't list the changes the
> commit makes as part of the clean up process.  That would have been
> helpful information for me as a reviewer.
> 
> *Sigh*  Whatever...  I would have allowed this commit message but there
> is a bug in the code.
> 
> > +				memcpy(data, io_buf,  len);
> > +		} else {
> > +			/* errors */
> >  			if (status < 0) {
> > -				if (status == (-ESHUTDOWN) || 
status == -ENODEV) {
> > +				if (status == (-ESHUTDOWN || -
ENODEV)) {
> 
> This is a bug so you'll have to redo the patch.

This is the proof of what I was trying to convey with the words above. I 
perfectly knew, since days, that this line is wrong but for some reason that 
I really cannot understand why it's still there.

Thank you very much,

Fabio

> regards,
> dan carpenter
> 




