Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C776F33C1;
	Thu, 16 Mar 2023 13:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219B2C433D2;
	Thu, 16 Mar 2023 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678971877;
	bh=6SKDCIH8F2y9+9R8yw+MQjW9o6dNgojeQwy94ObmQjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7Gm3ADSOJDnBTskBTaVy90s2Bz43LFoXIOYdkrEcqL5D97+Is9QRwK0+qgHeR4ni
	 HEhX9Hp3sRMgq6IciiQsr/08W+WWKUqbYHZNTfOI9kBG5jKBpVw229N0d+lCbjQsZg
	 5qliHEFuOZGZZp8PpNOItSKQ8G2wp+puOggTTMk0=
Date: Thu, 16 Mar 2023 14:04:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBMT41g8kYQPCw+d@kroah.com>
References: <ZBMR4s8xyHGqMm72@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBMR4s8xyHGqMm72@khadija-virtual-machine>

On Thu, Mar 16, 2023 at 05:56:02PM +0500, Khadija Kamran wrote:
> @@ -815,6 +811,16 @@ static int axis_fifo_probe(struct platform_device *pdev)
>  	char *device_name;
>  	int rc = 0; /* error return value */
> 
> +	if (read_timeout >= 0)
> +		read_timeout = msecs_to_jiffies(read_timeout);
> +	else
> +		read_timeout = MAX_SCHEDULE_TIMEOUT;
> +
> +	if (write_timeout >= 0)
> +		write_timeout = msecs_to_jiffies(write_timeout);
> +	else
> +		write_timeout = MAX_SCHEDULE_TIMEOUT;

Also, this change needs to go into the axis_fifo_init() function, not
the driver probe as now the print message in there is not correct.

thanks,

greg k-h
