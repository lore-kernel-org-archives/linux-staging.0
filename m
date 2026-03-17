Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDF0264A9D;
	Tue, 17 Mar 2026 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765441; cv=none; b=VvCUSPDgDng23aArvcp+Ezv8ZthyS/qBETiAo+tE/92rU158EKP8d+zPJCHoFoL8i+UGhLRviMQzuIzC4dzfFH4Sg/6vVO34lLzkFGwBXF9gEV1DuIkkC3L4VDAaev0MK2XjBpn/oaOClV6qjw+e1VXBCSm7mhCuaX23C6tka5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765441; c=relaxed/simple;
	bh=QIsIQJqZiPz/uYXn49ib0riaHqg3EjW9MdevwPoZAlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlgYwmwXxrVniZ7ji/5i8F75Y5+j20IJffx8eb0HR3xIooj2iEOpfZ4jSnnPuOE/56IiBHiKBzLtdrVYF3O5mAqktorQmOTR2exz5ZanAScBj6WcJw0geiv8aMyiUfdVdSEruB29a2j5I+qTpGwaGpotJSJLNfCKc361s5OMA+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJjnheIH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJjnheIH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3A5C19424;
	Tue, 17 Mar 2026 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773765441;
	bh=QIsIQJqZiPz/uYXn49ib0riaHqg3EjW9MdevwPoZAlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJjnheIHZ49UW3lwAkyWYV7ZyeVufZxgtW6cHEi5P44InYKR9pUn1WE37vqQewYuP
	 Mwi+VgEZUf1C3iBaQ7ptzygokmdWhuBmWf0YAJ4K45MuVqjXCcVJD0gX5YDDIHVHeL
	 Zu9HL9WrUyGSq9dsKe9hvFmPul5fbSNdnIqkbmTLlyBrEWqerdQWfksPl9kW1kPdds
	 +NK+JIwtXJm8e9mKXPZ4Bn9yBG8fjc/wWeso6+3HU/bZkgNpJDgamm50KP/mU+BJur
	 apDluFg/1rxRuXPP3xt1ZkQjvE/VwF9cqxE8oFM4wuExL0L7y/AOkTJZIBT0gB7BjM
	 +xKUhnHRM/9Cw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2XPz-000000008BE-1QDL;
	Tue, 17 Mar 2026 17:37:19 +0100
Date: Tue, 17 Mar 2026 17:37:19 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Elder <elder@kernel.org>
Subject: Re: [PATCH 2/2 RESEND] greybus: raw: fix use-after-free if write is
 called after disconnect
Message-ID: <abmDPyRLZIHJG_7N@hovoldconsulting.com>
References: <20260311212511.82563-1-damien.riegel@silabs.com>
 <20260311212511.82563-2-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311212511.82563-2-damien.riegel@silabs.com>

On Wed, Mar 11, 2026 at 05:25:11PM -0400, Damien Riégel wrote:
> If a user writes to the chardev after disconnect has been called, the
> kernel panics with the following trace (with
> CONFIG_INIT_ON_FREE_DEFAULT_ON=y):
> 
>     [   83.828726] BUG: kernel NULL pointer dereference, address: 0000000000000218

Please trim this oops too. The timestamps are not needed either (in
either patch).

>     [   83.835259] Call Trace:
>     [   83.835983]  <TASK>
>     [   83.836362]  gb_operation_create_common+0x61/0x180
>     [   83.836653]  gb_operation_create_flags+0x28/0xa0
>     [   83.836912]  gb_operation_sync_timeout+0x6f/0x100
>     [   83.837162]  raw_write+0x7b/0xc7 [gb_raw]
>     [   83.837460]  vfs_write+0xcf/0x420

> Disconnect calls gb_connection_destroy, which ends up freeing the
> connection object. When gb_operation_sync is called in the write file
> operations, its gets a freed connection as parameter and the kernel
> panics.
> 
> The gb_connection_destroy cannot be moved out of the disconnect
> function, as the Greybus subsystem expect all connections belonging to a
> bundle to be destroyed when disconnect returns.
> 
> To prevent this bug, use a lock to synchronize access between write and
> disconnect. This guarantees that in the write function raw->connection
> is either a valid object or a NULL pointer.
> 
> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
> Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
> ---
> resend: added linux-staging as Cc, this list was not part of the first
> submission.
> 
>  drivers/staging/greybus/raw.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> index b92214f97e3..aa4086ff397 100644
> --- a/drivers/staging/greybus/raw.c
> +++ b/drivers/staging/greybus/raw.c
> @@ -21,6 +21,7 @@ struct gb_raw {
>  	struct list_head list;
>  	int list_data;
>  	struct mutex list_lock;
> +	struct mutex write_lock;	/* Synchronize access to connection */

This works here, but I think it would be better to generalise this so
that it could be used for possible future ioctl() and read() too.

For that you can use an rw semaphore and name it something like
disconnect_lock. And possibly use a dedicated boolean flag for the
disconnected state.

>  	struct cdev cdev;
>  	struct device dev;
>  };
> @@ -124,8 +125,8 @@ static int gb_raw_request_handler(struct gb_operation *op)
>  
>  static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
>  {
> -	struct gb_connection *connection = raw->connection;
>  	struct gb_raw_send_request *request;
> +	struct gb_connection *connection;
>  	int retval;
>  
>  	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
> @@ -139,9 +140,15 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
>  
>  	request->len = cpu_to_le32(len);
>  
> -	retval = gb_operation_sync(connection, GB_RAW_TYPE_SEND,
> -				   request, len + sizeof(*request),
> -				   NULL, 0);
> +	mutex_lock(&raw->write_lock);

Then this would be a read lock.

And as part of this or a follow-on patch you also take a read lock in
read so that user space can be notified that the device is gone rather
than trying to read the empty buffers indefinitely.

> +	retval = -ENODEV;

Please check raw->disconnected (or !raw_connected) here and bail out
after setting retval instead.

> +
> +	connection = raw->connection;
> +	if (connection)
> +		retval = gb_operation_sync(connection, GB_RAW_TYPE_SEND,
> +					   request, len + sizeof(*request),
> +					   NULL, 0);
> +	mutex_unlock(&raw->write_lock);
>  
>  	kfree(request);
>  	return retval;

> @@ -238,9 +246,9 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
>  	struct raw_data *temp;
>  
>  	cdev_device_del(&raw->cdev, &raw->dev);
> -	gb_connection_disable(connection);
>  	ida_free(&minors, MINOR(raw->dev.devt));
> -	gb_connection_destroy(connection);
> +
> +	gb_connection_disable(connection);
>  
>  	mutex_lock(&raw->list_lock);
>  	list_for_each_entry_safe(raw_data, temp, &raw->list, entry) {
> @@ -248,6 +256,12 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
>  		kfree(raw_data);
>  	}
>  	mutex_unlock(&raw->list_lock);
> +
> +	mutex_lock(&raw->write_lock);
> +	raw->connection = NULL;
> +	gb_connection_destroy(connection);
> +	mutex_unlock(&raw->write_lock);

Then this would be a write lock setting the disconnected flag, and that
can be done before freeing the data buffers (or before disabling the
connection).

> +
>  	put_device(&raw->dev);
>  }

Johan
