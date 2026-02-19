Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F697262808
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521451; cv=pass; b=Kl3EV9cgRYULqNmxgqrdst8oPX4wM5hPikSEuoubN1bG7RzoE4g/6JiuLrCRm58F3LAbExf9zYkTq4o0HoiE+T9l3rRpZ+GYDK5UyQJPGnNW068g01/PeYPxqVtDFvKn40BThHPawUwvQBPeQitjBXdvk+luJP4WKO0oDe7H9Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521451; c=relaxed/simple;
	bh=8s7zqn+JKR5OYoKOoaTPQWs8K5lNLxKEgdGO9RiCybo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZldFA00/dHWwOI7Ef71pJ5jJK/k57eJzvEi8Cb5qK3ayIdcAlKHcVw0FDWAjWYbCiPopiknfgDHsElpOJw+NqF2kbALQAKf4rMJP43xjRR83xji/LA5kCnRhjHrtKItMm7Y0chXE6dfpsbNuN0imc8vfmRa2mtRNPD+S91NSnmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F50LCwVm; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F50LCwVm"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89503a3bb83so8855796d6.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771521448; cv=none;
        d=google.com; s=arc-20240605;
        b=MZBjShJL9GQ6nJIDBee+On72/itW/fI4nei04q3hvplY0J0d2R35hNK8mKa+hpX5F9
         n66CDI6BllkS5Mx/aSr7HbzwxlWpRczdBfwV5I+szPmJsFuTpMMQ3AMiQgRxmOCQ39kV
         gMJFpcJAdZKLOJBivA1MbPCdNJTouW11hcHhJOM1gn3zid5RrT2QKRUmyWuTd6hmgGHn
         kYnt4p1Xke1WqgCkS0ryndscZVZOtOQO4O3e72OE1sdcCjlGDJgG5CeIIn0zGgZPBbtq
         Z4ogQ43d42a0pBei5z1hOIGMRwP/PAraaaOSPFjwW+tN1yNr7FMe0Hg40RBRJ1q75U7k
         6Z2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S5w/msoFDa9orh2H96VLrf36iiFdGsvKYnvJC5OxIJw=;
        fh=UZ7au4nGb/rfwSZvnXot57GcTt+28NQ7Yy+7DjcW6CU=;
        b=RtPvIMybggGRNOhYUY2LYzE8/frOoQG5uwYPlfKnjrR3oFEuLBAw2jD5C8FMzruE8w
         NCN+zk8FXMR5+KKn66hiAU+HYG9ZNRNMlTxu7FdCraem027axMGbwLYP+9VuS8u/WWB9
         RlrLlafAN6ozhlcBRV7XiuivsA0tSrwFBUUYye9AJwmKSNaqnCWNtqTkv8fAxamvBOO4
         1JSHUk4abR6Dr7EUexNtOqpdMVNYZJZOkNMN2Y4SYi1uj3+fqggUCEI87VWvUnBIjazD
         3WV5ObfINSxAVOXoNRNgfzyJJE/j1uQQvUEkITcHhdkZVkdFfoJmRruVSy5kwuasJCsN
         vSTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521448; x=1772126248; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S5w/msoFDa9orh2H96VLrf36iiFdGsvKYnvJC5OxIJw=;
        b=F50LCwVm8JmPeB2wZl2ussImN0Stx6i6h1405TgWViPwAN0YIGxOlLJfLlfmLcGTyQ
         +TlWfTDtyDt432CHDZSGbzvsE1mPqRUEV5U7LEWaKUBO5K0uIWrzLZhpT39eu1NSqyeE
         vrZrtu6cWHIrMppt4eTP79SBARIs1IfymtPsEJluzsDSoCyvMcogrb1n9pg1xta5Vswr
         9w4ORi1oRAuOfK8hpPa8fGl6BIeuZgkqZe67mOq1iStHUKu0cBOOy7IEDviWkbx5Uh9Z
         vts0BMsDaRCZdYKvKL+CUwkkstjgT4yCx4Qah5YZY/vsB46fIe+z3mnNpm1GF9O+Bn8f
         IaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521448; x=1772126248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5w/msoFDa9orh2H96VLrf36iiFdGsvKYnvJC5OxIJw=;
        b=jZksYxWVfLRuohP4yDsF7MtTVvPNkcYCSahNSsl5y1Ly4T2qaIXwLFF7yJi7qkv18s
         X0IJhslUGulmdqXmP5rbidb3AjiDDJEIt/RS+A0S8QP9Iz8hmYP5mu4JfUB9ab4onPHJ
         gRuzVqncxL3EigDzJ4jr4r9yzB47vA3PVzBXIJpsipH94HZLhRzWSrPzOL6/8HuO1xqZ
         QrXyuHtOiJkuyHQToIsNg9RNrJtaumgY5/mcZ3vOqROggXwxQeUTJ6k7WnKJUc1szw05
         dG1H0DuPlTFJNUhbtUFoyJZFWDFsFUL1mCVMjkyz+wt06LoouKlumE6/J147ljegdGDZ
         6bGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXZU4E/DqualZxldE2pu1Wzwc+KscwHSvCtPMiugw4td0LIw6troGKb/gTpqrUMqV8QjFz/FHyrrn8TZQv@lists.linux.dev
X-Gm-Message-State: AOJu0YwX09eQLPxYASVylWDtKPELcvTqUFe2v0ALvl3cN3qVN5GoEGmc
	eq+G3Yji6QUzrDJ2N06j+tlZiFdFFql/bKwfBoP1nSv/OXulDPQ1COgj0v2BW1RbLqRFeiatgAL
	IL1YvOx3moTperud1k5UitbMmppBMxms=
X-Gm-Gg: AZuq6aJrdwMxkbdp8DpN9MX0R/sFFGrPw+cFTtQ83u2OdznAtJ66It1ZqXK7ewL13Oo
	v/CqgiyLidzBl26SZ/CMDRdMufed8dVzUPXT2PtAllf3OnTlYzo784g5LQKfJqVF9KOuwSmd5ym
	Rv3wUeC9wbukEY3PofYcfN++Q3+6jXtsMnBdsvAECkC91odS7oyymWBuKRxol981HRPyC2Ba26U
	Qcm9sDHHqYs8KgagOPm0m8VvyJ9U2qKYdAk4p3yqvgnH2uzD6rQll6XlDQhVEFDxEDEMP2DWMSm
	K1w3fEZ3Fg==
X-Received: by 2002:a05:6214:27eb:b0:896:f6d5:c73c with SMTP id
 6a1803df08f44-899580a8bcbmr89613496d6.41.1771521447631; Thu, 19 Feb 2026
 09:17:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260219171310.118170-1-aha310510@gmail.com> <20260219171310.118170-16-aha310510@gmail.com>
In-Reply-To: <20260219171310.118170-16-aha310510@gmail.com>
From: Jeongjun Park <aha310510@gmail.com>
Date: Fri, 20 Feb 2026 02:17:18 +0900
X-Gm-Features: AaiRm529edBYEh1GUJI3ts8-SzVmsBmd3V91rJtHn___pgs9QXwHrjAbeawXVSs
Message-ID: <CAO9qdTGZVdkug1kn0goW8Uwro95P+_jLW3MBxxp04bxgq=SsCA@mail.gmail.com>
Subject: Re: [PATCH 5.10.y 15/15] timers: Fix NULL function pointer race in timer_shutdown_sync()
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, Julia.Lawall@inria.fr, 
	akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, 
	peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, 
	viresh.kumar@linaro.org, zouyipeng@huawei.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Jeongjun Park <aha310510@gmail.com> wrote:
>
> From: Yipeng Zou <zouyipeng@huawei.com>
>
> [ Upstream commit 20739af07383e6eb1ec59dcd70b72ebfa9ac362c ]
>
> There is a race condition between timer_shutdown_sync() and timer
> expiration that can lead to hitting a WARN_ON in expire_timers().
>
> The issue occurs when timer_shutdown_sync() clears the timer function
> to NULL while the timer is still running on another CPU. The race
> scenario looks like this:
>
> CPU0                                    CPU1
>                                         <SOFTIRQ>
>                                         lock_timer_base()
>                                         expire_timers()
>                                         base->running_timer = timer;
>                                         unlock_timer_base()
>                                         [call_timer_fn enter]
>                                         mod_timer()
>                                         ...
> timer_shutdown_sync()
> lock_timer_base()
> // For now, will not detach the timer but only clear its function to NULL
> if (base->running_timer != timer)
>         ret = detach_if_pending(timer, base, true);
> if (shutdown)
>         timer->function = NULL;
> unlock_timer_base()
>                                         [call_timer_fn exit]
>                                         lock_timer_base()
>                                         base->running_timer = NULL;
>                                         unlock_timer_base()
>                                         ...
>                                         // Now timer is pending while its function set to NULL.
>                                         // next timer trigger
>                                         <SOFTIRQ>
>                                         expire_timers()
>                                         WARN_ON_ONCE(!fn) // hit
>                                         ...
> lock_timer_base()
> // Now timer will detach
> if (base->running_timer != timer)
>         ret = detach_if_pending(timer, base, true);
> if (shutdown)
>         timer->function = NULL;
> unlock_timer_base()
>
> The problem is that timer_shutdown_sync() clears the timer function
> regardless of whether the timer is currently running. This can leave a
> pending timer with a NULL function pointer, which triggers the
> WARN_ON_ONCE(!fn) check in expire_timers().
>
> Fix this by only clearing the timer function when actually detaching the
> timer. If the timer is running, leave the function pointer intact, which is
> safe because the timer will be properly detached when it finishes running.
>
> Fixes: 0cc04e80458a ("timers: Add shutdown mechanism to the internal functions")
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: stable@vger.kernel.org
> Link: https://patch.msgid.link/20251122093942.301559-1-zouyipeng@huawei.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Signed-off-by: Jeongjun Park <aha310510@gmail.com>

> ---
>  kernel/time/timer.c |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> --- a/kernel/time/timer.c
> +++ b/kernel/time/timer.c
> @@ -1360,10 +1360,11 @@ static int __try_to_del_timer_sync(struc
>
>         base = lock_timer_base(timer, &flags);
>
> -       if (base->running_timer != timer)
> +       if (base->running_timer != timer) {
>                 ret = detach_if_pending(timer, base, true);
> -       if (shutdown)
> -               timer->function = NULL;
> +               if (shutdown)
> +                       timer->function = NULL;
> +       }
>
>         raw_spin_unlock_irqrestore(&base->lock, flags);
>
> --
