Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D3C3B0AF8
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149657; cv=pass; b=HAk9tp41k9j+07bTfotJtWYJrUOUB4hEYFIlydGiwr+R16aiYl2/u2ltdhupuhRqjqNUe4cpz9+JjhDS6D+ba1I2PcXRW02QAA8gOj5REFI4963ctB4B8oNdMU6YVACKSDilszBv4uQ5ph3qGZ3ZcJ5iunjJWkBTr9q8zPmMmGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149657; c=relaxed/simple;
	bh=XvtusBtLttv6uK31N5gEOAYnd5cCzIPklCZEEQwool8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe7krjaqp2dBnKJhMNBWdZJihWcP4u1gCOMmkrmPsjWslkotVhxtCXPWaklvQ8vtgnpFXRuKuu+Q8qaoQxwpqTps2fCMTxqpOPZve+evwMcq4f/vJ6XJ0ux6npnIP3Il6ntIeTOdt2hISIY/8z8Wk/s3n5xn3WHvCUEOu8fD7UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=A1RM/A4Q; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="A1RM/A4Q"
Received: from hillosipuli.retiisi.eu (n18ws8cotp5c1dsf-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:1157:8c0f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fVZbf4kjCzyTZ;
	Tue, 10 Mar 2026 15:34:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1773149647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbbCoMIKHho8A2lZAHILdn3DiD5n6G5yZxvhwBhsg30=;
	b=A1RM/A4QmSvd89WyBtC2iQ18ncfLw39QUUE9Mg4Hi4OT36eiXrNAra44zCDQ8qX9+cMYNl
	/Wr3Txxn5FxAUOVJrPAfrE9P3WJDVmyowecvUWQqI8Kg9rEv/mvK0OkmpJ6DPNuT+vTCN3
	6JSweSav/bbOXbrkrUpzTZ42Z+wNJmY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1773149647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbbCoMIKHho8A2lZAHILdn3DiD5n6G5yZxvhwBhsg30=;
	b=tPNymujrBqSh+81ABhyYQdxz7aGr7sN9VFaVJnH1UZonzTAB4u2GJRlyuWc7CrbdiRpyRt
	WtSBI2FSSsjuZNDH+LyyCWZas+z2LLkRhkxfBEAAmlVuWDyCv5v03nYqzMX9TfyBAbb2Kj
	SjJDQlGKJOvhba25/SVlyWttkTd0HuQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1773149647;
	b=WD0myuJtCdSMY/Me0UhHwGmykauJLLB7BBYLfxMQ3TgtwB9Hh7MLgc5Au/3QSJdttQ1Ir8
	LV7XcmkFjVm2n+jC2LAEqcdbfkowF4kVnYJoT8ew4w6j8rWtj2f3PNkQfR1gdjTIEnnM9y
	515SDEEke0nruSDe2KrNcVpCTAbawpU=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 27AE1634C50;
	Tue, 10 Mar 2026 15:34:06 +0200 (EET)
Date: Tue, 10 Mar 2026 15:34:05 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-media@vger.kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: i2c: replace msleep() with
 usleep_range()
Message-ID: <abAdzZYJXhjpJIWb@valkosipuli.retiisi.eu>
References: <20260307053311.15746-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307053311.15746-1-marusik.adamenko@gmail.com>

Hi Mark,

This is a patch to the (atomisp-)gc2235 driver, not to atomisp itself.

On Fri, Mar 06, 2026 at 09:33:11PM -0800, Mark Adamenko wrote:
> checkpatch.pl flags a warning for msleep() being called for 5
> milliseconds. Replace the msleep() call with usleep_range(), as is already
> done in the same function.
> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index d3414312e1de..db5e007efc56 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
>  			goto fail_power;
>  	}
>  
> -	msleep(5);
> +	usleep_range(5000, 6000);

I'd use fsleep() here.

>  	return 0;
>  
>  fail_clk:

-- 
Regards,

Sakari Ailus
