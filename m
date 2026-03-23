Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE1C191;
	Mon, 23 Mar 2026 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276230; cv=none; b=F3k/gBerjqcCbIhVja9ROxFMnQ1ftztrgf2JZSM/oAZvgXhDFvaPxUnexP1aVTDlDBteh+bNovqACM9G6EQTuv7TIYOH37x6hLWScNcYU9/lyvi92TesxhYex8duLZikeUKF5wCw0TybPLUpG+UU5ib+tkS3EVQ2U63PmnQTD3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276230; c=relaxed/simple;
	bh=+uXh6Wo8ID6kFjXsjYwlzbtp3B2p7V/Saw4pHUAkil4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/CkeAhep2KGUJmVu16UabjdcGhB5BUUAQtWGm6Gx2iUXjYU2OunKJ9zDRlXVzt7vvodiDB6bBSO2zGB/jV+dyC2xaOtwxK9M4g80FFZyrDGOWmn/tG/FuSYLVMUxDqMGZaiZGhsINTxGeMl3wE8kwBl1PqueRnGOXqGIK0QANY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3s3xv0Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3s3xv0Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB83DC4CEF7;
	Mon, 23 Mar 2026 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276229;
	bh=+uXh6Wo8ID6kFjXsjYwlzbtp3B2p7V/Saw4pHUAkil4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3s3xv0YGJ5nGlClKOKJz+JfTR9WXsxNN9RC8hcHZp0hiy9Zb82/0Thyy3t1bw4BE
	 3ACK+lnd9d/BCuTuoyKKUnaOmWPlqlyZyPbRXN0h9NisY0nI5bpkksTxPfoZMMlg4A
	 TYIfBQYF0vyFwfhNjZcG1kt5OASrTjA/03rg8QgEXiRSi5E46rn6vbOCoP03qeT0VW
	 xdyHZgYmhih6q+VlQeDPyVrUIlhqkXWvXmfD+zC/zMfDOVMDsvGkPovwQd+claOmAG
	 vcR82Dg4yjSHk/EhgjteelzhKxxEB34dLqyqhtEYPgM7dD4B3bFeA4ptHHp3vm2RDh
	 +aIwPmewBxi9Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4gIV-00000003auM-2i47;
	Mon, 23 Mar 2026 15:30:27 +0100
Date: Mon, 23 Mar 2026 15:30:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2 2/2] greybus: raw: fix use-after-free if write is
 called after disconnect
Message-ID: <acFOg_EFUdxx0k9S@hovoldconsulting.com>
References: <20260319162049.42269-1-damien.riegel@silabs.com>
 <20260319162049.42269-2-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319162049.42269-2-damien.riegel@silabs.com>

On Thu, Mar 19, 2026 at 12:20:49PM -0400, Damien Riégel wrote:
> If a user writes to the chardev after disconnect has been called, the
> kernel panics with the following trace (with
> CONFIG_INIT_ON_FREE_DEFAULT_ON=y):
> 
>         BUG: kernel NULL pointer dereference, address: 0000000000000218
>          ...
>         Call Trace:
>          <TASK>
>          gb_operation_create_common+0x61/0x180
>          gb_operation_create_flags+0x28/0xa0
>          gb_operation_sync_timeout+0x6f/0x100
>          raw_write+0x7b/0xc7 [gb_raw]
>          vfs_write+0xcf/0x420
>          ? task_mm_cid_work+0x136/0x220
>          ksys_write+0x63/0xe0
>          do_syscall_64+0xa4/0x290
>          entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Disconnect calls gb_connection_destroy, which ends up freeing the
> connection object. When gb_operation_sync is called in the write file
> operations, its gets a freed connection as parameter and the kernel
> panics.
> 
> The gb_connection_destroy cannot be moved out of the disconnect
> function, as the Greybus subsystem expect all connections belonging to a
> bundle to be destroyed when disconnect returns.
> 
> To prevent this bug, use a rw lock to synchronize access between write
> and disconnect. This guarantees that in the write function
> raw->connection is either a valid object or a NULL pointer.

You forgot to update this last sentence after you switched to a bool
flag.

> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
> Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
> ---
> Changes in v2:
>   - trim down trace in commit message to keep only the essential part
>   - convert the mutex that protected the connection to a rw_semaphore
>   - use a "connected" flag instead of relying on the connection pointer
>     being NULL or not
> 
>  drivers/staging/greybus/raw.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> index 6da878e4339..57bf5032280 100644
> --- a/drivers/staging/greybus/raw.c
> +++ b/drivers/staging/greybus/raw.c
> @@ -21,6 +21,8 @@ struct gb_raw {
>  	struct list_head list;
>  	int list_data;
>  	struct mutex list_lock;
> +	struct rw_semaphore disconnect_lock;	/* Synchronize access to connection */

Just skip the comment (and ignore checkpatch).

> +	bool connected;

Please use a "disconnected" flag instead (and leave it set to false
until disconnect() is called) which is the common way to handle this.

>  	struct cdev cdev;
>  	struct device dev;
>  };
> @@ -124,7 +126,6 @@ static int gb_raw_request_handler(struct gb_operation *op)
>  
>  static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
>  {
> -	struct gb_connection *connection = raw->connection;
>  	struct gb_raw_send_request *request;
>  	int retval;
>  
> @@ -139,9 +140,18 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
>  
>  	request->len = cpu_to_le32(len);
>  
> -	retval = gb_operation_sync(connection, GB_RAW_TYPE_SEND,
> +	down_read(&raw->disconnect_lock);
> +
> +	if (!raw->connected) {
> +		retval = -ENODEV;
> +		goto exit;
> +	}

I think it may be preferred to move the disconnected check to
raw_write() to avoid allocating memory and copying data for a bundle
(connection) that's already gone.

> +
> +	retval = gb_operation_sync(raw->connection, GB_RAW_TYPE_SEND,
>  				   request, len + sizeof(*request),
>  				   NULL, 0);
> +exit:
> +	up_read(&raw->disconnect_lock);
>  
>  	kfree(request);
>  	return retval;
> @@ -199,6 +209,7 @@ static int gb_raw_probe(struct gb_bundle *bundle,
>  
>  	INIT_LIST_HEAD(&raw->list);
>  	mutex_init(&raw->list_lock);
> +	init_rwsem(&raw->disconnect_lock);
>  
>  	raw->connection = connection;
>  	raw->dev.parent = &connection->bundle->dev;
> @@ -210,6 +221,8 @@ static int gb_raw_probe(struct gb_bundle *bundle,
>  	if (retval)
>  		goto error_connection_destroy;
>  
> +	raw->connected = true;

No need to initialise after you invert the flag.

Johan
