Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6F672
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 08:42:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C64E60F6F;
	Fri, 27 Aug 2021 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630053757;
	bh=Wi+hqYvcZj79USE4XMLdmv/0UzddAaB7Y0OacSwib+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMMGtyVQWuqvA5fPmvaCMihXq39KleoWEGVExfDwViWdWzLuhKnalrgiIxP5Eaudx
	 uumKI99pR7VLCYjGFL8odYwUWdg1MD7+6q51VeedV7wWrsKlj3QTpxg2eD+0KN+11J
	 Z5znxDHwRjcgl9I5RoesbrxgwdEgkUMfLPQoEPpA=
Date: Fri, 27 Aug 2021 10:42:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 5/5] staging: r8188eu: Use vsprintf extension %phCX to
 format a copy_to_user string
Message-ID: <YSildgE0Ul4akIUJ@kroah.com>
References: <cover.1630003183.git.joe@perches.com>
 <152e1b8f84c4686ea38182ca55344ed7f2cede65.1630003183.git.joe@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152e1b8f84c4686ea38182ca55344ed7f2cede65.1630003183.git.joe@perches.com>

On Thu, Aug 26, 2021 at 11:43:05AM -0700, Joe Perches wrote:
> This reduces object size without changing the string content.
> 
> compiled x86-64 defconfig w/ r8188eu and gcc 10.3.0
> 
> $ size drivers/staging/r8188eu/os_dep/ioctl_linux.o*
>    text	   data	    bss	    dec	    hex	filename
>   72556	   1548	      0	  74104	  12178	drivers/staging/r8188eu/os_dep/ioctl_linux.o.new
>   72758	   1548	      0	  74306	  12242	drivers/staging/r8188eu/os_dep/ioctl_linux.o.old
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index ab4a9200f0791..048164659d872 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -2907,10 +2907,8 @@ static int rtw_p2p_get_groupid(struct net_device *dev,
>  	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
>  	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
>  
> -	sprintf(extra, "\n%.2X:%.2X:%.2X:%.2X:%.2X:%.2X %s",
> -		pwdinfo->groupid_info.go_device_addr[0], pwdinfo->groupid_info.go_device_addr[1],
> -		pwdinfo->groupid_info.go_device_addr[2], pwdinfo->groupid_info.go_device_addr[3],
> -		pwdinfo->groupid_info.go_device_addr[4], pwdinfo->groupid_info.go_device_addr[5],
> +	sprintf(extra, "\n%pM %s",
> +		pwdinfo->groupid_info.go_device_addr,
>  		pwdinfo->groupid_info.ssid);

We can just use the lower-case one here, no need for a new modifier just
for something like this (i.e. log file output)

thanks,

greg k-h
