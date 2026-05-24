Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BED5156F45
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779622628; cv=none; b=ACUi3Y/do1qs/TFrwq0+S8VBJf/iPsfnfoh4T71JYuAV5q9RYAlf8B5srzMWHF9zUruJl2sVOAbg9UuUr6ZNUqcwEJctW0QV7ZYl+m9Rui94o/bJINl69bGIiMwJhZM4T6WqylkQVBwPfvtbsmPqcQMHppued4OYbT7sbTortvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779622628; c=relaxed/simple;
	bh=JDS15T2cCU3kNO5EoOzMHK97g2r+Nb5MoR5qHGAmpnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsxXuo4YaV/NDwKe3hZaKUTB57nvcM6e7BRwOkNAdMZCPtPt2tCXwBUSA8DTPTIenFWJNpWjQqGMi3xD4AZ7WcmzqJy5SVUS/jpa4ve6N4emBchnCRTbhV9pxHJGbSMKI9SI9dXXr/ixCMTPMKNfBd0yfuDIoNG+YiMA+JL27HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=o2gAdwgc; arc=none smtp.client-ip=178.154.239.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="o2gAdwgc"
Received: from mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:f85:0:640:673a:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id 6AFF7C06D5;
	Sun, 24 May 2026 14:36:54 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (smtp) with ESMTPSA id oaUQfOXdYOs0-PhgwleaC;
	Sun, 24 May 2026 14:36:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779622614;
	bh=w86NeyHvZnV6vNIjWrNl9xGKqc00yZH9DdZlbcdcutc=;
	h=Message-ID:Subject:References:To:From:In-Reply-To:Cc:Date;
	b=o2gAdwgcB+Sp5blCOKy84rXV3sqWZZXmsl1ZHyIbO+PydPBVNXya9HZutOWHFJnNo
	 0Hhw+HEV6Vd+/GCvVAxYj2xRXicSqSWcdii66hnAVDTV8DuvMvj+YLDEYVEUdbdOmp
	 zOssm20gjLa6x1R13/FQU629sCFixl4Y+8jXDk2Y=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Date: Sun, 24 May 2026 11:36:50 +0000
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
Cc: gregkh@linuxfoundation.org, ethantidmore06@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: hal: Fix block comment style in
 hal_com_phycfg.c
Message-ID: <ahLisKRbIN-0_-PD@sezginduran.net>
References: <20260524095949.20819-1-praveen.pattar2022@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524095949.20819-1-praveen.pattar2022@gmail.com>

On Sun, May 24, 2026 at 03:29:49PM +0530, Praveen Jayaprakash Pattar wrote:
> Fix improper block comment alignment where '*' on each line had two
> spaces instead of one before it. Kernel coding style requires a single
> space before '*' on each line of a block comment to align with the
> opening '/*'.
> 
> Detected by checkpatch.pl with --strict flag.
> 
> Signed-off-by: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> index bdd595a99b98..9f513eb92ff8 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> @@ -407,9 +407,9 @@ struct adapter *padapter
>  }
>  
>  /*
> -  * This function must be called if the value in the PHY_REG_PG.txt(or header)
> -  * is exact dBm values
> -  */
> + * This function must be called if the value in the PHY_REG_PG.txt(or header)
> + * is exact dBm values
> + */
>  void PHY_TxPowerByRateConfiguration(struct adapter *padapter)
>  {
>  	phy_StoreTxPowerByRateBase(padapter);
> -- 
> 2.54.0
> 

Does not apply to staging-testing.

Regards,
Ahmet Sezgin Duran
