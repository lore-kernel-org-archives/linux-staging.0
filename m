Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087843FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 13:19:35 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id v16so9159802ilg.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vF5L7GXRUK29LXMTYRG6W7BkE3rRpiH/vOLwx+ir5w4=;
        b=rBmEJnqkXzS41M6QNEd5U6BFmT2ADhSPFtA/aqR/0hSd99MmexWWeb3DwdZKukJzlF
         gNrsslLy6bpsbDJA/GveRZoLSFc6eruRHDg4HKEPDgb/rLDY48dgOYdTg7nCsFXDgrZB
         6bR7YAcjNUrpPmGBP+ZOf2b8Lu8uOmiPANWB6wY1Sy5CxPZZdQhHi85pwwEYnAM9ZOwv
         TEQW1NKjdP3qQFmbfMyhvh7wBJoW2D/pKK+WtXvkxnMNbonOf3Z0p0H+N65Ci6ByuR36
         N8xdsyZJKiml3CyyHgv5vGVuNGe5OKNF3gcyLqH1gKHmIZXV6VI8iqXkFF/fZFe+mkNo
         IGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vF5L7GXRUK29LXMTYRG6W7BkE3rRpiH/vOLwx+ir5w4=;
        b=JjYhFBmuJ7Z8cTxSh/moa6HAwZQgelLo6gtSzExtFoaRpQL7Dw9ABctB6KLpcHuQ9L
         6uW+7DBr1ULJ+COkuBk1IsaC82yMXJSw2Xmv60WDZ1ge/U6xLf3ertU4vrRl8PUK1m/O
         aMBA6Xn16R7kfRJLdHQpxyfZRbxrLFgXqaB+qGNXPao6Wugx7EBUPSPMKfVh0QKDsS3r
         Q4GcN4pehetRTv7TKHMgOuldIRnNQEAYDl+drT2NzCkn1+91wJ9iA1zPPbnxubNw5s9t
         Gc2L2n9VoRyNtRc7NjpV5AakR8fk72HPbgqr7K10uAsTHuqo7KHmorGiSaJt3pkDsDYL
         A1IQ==
X-Gm-Message-State: AOAM532PdNe9GpXxw9/MeL+7kQ2awgBBqRSBHTKJXVA+QfPu9M8chuv0
	fbTXNr3ESZ70ZpeQFFnmba0oSA==
X-Google-Smtp-Source: ABdhPJy7LNF2NL0nktkyHtcqQ0/1bHTN3pLBYQ0Px9v6ZBDyGIJbpzq/7n+5znbafTmOelW8AqXVhg==
X-Received: by 2002:a05:6e02:551:: with SMTP id i17mr3532683ils.281.1631625575171;
        Tue, 14 Sep 2021 06:19:35 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id f17sm4693585ilq.44.2021.09.14.06.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 06:19:34 -0700 (PDT)
Subject: Re: [greybus-dev] [PATCH 14/16] tty: drivers/staging/, stop using
 tty_flip_buffer_push
To: Jiri Slaby <jslaby@suse.cz>, gregkh@linuxfoundation.org
Cc: Alex Elder <elder@kernel.org>, linux-staging@lists.linux.dev,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-serial@vger.kernel.org,
 David Lin <dtwlin@gmail.com>
References: <20210914091134.17426-1-jslaby@suse.cz>
 <20210914091415.17918-1-jslaby@suse.cz>
 <20210914091415.17918-7-jslaby@suse.cz>
From: Alex Elder <elder@linaro.org>
Message-ID: <9cd19a7d-797f-4951-c29a-c263f69a6631@linaro.org>
Date: Tue, 14 Sep 2021 08:19:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210914091415.17918-7-jslaby@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/14/21 4:14 AM, Jiri Slaby wrote:
> Since commit a9c3f68f3cd8d (tty: Fix low_latency BUG) in 2014,
> tty_flip_buffer_push() is only a wrapper to tty_schedule_flip(). We are
> going to remove the former, so call the latter directly in
> drivers/staging/.

For "greybus/uart.c", looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: David Lin <dtwlin@gmail.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: linux-staging@lists.linux.dev
> Cc: greybus-dev@lists.linaro.org
> ---
>  drivers/staging/fwserial/fwserial.c | 4 ++--
>  drivers/staging/gdm724x/gdm_tty.c   | 2 +-
>  drivers/staging/greybus/uart.c      | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
> index e8fa7f53cd5e..b2d3f95edbc3 100644
> --- a/drivers/staging/fwserial/fwserial.c
> +++ b/drivers/staging/fwserial/fwserial.c
> @@ -518,7 +518,7 @@ static void fwtty_emit_breaks(struct work_struct *work)
>  		if (c < t)
>  			break;
>  	}
> -	tty_flip_buffer_push(&port->port);
> +	tty_schedule_flip(&port->port);
>  
>  	if (port->mstatus & (UART_LSR_BI << 24))
>  		schedule_delayed_work(&port->emit_breaks, FREQ_BREAKS);
> @@ -565,7 +565,7 @@ static int fwtty_rx(struct fwtty_port *port, unsigned char *data, size_t len)
>  
>  	c = tty_insert_flip_string_fixed_flag(&port->port, data, TTY_NORMAL, n);
>  	if (c > 0)
> -		tty_flip_buffer_push(&port->port);
> +		tty_schedule_flip(&port->port);
>  	n -= c;
>  
>  	if (n) {
> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> index 04df6f9f5403..95a3b4e61fec 100644
> --- a/drivers/staging/gdm724x/gdm_tty.c
> +++ b/drivers/staging/gdm724x/gdm_tty.c
> @@ -129,7 +129,7 @@ static int gdm_tty_recv_complete(void *data,
>  	if (data && len) {
>  		if (tty_buffer_request_room(&gdm->port, len) == len) {
>  			tty_insert_flip_string(&gdm->port, data, len);
> -			tty_flip_buffer_push(&gdm->port);
> +			tty_schedule_flip(&gdm->port);
>  		} else {
>  			return TO_HOST_BUFFER_REQUEST_FAIL;
>  		}
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index e6d860a9678e..2bdc2401b652 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -122,7 +122,7 @@ static int gb_uart_receive_data_handler(struct gb_operation *op)
>  			recv_data_size, count);
>  	}
>  	if (count)
> -		tty_flip_buffer_push(port);
> +		tty_schedule_flip(port);
>  	return 0;
>  }
>  
> 

