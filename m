Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B09186A
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 20:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724790560; cv=none; b=cTBBI/Q8OiiOpOpzTytmU2iTx8rrowY0fOwofxLF+vBsyTdyJ9BgfuPTjPXaCTPRuPBmUxF44yNvX+FdRCqOSY1rW56COOUUBK3Ekqtqhw6kaBhZB69dRxRfl/zt2WX+KHDwDkhH+Yc5A8NJY7jaytBH3oE+qr4BwviYBd2OOYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724790560; c=relaxed/simple;
	bh=jpBEmBWxelW30kdJod71HrZHykpjpBD+VRwhk5peNas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kan2RqTncT4TUZ+eVAgbRo3OjngEEPEJUvstw1rJ317raCUUHnUWSOq0JMNRGhtkFBYv0oECluMkl+OgY/q7iwGPH0xScVcW3GTBTqI3tkvErlbQlYbAMJaiYsjC/ejLbA5PwiFQIeh+kx6wAnNYxX4yyV3Ow+dTPBQ+lIs6Uro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XqKF1+At; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qCwDcW6Q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XqKF1+At";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qCwDcW6Q"
Date: Tue, 27 Aug 2024 22:29:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724790549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q5O8I6R+ZOt+8soub3TuoO9hBAOUMB/FUiDAn9N49VM=;
	b=XqKF1+AtTO1/JZKAZi8bqWdqDFF/b7ZolkL3BIvCYxYIvxALqSDonmzYpjyropK9p9q+tx
	C3yVXLgwVhcAhbNpcK9xn7xBcjLXs4hQ1bynIeLJFYF4+umFYzQAg6LvCLyeb3SiZmZge+
	U6J6u8hIwUGeaRNqdCV4idzr08iKuwxP6wq3qDS0aMzamAPKgeg5X562efBCtpmVG74IHr
	PlNYs7tgsWLChoU0j7nISJCaBoSFusrt2F+6tnFCYpscZKCUCuFg2fwCN7xuxS5qJ2YZuE
	dVKmFTfvrDgYFQfkahpPHzMo8OhU7OL0RpVIasMyQC1vURCSYyk+Mw108a8iRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724790549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q5O8I6R+ZOt+8soub3TuoO9hBAOUMB/FUiDAn9N49VM=;
	b=qCwDcW6QfkV8L5F+MP4pjBaecphhkFs1TFJaTMYf1rizxRbs4O47zK2o8bKBwsIyC88oi2
	QwCEy16HG1JwohCQ==
From: Nam Cao <namcao@linutronix.de>
To: Nilo Alexandre <n1lux.comp@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v3] staging: rtl8192e: Fix parenthesis alignment in
 r8192E_dev.c 325
Message-ID: <20240827202904.vnRH1diD@linutronix.de>
References: <20240827195619.34712-1-n1lux.comp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827195619.34712-1-n1lux.comp@gmail.com>

On Tue, Aug 27, 2024 at 04:56:19PM -0300, Nilo Alexandre wrote:
> Align parenthesis to improve readability.
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Nilo Alexandre <n1lux.comp@gmail.com>
> ---
> v3: Fix typo in commit message.
> v2: Using tabs instead of spaces.
> ---
>  drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index b767dc00100aa..2d17d8e8898e7 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -322,7 +322,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
>  		if (priv->epromtype == EEPROM_93C46) {
>  			if (!priv->autoload_fail_flag) {
>  				usValue = rtl92e_eeprom_read(dev,
> -					                     EEPROM_TxPwDiff_CrystalCap >> 1);
> +								EEPROM_TxPwDiff_CrystalCap >> 1);

But it was aligned, your patch makes it misaligned, right?

Also, I couldn't apply this patch. Are you sure this patch was made on top
of Greg's staging tree?

I suspect that there is a linebreak here because of Linux's historical 80
columns limit. Now that the limit is raised to 100, perhaps it's better to
just remove the linebreak:

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b25e83743956..a80efe6c7c20 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -321,8 +321,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 
 		if (priv->epromtype == EEPROM_93C46) {
 			if (!priv->autoload_fail_flag) {
-				usValue = rtl92e_eeprom_read(dev,
-					  EEPROM_TxPwDiff_CrystalCap >> 1);
+				usValue = rtl92e_eeprom_read(dev, EEPROM_TxPwDiff_CrystalCap >> 1);
 				priv->eeprom_ant_pwr_diff = usValue & 0x0fff;
 				priv->eeprom_crystal_cap = (usValue & 0xf000)
 							 >> 12;

