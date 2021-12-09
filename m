Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8F5173
	for <linux-staging@lists.linux.dev>; Thu,  9 Dec 2021 08:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739E5C004DD;
	Thu,  9 Dec 2021 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1639036800;
	bh=6si4EnigSjUiEWLkIW5cwTlJeEt38NNMe4X31kf7bk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JRyK3oRx2hgMK4sU4zNzpiQu/vBQno7yDEc2Ww2W6Z7MnJ3zkqEtV1lYYio0j4Jeq
	 nCvNJRyzTJ+CsExT3SdGXzb2M+1ebgGJfVYzHuwZifOV9gBPmjA/t/LuhXnUdTmmUJ
	 CBoyzSHM1I3PY9D9k42ZotA8BBDEkt5ICp+T/5Vw=
Date: Thu, 9 Dec 2021 08:59:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianglei Nie <niejianglei2021@163.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix a memory leak in rtw_mp_QueryDrv()
Message-ID: <YbG3fUhdDp7cezk8@kroah.com>
References: <20211209073421.126251-1-niejianglei2021@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209073421.126251-1-niejianglei2021@163.com>

On Thu, Dec 09, 2021 at 03:34:21PM +0800, Jianglei Nie wrote:
> Line 6183 (#1) allocates a memory chunk for input by kmalloc().
> Line 6204 (#3) frees the input before the function returns while
> line 6190 (#2) forget to free it, which will lead to a memory leak.
> 
> We should kfree() input in line 6190 (#2).
> 
> 6177 static int rtw_mp_QueryDrv(struct net_device *dev,
> 6178 			struct iw_request_info *info,
> 6179 			union iwreq_data *wrqu, char *extra)
> 6180 {
> 6182	char	*input = kmalloc(wrqu->data.length, GFP_KERNEL);
> 	// #1: kmalloc space
> 
> 6186	if (!input)
> 6187		return -ENOMEM;
> 
> 6189 	if (copy_from_user(input, wrqu->data.pointer, wrqu->data.length))
> 6190 			return -EFAULT; // #2: missing kfree
> 
> 6204 	kfree(input); // #3: kfree space
> 6205 	return 0;
> 6206 }
> 
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index 1fd375076001..0524523910f0 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -6186,8 +6186,11 @@ static int rtw_mp_QueryDrv(struct net_device *dev,
>  	if (!input)
>  		return -ENOMEM;
>  
> -	if (copy_from_user(input, wrqu->data.pointer, wrqu->data.length))
> -			return -EFAULT;
> +	if (copy_from_user(input, wrqu->data.pointer, wrqu->data.length)) {
> +		kfree(input);
> +		return -EFAULT;
> +	}
> +
>  	DBG_88E("%s:iwpriv in =%s\n", __func__, input);
>  
>  	qAutoLoad = strncmp(input, "autoload", 8); /*  strncmp true is 0 */
> -- 
> 2.25.1
> 
> 

Again, what tree are you making this patch against?  This function is no
longer present.

Also, when sending more than one patch for the same driver, always make
a patch series so we know what order they should be applied in.

thanks,

greg k-h
