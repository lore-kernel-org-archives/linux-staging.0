Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027A61C3A
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Btu82OJj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3BCC433C7;
	Sat, 21 Oct 2023 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697881715;
	bh=LWyKW1uK7K8s4xmPcXxHy2ZlSq7/79IXRHSU/lV9Cpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Btu82OJjszJ0E63UkiKXGBlda/QUAuCXb4Fi/Af0AZj9mWjpB5gjxjfxGDOC3EgNz
	 u6Fc17Zaq1WLuuFE//XcYxJWR0+0NeB9rZ9eJv2FfaDh0YN15gYMw7EEYrc1ZWmn8I
	 15NIpJO2CKN/9gc2bckhrdn6veyKMETwxxzz+btA=
Date: Sat, 21 Oct 2023 11:48:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
Message-ID: <2023102131-slacker-lily-28ff@gregkh>
References: <20231019213949.GA2922@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019213949.GA2922@ubuntu>

On Thu, Oct 19, 2023 at 02:39:49PM -0700, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>  drivers/staging/greybus/camera.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index cdbb42cd413b..405c8e78aa72 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>  }
>  
>  static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp)
> +				      struct gb_camera_configure_streams_response *resp)
>  {
>  	unsigned int max_pkt_size = 0;
>  	unsigned int i;
> @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
>   * Validate the stream configuration response verifying padding is correctly
>   * set and the returned number of streams is supported
>   */
> -static const int gb_camera_configure_streams_validate_response(
> -		struct gb_camera *gcam,
> +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,

Why change this line?

It's fine, but then:

>  		struct gb_camera_configure_streams_response *resp,
>  		unsigned int nstreams)

These lines are not fixed up?

thanks,

greg k-h
