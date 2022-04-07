Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D066B20F5
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 07:02:09 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id x24so308492edl.2
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 00:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=46G4DElr2lTCJKQvU2NBw5+Ku6Z9RIMMPeVF6jkEn4U=;
        b=DAvVXnPn7alc7k8NLAtGjN29x/f0AMIdjWrUlN3pR3IFNwWJPGyhzvu70N0tgYTpWM
         QSbqa6UJPukeJoRPY7v5Q3IbsI4DkL+tvDtycSH1Tl4N2LU6G3rjn6WdrSEGxmm7r2aW
         nOtan0sO0xXM760XZwJIul9DqnVfx0S3Tqx4ounYcxDsvyehaP2APdk6nd9MmMkBXOBl
         AOTaSzFrix663S1/qTRbB8oMDrqM7ZwDqHyoihi+2rG/YCFQOEw2wqLeQvxVU5xVS9ci
         AP4QvrsBDehAwIrG7ABJxLuoFm/NT/XRrS5Nu+3nM4k3DRR03rI2XNbAW85flCaNI6Md
         BhFA==
X-Gm-Message-State: AOAM533GMh8G0b3hIR5LGaIDn4KNZcKi2ldxhmDv08RA2wtCY/uHQpyC
	bj06EXdY41tHMAV/1WKARy0=
X-Google-Smtp-Source: ABdhPJyVCanP2uW7lJxkIPHF3GlJ1OHZfNBFV6sC53moBL0MR5YRphUv/uvWzQu3TDqz1ql0BUTMLw==
X-Received: by 2002:a05:6402:5243:b0:419:52a1:a743 with SMTP id t3-20020a056402524300b0041952a1a743mr12778753edd.269.1649314927858;
        Thu, 07 Apr 2022 00:02:07 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id q3-20020a50da83000000b0041cdd6e92b1sm3870276edj.27.2022.04.07.00.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 00:02:07 -0700 (PDT)
Message-ID: <656ffd1d-e7cf-d2c0-e0e6-c10215ba422b@kernel.org>
Date: Thu, 7 Apr 2022 09:02:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 01/11] drivers: tty: serial: Fix deadlock in
 sa1100_set_termios()
Content-Language: en-US
To: Duoming Zhou <duoming@zju.edu.cn>, linux-kernel@vger.kernel.org
Cc: chris@zankel.net, jcmvbkbc@gmail.com, mustafa.ismail@intel.com,
 shiraz.saleem@intel.com, jgg@ziepe.ca, wg@grandegger.com,
 mkl@pengutronix.de, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 jes@trained-monkey.org, gregkh@linuxfoundation.org,
 alexander.deucher@amd.com, linux-xtensa@linux-xtensa.org,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-hippi@sunsite.dk,
 linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>
References: <cover.1649310812.git.duoming@zju.edu.cn>
 <e82ff9358d4ef90a7e9f624534d6d54fc193467f.1649310812.git.duoming@zju.edu.cn>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <e82ff9358d4ef90a7e9f624534d6d54fc193467f.1649310812.git.duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07. 04. 22, 8:33, Duoming Zhou wrote:
> There is a deadlock in sa1100_set_termios(), which is shown
> below:
> 
>     (Thread 1)              |      (Thread 2)
>                             | sa1100_enable_ms()
> sa1100_set_termios()       |  mod_timer()
>   spin_lock_irqsave() //(1) |  (wait a time)
>   ...                       | sa1100_timeout()
>   del_timer_sync()          |  spin_lock_irqsave() //(2)
>   (wait timer to stop)      |  ...
> 
> We hold sport->port.lock in position (1) of thread 1 and
> use del_timer_sync() to wait timer to stop, but timer handler
> also need sport->port.lock in position (2) of thread 2. As a result,
> sa1100_set_termios() will block forever.
> 
> This patch extracts del_timer_sync() from the protection of
> spin_lock_irqsave(), which could let timer handler to obtain
> the needed lock.
> 
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>   drivers/tty/serial/sa1100.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/tty/serial/sa1100.c b/drivers/tty/serial/sa1100.c
> index 5fe6cccfc1a..3a5f12ced0b 100644
> --- a/drivers/tty/serial/sa1100.c
> +++ b/drivers/tty/serial/sa1100.c
> @@ -476,7 +476,9 @@ sa1100_set_termios(struct uart_port *port, struct ktermios *termios,
>   				UTSR1_TO_SM(UTSR1_ROR);
>   	}
>   
> +	spin_unlock_irqrestore(&sport->port.lock, flags);

Unlocking the lock at this point doesn't look safe at all. Maybe moving 
the timer deletion before the lock? There is no current maintainer to 
ask. Most of the driver originates from rmk. Ccing him just in case.

FWIW the lock was moved by this commit around linux 2.5.55 (from 
full-history-linux [1])
commit f38aef3e62c26a33ea360a86fde9b27e183a3748
Author: Russell King <rmk@flint.arm.linux.org.uk>
Date:   Fri Jan 3 15:42:09 2003 +0000

     [SERIAL] Convert change_speed() to settermios()

[1] 
https://archive.org/download/git-history-of-linux/full-history-linux.git.tar

>   	del_timer_sync(&sport->timer);
> +	spin_lock_irqsave(&sport->port.lock, flags);
>   
>   	/*
>   	 * Update the per-port timeout.

thanks,
-- 
js
suse labs
