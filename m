Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34721A680D;
	Mon, 23 Mar 2026 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275774; cv=none; b=Sm0sdMcEaPk/lSGPjnQPz1zTRkskCFbBXBARO29T1i36lMvKtmGL6T2OmeoPpVJbt4tSfC+GDC7O6n6HFO+j9rfRzWtnU724SvxHbBrXctKB/rHdGTkQ0Ep0PiPAW9vPFfWXo0kXzA+zSNzT/bgkwhZcKiGDZ6bwmj6UeMaKbrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275774; c=relaxed/simple;
	bh=75yMJNjNKG40Z7gVjEIHoK8Kc4ACaANukIDeoem0vvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSwhEw1i8alt8opMs4LAiz46ThMBTWsRfxCl0fRhppSFl/S1nnR9AMhFe7+M6PAMLxIH8R1Hi5G9ldq/n39Kj4K6mGWCZ+sBEEHDQXsfh/Fo2YH0047U8excy4tJGdIRQty2zbstjlb9el1OBOYpFc9tp8++iTAI2SgVKcnM7pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzBkfag8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzBkfag8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89399C2BCB1;
	Mon, 23 Mar 2026 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774275774;
	bh=75yMJNjNKG40Z7gVjEIHoK8Kc4ACaANukIDeoem0vvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzBkfag8wEp6d13LEU3cb/n+u8SrIuTebqAz/rWb08DfKNBrNSlMf760MAIuCfBFu
	 SHQHsPbG7CiQebXMyVNSZ5ICdtJYKMJ2ei7zxeBY9zkCJsQ4NaZQPWkoYHb5akoCzS
	 U6gckJZmBs1g2tWoEXsbPsu5zn8Y7/U6z9udeAhAuhfMroKfXgqPn1wiLsxeYw4Bpo
	 g8hdATs+cntRw3ALJT5SDQSts4rlmJX/2fWqPw6gIs4+I5mPhO60QeycNCFOPK7Ex5
	 1HKyp6MNo9N6yVt+zgy7JTLSoDzr4ibNA185/XfYWbkMYxXmGhLl5MbT0dzcGHSUwn
	 3PZscKFuRbnnw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4gBA-00000003amJ-1Zae;
	Mon, 23 Mar 2026 15:22:52 +0100
Date: Mon, 23 Mar 2026 15:22:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2 1/2] greybus: raw: fix use-after-free on cdev close
Message-ID: <acFMvCgcwIny-z2N@hovoldconsulting.com>
References: <20260319162049.42269-1-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319162049.42269-1-damien.riegel@silabs.com>

On Thu, Mar 19, 2026 at 12:20:48PM -0400, Damien Riégel wrote:
> This addresses a use-after-free bug when a raw bundle is disconnected
> but its chardev is still opened by an application. When the application
> releases the cdev, it causes the following panic when init on free is
> enabled (CONFIG_INIT_ON_FREE_DEFAULT_ON=y):

> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
> Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
> ---
> Changes in v2:
>   - trim down trace in commit message to keep only the essential part
>   - rework error paths in probe function to ensure device is always
>     freed (set device release callback before any call to put_device)
>   - move ida_free to release callback

> @@ -164,63 +172,58 @@ static int gb_raw_probe(struct gb_bundle *bundle,
>  	if (cport_desc->protocol_id != GREYBUS_PROTOCOL_RAW)
>  		return -ENODEV;
>  
> +	minor = ida_alloc(&minors, GFP_KERNEL);
> +	if (minor < 0)
> +		return minor;
> +
>  	raw = kzalloc(sizeof(*raw), GFP_KERNEL);
> -	if (!raw)
> +	if (!raw) {
> +		ida_free(&minors, minor);
>  		return -ENOMEM;
> +	}
> +
> +	device_initialize(&raw->dev);
> +	raw->dev.devt = MKDEV(raw_major, minor);
> +	raw->dev.class = &raw_class;
> +	raw->dev.release = raw_dev_release;
> +	retval = dev_set_name(&raw->dev, "gb!raw%d", minor);
> +	if (retval)
> +		goto error_put_device;
>  
>  	connection = gb_connection_create(bundle, le16_to_cpu(cport_desc->id),
>  					  gb_raw_request_handler);
>  	if (IS_ERR(connection)) {
>  		retval = PTR_ERR(connection);
> -		goto error_free;
> +		goto error_put_device;
>  	}
>  
>  	INIT_LIST_HEAD(&raw->list);
>  	mutex_init(&raw->list_lock);
>  
>  	raw->connection = connection;
> +	raw->dev.parent = &connection->bundle->dev;

You can set the parent above where you initialise dev since the probe
function is called with a pointer to the bundle (that is being bound).

>  	greybus_set_drvdata(bundle, raw);

Looks good otherwise:

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
