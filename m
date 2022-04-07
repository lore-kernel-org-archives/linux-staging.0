Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF220F5
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 07:22:11 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ot30so8864502ejb.12
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 00:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vwGQPeLGONcDmqJfPIeESPpipQ500aFLCZgIRy5zqZ0=;
        b=cGpUq0EaSPKZUmC5xLx1Jzohz8q2BA0SCfgkM8wrethxxkDt/+g2N32fYAJT3XYV7c
         gQbz6QMaUUd43OLUA3Qr9ybm972y3GG09XSDuFu30DSIEbHhMHSFAgUidWPsz8GrgGeW
         s7tbaW4vOsf45FRd0naJvDCrCyKtKsWV4L7c0X8uFXIFfWJcIPONICfRuDmKWStRxSCw
         O51niQQXIBWe/kqVxIekXIQ/hHMRE3f0A3lQ3oU7dB+SGmXs9PVY3nPhJ24PTFgfotQd
         B8VGD/Fzr7+dIrGtF2FRhhrKgQ9sbMeozCRly8MMFIdcZp6QMqHRMmi7EmTJnuHLjSxB
         q5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vwGQPeLGONcDmqJfPIeESPpipQ500aFLCZgIRy5zqZ0=;
        b=u00/L3TrVSnuYDIT9cYYHeDyAF+SS2YYMqQo7fvWXSZW31Bl2fzj2DOFEcnN04kOBe
         e8HR2SOwEBIi9DMWXkZO7VNyb5ws6bFmiQRcaid1j2uHAdUe+LZvG+yv0CyxC7kP9vnj
         vRe/0wj78WQQfOaMbVblBKh/SkPCMf4NS0LtHavjXvkCrGhfknCoCInRvflrMUIsWtHl
         7DoVmWaMxuhfC2Be9RifXzlrmsLLRHwwmZ7c1Vy+D2mwX2iOoQmxWu5DWXicfvxf0b8y
         Q41SJMOs0ERPSy+rsd0BSkTQtpMkwzBeSBud5joojJD2Ztjf2/C0DxY/NYCjPtbxTT/2
         ZkcQ==
X-Gm-Message-State: AOAM531Go6JVFvSiXzIlEL0TVx9EfIL89R0W9J/qf7zmIuNYr8dr0Ql9
	LpZhnOZu4XoiYjglDwhVLXA92KieseaAuZg9Zcw=
X-Google-Smtp-Source: ABdhPJzQRq8/eIccgTS4Y7+Q3Go4ejR4ddyxfTtgPRrDE8QiY00n90m58Se3srjqqXXHUSIg52T71GhZZnCQSkeWe4o=
X-Received: by 2002:a17:907:8a26:b0:6e1:2646:ef23 with SMTP id
 sc38-20020a1709078a2600b006e12646ef23mr12386094ejc.109.1649316129522; Thu, 07
 Apr 2022 00:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1649310812.git.duoming@zju.edu.cn> <9ca3ab0b40c875b6019f32f031c68a1ae80dd73a.1649310812.git.duoming@zju.edu.cn>
In-Reply-To: <9ca3ab0b40c875b6019f32f031c68a1ae80dd73a.1649310812.git.duoming@zju.edu.cn>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 7 Apr 2022 00:21:58 -0700
Message-ID: <CAMo8BfLG_u2z2HwY9Qo6cFgNoSrrz2mS2iD+rtj-uyrKhZYmLw@mail.gmail.com>
Subject: Re: [PATCH 11/11] arch: xtensa: platforms: Fix deadlock in rs_close()
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, Chris Zankel <chris@zankel.net>, 
	mustafa.ismail@intel.com, shiraz.saleem@intel.com, jgg@ziepe.ca, 
	wg@grandegger.com, mkl@pengutronix.de, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, 
	jes@trained-monkey.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, alexander.deucher@amd.com, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-rdma@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-hippi@sunsite.dk, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Duoming,

On Wed, Apr 6, 2022 at 11:38 PM Duoming Zhou <duoming@zju.edu.cn> wrote:
>
> There is a deadlock in rs_close(), which is shown
> below:
>
>    (Thread 1)              |      (Thread 2)
>                            | rs_open()
> rs_close()                 |  mod_timer()
>  spin_lock_bh() //(1)      |  (wait a time)
>  ...                       | rs_poll()
>  del_timer_sync()          |  spin_lock() //(2)
>  (wait timer to stop)      |  ...
>
> We hold timer_lock in position (1) of thread 1 and
> use del_timer_sync() to wait timer to stop, but timer handler
> also need timer_lock in position (2) of thread 2.
> As a result, rs_close() will block forever.

I agree with this.

> This patch extracts del_timer_sync() from the protection of
> spin_lock_bh(), which could let timer handler to obtain
> the needed lock.

Looking at the timer_lock I don't really understand what it protects.
It looks like it is not needed at all.

Also, I see that rs_poll rewinds the timer regardless of whether del_timer_sync
was called or not, which violates del_timer_sync requirements.

> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>  arch/xtensa/platforms/iss/console.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/xtensa/platforms/iss/console.c b/arch/xtensa/platforms/iss/console.c
> index 81d7c7e8f7e..d431b61ae3c 100644
> --- a/arch/xtensa/platforms/iss/console.c
> +++ b/arch/xtensa/platforms/iss/console.c
> @@ -51,8 +51,10 @@ static int rs_open(struct tty_struct *tty, struct file * filp)
>  static void rs_close(struct tty_struct *tty, struct file * filp)
>  {
>         spin_lock_bh(&timer_lock);
> -       if (tty->count == 1)
> +       if (tty->count == 1) {
> +               spin_unlock_bh(&timer_lock);
>                 del_timer_sync(&serial_timer);
> +       }
>         spin_unlock_bh(&timer_lock);

Now in case tty->count == 1 the timer_lock would be unlocked twice.

-- 
Thanks.
-- Max
