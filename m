Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC9C34BA57
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 07:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645638; cv=none; b=gNeO4qeXRBjXPAxqz5FPA52ll+CNf2zspubEpD+hVGH4y5MJfwdrbuKN61nwxZPWKwfkLypyk4qKYsP4zCrsJMn1FGxO7EPKXdGh9mHkbb13KIw32SsWcDCF+XT9zWrvnPkOTTya7p4YX/IFhilzjgiKjEVaqfD7S7gd1pytamg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645638; c=relaxed/simple;
	bh=afqKyQQ18sxMobhcKhw5RBSALeZ0ixVAbCZjPvGTR6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNyiYyZ/dzQT1c+8mtcs1h1o/n5E/w318k93yz3fRUwrTahpaUZVS2sdAUo5lmugEknATzuxLZOfbGkDd2lvUdmO/uHtNcFi3H6MS8FXqPsn/0jvWH6HjmyAXjRR5/194/ZtlPLkTjX+HSW3IlHZoGK3euyNY4jaGAmg34tW79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UUL/lKzD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UUL/lKzD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso36477635e9.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773645635; x=1774250435; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZdKQYO2ewxJmQV8sx3HmKzvzT1vlMa/R+ZGVJq9Oks=;
        b=UUL/lKzDiWzBeE88Z4CTgRd9um2622/zWaTGjSjKUeP8/q+m/lDsA5pY7FDYbvl8n7
         h4CDhoxNMN+U2z13o6vxk0P/nCSM83lGSUbu+wmxCUY3Ic83p4JvmuyaM4RTzqvEVZ8n
         E/HQCIauTsmnEhFGD9UdwPjCpJl0PAAF675upPJucIDCndCP6uvFhuzvmGccsmS2vEk3
         1bbM5aR/szplg4hFhUQI2ZR5v0rcx5ceni5Ef6uKtUFM/5JmosWONXt13xYxO3uG/CYE
         eZS5HO1G4Nc1KVXbLvqYnlKz7ytyjOeR9me3o6aPbHlZrghqnry9Gq/3jaqz1ZZbezXq
         /KGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645635; x=1774250435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZdKQYO2ewxJmQV8sx3HmKzvzT1vlMa/R+ZGVJq9Oks=;
        b=SjZ9TN/NqCd9JpTvKIgeEpVysyY5pF5x8pOpUd/Sewq5BiA9hDWndwbMTnbuiz3VAd
         exek8NyXtKynrAxnwk5LJorM+5/0dqIzIn+EXiHHqZ/6+CoTrvsVFuj4hOE8BSyLyH1h
         kqgr6R5pjCJbHTqflnEZJQUFtc3k+uHH2eUPz3pPlkk2UjnPjvsLi5OfXl99ctksHtfF
         03/+Pjuizu1ZE+TJTynWvzJ9k7k0tYsB3CuPWnwZgUdVByzDg7PqQUYLoFCfJsimSYz+
         WiZD2JzsX6/cNcQZjMyX6TMtOZ39Mz/RY81SIRv1dTGObvK5EQj8Io5zW/gyjgWZwftL
         XZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCWKRj8bD44/nz2tgJUtTuwO/Y8vIfNXBScNUQ0d5knWo8TJTygP2rXYhz/zYDiP3gC/KH4OkYeU1uLwYOdx@lists.linux.dev
X-Gm-Message-State: AOJu0YyuFdGDErVRyGa+RDQru6wnoYYozGufHvyH5zo8r7P6eFOWuN08
	/I8j8yCxhDPz3NTzqwhXNOMD1ad+LXZS+T7y87T4gHxb6WrKFm2j+3RHP2EN8T16nvQ=
X-Gm-Gg: ATEYQzzecFViopgFP+q4Ep5zxGvdcAhru7+nGTbzBo/Hca0VjFsYDdKPPRSjgu7ypPW
	fdZ6F3YFpEa+KWxisOWYrhm29RPxBZ5yENkIGf2JQAwId97Bor6WZl4oLCa3ktGklWnCxnxFJYO
	gwqx+Tgv8kuTbjP5fK3GVMjb6KzSHQOzj+IWxCB+5+UI5k5Ltm5Cv/buALyPt5Qh60TRwwlJLr+
	lMAv0nVCm3VoGYrsbGQdi0Qv7QIAoXVAJzZL9rIIOEGBsfSOx6JytXzWy6WGlSQ+fx0EKewxaXQ
	/07S5eypY5UDg1+bg/dlhxv6CEtCFWLkBYxB/wwp+86IqsrLQVwArZvX4ZFNbVNZJbpaeWNpl2E
	hkpvcQEYjMJpqnVFkxLNT5Vd89XqzCdGPxXXi7VR988N+Nnp9rZZZCCew7J12OEdp3zX1Ti9dzu
	MBmnwnArMQBCzZeg5umOdRohvYMIt1
X-Received: by 2002:a05:600c:3104:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-485566e316dmr178619855e9.1.1773645635166;
        Mon, 16 Mar 2026 00:20:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557784c18sm187652855e9.4.2026.03.16.00.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:20:34 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:20:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rahul Joshi <rj5547884@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: add comments to locks and fix
 alignment
Message-ID: <abevP7wQGicCe9nZ@stanley.mountain>
References: <20260311184104.499201-1-rj5547884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311184104.499201-1-rj5547884@gmail.com>

On Thu, Mar 12, 2026 at 12:11:04AM +0530, Rahul Joshi wrote:
> The spinlock_t and struct mutex members in struct gb_tty lack
> comments describing what they protect, which is required by the
> kernel coding style.
> 
> Also fix the alignment of the wait_for_completion_timeout() call
> in gb_uart_wait_for_all_credits() to match the open parenthesis.
> 
> Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 7d060b4cd33d..52a84a68049c 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -50,12 +50,12 @@ struct gb_tty {
>  	unsigned int minor;
>  	unsigned char clocal;
>  	bool disconnected;
> -	spinlock_t read_lock;
> -	spinlock_t write_lock;
> +	spinlock_t read_lock;	/* protects iocount and oldcount */
> +	spinlock_t write_lock;	/* protects write_fifo and credits */


https://lore.kernel.org/all/aaFdxqxEUzZFVIqQ@stanley.mountain/

How on earth could you have come up with the exact same words here
that someone else did?  It feels like too large of a coincidence.

regards,
dan carpenter
