Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A6371D0D
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649481; cv=none; b=ZNjdbGc/nyOhjD90y3TMbj5cnljIKVG/g/QhMw8GvnjR7aSFV9+gUx85YHkY7utY1KqGVS9RTdBVYNR5AcqpVq2KomZTyaBQy05QRPe+5ngMym9rPBFCfR339vOHG+x8M9zRNWBnYjGobVJlJ+Tt7dS5g2fNcnvitKcHHJw26Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649481; c=relaxed/simple;
	bh=3miNijcwl8Jc3wYIr0XHhXDKC8OavmVDnnPlzDD8k7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkqqJnShn/IQdWj8Pj0svDq4kqAbvMGQ34xTy0HbvRTYb2bBLfeAuGYZyiRy+Ux2acPaZNY7IL5T7V8a8Auag4p1CSMQUqDBMcusk+uygKfIm5PKI6y99ZtBUbS4F+YSupTOBWRwNy4LtSLoaYjDaWlyey/Tld1uZAYNBjZBWoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b/PuuKXM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b/PuuKXM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f454be5bso49332195e9.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773649476; x=1774254276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3irUY7KhJqlEd3mK9i9xdShte5YmZbK2Krg9U/BlPg=;
        b=b/PuuKXMHALvolAAfeysDhlfyP7zqMsy22PF9mnlKVgL+8plRY9zX1msBHcJq27dlA
         9LBbYJN5EpmOycA1SrqSdO+I5D+uKfDQF2YvGpubr8hm3NywIzn7t5GAYJZoIyDKCzar
         cBcxpeOCnkI1gy+0iMjwXj5pHEa5VbWbgGHh4kadxGQIxOtfze+5XuQaTDUxJ3U0xNcq
         ohOweD6908lTCIuDO1Hh1JHI+EgTOPSUKmVYbnelik7j/c9uipGMAMRqzOP7gam39FKx
         OJxReYXK+b59oQXszf8fJdu8OL6hylOoQGL23lBDD3Q3CAsNuSBwfftlwhxmXra8dMuE
         7jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649476; x=1774254276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3irUY7KhJqlEd3mK9i9xdShte5YmZbK2Krg9U/BlPg=;
        b=KtDVmD1LGFC56mI1IGZfenzDpLXocJ0OiNoowMHD7Tde+VCxsRedp9EmUX63vflhzH
         BpOGzrBq5KZGWzTzjZMSUOjgPfksiIBh8wyP4AvDDvM1Etv9Yg4jFT5sXsTnh7UToHsz
         f5XgAcxdLMvkWXYkbVf6vjQWZJKeqoRwU7fO6j6ObIZ1x54822OIAqS11noBprqXMWuY
         npki3BbHTuy/PlbjNRHP5BKHxBqAHbfAcbaEDxMLa2HwQmmmiQBk7BYP8gOq3gS5JskC
         aj5bg/wVWuTwsJPFViwkuPjHRG/yW+fJSwUJ3HZcUW+0V/iZslzCG2ak47g78WgflAHh
         cCbA==
X-Forwarded-Encrypted: i=1; AJvYcCVnqlWvtD0VsGwaV/+xwkJZSgjUEG9ZnRW2GU9AFbeScglFjgRaI95W/2ET3keqoVaV5fYXiRLoR5g6HdY4@lists.linux.dev
X-Gm-Message-State: AOJu0YyrqI8GBEAydY1PH2cGGBRMrvwhd7G7aNKKv9GFGESI3I4uR7Ab
	UOkqf8Qu2z7A+76fBTOr/ivmmEVA6E8tv6HexjsPkd6TK3GBTp9Peg9zhJDEMDRhjY4=
X-Gm-Gg: ATEYQzwxQ1Ku6qywM/Nzy7e/zSOW5rQ/aWxj+ECWcGqLidIVbJap2TzDmnB31QBIk44
	SF4/gVg/jGYzvlDmRUKQ4jN43Rg0J9AdHPcIm0nseueDEMQRqtZ8bnDoANtj5vsfQtZpQ2TAaUy
	7Pf/LYDkSrrj2PhLziTMbN7/UA3rM+2FT7YijFtC/QvLvHdPiNue1QUiv5bMumxdR49LPCyv08B
	3R577PD6rUTXMx3VdvEGdgUY8D7Mj81Ma1mQRN5enaIYqyZgF/wJlCt0qBChTAeI4lvlPMsvddv
	IRkPvGnauYmmsxAPKYZdMJquAdbq5kAyP1rMG5VkI87Fs4lmg9WD9/sCzBRG9PCkbUcgKRAwulX
	a7njDa+I2XLpGnOySZR+W18zCBRcRC/2POWywdvMrU2d/g9PFGFX9+qP2GK/G9sa0qm87vvA76f
	n0F20/E/xBYdaCMiubkagFQQ/Ks7yX
X-Received: by 2002:a05:600c:1907:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48555a5689amr196690125e9.0.1773649476013;
        Mon, 16 Mar 2026 01:24:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e92d5sm402893815e9.1.2026.03.16.01.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:24:35 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:24:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
Message-ID: <abe-QCG4xF1L538e@stanley.mountain>
References: <20260313-sp8870-cleanup-v2-1-ca679e62f9b7.ref@yahoo.pl>
 <20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl>

On Fri, Mar 13, 2026 at 05:32:18PM +0100, Tomasz Unger wrote:
> @@ -490,7 +490,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
>  			return err;
>  
>  		for (check_count = 0; check_count < MAXCHECKS; check_count++) {
> -//			valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0);
> +			/* valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0); */

Delete dead code.

>  			valid = sp8870_read_data_valid_signal(state);
>  			if (valid) {
>  				dprintk("delay = %i usec\n", check_count * 10);

