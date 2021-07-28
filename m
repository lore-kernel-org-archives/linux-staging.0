Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F1D70
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 12:00:24 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id g15so2227289wrd.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 05:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cVAGWXk6C/RClkhxJBC2qc8hyZaz+QfRZnXkvbgygas=;
        b=ElZkUGcJJwD7Aa2mRV34LlTvFelQdA333XEOrmYWZPMcj7iUpAEUVcZgerqW02QZIv
         D7u6xaS/dfr5c+SWwNuNeLDpKoasAQz8G5J0cuXDfqAU88VPr1shGX0hvw78ZRfbkqlq
         DTz728iCazAcDN+cmZP5a/QDOIGh+KTFZncG5V06KvlsbtqNsxlcfNmcEZkTSwEHTvlk
         AXWrR3emzZjJ1buD3hPAH4HktVHPwqhOMqPxi8dONbIR0gAiYdkaUbkG1PcShWST9xoX
         w0kd5JFo1MYqlr1mGMdpFHFnUi9AwXArIra5D2Q2QutxIfjGyVM/FD4iH9mUvMRnw0fY
         Afog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVAGWXk6C/RClkhxJBC2qc8hyZaz+QfRZnXkvbgygas=;
        b=JM3W5uE6Wbcszp0stguFgzfsDmq/ZcDWeVJ58PHo+6cfFzd6+l8a4uAMwFirfJZmW+
         SOnT5m+b4WIXoUUTEw7m8VtWmfa+mf2+A0j3CwiZ/pVi+0sj9wrIgS2O17fymki1NiYK
         pTJ71fNzHUGkAxpP0rN72Tv953S5vHZZcAQfL1T0L8aVhOKMfZBOnUsFmS2SK9htICsq
         1LbeQr6rO9krL0YWep2yGnvNckW7CB0Yc03Qz2RQjv9X4M0gNx3KIB0q3myEs86yw+IY
         ezgxHeMqOBjMsh0bnoDqxpDxPkkwlvvJauGwmU7w6aa0aeYB+qaHDEhw3DjI8ab9slta
         EBng==
X-Gm-Message-State: AOAM5311uorGr13ryG1b1eiJ0pNePpK41FtJsaevSeH3PG4n1vvne2te
	RWicXm8cI1r3EjiLmzCz8zI=
X-Google-Smtp-Source: ABdhPJwafNQZVd1Gwz3myc+7Vx0WTbCDQuQXyXHGgpvrzw8HDEpiOTh5dRVAeEvqlgvQ7KhAojQi6w==
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr30345956wrw.131.1627473622800;
        Wed, 28 Jul 2021 05:00:22 -0700 (PDT)
Received: from localhost.localdomain (host-79-26-32-124.retail.telecomitalia.it. [79.26.32.124])
        by smtp.gmail.com with ESMTPSA id n5sm6354930wri.31.2021.07.28.05.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 05:00:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Suren Baghdasaryan <surenb@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <christian@brauner.io>, Hridya Valsaraju <hridya@google.com>, LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: android: Remove set but unused variable in ashmem.c
Date: Wed, 28 Jul 2021 14:00:19 +0200
Message-ID: <4425350.seJdf4cM5h@localhost.localdomain>
In-Reply-To: <20210726134454.GJ1931@kadam>
References: <20210723200514.10139-1-fmdefrancesco@gmail.com> <13453441.4PhDYAFLLM@localhost.localdomain> <20210726134454.GJ1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello Dan,

On Monday, July 26, 2021 3:44:54 PM CEST Dan Carpenter wrote:
> On Sat, Jul 24, 2021 at 09:49:35AM +0200, Fabio M. De Francesco wrote:
> >
> > [...]
> >
> Another trick which would have helped is to try find out which patch
> forgot to remove the "inode" variable, because that developer would have
> seen the warning as well.
> 
> > > I'm guessing you are building with CONFIG_LOCKDEP=n.
> > 
> > Actually my .config sets CONFIG_LOCKDEP_SUPPORT=y. Did you refer to this?
> > There is no CONFIG_LOCKDEP in the file.
> 
> Use make nconfig and then use f8 to search for CONFIG_LOCKDEP.
> 
> regards,
> dan carpenter

Thanks a lot. As always, you've been very helpful. I appreciate your 
willingness to help and, more generally, your attitude towards people with 
less experience than yours.

By using F8, I found that CONFIG_LOCKDEP is selected by CONFIG_LOCK_STAT (in 
logical AND with other options) but, in my .config, the latter was set to 'n'. 
After setting this other option to 'y', CONFIG_LOCKDEP magically :) appeared  
in .config and it was automatically set to 'y'.

I see that the same kind of search can also be done by using the slash if one 
uses "make menuconfig".

Regards,

Fabio



