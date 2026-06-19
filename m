Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27DC373BEC
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864736; cv=none; b=ZZlwezB1k5M6bvJhouuKrblWZGiTD6ABOBmzh42zrJmpIR834XMYrnVs4CH2ustKjZj5+9EH8x2wLlHNn16j1a4kw4NV3CzBr2GfX9a5i/sE3X1rAGP2f1BfCf0dj6FKXnItROFRUsX8zI4Q/L6rrVP23AV0ldh7Y4fwv2Uo05c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864736; c=relaxed/simple;
	bh=hc+o/tDT5bhjld22gHaN9XI/LKjR1lIpPoh1B0be484=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0q/xxhq5Pyfkl0/dQheXBvJIsHYVb8xHx62EdwkEFiZ6+nNoxJJl3+FmOhh1wPqyuPoNMHoD7vVuCiZdJsQA7MJ+nEBMWzPZVmZpkGFsuFM6TNf83uXG4Mifjs34WY3EeSuVrUqxxlHw3MQLpWOTA2RSvPYcwxsnDIz04tzibs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KANhgEz9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KANhgEz9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1773903f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781864730; x=1782469530; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7yIBh4a9mTMSksbkiLiS0IpFfkedL+uRoboln/D2zvU=;
        b=KANhgEz9hjnmN7oVoO8HxdioTL8YZgEkXl7imLJSskhiDxiQA2oSx8pG6LbcvRrpJa
         VWVrH4UkxjKYDB77p1luX2+UgFsp4CsHckaaqf5EzGxO07/6I8Qq2Gxa6DgNsgWQQxUQ
         IbX1HqQYr1FexQwLSmtT4UbtOKum+GcoQh33Kf8uOxvY+Vs9XPO5w7vrRKj/HpFwsXh0
         A3yc5UfrFB6xJQyR4tuZOfJaR+FJsWL3aI2Sa/YnSurzQp0zWIAYW/VcOMns/+N3zzL2
         tJsie1wIPawzwWQ0DMsI6TjJ6T8Z/wMy6zRgszn0hXT1j6DbIv3v/6m/2MSa0Lg54KR0
         k8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781864730; x=1782469530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yIBh4a9mTMSksbkiLiS0IpFfkedL+uRoboln/D2zvU=;
        b=H8ELXmee2/bR5s36je0FGr2wbyEQiMEOpGIxqJ9aBcyDbQqa8S/0NOJENMYXtG6tQt
         Pw6Q9LOaKQnal+/c7jJ6b+2oXWGHtZJysSzz28MjiUx0YAbFUVsu3c8aYa+WmQ49vzTw
         dyMOK2Yyqu3I4Rn6wusy4lKZkpgg64kZIHOk1+rgpztOemuibst+SJChFnYuUs5zcaoj
         GRiv2MN6kcpCgkwj8aGCnBwVuyhOPEg34Kz+nynsW7+kGVMjupUTjWfyWm4ziiylVNnQ
         zqVp4Wo5eZuh5qMWZF/PIG1XUdnS3S9htuIC20rn7ddcTPggVncKuCAneZxLgxC0t5PX
         kbjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MldoYGv+OsFqkWeH4nYCHhlT8AmyPOox4PhhPx7yB9dmdBj0XWF0eNS1fzOsBLlQMM8tpL2yKw8JFqDDP@lists.linux.dev
X-Gm-Message-State: AOJu0YyZV0dCzxfWygMHsaZu7YENn64wpWlJwYvNby9sWC96j7wHoX00
	/ud5xb/eMox0OtNBCN9xRGNUzst+iXUZXhcTEpZQvFrPQNVUbNLoHsEe
X-Gm-Gg: AfdE7cmBnAhQt4NK2f9UYvvMs9EWYEIgzAR+i3RpEKatbqOnJZFWMPY4iPMkM19yLZP
	w+gpsZsw98inCO18c/tsW5jzfw5cz75lFGSPDN3ZpR9D34lCznQOf7rInrvhN5hl4qRbZS0B2uw
	VqyTYj/iqKaV5lE4T8gauJHmwJEPWh1/xt0rAij43kZ5CiKMl3fV7TaEQHLe0WeCn6oRwmvXbtW
	syfpz1hAFkol/l7oU6pyHs/QWKq0J+p+ukiGyUKVLHoc6sSGsk84gEBlayYymlSPRTppxio+j3t
	GMfbAEKAj+72fNVzi3JixdU87j7awAqusg8wbzQRK33I8pa/Vjt7D9czwdAIzaIJNAM7Qf/nPTk
	ir81iRAqFFtQiAhmCsUjBuuyMQxg/7WwYhOGrCqPjH6GHTXSlworNGIfSsp1zlwK1I2t3ZKJzyy
	XphKSWj5g=
X-Received: by 2002:a05:600d:15a:20b0:490:5000:917 with SMTP id 5b1f17b1804b1-492409fbfc4mr28454445e9.1.1781864729725;
        Fri, 19 Jun 2026 03:25:29 -0700 (PDT)
Received: from localhost ([41.210.141.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm55141745e9.6.2026.06.19.03.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:25:29 -0700 (PDT)
Date: Fri, 19 Jun 2026 13:25:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alonso Garrigues <agarrigues@riseup.net>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant condition in
 wlanhdr_to_ethhdr
Message-ID: <ajUZFBS5KoIu1MqD@stanley.mountain>
References: <20260619101300.1841338-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619101300.1841338-1-agarrigues@riseup.net>

On Fri, Jun 19, 2026 at 11:13:00AM +0100, Alonso Garrigues wrote:
> Comparing boolean return value to true with == is redundant.
> Remove the explicit comparison and the extra parentheses.
> 
> Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
> ---

Someone already did this.  Please work against staging-next or
linux-next.

regards,
dan carpenter

