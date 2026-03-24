Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F42334CFC2;
	Tue, 24 Mar 2026 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338735; cv=none; b=gJIzmtu13pVuTLJHpwQjpTwDFodkni+GWCimICakTs+8AyiVPPMW5rZJfivGycN1MFowL7Z2T9YKOxRDUoqTp8wrQ72ZkCj0FF6FBMrzWps38uTHMBXF7d3oIYx0R++UpLnoKQA5fkTGbf9b/4q/YiahC37OkCLx8tK9KfODkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338735; c=relaxed/simple;
	bh=mBPvp3q+TvJUpg4+ASx6IuOCedA/fw22Wnrq5ySC6tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GetBbzPFjaKfGil0mxJPvg50LD8e4Bkg+JegNGGOz+el0anwDunSCk42Kb5jTGvJ6iCxvKW0BnnvNPKbFcHsaPYKQqQAUdOMM7DzmjlA5Q/PT1CMGy46yH/vvmv6qIp52OgzqvWfJBr+LKC/K+UTFM/i3woPAKIyY8DUry8tm/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TyjUDAOk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TyjUDAOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C7FC2BC9E;
	Tue, 24 Mar 2026 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774338734;
	bh=mBPvp3q+TvJUpg4+ASx6IuOCedA/fw22Wnrq5ySC6tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TyjUDAOk/+jRzBAdVvEw/ggWIsO/sUESVSr0DPUG6zwUvd7fqDZcMI+ZOr9w1Zdxs
	 E4qcn3atm8qw++RB0IjeUd924w0vrDDMF5piO+ApjNyds7BKzE+J+Dm2IbJke90BiU
	 bPcEUw27601sgCYJQo49mRG/AMkk9S3DFc4zVYafDq7oEL6hYyh/39BdGt4rvSd/Tp
	 qga/isPx580WepsnvGVfa8aK7d1vRcDRRGDE2Kw59hZH3gVpNz7DXa4l3Aj92/87VW
	 K/cEUgKC9Lu1ICG8pgvKF/vS3MZHadaoOa5RpwQUB6snaG7afF159VCp1cgb6rVFjn
	 x+OenNo5gK2UA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4wYe-00000003iHD-2A05;
	Tue, 24 Mar 2026 08:52:12 +0100
Date: Tue, 24 Mar 2026 08:52:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Cc: Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] greybus: raw: fix use-after-free if write is
 called after disconnect
Message-ID: <acJCrBYJS61o2ZbG@hovoldconsulting.com>
References: <20260324022510.28596-1-damien.riegel@silabs.com>
 <20260324022510.28596-2-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324022510.28596-2-damien.riegel@silabs.com>

On Mon, Mar 23, 2026 at 10:25:10PM -0400, Damien Riégel wrote:
> If a user writes to the chardev after disconnect has been called, the
> kernel panics with the following trace (with
> CONFIG_INIT_ON_FREE_DEFAULT_ON=y):

> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
> Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
> ---
> Changes in v3:
>   - rename "connected" flag to "disconnected"
>   - acquire/release of write semaphore acquire/release were in
>     gb_raw_send, move them to the caller instead (raw_write)
> 
> Changes in v2:
>   - trim down trace in commit message to keep only the essential part
>   - convert the mutex that protected the connection to a rw_semaphore
>   - use a "connected" flag instead of relying on the connection pointer
>     being NULL or not
 
> @@ -277,11 +285,20 @@ static ssize_t raw_write(struct file *file, const char __user *buf,
>  	if (count > MAX_PACKET_SIZE)
>  		return -E2BIG;
>  
> -	retval = gb_raw_send(raw, count, buf);
> -	if (retval)
> -		return retval;
> +	down_read(&raw->disconnect_lock);
>  
> -	return count;
> +	if (raw->disconnected) {
> +		retval = -ENODEV;
> +		goto exit;
> +	}
> +
> +	retval = gb_raw_send(raw, count, buf);
> +	if (!retval)
> +		retval = count;

I'd invert this so that we test for errors consistently:

	if (retval)
		goto exit;

	retval = count;

> +exit:
> +	up_read(&raw->disconnect_lock);
> +
> +	return retval;
>  }
>  
>  static ssize_t raw_read(struct file *file, char __user *buf, size_t count,

Johan
