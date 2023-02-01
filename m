Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C657F4
	for <linux-staging@lists.linux.dev>; Wed,  1 Feb 2023 05:06:43 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so480518wmb.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 21:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aICBJrKVWPHeedxD0FVA8WOU0XSPMA5Nridqt13rtlk=;
        b=h4vZW0GhGYie/hJSB99EfkUDdaNWQ2L9Wl0h/Gg04fWaEfzSwCC+i9Nz7pGlXH5fmQ
         A0pPDBEnNzFIckAG0xlcGc0u0ViV/dkZo32NDPqRC/jehUDgHz2zwje0wYDTedmpXtOk
         FiQKb0b4KP86pmde5iS/rO1xqor7e3hSQ4h6bSNK38I1uZGXty6WtQV/1QW7E6/cMJwc
         MNZldPJ9F+qhjo5RYq7dv1LUDOwgYr/XmqDs88seq88rSVF33STO+CfI56ARfUBQWLLJ
         YzddvIQvPVqW6eednLlhLKdpgoCRkZeDfW4rejM50gucZX2B8IHqMUs5k7z1BzUu4t+d
         qH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aICBJrKVWPHeedxD0FVA8WOU0XSPMA5Nridqt13rtlk=;
        b=m6zkiY2RoBlpubmGNihXJeAX8sed2mG9bl1bNXVXZrESsXnhZ6shrEvFQEIndKNE6M
         8KF4gFZ4sggRUeyfhY/1yEbw3SlEuZqBHqsCG+pAFEqdxBrQkx1YkcNy+R7zYKuczNe2
         kOuFRwf4yXh1hp/gThN/LVBLSsodi13DSm5rqOw/iVBTN4nhdxv9hrkizpND2AWEZzRz
         XgvTtuQk3uYRLVGPbPWrLQFNuPAn7HCYEP+1MUlxqp5HsryzAf691cx17fqCOl0xLFqv
         fzORtFvLxtWD9H/WggvFA2QjiytKAt55CQV3WIZcqZdD1Dcn49i+5X2/cGP8EvmGp5Ay
         EROA==
X-Gm-Message-State: AO0yUKXsy1v0zYaNE5K9Mi3JhSp0ntKOWh7XKF489hYUeeJO4xyhZBV1
	Raxym/f9Gs4M5Kfz7QKz98c=
X-Google-Smtp-Source: AK7set/KReGr4XP1Lixp7Q+J0OK/uexI/rucZoin9FOfNPCTOQP/g/RvjPZpLCsHA0uNOBkBpZzqTA==
X-Received: by 2002:a05:600c:4fd2:b0:3dc:523c:22b4 with SMTP id o18-20020a05600c4fd200b003dc523c22b4mr587346wmq.27.1675228001614;
        Tue, 31 Jan 2023 21:06:41 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b003daf6e3bc2fsm1580004wms.1.2023.01.31.21.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 21:06:36 -0800 (PST)
Date: Wed, 1 Feb 2023 08:06:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix NULL check for rcu pointer
Message-ID: <Y9nzV1CSCh3PvDt9@kadam>
References: <20230131090057.241779-1-martin@kaiser.cx>
 <Y9kvF0C1kiDctEUw@kroah.com>
 <20230131171613.mubqpogkk5e6lnrk@viti.kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131171613.mubqpogkk5e6lnrk@viti.kaiser.cx>

On Tue, Jan 31, 2023 at 06:16:13PM +0100, Martin Kaiser wrote:
> Hello Greg and all,
> 
> Thus wrote Greg Kroah-Hartman (gregkh@linuxfoundation.org):
> 
> > On Tue, Jan 31, 2023 at 10:00:57AM +0100, Martin Kaiser wrote:
> > > Fix the NULL check for padapter->pnetdev->rx_handler_data.
> 
> > > The current code calls rcu_dereference while it holds the rcu read lock
> > > and checks the pointer after releasing the lock. An rcu pointer may only be
> > > used between calls to rcu_read_lock and rcu_read_unlock.
> 
> > > Replace the check with rcu_access_pointer. My understanding is that this
> > > function returns the value of the pointer and needs no locking. We can
> > > then check the pointer but we must not dereference it.
> 
> > > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> 
> > What commit id does this fix?
> 
> the code that checks br_port has been around since the driver was
> imported into staging.
> 
> If the patch is considered as a fix, it should have
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")

I don't think it is a fix as we discuss later in the thread.

But if it were then it's still really useful to record that.  I normally
don't record when Fixes are from before the git era because one time,
ten years ago, one person said not to do that.  But really even there I
personally think Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") is useful.

It tells the tools how far to backport things.  It tells us if most of
our bugs come from the very start or if we're introducing them later.

regards,
dan carpenter

