Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F2B330668
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414887; cv=none; b=ROE84uG/L0ljD068GJMN94VBd9nkzPVi6VzdCdAPo4d4eVan/zCqacVYRpbJyTjlblQueqdnd467cAq3UJfreB45ZSvCp27Qv5l4glWtoYIP6LzCb3gQ+Qfu93nDf9wEPYMa7udbcoWZZ7IwfrxXQf44ApPc8OJZfCz6gVzyqIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414887; c=relaxed/simple;
	bh=56uc8f4GME4sShur8EhlJiM7/85PZl4aZSQZpbAeG04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gD0zTP2TV3zJiGszOevPcL2s7dC0sc3MZWvNYX68YAt1CtHwzEhFag+U86/H9lMShsDFltNJsktFUNxiQjB+tZaBItoyCHPLgx5AqG+gzjLL3sdJ1eHAC4gvhIhhms/lkuGWO+6nPpErko2ChujC8/q8koWtluoNNYff6xjrQDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d/7d1mIk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d/7d1mIk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6071F000E9;
	Tue,  7 Jul 2026 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783414886;
	bh=6raVjvi3XDmAui1gkysk51ynAxJsWrL+QzELOj6V6sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d/7d1mIkXHsAGC+cG8yeAfuzkdkYiNZqfHjbdxm8xHccv0BjzJl5i6e4Fn+hUV7L0
	 kJj8bOiu6t/K8Nnd3kdInQU1jRiInX1iTlwobxOOO3lQdvVM0xq2umj4gON/6zqrqd
	 vOi2yusqfJ9HgCzEYV8WhS8qwY6/o3sKmAfkFY7M=
Date: Tue, 7 Jul 2026 11:01:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org
Subject: Re: [staging] staging: greybus: loopback: add missing comment for
 mutex
Message-ID: <2026070754-lumber-raking-ea19@gregkh>
References: <20260622042721.31760-1-kapoorarnav43@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622042721.31760-1-kapoorarnav43@gmail.com>

On Mon, Jun 22, 2026 at 09:57:21AM +0530, Arnav Kapoor wrote:
> Add a comment for the mutex as suggested by checkpatch.
> 
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>

The subject line should have [PATCH] in it, right?

> ---
>  drivers/staging/greybus/loopback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index ea57b1f5d..bf827e672 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -61,7 +61,7 @@ struct gb_loopback {
>  
>  	struct dentry *file;
>  	struct kfifo kfifo_lat;
> -	struct mutex mutex;
> +	struct mutex mutex;		/* protects the entire structure */

Look on the mailing list for other places where this type of change was
rejected as it doesn't really explain anything.

thanks,

greg k-h
