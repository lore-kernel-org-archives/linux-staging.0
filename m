Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BE803
	for <linux-staging@lists.linux.dev>; Fri,  4 Nov 2022 20:42:02 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-13bd19c3b68so6783820fac.7
        for <linux-staging@lists.linux.dev>; Fri, 04 Nov 2022 13:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPWTHAu4vAKpdYGymfUO7xJHpj+KFNZBd9yee/lAZWg=;
        b=lOkZpKJZGrRdTwW1q1n3PYtNavkFYrwxfV2GFvR6YWuaVKwLPk4VJ5U5ZDx0nuSETe
         4J0qx8jESJCo6y+3k5I/RIDeXo7Y6jSgRRXz2DJFkzXiePACdAOetFhkjtL5bcgp83ac
         L9LEH/9+5kOlP36xHlU1S0A9pTTFCmy4MsC6KZRblm7eTmGH17TdH1F+e+pVpfC6YibP
         OD0bbJB9hlpboqehpl8hGHOw6SotGw7ZzxTK+J5+Bkycl7auUJR59DVXhb+Lm2qdFRIM
         WNNsyFThpDNs5XVQPsJWiyibl8FySITsqyv8EbD5o54HP3A3J+dpKDkJeIuzl/+kIUVP
         0S2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPWTHAu4vAKpdYGymfUO7xJHpj+KFNZBd9yee/lAZWg=;
        b=QQuBOOl4dZmVQdlnIGcdOqNZKIIer4PRssvz1YbwTHgO+8wnroV7eWxKidovv2tRtu
         NQZT7nJrifBWfQ9h6gAg8Qczua16FnhzkRUNGZGgnk4ffLI6E8HVpraz57LNVyKR8dFX
         +3xLGt3gSkC+HurPVZ6D+2XW8SsWfp2LW3pr35DvL6EqXS1v//E8S5MW0TciQMK7a39X
         g3qnJVhIFytdKxEQmJGRLBXPJMvIXgmcHVeL/g3PUMsOHMdz0ynppWVkxqUvQRPDX96Q
         +JqlXR5FjggEA+tbPx+psRrgaoxX7b8zrJ+gc/3dEdAqX8z6+4x+r/dXhs091WMRwh2x
         Td7Q==
X-Gm-Message-State: ACrzQf2ELfqMlVssLwW2Eff7HSmWDRlRnbIfsk8fFEnn0Ogo8TIiyjPT
	MRkohT7XWGr8nquq9bAag2s=
X-Google-Smtp-Source: AMsMyM4YoEr7WxXxO25Opwv5nzrxjGmv3HfOq/bk78IdaTMObaueZEnFddqxBoG0u+KT3n0Hv+LaGQ==
X-Received: by 2002:a05:6870:9597:b0:13a:f95a:2bc1 with SMTP id k23-20020a056870959700b0013af95a2bc1mr32722633oao.292.1667594521690;
        Fri, 04 Nov 2022 13:42:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a9-20020a544e09000000b00359ad661d3csm43433oiy.30.2022.11.04.13.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 13:42:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Nov 2022 13:41:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>, rcu@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-edac@vger.kernel.org,
	cgroups@vger.kernel.org, linux-block@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	netdev@vger.kernel.org, linux-pm@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bluetooth@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
	linux-input@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-leds@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
	bridge@lists.linux-foundation.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, lvs-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-nfs@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Subject: Re: [RFC][PATCH v3 00/33] timers: Use timer_shutdown*() before
 freeing timers
Message-ID: <20221104204159.GA506794@roeck-us.net>
References: <20221104054053.431922658@goodmis.org>
 <20221104192232.GA2520396@roeck-us.net>
 <20221104154209.21b26782@rorschach.local.home>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104154209.21b26782@rorschach.local.home>

On Fri, Nov 04, 2022 at 03:42:09PM -0400, Steven Rostedt wrote:
> On Fri, 4 Nov 2022 12:22:32 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > Unfortunately the renaming caused some symbol conflicts.
> > 
> > Global definition: timer_shutdown
> > 
> >   File             Line
> > 0 time.c            93 static inline void timer_shutdown(struct clock_event_device *evt)
> > 1 arm_arch_timer.c 690 static __always_inline int timer_shutdown(const int access,
> > 2 timer-fttmr010.c 105 int (*timer_shutdown)(struct clock_event_device *evt);
> > 3 timer-sp804.c    158 static inline void timer_shutdown(struct clock_event_device *evt)
> > 4 timer.h          239 static inline int timer_shutdown(struct timer_list *timer)
> 
> $ git grep '\btimer_shutdown'
> arch/arm/mach-spear/time.c:static inline void timer_shutdown(struct clock_event_device *evt)
> arch/arm/mach-spear/time.c:     timer_shutdown(evt);
> arch/arm/mach-spear/time.c:     timer_shutdown(evt);
> arch/arm/mach-spear/time.c:     timer_shutdown(evt);
> drivers/clocksource/arm_arch_timer.c:static __always_inline int timer_shutdown(const int access,
> drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_VIRT_ACCESS, clk);
> drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_PHYS_ACCESS, clk);
> drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_MEM_VIRT_ACCESS, clk);
> drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_MEM_PHYS_ACCESS, clk);
> drivers/clocksource/timer-fttmr010.c:   int (*timer_shutdown)(struct clock_event_device *evt);
> drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
> drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
> drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
> drivers/clocksource/timer-fttmr010.c:           fttmr010->timer_shutdown = ast2600_timer_shutdown;
> drivers/clocksource/timer-fttmr010.c:           fttmr010->timer_shutdown = fttmr010_timer_shutdown;
> drivers/clocksource/timer-fttmr010.c:   fttmr010->clkevt.set_state_shutdown = fttmr010->timer_shutdown;
> drivers/clocksource/timer-fttmr010.c:   fttmr010->clkevt.tick_resume = fttmr010->timer_shutdown;
> drivers/clocksource/timer-sp804.c:static inline void timer_shutdown(struct clock_event_device *evt)
> drivers/clocksource/timer-sp804.c:      timer_shutdown(evt);
> drivers/clocksource/timer-sp804.c:      timer_shutdown(evt);
> 
> Honestly, I think these need to be renamed, as "timer_shutdown()"
> should be specific to the timer code, and not individual timers.

Yes, that is what I did locally. I am repeating my test now with that
change made.

Guenter
