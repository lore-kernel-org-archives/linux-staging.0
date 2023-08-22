Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F51EA8
	for <linux-staging@lists.linux.dev>; Tue, 22 Aug 2023 06:58:25 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-529fb2c6583so3126381a12.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Aug 2023 23:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692687503; x=1693292303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WpY3mT4gPNi0x9DNid0qCTIl8PLMjBEcgZhvabeaJIk=;
        b=JXY5GTuEfKoxugi8M+idvv/SwbgMv5U6RshJ1oDOx4sui9zwHf6mdSCtTYulfFQle2
         VXoqU0LMk3AjIZ9FToRFFjrUxYJveNMpQO30YvaWYnnc36rf63Wa5S1wCRjGoC6laPNk
         oNztAZ4HjnN6tg7tdVphmK0+lsG3pdWhGauVYenzmDq3jOyq5X0g7sxOTwbjaNvi+j7e
         Lxo4MgEiDbQPGRG++ivVOR4w9jOSiq2qAW72f85JaQEf5XkkQLqnmagR7phJX08Atoy5
         2oqHpxK/NW7hg0qikxE98OCJ9U/thYylEaHzGz2Iba93oUwJTr8SdCMNMw3KWKZ9/LNt
         iajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692687503; x=1693292303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpY3mT4gPNi0x9DNid0qCTIl8PLMjBEcgZhvabeaJIk=;
        b=a6pLYU4hkOPN1FDGnur2QjjyZgnrlXck/Knm8piPzmQOfPpiiFKATrFV5bZApEdNwQ
         x6MNDqJMbkJsiG4Cr1K3LfOn5u56WbcpPe5JXxe28PcMVsLLEzqTVGy1A0cCkAyy0U4h
         Ov9/v5qznMRz7NqyYJ6DRlyTTTmIdMII+uBz0vK+E0kRc+fRHsAoiJrprDStV5RnQbat
         gmzcUzIrcFXolU/EK4rs7I9xXL+CpH22OjYof5NZWbTNcEidJFxFHblhwRFiBREXPy9u
         JUGFj3JTCCfpZKCLIbT1Ilkkn/tH1tX2NWXxoAzFhjOUdrml4itjrWxMj8zup8GvzCKC
         JNMA==
X-Gm-Message-State: AOJu0YwtAYys/F0eieolztxqRSwvwCa6xLZCrIT8TFMIBUifFkCFZyyn
	YJ6eOjRv3XYrpFU95HGkOXg=
X-Google-Smtp-Source: AGHT+IGuEOSIxJQs3JIm+Z0QYFbbU4kDBe0FAshlIOtYDUdaHm4IDyylH/LAC05Wexapi/zHuZqLvg==
X-Received: by 2002:a17:906:74cf:b0:992:9ea0:2317 with SMTP id z15-20020a17090674cf00b009929ea02317mr7370017ejl.61.1692687503159;
        Mon, 21 Aug 2023 23:58:23 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id j15-20020a170906430f00b0099bc8bd9066sm7680700ejm.150.2023.08.21.23.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 23:58:22 -0700 (PDT)
Date: Tue, 22 Aug 2023 08:58:21 +0200
From: Nam Cao <namcaov@gmail.com>
To: Rohit Chavan <roheetchavan@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix alignment of open parenthesis
Message-ID: <ZORcjUIrKYW/r0ne@nam-dell>
References: <20230822043426.1966-1-roheetchavan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822043426.1966-1-roheetchavan@gmail.com>

On Tue, Aug 22, 2023 at 10:04:26AM +0530, Rohit Chavan wrote:
> Fixed all CHECK: Alignment should match open parenthesis
> as reported by checkpatch to adhere to the Linux kernel
> coding-style guidelines.
> 
> Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 727b956aa231..d0ca82a755e4 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -381,7 +381,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		 */
>  		mutex_lock(&fifo->read_lock);
>  		ret = wait_event_interruptible_timeout(fifo->read_queue,
> -			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> +						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
>  			read_timeout);

This "read_timeout" should have the same indentation as the line above.

> 
>  		if (ret <= 0) {
> @@ -522,7 +522,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		 */
>  		mutex_lock(&fifo->write_lock);
>  		ret = wait_event_interruptible_timeout(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
> +						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
>  				 >= words_to_write,
>  			write_timeout);

Also here, this looks very ugly after your change :(

Best regards,
Nam
