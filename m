Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15382C9D
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 15:18:43 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b15so14931765edd.7
        for <linux-staging@lists.linux.dev>; Fri, 05 Nov 2021 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i9xZtOveuu4jbIdOFsc814Y2qvvKfwig9WrRvuHTEOg=;
        b=SCeySTUWTEPQV2arwdlJG6fjA0DTyzalIjPTFdI5rwovEvbB3SYHKjYjhVON5o+CmM
         WZptJEKjVuH41de6B4gyZJfNRT5WiRWsRH5/Klx9KihJEiavwd4m5Le155FY3J9dbB9C
         Cj1aVTfbG0x/4Q2ZuQYb6v18Ljg1afv/LCr6WAy4CZN/0s2lR0r1G1q+zjk0vwymJBET
         GTzmSYKPPaKloWlktF+JrOiyRarsJEEUkeGVuLXUL2RUhyMzlAbW+9qHFFCMCXfGG79O
         45Gr1hJyzTDM3uhf66YLPShhcTAsAZMnYIb48V/DOiYt/Td8LhzADGvWPv1pj7P1m0+n
         7sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i9xZtOveuu4jbIdOFsc814Y2qvvKfwig9WrRvuHTEOg=;
        b=1q7y3J+HpyBgdgy94m5o7TR8++vZElHHGbwRdsUVuqXu7Qx0L6AHihRn/jahER+Ruq
         RW+qohIhypDO4p3BuXFBlma1a1xdEeAEkkNIRgkfgSDOEG1zPUzb3xJcdktdoI9MapGy
         eE6D8wjaEe1AENq4uQWE5ryViQJboT9gki/1Twsh1sS3RWCI3OqqKKXAO25kRh7E9T3/
         F8GGyjc2y0lux8pkFDmQyQrUx0y387u5Boiv7z3UtOCmQ/XhhkEJQvA1xDpmEy6I6Qix
         4J6tKqJelkSFcUWXrOgyDZeLnUq0xG/TeF+huJ3eUqrMCdH33q+BEkH0UROcGDcjdHYF
         XK5g==
X-Gm-Message-State: AOAM532GyWqlcK3jvHDG/X/be5cV+6odIZ9+RBYPQs8HEEcG7FaRoomH
	1nk9HeKmh+ccxMegaVJsSz0=
X-Google-Smtp-Source: ABdhPJwAQgvJbA2xcqECODxSkWfim6E2m5qDTQG583ZUpRmlufSeQZraovhAJhNdunWKA7OBC9L9zw==
X-Received: by 2002:a17:906:7044:: with SMTP id r4mr41149163ejj.256.1636125522075;
        Fri, 05 Nov 2021 08:18:42 -0700 (PDT)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id hd15sm4473126ejc.69.2021.11.05.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:18:41 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Fri, 05 Nov 2021 16:18:39 +0100
Message-ID: <3198013.HnMX8GfXRX@localhost.localdomain>
In-Reply-To: <20211105132551.GB2001@kadam>
References: <20211101191847.6749-1-fmdefrancesco@gmail.com> <20211105132551.GB2001@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, November 5, 2021 2:25:52 PM CET Dan Carpenter wrote:
> On Mon, Nov 01, 2021 at 08:18:47PM +0100, Fabio M. De Francesco wrote:
> > Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in
> > report_del_sta_event(). This function is called while holding spinlocks,
> > therefore it is not allowed to sleep. With the GFP_ATOMIC type flag, the
> > allocation is high priority and must not sleep.
> > 
> > This issue is detected by Smatch which emits the following warning:
> > "drivers/staging/r8188eu/core/rtw_mlme_ext.c:6848 report_del_sta_event()
> > warn: sleeping in atomic context".
> > 
> > After the change, the post-commit hook output the following message:
> > "CHECK: Prefer kzalloc(sizeof(*pcmd_obj)...) over
> > kzalloc(sizeof(struct cmd_obj)...)".
> > 
> > According to the above "CHECK", use the preferred style in the first
> > kzalloc().
> > 
> > Fixes: 79f712ea994d ("staging: r8188eu: Remove wrappers for kalloc() and 
kzalloc()")
> 
> This is not the correct Fixes tag.  The original allocation wrappers
> checked in_interrupt() they did not check in_atomic() so they had same
> bug.  The correct tag is:
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for 
RTL8188eu driver")
> 
> regards,
> dan carpenter

Hello Dan,

I'm sorry but I surely missing something, therefore, before making changes I 
need to understand this subject a little better. Let me explain what I am 
missing...

The two kzalloc() in report_del_sta_event() are called while spinlocks are 
held and bottom halves are disabled by spin_lock_bh(). If I remember it 
correctly spin_lock_bh() finally calls __local_bh_disable_ip() to disable 
bottom halves on local CPU before actually acquiring the lock.

This is the code and inline documentation of in_interrupt():

/* in_interrupt() - We're in NMI,IRQ,SoftIRQ context or have BH disabled" */
#define irq_count()	(nmi_count() | hardirq_count() | softirq_count())
#define in_interrupt()		(irq_count())

And this is the code and inline documentation of in_atomic():

"/*
 * Are we running in atomic context?  WARNING: this macro cannot
 * always detect atomic context; in particular, it cannot know about
 * held spinlocks in non-preemptible kernels.  Thus it should not be
 * used in the general case to determine whether sleeping is possible.
 * Do not use in_atomic() in driver code.
 */
#define in_atomic()	(preempt_count() != 0)

To summarize, I think that using in_interrupt() in the old wrappers was the 
wiser choice. Therefore this patch fixes 79f712ea994d ("staging: r8188eu: 
Remove wrappers for kalloc() and kzalloc()").

I know that I have so little experience that I shouldn't even discuss this 
topics. However, I would appreciate if you may explain with some more details 
why in_atomic() should have been preferred over in_interrupt() in the old 
wrappers that were removed with commit 79f712ea994d.

Thank you very much in advance,

Fabio M. De Francesco


