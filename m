Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BD8FBF7
	for <linux-staging@lists.linux.dev>; Thu,  4 May 2023 14:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC219C433D2;
	Thu,  4 May 2023 14:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683212052;
	bh=TmACzxlSeb+WERvLsvXQwELOey/j51OsQ52OPnlwneM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGc7/jfZgBMqdOT/Q8ZklvtXELuPyC9G8Adup84Tf9khzhzWdDv88vQQ9IDmJm1Sf
	 1n4pccodaWrjOOxU2AuhH0AhIf+m75+vtQOctPrO6jmPvVaoQPuaazFvTkDj3ZNCcs
	 KxlZJowPBY61AortnBGbZBlPSZKNmF2RT4k+MD6kTJmdctso3MMxdpxf+KgWg7YI3t
	 h7TvpRp4hQ3t65AbR3jzyG4LkkR10bddkOijzbDvowHKWwjpWhdRqbA1jpg/nWKPh7
	 p91/odYPl18phx6XoRXPLc0MerVB7Vh/KE/eL4BlsoeVvQy/kkeOMc6FRbd/DjbBIr
	 ANWGE77uzyqFQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1puaLc-0004eW-Oc; Thu, 04 May 2023 16:54:21 +0200
Date: Thu, 4 May 2023 16:54:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jacopo Mondi <jacopo.mondi@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@google.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: staging: greybus: fix GPF issue in
 gb_camera_capture
Message-ID: <ZFPHHImqiVRRV5Cd@hovoldconsulting.com>
References: <20230504135841.1566958-1-dzm91@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504135841.1566958-1-dzm91@hust.edu.cn>

On Thu, May 04, 2023 at 09:58:41PM +0800, Dongliang Mu wrote:
> In gb_camera_capture(), it does not check the value of settings
> before dereferencing it. And gb_camera_debugfs_capture calls
> gb_camera_capture with the 6th parameter settings as NULL.

Looks like you just broke gb_camera_debugfs_capture() which relies on
passing NULL as settings.

> Fix this by checking the value of setting at the starting of
> gb_camera_capture.
> 
> Fixes: 3265edaf0d70 ("greybus: Add driver for the camera class protocol")
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  drivers/staging/greybus/camera.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index cdbb42cd413b..5a4b26e7f645 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -659,7 +659,7 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
>  	size_t req_size;
>  	int ret;
>  
> -	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE)
> +	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE || !settings)
>  		return -EINVAL;
>  
>  	req_size = sizeof(*req) + settings_size;

Johan
