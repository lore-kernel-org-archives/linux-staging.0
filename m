Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD4BA31
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 09:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83D2C340EE;
	Tue, 22 Mar 2022 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647939857;
	bh=bATFr0wq7Cf/1RkRBizWVvZl0hCoNH8ejbumoz6bjao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vr2C7oc0EQ5iqRCtm3aE6rhKGaJ42gHatF7i8FMLy6ZHnyK0tpMpho+KPuj+ov6FS
	 xZsS0s620vkSt6Kak2CPgn3FARjH3w/O34yKzJrhJnmdscG5WoOHwOqFO7xB9UZiKs
	 ouauTcvv3lDLdpvOHKnKDLVTxbeGjkd6bxP2kMgA=
Date: Tue, 22 Mar 2022 09:47:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: David Kershner <david.kershner@unisys.com>, sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: unisys: Properly test debugfs_create_dir()
 return values
Message-ID: <YjmNIX4RsbG8LpyF@kroah.com>
References: <20220322083858.16887-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322083858.16887-1-fmdefrancesco@gmail.com>

On Tue, Mar 22, 2022 at 09:38:58AM +0100, Fabio M. De Francesco wrote:
> debugfs_create_dir() returns a pointers to a dentry objects. On failures
> it returns errors. Currently the values returned to visornic_probe()
> seem to be tested for being equal to NULL in case of failures.
> 
> Properly test with "if (IS_ERR())" and then assign the correct error 
> value to the "err" variable.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/unisys/visornic/visornic_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/staging/unisys/visornic/visornic_main.c
> index 643432458105..58d03f3d3173 100644
> --- a/drivers/staging/unisys/visornic/visornic_main.c
> +++ b/drivers/staging/unisys/visornic/visornic_main.c
> @@ -1922,11 +1922,11 @@ static int visornic_probe(struct visor_device *dev)
>  	/* create debug/sysfs directories */
>  	devdata->eth_debugfs_dir = debugfs_create_dir(netdev->name,
>  						      visornic_debugfs_dir);
> -	if (!devdata->eth_debugfs_dir) {
> +	if (IS_ERR(devdata->eth_debugfs_dir)) {

We really shouldn't be checking this value at all.  There's no reason to
check the return value of a debugfs_* call.  Can you fix up the code to
do that instead?

thanks,

greg k-h
