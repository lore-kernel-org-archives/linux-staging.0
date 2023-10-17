Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E30F747E
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 04:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PDlBgXdJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40776b1ff73so29542085e9.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 21:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697516477; x=1698121277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mSCcyJKKhe9oQwQDqf1wV5AdygiSe6A+VMWBZelRBOg=;
        b=PDlBgXdJOuUUWpuSD0GoUlf9H8ewzX1FnGhiMDKESXjBmgDd1vD6RDWs1g5mLNi9V3
         LBUBW+Bllpt8JmEsNTSWNO2036nK4W9xFNkJu7bZoIlrXNnrYp7xaHAcVWUfduAV+yXY
         /7fbIUkuIi9r2gD/Z0xZnBrcWrHb+CdZD6ajg/0TaC+j/ie7297wje8IEOhgeHc4ajwz
         gqBJFPnc6FB1xicW0PYDLl6kY5GX/USKO7eV6yL7CUGYrIM6OgrUH+R+5fCJUG0bm2+M
         DZRmn6PSMkoNfBbHbKW/66t9Fh4WWFPWOOZ+4Symnkq0muS+FEQileGoyKtDcXegYLHY
         6Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697516477; x=1698121277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSCcyJKKhe9oQwQDqf1wV5AdygiSe6A+VMWBZelRBOg=;
        b=Iux6SljEh3PFwnEyEmC8JQOLS19zz/zKgmKIzZtngmT0cQI7+ZowCT7zGi5bplQFNQ
         LutYSU7pozzj8V4BjcxXa63QRDJMxb9z1dG9b3B4rkXoW3zO1HlSvucR+uP80F3DAAVM
         BfFzkDhAYWpJzv9Egxw4yQebnHch782YJJ+hcKJ7WySl+S3gy8n86uOci8UbS7ra5QqC
         VAckdrPTqTu27YEd4zg5lufjSOmeWKCJkKTxXi+WfsUZHefPxe/9zR6UNzjPPujKHZEC
         tC5dzHwIVqO0pXaNOs/RVAxBXOys4zZOwmj4nGUlV6LtZwjH1idtuE3Tq+IYl0mxeXnG
         jIuA==
X-Gm-Message-State: AOJu0YxYWUsCFjvNuTPTjhertEAaYUO4dvFHwbc/dJXndsWlZvyacNzI
	YmnA+g9HfypSHPeLG5EqOQAUdw==
X-Google-Smtp-Source: AGHT+IFXi6U+vu92ahA0dSTkSUF4s/rRSRQ+VtC9Ir5a0Pm9QEmodyk0y5hzOYvsChcxJgVJkeg+wg==
X-Received: by 2002:a05:600c:4744:b0:403:9b7:a720 with SMTP id w4-20020a05600c474400b0040309b7a720mr886510wmo.1.1697516477154;
        Mon, 16 Oct 2023 21:21:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c510b00b00407752f5ab6sm758943wms.6.2023.10.16.21.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 21:21:16 -0700 (PDT)
Date: Tue, 17 Oct 2023 07:21:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Gilbert Adikankwu <gilbertadikankwu@gmail.com>,
	Nam Cao <namcao@linutronix.de>, outreachy@lists.linux.dev,
	manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
	coiby.xu@gmail.com, gregkh@linuxfoundation.org,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Add bool type to qlge_idc_wait()
Message-ID: <32b0e468-6943-431c-9f71-68fc41727914@kadam.mountain>
References: <ZSoxLxs45bIuBrHg@gilbert-PC>
 <20231014065813.mQvFyjWb@linutronix.de>
 <20231014071423.UgDor1v0@linutronix.de>
 <ZSpIPippZFtMw2aG@gilbert-PC>
 <78f321db-bc09-06e8-b4ef-ac56ab91e187@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78f321db-bc09-06e8-b4ef-ac56ab91e187@intel.com>

On Mon, Oct 16, 2023 at 04:19:09PM +0200, Przemek Kitszel wrote:
> On 10/14/23 09:50, Gilbert Adikankwu wrote:
> > On Sat, Oct 14, 2023 at 09:14:23AM +0200, Nam Cao wrote:
> > > On Sat, Oct 14, 2023 at 08:58:13AM +0200, Nam Cao wrote:
> > > > On Sat, Oct 14, 2023 at 07:11:59AM +0100, Gilbert Adikankwu wrote:
> > > > > Reported by checkpatch:
> > > > > 
> > > > > WARNING: else is not generally useful after a break or return
> > > > > 
> > > > 
> > > > What checkpatch is telling you here is that the "else" is redundant and
> > > > can be removed. Although your patch suppresses the warning, it makes the
> > > > code messier :(
> > > 
> > > Ah wait, after reading Julia's comment, I realize that the "else" is not
> > > redundant at all. Seems like checkpatch.pl is lying. So ignore what I
> > > said.
> > 
> > Thanks
> > 
> > 
> 
> Could you consider fixing checkpatch instead?

Parsing C is quite hard and checkpatch is never going to do it well.
It might be fun to start this project but it's kind of doomed.  Doomed
projects can be an educational experience as well.

The way to do it might be to add a new in_else_if variable which tracks
if you are in an else if block.  You would look at the indent level and
try the curly braces.  Then if the previous thing was an else_if silence
the warning.

But also it's fine that checkpatch prints the occasional incorrect
warning because it teaches people to be more careful.

Another thing is that when you introduce a bug, you should always
consider if other people have done that before as well.  Perhaps do
a `git log -p --grep "else is not generally useful"` and see if everyone
else did it correctly and if reviewers caught the mistakes.

regards,
dan carpenter


