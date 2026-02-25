Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BAF328B53
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018292; cv=none; b=ApAHbI7aJM6u9sZoc9SgQ0Y5qXs0ywQpi6TQVVaUwdvaBUBUATxRuv2zCSNUmnZwxzweK2JB5O1fz1qAUsZ5MKYI6XVxF4sAlEmK73VWZpmNztY3TqII+5n/oQkkPyifF446aEYbf3PQBh/DweGBPludmLcSUwfP2ruc975MlME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018292; c=relaxed/simple;
	bh=mCw3graGJESi6OWWsp54IpWjiXBaot/He/w+FaZf6ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psSbnKzXtrrOLJPNW7slV7Yl0R/6wY4b0RGPU5yKQdItlxdgH1kCaMh/EomU/kAygROWFLAurKCABkzW9aqlaVOJuuohJ0GKZnvMA04U78hrOVzOpgKWOoCXhZMYzUAqCOGNDMVDzPjdadyvINoblFFu03aKyjBlXRoxhJDxhV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZOP83YwS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZOP83YwS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so4166975f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 03:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772018290; x=1772623090; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CSSpSxGGCKDVKlBKqXysRzcuCfnzWwXAef5nbWIuSUw=;
        b=ZOP83YwSu6bsSIxifeMqVHTwVa5b5ytj74gtxZAiQbURc9SqmZlnDimdHT3CiJNMhq
         s13QUIowUH/73IFPD1MhY+sGzZ4l99IzmsUnBJ5tCMvuk7eme4cQwnuIx3SK4/2G1V+i
         3NddyEp41D3/hy6fu71RRAMF1iEr3qcFIkW3kueCa7B5Qkcqsx0ygVwG+U/infVGtqRT
         1LKMBz7GPAXz2VSIiO4BesP2jJ//HfsmenM6w/ooXpXvhNmttqdqMSgDLGget1rKuBNj
         BT03nQII2HbGMhuPuAbeHeh43LnlFkjyHoBwC41mgOYRIqGB4GzYvmUC4laMvkkTY1IU
         916w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772018290; x=1772623090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSSpSxGGCKDVKlBKqXysRzcuCfnzWwXAef5nbWIuSUw=;
        b=Ik7HyO+tV1jRCNw4FoknthURK4Xc5DN/c1h7r2KEMGIaNXozhm+Np1qFKTwC4ODWLU
         GUluJ4ifFAhFNkIokpYOav5+pPwSsnno4R7Iw/TI+tuTFLv64f4YE7kuiLOopYPrtgiW
         hKAUc+nNkrPPmh7pR658SvM5BE08BXUaVaeNT+lBHrFwZUs+s7vDVDUuPOMEsH0h1vTP
         askh2FjrUjQwFR3Sb/mxPzoocMXRbfYrJCZfPIdW5/x5WTBY6GKzeaafZBlHA4VuD/zP
         DZHlOIyUZIG9axqzWn959SaGLVpLXDPgEzdnfSvAsHGw5VsqhE3yaefMYzPiGeoUs57M
         C0SA==
X-Forwarded-Encrypted: i=1; AJvYcCVUeV0FEv8j5uvtheUL0UyxbuykKuRujB1VU0h2fBf5UtVgCZz6rdJ78OBDvZFCaLZc6QYjpDeDc2SoZI+u@lists.linux.dev
X-Gm-Message-State: AOJu0YyVj6J9lMIolCF/lPzV/ampAVVnby1hsmmNfZTA/QeMrKC+EIBB
	9MxNEv5NE5JfE61juXFjVSA0Hnh4cmxzTgvMcjVEpDybSoSUv/So+PMOt1huJqMhY9I=
X-Gm-Gg: ATEYQzyycLw8NxvhWyETjn2WO7GW68u5a1NoQCDHZLXbNVQBr+Oxr3Tqn9ftQKOW8WZ
	NRHOm01l4jzGwPJ52337MNjtCW491NblJau++nCFa9Rmg+A29vvfBHit96CPv9/Wal9JcGD2Q7B
	sXnrs0HZHcKp6P2WjSAN7/0bLnDS0F8RDUyPV7iJmkcEV+yvA+5Bb/BXk/pHp0bUAZhpPTH910/
	LTblPI/ss+sWmP3/XcoTAthKcFsIPWmb5Itu+76t0pSY37LorZy4uy7+VwqWnPR9AVjkFUcn7Q7
	fuZzjLSP25WlBrgHY6+bK3pIwk1IL4aoqHVH+XejqmMBBBjLF5TYM/gCKPdzXxIjl5syNJ36oR6
	ndAx/s0X/7mxSSu2v1QXdSMhMb0Oswd3rAVpIWQtCba5XqSQBrDwJGOibLfgXr+JsFA3gA+EbeK
	QjOUQZ0/d7mxiPUw0TAkkWREfneJs=
X-Received: by 2002:a05:6000:1883:b0:430:f463:b6bb with SMTP id ffacd0b85a97d-4396f15ada0mr29637452f8f.16.1772018289877;
        Wed, 25 Feb 2026 03:18:09 -0800 (PST)
Received: from localhost ([41.210.147.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm31458496f8f.24.2026.02.25.03.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:18:09 -0800 (PST)
Date: Wed, 25 Feb 2026 14:18:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: camera: add comment for mutex
Message-ID: <aZ7aaxEWO_7gaNzY@stanley.mountain>
References: <20260225110511.107114-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225110511.107114-1-azpijr@gmail.com>

On Wed, Feb 25, 2026 at 12:05:06PM +0100, Jose A. Perez de Azpillaga wrote:
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index 62b55bb28408..a6f3637b8871 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -53,7 +53,7 @@ struct gb_camera {
>  	struct gb_connection *data_connection;
>  	u16 data_cport_id;
> 
> -	struct mutex mutex;
> +	struct mutex mutex; /* Protects camera state */

I'm not sure what it means, and looking at how the mutex is used I
don't feel it's accurate either.

To be honest, I rarely love these lock documentation patches...  :/
They're often really vague and sometimes seem like just guessing based
on the name.

regards,
dan carpenter

>  	enum gb_camera_state state;
> 
>  	struct {

