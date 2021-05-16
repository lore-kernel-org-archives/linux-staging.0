Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F14072
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 16:54:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b7so1679349wmh.5
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uxeHaM6iA6r0czkHIwvkgtNmvE8Z25gc1GPkEYSzWmY=;
        b=fpT0IG2rIPhmZQp0ZX7xHT/LqfFzqmFuKjEyWGOKiQHlaLkc/P9GxdCYOw7zcRB1Ta
         1DmimfIcjjn2Bcvl++Yu3ZDYbbCbVxuGbrCuwbO/9YQas0Xo8cqcchj995yN3b32z071
         b1Nzvw64JvOaMZwTuVrs+xNxlQH0J49H5tZeJakrJe9JXi9GGrseTnRRvHMOM5YF2V01
         gy5jR90WmKfo4C00suIryiFl4hAtSxlyDNpsX59DRgEws30cMDc6wJfZMDyZ2fyJgGXw
         w891iPyiiblaLY3eZhLukWSPspmYhAe/p5zNN7lsQQJwH1Pi22QauzmuhQoA2z3wKj20
         ILdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uxeHaM6iA6r0czkHIwvkgtNmvE8Z25gc1GPkEYSzWmY=;
        b=GbY6U5cuBMWiyHEahsWgevSQuM+Zu9kIXgYa2hc5tDDBaWwRJF15O+ZPWX72GbSL/e
         2Ts4z1jkaBVfnP5QX4Knsgq7RCsQ7OY4yflKXGJL22YwkaNwgdWlDs/Ac8ptZmjAt3/N
         zw84qGLoFvhBnL3ggu0W3C1PELFivspAKcnirMSu9UQXaqL+2l4mrkbzIg/HQqR6a1/7
         1Wz+smmPXjvb6MYpewIlVixs8a0FshRPzAV6QMM7EL4Xaa2ITw8XZFnd12zrwIUqwHjE
         C5DnFDh54/vGueun4eg53z3FVUsPz4iV6rwSY0C8UjqxBJkrVLQ4I8LYbwR9wNM9o46o
         tS8Q==
X-Gm-Message-State: AOAM532hv2jf061hvyREnvhKlrh2edeqn/rRLwk6Fr73hILUKqpJ07o9
	goZq5BZa2xw5YstrAAJoFJM=
X-Google-Smtp-Source: ABdhPJy28DFopJ9EWTYMoi+DfRhZ4tDlUSss8BuaJzJe0l5dW82akHNr4PeqioP4rYdtNORgWgKMNA==
X-Received: by 2002:a05:600c:410a:: with SMTP id j10mr15914314wmi.5.1621184065823;
        Sun, 16 May 2021 09:54:25 -0700 (PDT)
Received: from agape.jhs ([5.171.81.26])
        by smtp.gmail.com with ESMTPSA id i11sm14281654wrq.26.2021.05.16.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:54:25 -0700 (PDT)
Date: Sun, 16 May 2021 18:54:23 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/20] staging: vchiq_core: fix return type of
 vchiq_init_state
Message-ID: <20210516165422.GA1404@agape.jhs>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
 <1621105859-30215-2-git-send-email-stefan.wahren@i2se.com>
 <20210516072722.GA1410@agape.jhs>
 <129774c3-884b-19e2-68ab-b1a8d8763458@i2se.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <129774c3-884b-19e2-68ab-b1a8d8763458@i2se.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, May 16, 2021 at 11:38:10AM +0200, Stefan Wahren wrote:
> Hi Fabio,
> 
> Am 16.05.21 um 09:27 schrieb Fabio Aiuto:
> > Hi Stefan,
> >
> > On Sat, May 15, 2021 at 09:10:40PM +0200, Stefan Wahren wrote:
> >> Recent commit "staging: vchiq_core: drop vchiq_status from vchiq_init_state"
> >> missed to change the return type in the definition. Let's fix this now.
> > if this patch fixes something that a previous commit broke,
> > it's better adding Fixes: tag
> 
> the mentioned commit is still in next, so a Fixes tag doesn't make sense
> to me. Or do i miss something?

ok, recently I've been told to add a Fixes: tag to a patch fixing a
previous not mainlined commit (staging-next).

https://lore.kernel.org/linux-staging/YF3qSsH%2F3vRy7BRy@kroah.com/

but I understand what you mean, let's see :)

> 
> Stefan
> 
> >
> >> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> >> ---
> >>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> >> index ff85327..9b6c626 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> >> @@ -2157,7 +2157,7 @@ vchiq_init_slots(void *mem_base, int mem_size)
> >>  	return slot_zero;
> >>  }
> >>  
> >> -enum vchiq_status
> >> +int
> >>  vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
> >>  {
> >>  	struct vchiq_shared_state *local;
> >> -- 
> >> 2.7.4
> >>
> >>
> > thank you,
> >
> > fabio

thank you,

fabio
