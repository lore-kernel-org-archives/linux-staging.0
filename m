Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C5E1C01;
	Sun, 16 Oct 2022 15:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB13FC433D6;
	Sun, 16 Oct 2022 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665932963;
	bh=LkZdo4C2etXIVshfF7HoMh8gk7bTmamu8NWJxVgV6ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IuWrDb9zRcOdm/rFvubwvMCe9R+XIrTQGZDpQk0LBJ3rSqUro1C1064e1xiwMwzd8
	 28JpdeBEGig6elOdA6QNOQVg16Zd5OaI+DjIhaGXT2nu4rBLflOxXuxB5O5BQ4J5fN
	 dwB1vZIP7dj5unPXSGSWLbk1bjZ2QsVR0vGfTVLQ=
Date: Sun, 16 Oct 2022 17:10:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: loopback: enclose macro statements in
 do-while loop
Message-ID: <Y0we0XPpye+Vjznr@kroah.com>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>

On Sun, Oct 16, 2022 at 10:19:12AM -0400, Deepak R Varma wrote:
> Include multiple statements of macro definition inside do-while{0} loop
> to avoid possible partial program execution. Issue reported by
> checkpatch script:
> 
> ERROR: Macros with multiple statements should be enclosed in a do - while loop
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/greybus/loopback.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1a61fce98056..37214cb43937 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  static DEVICE_ATTR_RO(name##_avg)
> 
>  #define gb_loopback_stats_attrs(field)				\
> +do {								\
>  	gb_loopback_ro_stats_attr(field, min, u);		\
>  	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +	gb_loopback_ro_avg_attr(field);				\
> +} while (0)
> 
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
> --
> 2.30.2

Always test-build your changes before sending them out so you do not get
grumpy maintainers asking why you did not test-build your changes.

Also, don't bindly trust that checkpatch is always correct, you need to
read the C code to verify that it is a sane request.

thanks,

greg k-h
