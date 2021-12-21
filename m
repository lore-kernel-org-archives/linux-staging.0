Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C73173
	for <linux-staging@lists.linux.dev>; Tue, 21 Dec 2021 06:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62232C36AE2;
	Tue, 21 Dec 2021 06:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640067588;
	bh=sNp5KW8FciYVu7KbI/Elxa/BX747ZvrsGR5+FhLtjIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZcH5b57fUscJnA6P5MMxBLvC2bjVa75dma/Kd9sQ+IetW7UPmMeAOwh8zjokxS4w
	 P6izh86sER6BJ4laszXI30ve5j0JbkoD2dojwGcT4ECHtt8lz70ZsmhrHpBGLojIhe
	 XFwF1bR9V3f5IO76mlB/vLPbWnDiPhsAZaL3npyg=
Date: Tue, 21 Dec 2021 07:19:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: linux-staging@lists.linux.dev, nsaenz@kernel.org, f.fainelli@gmail.com,
	rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	juerg.haefliger@canonical.com, rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com, stefan.wahren@i2se.com,
	unixbhaskar@gmail.com, mitaliborkar810@gmail.com,
	phil@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] staging: vc04_services: avoid the use of typedef for
 function pointers
Message-ID: <YcFyASAYo6yimT8W@kroah.com>
References: <cover.1639858361.git.gascoar@gmail.com>
 <7f681ccee713ef8600f40c765b6a59e119c6bf2c.1639858361.git.gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f681ccee713ef8600f40c765b6a59e119c6bf2c.1639858361.git.gascoar@gmail.com>

On Mon, Dec 20, 2021 at 06:29:12PM -0300, Gaston Gonzalez wrote:
> Replace typedef bm2835_mmal_v4l2_ctrl_cb with equivalent declaration to
> better align with the linux kernel coding style.
> 
> Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> ---
>  .../vc04_services/bcm2835-camera/controls.c   | 76 +++++++++----------
>  1 file changed, 35 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
> index b096a12387f7..7782742396fc 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
> @@ -65,13 +65,6 @@ enum bm2835_mmal_ctrl_type {
>  	MMAL_CONTROL_TYPE_CLUSTER, /* special cluster entry */
>  };
>  
> -struct bm2835_mmal_v4l2_ctrl;
> -
> -typedef	int(bm2835_mmal_v4l2_ctrl_cb)(
> -				struct bm2835_mmal_dev *dev,
> -				struct v4l2_ctrl *ctrl,
> -				const struct bm2835_mmal_v4l2_ctrl *mmal_ctrl);

Function pointer typedefs are ok, if they are needed.

> -
>  struct bm2835_mmal_v4l2_ctrl {
>  	u32 id; /* v4l2 control identifier */
>  	enum bm2835_mmal_ctrl_type type;
> @@ -84,7 +77,8 @@ struct bm2835_mmal_v4l2_ctrl {
>  	u64 step; /* step size of the control */
>  	const s64 *imenu; /* integer menu array */
>  	u32 mmal_id; /* mmal parameter id */
> -	bm2835_mmal_v4l2_ctrl_cb *setter;
> +	int (*bm2835_mmal_v4l2_ctrl_cb)(struct bm2835_mmal_dev *dev, struct v4l2_ctrl *ctrl,
> +					const struct bm2835_mmal_v4l2_ctrl *mmal_ctrl);

No need to rename this function pointer, why not keep it at "setter"?
That would make this patch much smaller and more obvious.

thanks,

greg k-h
