Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF665332EBC
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 08:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776501800; cv=pass; b=aikCfljLjnVCv9/Wottg2MEqWsfrz6tjsbmywKwWhW3iNFpPoc+x82pA12sslVwX+qd20o/U0ffEtrgCDmrNlDmeGHgvdiCdLEmnY12P3ogoKODeAenBjikAH6U5Edp3TbFoF3hPEO2+vl776KBGgKkLQDGiinKSRNCyeabwkiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776501800; c=relaxed/simple;
	bh=4yjmMrtp0YJpQNtdbEeOzp8QVDTlPiEntvHWa6ArwtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWhQpStmsntsSqSAWCbRcGUUrGBVa8nhA6uhSZcapJgG/p9ws08oABgk9vTwNeGqokbNDYmfF4OqbrhJcsx9TvGWVw5BxtJCMguSYR7+Y+/PrxiAU/zraPFa0qbXItJ9k5xuxxQX3T42JyLfrMXz5rcXF7+Y86KseD8+WxlKz4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=DOY5H+LP; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="DOY5H+LP"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyQJ44qPpzyRd;
	Sat, 18 Apr 2026 11:43:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776501796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qDMMSPK/6+xf9b1K6hn8WqRNPYOrf89U93dU+NspwHk=;
	b=DOY5H+LP7wXYntzjQehcDnVQ4F9CZzN0jrrOICV80COjfVCTrFb6wN6lYKz62SM8w8i2ys
	PkxA6HnG/MZ9+Va+et33vF5NJxcJUrUmzzpwv4BP5tiavBeB2gjORIN1ejJ6lEW5J0GrQS
	dmhzXJCaKI/IARgpvtUVX8poudMYFBw=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776501796;
	b=FAFTVM7iBQkz2n1bt9P7zvhICI/+uDIJ3hP7Dj/YKG3UMT1SEtSoAQjJalTBmYZ87wUGSm
	5YSPRy56pniZTxP4y31nkDAMyQEZlG7RCM0Kx9FWg5UI2Dq4qjYlpQiDp7ZMEkz/dc94oP
	ATtU/xTP81Kw9hf9QMX/DRej5BbuR3o=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776501796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qDMMSPK/6+xf9b1K6hn8WqRNPYOrf89U93dU+NspwHk=;
	b=AYNN29XlWxkUtMayI4b7tk4++vaKVKctveIg/zBttGDdObaZ2CR/t4aG+D6dAL9j9XrLYm
	OHGP2Moe3pJYiF7FlA2i27OIkYai4ucPeWdk25L2IStQb6htE1J7EHVZPIJfH+wPM5dkJo
	dXGJ1i7aSzber9OAOqBA/ic+RNX48cA=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 38FD1634C4E;
	Sat, 18 Apr 2026 11:43:16 +0300 (EEST)
Date: Sat, 18 Apr 2026 11:43:16 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: remove useless return statement in
 atomisp_cmd.c
Message-ID: <aeNEJBJ660YHPfRV@valkosipuli.retiisi.eu>
References: <20260301212900.3783-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301212900.3783-1-rayfraytech@gmail.com>

Hi Oskar,

On Sun, Mar 01, 2026 at 10:29:00PM +0100, Oskar Ray-Frayssinet wrote:
> Remove unnecessary return statement at the end of void function.
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index d5c5895e06e2..de0446997154 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1417,7 +1417,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
>  
>  err:
>  	atomisp_css_free_stat_buffers(asd);
> -	return;

I'm sure there are more of these in the driver.

>  }
>  
>  static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,

-- 
Regards,

Sakari Ailus
