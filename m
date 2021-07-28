Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A74E70
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 18:45:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 939516023B;
	Wed, 28 Jul 2021 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627497958;
	bh=AGvqkwV9OjaqEJNQNzy5jf5UNN74DbHUMIEiFgrsVGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZSgyhG3eLa4XizSP156vF5jNbRODIEdiCvbS2XCrIX6ig5SPxb4vSBB+ScjHLGNs
	 KGq/UfdGENY1FNqUF378LulYtNJmI2I8JSquMYR+bbEsTsGGH22FLQZ8z+a6Xx9DqE
	 eeR2b61O16/Cq2233ylmgJwa7YoImmctEe3wTHEE=
Date: Wed, 28 Jul 2021 20:45:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ojaswin Mujoo <ojaswin98@gmail.com>
Cc: nsaenz@kernel.org, stefan.wahren@i2se.com, dan.carpenter@oracle.com,
	phil@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: vchiq: Set $CONFIG_VCHIQ_CDEV to be enabled
 by default
Message-ID: <YQGl47Wpu7+SHIW+@kroah.com>
References: <cover.1627495116.git.ojaswin98@gmail.com>
 <70d91b0482e19d7551d3258ea54c970c1b996317.1627495116.git.ojaswin98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70d91b0482e19d7551d3258ea54c970c1b996317.1627495116.git.ojaswin98@gmail.com>

On Thu, Jul 29, 2021 at 12:07:16AM +0530, Ojaswin Mujoo wrote:
> Before this config was defined, the cdev used to be created
> unconditionally. When an earlier commit introduced this config, the
> default behavior was set to disabled, which might surprise some
> unsuspecting users.  Hence, make this config default to 'Y' to be more
> backward consistent.
> 
> Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> ---
>  drivers/staging/vc04_services/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
> index 63caa6818d37..2b70c37cdd09 100644
> --- a/drivers/staging/vc04_services/Kconfig
> +++ b/drivers/staging/vc04_services/Kconfig
> @@ -23,6 +23,7 @@ if BCM2835_VCHIQ
>  
>  config VCHIQ_CDEV
>  	bool "VCHIQ Character Driver"
> +	default y


default y is only if the machine will not work without this option.
Is that the case here?  If not, then please do not have this as the
default.

thanks,

greg k-h
