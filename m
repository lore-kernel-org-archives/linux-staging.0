Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6171B352C52
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779624979; cv=none; b=KKxMtGEU9xKxLsh7RG8ujt+J7w1+YJ9C4EdzjvvLZhUPPJ5YZa6VP70E75w9gwoduA6sYFTsFH+DHyUWpuQVONDaBrOfvMMpSJ6t7FxM4BaQkKSQh+EyNyaRZZ/7Sz665c3HOrI68JHWIoZPgA5XiHOCWHTm1WehVgKXzESng8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779624979; c=relaxed/simple;
	bh=KYA7xZnWW35JlVRR6VSKn4VpCyXCYmdKdDI49M96ZCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aO8g6iXXdn6WXma5DCfYMgyrTg/8gsFKmoVpF6xCkCWq/4tbyUxcpa6FYcUT8Sx9hRy72pVsx5sabqbsNTmNgCtf+CnCw0whYsEcLemLwoLwzugOr9vjQil8M0xtulkGj2z9nVfRiWqL8JjswaKM9Ma/tjzhtAzEubHqP31dqQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=a2GY+uEX; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="a2GY+uEX"
Received: from mail-nwsmtp-smtp-production-main-69.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-69.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:a419:0:640:4647:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 6417580BD9;
	Sun, 24 May 2026 15:16:12 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-69.iva.yp-c.yandex.net (smtp) with ESMTPSA id 6GVYu6SgHGk0-0jVgq0j3;
	Sun, 24 May 2026 15:16:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779624971;
	bh=hGy6JO0zkkQToaNZYoxPExX9zmmtsCEW9z15k9z/mCA=;
	h=Message-ID:Subject:References:To:From:In-Reply-To:Cc:Date;
	b=a2GY+uEXBPpqZP54eh63p8J+vTTn4gkLmw3xO3ttEeTHnvvi4KLKblW49raN/lmGA
	 /4stxrU2KWkZ7PzFeTCKsecY3FjrmHaA2CaDcUq65JiAn8u0EoabAJEPpqNmSVodUx
	 dXGW8TgJdmFBQDcSwdufzK0crSGh88EEG60dSAmw=
Authentication-Results: mail-nwsmtp-smtp-production-main-69.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Date: Sun, 24 May 2026 12:12:48 +0000
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: onish-cmd <neharora23587@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Fix CamelCase style issues
Message-ID: <ahLqZbelgE6WWzjp@sezginduran.net>
References: <20260524115823.8813-1-neharora23587@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524115823.8813-1-neharora23587@gmail.com>

On Sun, May 24, 2026 at 05:28:23PM +0530, onish-cmd wrote:
> From: Onish Sharma <neharora23587@gmail.com>
> 
> - Rename struct members: powerMode -> power_mode, pvReg -> pv_reg,
>   pvMem -> pv_mem, setAllEngOff -> set_all_eng_off,
>   resetMemory -> reset_memory.
> - Rename enum members: sm750_24TFT -> SM750_24TFT, etc.
> - Corrected MODULE_PARM_DESC formatting to comply with kernel style.
> - Note: g_fbmode warning intentionally kept to allow runtime assignment.
> 
> Signed-off-by: Onish Sharma <neharora23587@gmail.com>

You are doing way too much in a single patch.

Also doesn't apply to staging-testing, your base is probably too old.
Make sure to base it from Greg's latest staging-testing branch.

Regards,
Ahmet Sezgin Duran
