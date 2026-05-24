Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3275204F93
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 11:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779623015; cv=none; b=us3sKnsw8U8T1my6qt9DztAG0hOhR7/s5/RE6uxtKVjmjeKbvODHoNYXxWPX/Fn71stg1opwfhmHiRjyYc6/WuXUPCsjcvymUdyh7jMQXXEw6Z77JW5dLNeTU0tjCBevubpZ7CmShUtbPQw+AyUaZfNpekqXuANbmg3Juah60vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779623015; c=relaxed/simple;
	bh=Gr2kwBB38leXZL15pRyIDUOpaSxBi2u352YA8JO8tsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmzJsyAICi+AiM5quyd0rQHRVqyM9v7fKepgiZbHUliwLvBAJZohWy84QtHQcsBT8UkHYXSFV3OiaEQNCZt4BC/nJM+0rvc/5amQcXtAHD0QIIoboIaw0DiziqinZOkAwW80teRmmxEYXknOHuxU1LJQ5yprdlyn4xuQjzHPLjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=GGdyP95w; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="GGdyP95w"
Received: from mail-nwsmtp-smtp-production-main-57.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-57.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:494f:0:640:ed81:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id 37EFCC07D8;
	Sun, 24 May 2026 14:43:26 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-57.klg.yp-c.yandex.net (smtp) with ESMTPSA id LhUerKYeK0U0-E0dYCL69;
	Sun, 24 May 2026 14:43:25 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779623005;
	bh=zZkwaCH+GGaJu1s0iUThbA+LseTK7NykHDhEMGfQZ7U=;
	h=Message-ID:Subject:References:To:From:In-Reply-To:Cc:Date;
	b=GGdyP95wkPIjB77C84jsASoqkIH6MKEOsUE8HoeJyqxi5AKws3li71QJZ1ITyOWng
	 +CbE/55hunBGz3cNxJcrzlZukZmeR5Lm65n4TedaxJP7x1GY7XkVR8VFHxj0lbmQDc
	 GiAcqxfKpQzxDwobsZGVcHf8F2vgCpS+0IomT9Z8=
Authentication-Results: mail-nwsmtp-smtp-production-main-57.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Date: Sun, 24 May 2026 11:43:21 +0000
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: hal: Remove unnecessary blank line
 in hal_intf.c
Message-ID: <ahLj9YqgZLZUY7Mm@sezginduran.net>
References: <20260524085732.20153-1-praveen.pattar2022@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524085732.20153-1-praveen.pattar2022@gmail.com>

On Sun, May 24, 2026 at 02:27:32PM +0530, Praveen Jayaprakash Pattar wrote:
> Remove multiple consecutive blank lines that violate kernel coding style.
> Detected by checkpatch.pl with --strict flag.
> 
> Signed-off-by: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_intf.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
> index 27c0c0198714..6b433ac72d14 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_intf.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
> @@ -264,7 +264,6 @@ void beacon_timing_control(struct adapter *padapter)
>  	rtl8723b_SetBeaconRelatedRegisters(padapter);
>  }
>  
> -
>  s32 rtw_hal_xmit_thread_handler(struct adapter *padapter)
>  {
>  	return rtl8723bs_xmit_buf_handler(padapter);
> -- 
> 2.54.0
> 

Does not apply to staging-testing. Please make sure that you are
creating patches based from Greg's latest staging-testing branch.

Regards,
Ahmet Sezgin Duran
