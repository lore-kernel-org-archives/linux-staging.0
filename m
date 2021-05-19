Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C2E2FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 15:57:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AF4A611BF;
	Wed, 19 May 2021 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621439871;
	bh=CvWgn1TOhKyllL0rp25eLv8GWJAa4SUZ0xSNVCnhHXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQbhPO6fh3q+C+P15r2OQnMBA7xmMTrT+lqIyoBuFEqEf/xDj8CDLj22xKvZY2k6S
	 0jQI0+AAyVTWe62kNXqTI6ZxVuLUvIzuS8aqRdjODhXlf63eBa1s0CZyiefwHEGKdH
	 ZZFQOsOzEwqe+CSiRPJF4mQGfpywGus3ysXFsQvk=
Date: Wed, 19 May 2021 17:57:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: greybus: fix open parenthesis issue in gbphy.c
Message-ID: <YKU1fdzyKuwY/IER@kroah.com>
References: <20210519151851.26006-1-asha.16@itfac.mrt.ac.lk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519151851.26006-1-asha.16@itfac.mrt.ac.lk>

On Wed, May 19, 2021 at 08:48:51PM +0530, F.A.Sulaiman wrote:
> This fix "Alignment should match open parenthesis" checkpatch error.
> 
> Signed-off-by: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
> ---
>  drivers/staging/greybus/gbphy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> index 9fc5c47be9bd..13d319860da5 100644
> --- a/drivers/staging/greybus/gbphy.c
> +++ b/drivers/staging/greybus/gbphy.c
> @@ -27,7 +27,7 @@ struct gbphy_host {
>  static DEFINE_IDA(gbphy_id);
>  
>  static ssize_t protocol_id_show(struct device *dev,
> -				 struct device_attribute *attr, char *buf)
> +				struct device_attribute *attr, char *buf)
>  {
>  	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
>  
> @@ -221,7 +221,7 @@ void gb_gbphy_deregister_driver(struct gbphy_driver *driver)
>  EXPORT_SYMBOL_GPL(gb_gbphy_deregister_driver);
>  
>  static struct gbphy_device *gb_gbphy_create_dev(struct gb_bundle *bundle,
> -				struct greybus_descriptor_cport *cport_desc)
> +						struct greybus_descriptor_cport *cport_desc)
>  {
>  	struct gbphy_device *gbphy_dev;
>  	int retval;
> -- 
> 2.17.1
> 
> 

You sent this 3 different times, why?

Please send a new version, a v2, and say what changed from the previous
one.

thanks,

greg k-h
