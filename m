Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2DF7605D
	for <linux-staging@lists.linux.dev>; Tue,  9 Apr 2024 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712646266; cv=none; b=QBj29Ak/ApWGWL+os8CVaHDQ8JS6g2KwOc7qDfjzYmuyaGf9HEBdzOL3BJW6JDCuLQrVecIN8iVmBqO8MzaCYOm7PnQnic44rqWD54TTcbPkoKcGIjV7XdFawJ9dcUrzJSRUl7CHPg9tYAsAHtDiw1bix1C/WBe8DepDtafEDB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712646266; c=relaxed/simple;
	bh=hJiFGv5DW9utMvcHTnFoXsNOZQQnudImv4pfNaDBxQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIEcMXjyX3YCJ7inqFOzQVI/7z+TUVE/mRzFsixZt+BgCWA0SzFvmZ2KiTcOqdfXGqPf9xqSO9TLD3rP9greJUFmdTbGWIquU343l09WLdHsC5PsW4KRTpLsu+PdYGzp+12CH7iRUvaUhSWSmJmbkbTffwQ7eKTZnkX5zcHCd3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xN7UpJxj; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xN7UpJxj"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso3881210a12.3
        for <linux-staging@lists.linux.dev>; Tue, 09 Apr 2024 00:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712646263; x=1713251063; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZO+G8vYwqEif2MQQep31dNkOjqakaMIvdbgiCkuB6BI=;
        b=xN7UpJxj1puD6HqyVF1zxGBZir6GIT9hqAMqkIL3vCC6aV4mlSdH0kS7mhJLHoo1lC
         i3AShl3h8SDU+dpkMh3DvFm0h24IJQLry+jhl113k+8D6YiceqTTRfrEAST8zqVlorhx
         m1tV9QhvRwf3LGJZqO4WYD6khYQJzPof2iQxGY04udzinpUEOwGvtL0oj+ZLtPUYLZwy
         ms76cnEzL8lbAzDPRLiI5I8m3NMPT2zOG3gLVvF85zMJoS0dlRD+T8PNRm7Jv5KZxO6H
         yr21q5E6H+7CH34e8gGSe86fs3z4dK6oRV77k+tOT0dh0Rf9gWpBj/akKKRvyo4caWhs
         WZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712646263; x=1713251063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZO+G8vYwqEif2MQQep31dNkOjqakaMIvdbgiCkuB6BI=;
        b=QyjVxnQg5UHyBH0RWXjFbprs2Mn3yVK4cMQqu4mgRqHqg7Frs9iU8Zvd02C8Cuy7ue
         pHkIbWi7rVAV1b1YyWEzosqGEWr/x4CCTAuraxu+dohAoTHj6ViTYFcn73gIvub4OKIb
         LhKJWtKn9VVZ38vPIJLAkCyTFan3e2U+nVYqP1BI0KwsGoqWuKS9Ao4ZXrl2GbriQwQc
         pteD/ptGEC+DvA4dme/YhnZe3P+8dnToSOjzIZ5HulubBKazIwAtgYztKLDX87IUlLci
         iNZjh5w8Q1mSbjUJlApY1yYrZdsd07HAAsFNMMLKWFecpvyos0F6CGiGsxmgE5+OxC9C
         a0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWE1717DBBEI6Nt4Z44r0BJ+AFJIGIn0jMq6YV1I5t1wGkZ5BAELweEY7jPU9TFpw86EKBkzCsAfpxkWeqMsXAyCmc6zrZ/TQyOeb3eMA==
X-Gm-Message-State: AOJu0YzovgqJUR6TTnUMIvBr2vG8hmdkceBHwbt7EqjAfp+ieVmM5Lsi
	L1xy8e9j5qVx+u5AuXsFzyIMZo+ddQqgDnkXEDXaBTlo2OTbNFyfx1EJwHoEAB0=
X-Google-Smtp-Source: AGHT+IEJR0mpYHfVzK+X/mS3qDum9gkPCn+raThHT7VInTnvN2rmMEEmTyHQC1FpsccQ9/zUzab77g==
X-Received: by 2002:a17:907:948d:b0:a4d:f5d4:fb02 with SMTP id dm13-20020a170907948d00b00a4df5d4fb02mr8230339ejc.51.1712646262666;
        Tue, 09 Apr 2024 00:04:22 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ak2-20020a170906888200b00a51dccd16d9sm1716392ejc.99.2024.04.09.00.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 00:04:21 -0700 (PDT)
Date: Tue, 9 Apr 2024 10:04:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] [v2] staging: greybus: change strncpy() to
 strscpy_pad()
Message-ID: <514e5aa2-851b-4846-93f1-51f972d782b3@moroto.mountain>
References: <20240408194821.3183462-1-arnd@kernel.org>
 <20240408194821.3183462-3-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408194821.3183462-3-arnd@kernel.org>

On Mon, Apr 08, 2024 at 09:48:11PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-10 warns about a strncpy() that does not enforce zero-termination:
> 
> In file included from include/linux/string.h:369,
>                  from drivers/staging/greybus/fw-management.c:9:
> In function 'strncpy',
>     inlined from 'fw_mgmt_backend_fw_update_operation' at drivers/staging/greybus/fw-management.c:306:2:
> include/linux/fortify-string.h:108:30: error: '__builtin_strncpy' specified bound 10 equals destination size [-Werror=stringop-truncation]
>   108 | #define __underlying_strncpy __builtin_strncpy
>       |                              ^
> include/linux/fortify-string.h:187:9: note: in expansion of macro '__underlying_strncpy'
>   187 |  return __underlying_strncpy(p, q, size);
>       |         ^~~~~~~~~~~~~~~~~~~~
> 
> For some reason, I cannot reproduce this with gcc-9 or gcc-11, and I only
> get a warning for one of the four related strncpy()s, so I'm not
> sure what's going on.
> 
> Change all four to strscpy_pad(), which is the safest replacement here,
> as it avoids ending up with uninitialized stack data in the tag name.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2
>  - use strscpy_pad()
>  - use two-argument form
>  - change all four instances, not just the one that produced the warning

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

