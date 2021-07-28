Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0D70
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 18:46:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6BD56056C;
	Wed, 28 Jul 2021 18:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627498013;
	bh=4pYDQiXD1f15dcdtVWaMSRnaxJqMqA5JSOuuTmecDlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jr3JnTCbrw0xAzoeLMwfkhfCHjG9QY5Q+S0FytPjPllEBbNNkH8yU7dTNdYCGQAZL
	 0OA1WutivUX891vzWTVUMQ3IUpRyk/4q2mu3sH3fREc3uQJ0BIxZWauJomd4Gyhg7C
	 NRr2lvWHJQdgZZDjGTaMRqRxo0c5MddK4hBxoMJk=
Date: Wed, 28 Jul 2021 20:46:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ojaswin Mujoo <ojaswin98@gmail.com>
Cc: nsaenz@kernel.org, stefan.wahren@i2se.com, dan.carpenter@oracle.com,
	phil@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vchiq: Add details to $CONFIG_VCHIQ_CDEV
 help text
Message-ID: <YQGmG6nwk+pOyAdu@kroah.com>
References: <cover.1627495116.git.ojaswin98@gmail.com>
 <9c9c128b41e31d6bebe646e052aa05c44b19eb83.1627495116.git.ojaswin98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c9c128b41e31d6bebe646e052aa05c44b19eb83.1627495116.git.ojaswin98@gmail.com>

On Thu, Jul 29, 2021 at 12:07:17AM +0530, Ojaswin Mujoo wrote:
> Add some details to the Kconfig definition of $CONFIG_VCHIQ_CDEV to help
> make the motive behind it a bit more clear.
> 
> Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> ---
>  drivers/staging/vc04_services/Kconfig | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
> index 2b70c37cdd09..cb02d8a4cb74 100644
> --- a/drivers/staging/vc04_services/Kconfig
> +++ b/drivers/staging/vc04_services/Kconfig
> @@ -25,8 +25,12 @@ config VCHIQ_CDEV
>  	bool "VCHIQ Character Driver"
>  	default y
>  	help
> -		Enable the creation of VCHIQ character driver to help
> -		communicate with the Videocore platform.
> +		Enable the creation of VCHIQ character driver to help communicate
> +		with the VideoCore platform. The cdev exposes ioctls used by
> +		userspace libraries and testing tools to interact with VideoCore.
> +		This can be set to 'N' if the VideoCore communication is not needed
> +		by userspace but only by other kernel modules (like bcm2835-audio).
> +		If not sure, set this to 'Y'.

I still do not understand if I need this driver or not, and I have this
hardware!  What functionality does this driver accomplish?  What is
VideoCore?

thanks,

greg k-h
