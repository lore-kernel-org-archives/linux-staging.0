Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21EF72
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:48:06 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id g25so35146038wrb.2
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VemNr59oeExyJMlI/fohSHUiHaPcBF5eF3WpdYswakk=;
        b=M9IJbA0mOpSB48bAdJievp/E3liC+59Nwq/hRNPPXENDITFPuot+VH1kNog7eOII3o
         vfGwgQa1SrHHPVzLn7SgQ2ElwiWKQF/O/Iw5/VNQ6qKs3pEnW+JNyKwMIRJPOdzHfbVb
         rdnAUpOTZGqYTIxg5Wu1k7BrDnHJKOA88NO+S6meyD0PFL3/3KllBKcSbHsGFaatlJLY
         IFvdR+HP4cdwzq4UGZwivPyF5XNPH9ZvLdQl0k75I4QLdhIMjrzuvvMpaPUXHJEd7j60
         4BpC7Lm5dh1dxi4YczI3aKXbUD7geame1JaBChDhlOmItNk5KHun8nLnyzcVbHvUrC42
         zC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VemNr59oeExyJMlI/fohSHUiHaPcBF5eF3WpdYswakk=;
        b=sjCBDx7Pw4b8egSwlRBZO9/+FNoEaVd99240f7zTq1LL/g36yA0cEOaKIpaeayLfJ9
         7nVg8loWoa9cbA2KBB8emsq5EgwN4phEYnv+hYNfQBbUGjHWeQGgKiOe+dU4VOxT0Sz6
         XBzBUUfqlDxNoY8URO6BoHHzR3i2Y42n0dj7Sd60DmtmhnwwINeLLNBr2b9n+XkLArPu
         wODqj3F7RCPxR8qi5kgEsKkhUoCjTwalT6ds6HNvQfJScih58X4XKTMHD2oLQn6K7ZkD
         cxRwMRwEO8QG31MMJFMMX6aUn1b+FZ8KXZySlZpCQIkMhk3YnGNtHMmB2gRD59b0Qtsp
         8frg==
X-Gm-Message-State: AOAM5318EqA9I/5xTl5IM55GMq2uLn9ShZNslcbIyXhN4xAuBT7/1Fyp
	Vsc+vZzl5oCp3209BuR/DNUosw==
X-Google-Smtp-Source: ABdhPJzhjgHbGfjEBnAo+HUxyGnXmicF9xB0Hdq/zXOQ0Wiy1Jb9RQcq1ZPeZjOOZVJ1NBNiqnA/qA==
X-Received: by 2002:adf:a40f:: with SMTP id d15mr26831147wra.41.1634464085094;
        Sun, 17 Oct 2021 02:48:05 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id l2sm16216667wmi.1.2021.10.17.02.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 02:48:04 -0700 (PDT)
Date: Sun, 17 Oct 2021 10:48:02 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging: r8188eu: use completions and clean
 rtw_cmd_thread()
Message-ID: <YWvxUg0/5TrVZu8M@equinox>
References: <20211016091042.19614-1-fmdefrancesco@gmail.com>
 <YWrvbPkqer43C+Fk@equinox>
 <3115690.HXPuu0oz9h@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3115690.HXPuu0oz9h@localhost.localdomain>

On Sat, Oct 16, 2021 at 07:54:51PM +0200, Fabio M. De Francesco wrote:
> I guess that Dan will disagree with us :) Did you read his last message?
> 
> I hope that he has time to review these patches. He expressed some doubts 
> about splitting the changes in two separate patches. As far as I know, since 
> Dan is a very experienced engineer (I am not even graduated and everything I 
> know of Computer Science is self-taught), I could have been wrong in doing 
> this work the way I did.
> 

I did read it yes, he makes good points, and my motivation is simply
that the patches look fine as they are to me personally :-)

> > given that one semaphore was there for kthread start/stop and the other
> > for queuing. Looks good to me anyway based on what I know of completion
> > variables :-) I assume you've not made the waits killable or
> > interruptible in patch 1 due to the fact they are specifically related
> > to kthread start/stop?
> 
> Good question! :)
> 
> Let me explain how I chose to make one wait killable and the other 
> uninterruptible.
> 
> As far as I know, waiters may spin or sleep while waiting to acquire a lock  
> (see spinlocks or mutexes for instance) or to be awakened (completions and 
> condition variables for instance).
> 
> These were the cases of sleeping waiters. Sleeping can be done in 
> uninterruptible, interruptible / killable, and timed-out states.
> 
> Where I'm 100% sure that the code doesn't require / want to be interrupted 
> for whatever reason I prefer to use uninterruptible variants (and so I did in 
> 1/3).
> 
> When I'm not sure of the requirement above, I prefer to avoid that the 
> process or the entire system hangs while waiting to acquire a mutex or to be 
> awakened by a complete() (and so on).
> 
> Conversely, using interruptible versions without proper checking of return 
> codes and without proper managing of errors may lead to serious bugs.
> 
> Kernel threads (kthreads) are like user processes / threads and are scheduled 
> the same way the former are. One noteworthy difference is that their mm 
> pointer is NULL (they have not an userspace address spaces). However they are 
> still threads that have a PID in userspace and they can be killed by root.
> 
> This is the output of the "ps -ef" command after "modprobe r8188eu":
> 
> localhost:~ # ps -ef | grep RTW
> root      1726     2  0 19:06 ?        00:00:00 [RTW_CMD_THREAD]
> 
> Since the developers who wrote the original code thought that that thread 
> must be interrupted I thought that restricting interruptions to kills was the 
> wiser choice in 2/3. Conversely, I cannot see reasons to interrupt the core 
> part of a driver, so I chose to use an uninterruptible version of 
> wait_for_completion*() in the other parts of the code.
> 
> I warned you that I'm not an engineer, so please double check my argument :)
> 

Sounds good to me, just wanted to know your reasoning.

> > Anyhow:
> > 
> > For whole series:
> > Acked-by: Phillip Potter <phil@philpotter.co.uk>
> 
> Thanks for you ack. I really appreciated it.
> 

You're welcome :-)

Regards,
Phil
