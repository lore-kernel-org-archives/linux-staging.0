Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FF04601
	for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 19:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AED3C340E8;
	Thu, 17 Feb 2022 19:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645126004;
	bh=+GbxhSGLzwmU1NtyRldCXItdnvRFCwidru7MjEV9s9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YmhwJXVCJ4d6qu6l7uDUhvZunhZtjhor06UZWQf8d3iGcpaA6HVHREYiU2F4K9LVi
	 pxjQqnAZG8dDh0hbia26X4YryPPB135FbUrs0C4xZbDM35AEpAFmG+HI+3fO75S/SG
	 d49dxFKeG3z6GnWeN5P/cXX1rkhQBang4SrQD5OM=
Date: Thu, 17 Feb 2022 20:26:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Husni Faiz <ahamedhusni73@gmail.com>
Cc: pure.logic@nexus-software.ie, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: loopback: Fix Coding Style Error
Message-ID: <Yg6hcX6XK4Eu0KOR@kroah.com>
References: <20220217190722.44894-1-ahamedhusni73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217190722.44894-1-ahamedhusni73@gmail.com>

On Fri, Feb 18, 2022 at 12:37:22AM +0530, Husni Faiz wrote:
> Macros with multiple statements should be enclosed in a do - while
> block.
> 
> Signed-off-by: Husni Faiz <ahamedhusni73@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 2471448ba42a..33666a49e0a8 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  }									\
>  static DEVICE_ATTR_RO(name##_avg)
>  
> -#define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +#define gb_loopback_stats_attrs(field)					\
> +	do {												\
> +		gb_loopback_ro_stats_attr(field, min, u);		\
> +		gb_loopback_ro_stats_attr(field, max, u);		\
> +		gb_loopback_ro_avg_attr(field)					\
> +	} while (0)
>  
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
> -- 
> 2.25.1
> 
> 

Did you try to build this change?
