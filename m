Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18C430C614
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393224; cv=none; b=h8EOY7hpM9hJ/6kIYsTdBzWhDoAa9qkIhJqUxC0drdcosV5w2lDNIJPgOOEGtfskENNiEDSZ3U3bzNhYlkVR1kgBaKL1YqQwiGnwRXRLtWJEAbcqMXvLef/Zq1TPV30IFgHBT32/tJdRnHm8i28C4OL99YbE0wQNcFxlPVN6+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393224; c=relaxed/simple;
	bh=uqXvYwoxCnCH9ReCzbAtbwb5TAfiU+BGdX3lHCNGAs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNhNTuMvYtpSy/FUqpNpMqKdOx1KNLoAOXiHOa+k6DztA7Xi3UQkbqR8ntla0qyU2ajDo6Yyas417830NuLU36Jk52II8mTW29o7uWZDiBLcoQe6VDczfszV0OVxu3SVpdq0uWfSslW1J4B3JFk1tSjd38xPNMjbFzkDX4FT/8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Tr5VxNOT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tr5VxNOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1027BC4CEF1;
	Mon, 22 Dec 2025 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766393223;
	bh=uqXvYwoxCnCH9ReCzbAtbwb5TAfiU+BGdX3lHCNGAs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tr5VxNOTTJlxZ/U3SsX9A8foGfA6IK2tbj/jcyfNIymzY6P8cbjfxNDctSB103GC/
	 QphhBFTYypBTO1ou8mZ/Vzzv7/8cMgar/lv1S/UdVQ9b1iTeV58EhmH7PGDrIXj1im
	 QT0VaXsmNYaW+wSKgjJZKJrWEzOCEEBuypC01nx0=
Date: Mon, 22 Dec 2025 09:47:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: linux-staging@lists.linux.dev, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH 4/4] staging: greybus: greybus_firmware: fix long macro
 lines
Message-ID: <2025122240-exponent-polyester-f9c3@gregkh>
References: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
 <20251219063415.46818-5-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219063415.46818-5-zhanxusheng@xiaomi.com>

On Fri, Dec 19, 2025 at 02:34:15PM +0800, Zhan Xusheng wrote:
> Break long ioctl macro definitions into multiple lines to satisfy
> checkpatch.pl line-length checks (<100 columns).
> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  drivers/staging/greybus/greybus_firmware.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/greybus_firmware.h b/drivers/staging/greybus/greybus_firmware.h
> index b6042a82ada4..f59a2def3d45 100644
> --- a/drivers/staging/greybus/greybus_firmware.h
> +++ b/drivers/staging/greybus/greybus_firmware.h
> @@ -64,11 +64,16 @@ struct fw_mgmt_ioc_backend_fw_update {
>  } __packed;
>  
>  #define FW_MGMT_IOCTL_BASE			'F'
> -#define FW_MGMT_IOC_GET_INTF_FW			_IOR(FW_MGMT_IOCTL_BASE, 0, struct fw_mgmt_ioc_get_intf_version)
> -#define FW_MGMT_IOC_GET_BACKEND_FW		_IOWR(FW_MGMT_IOCTL_BASE, 1, struct fw_mgmt_ioc_get_backend_version)
> -#define FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE	_IOWR(FW_MGMT_IOCTL_BASE, 2, struct fw_mgmt_ioc_intf_load_and_validate)
> -#define FW_MGMT_IOC_INTF_BACKEND_FW_UPDATE	_IOWR(FW_MGMT_IOCTL_BASE, 3, struct fw_mgmt_ioc_backend_fw_update)
> -#define FW_MGMT_IOC_SET_TIMEOUT_MS		_IOW(FW_MGMT_IOCTL_BASE, 4, unsigned int)
> +#define FW_MGMT_IOC_GET_INTF_FW			\
> +	_IOR(FW_MGMT_IOCTL_BASE, 0, struct fw_mgmt_ioc_get_intf_version)
> +#define FW_MGMT_IOC_GET_BACKEND_FW		\
> +	_IOWR(FW_MGMT_IOCTL_BASE, 1, struct fw_mgmt_ioc_get_backend_version)
> +#define FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE	\
> +	_IOWR(FW_MGMT_IOCTL_BASE, 2, struct fw_mgmt_ioc_intf_load_and_validate)
> +#define FW_MGMT_IOC_INTF_BACKEND_FW_UPDATE	\
> +	_IOWR(FW_MGMT_IOCTL_BASE, 3, struct fw_mgmt_ioc_backend_fw_update)
> +#define FW_MGMT_IOC_SET_TIMEOUT_MS		\
> +	_IOW(FW_MGMT_IOCTL_BASE, 4, unsigned int)

The originals are fine, ioctls are messy, it's good to see them all on
one line usually.

thanks,

greg k-h
