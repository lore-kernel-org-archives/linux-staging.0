Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE1259177
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710352619; cv=none; b=aQcYJOd7Hnp9AteJ9c47Esw8bm0+wtLxZmeoVXSbtxnTGJC5p7lv/iIUO7d5ve96xRLUrCF8Mtu9BcwrD9UF3n46rSbMyhQawMHR4NtTcKvJ5wlARqEx7Bnqi0FhV3mfWRXnqK6A9j2IPVSUK81hDLEZWO1wwILBw9zPvg3hDHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710352619; c=relaxed/simple;
	bh=Il1ZTrrhxS2JwxtKteGg8c15At7P4qQJlxAx1oYisIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMHwM8431h6xWn7VfvPVAJHUYLvn6rqJH3FocfytORb6W6cvCISryOxS1dscom4y1BB5LiXLZGmT9JdO44pxTzAyqWeuBEUU/Lbj/dyOFFHGY33NBgq2gxXkgOMMxhQPIW3pSSjBBgk11jM7/NnqocrYW6SrI7CDtSY0HcLAKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJ4TSCPr; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJ4TSCPr"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563bb51c36eso114427a12.2
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710352616; x=1710957416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gXZwYoXbJPdWtL2uBl+Xzu/HgUqqQqktfQtiEj7JuE0=;
        b=cJ4TSCPrwp56S6vm0kO4tqUYV3tGcicjVULpwoDSFiHvdlxietIdHlksnAUzCHnZvA
         IiEjODD5gFTQ+3dChu4q9CFA7R9xTtxl6ZP6bIAfaloAo1vB3K8A2B/jGXzcn/HqMbbz
         zJlR8hV59wLi6LJ4z+gMK3jlAR6qqjdlvefIegecrqgePRDEnMa+mimByafakg9Ao6qQ
         Pdh9TIwwhkqgZEl/ygnCN8IoEZCvNkjOP04t7OBr/0bBX695Jvq1/2e66Gd7DHY0pjMm
         NOdjaHYcNp3tM2NYzXL4HW8iezgQ8X1NZyLrfAbLxwg9rCNDNm6jeL860jCffVL7s3tJ
         FMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710352616; x=1710957416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXZwYoXbJPdWtL2uBl+Xzu/HgUqqQqktfQtiEj7JuE0=;
        b=tr6X5uWt7YQzgn416LxfjXkUSINS9Urnazvkpmeyd/fKmM0OYHCeBf7DRzVvQtMXRz
         ZtWA5IxigKnQPZDV44pDrrDINrriUMk+1bB/hzBB78zxlc3SytggS3tkse7Ki/446u0B
         qKmt2T+wRmH9+rsjL+KrWy+iP9Mx7EAXPAP1i5AssRZDmkUITUi/mWa0bLpZ8AlMC3FJ
         x5YwwtAdrFdfQjE/7Sf/eK3Xw+jpEctEEpA/0Nwy0ATA9ld244S4R3G7xcJZbLAJHSq3
         o0w2N/pVNMv4VIg7DWrddG7TCofh3xEoIXx2oBLyAOWJ0GC9NOZXynb+L/7JDdb4ogQp
         IbhA==
X-Forwarded-Encrypted: i=1; AJvYcCX5yXliTg9R8kiZrEycQrCtjWPF1JwqqD8Jhykhw9FRwOeMX24Echr3OaW1IrtsfHylYVEhEEz/7NDONMxycRohexF8t3zgs3GWDlkitA==
X-Gm-Message-State: AOJu0Yy7cvWqK+t8E/z+lQl46QQNz0DUkGWsJ6JK53o1sh3PA+TWEuyX
	ife6OjbT9InpINVd3xLi0x+0L8ZaooovoSzSdGbTwhwKOEiSdAy+ke0/6cQUh68=
X-Google-Smtp-Source: AGHT+IFMICn1OAbDlmUEX0+eM+0X564WncVJ4CS+mHVBBJ1+2xobFpP0SJzPOjoFCL42xKef/8oJ/g==
X-Received: by 2002:a17:907:8a85:b0:a46:5e38:29d7 with SMTP id sf5-20020a1709078a8500b00a465e3829d7mr1637002ejc.10.1710352615843;
        Wed, 13 Mar 2024 10:56:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ku2-20020a170907788200b00a44936527b5sm5062753ejc.99.2024.03.13.10.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:56:55 -0700 (PDT)
Date: Wed, 13 Mar 2024 20:56:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: changen strncpy() to
 strscpy_pad()
Message-ID: <2b7d9a97-e180-4bcd-bc75-bde09a6d2157@moroto.mountain>
References: <20240313163712.224585-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313163712.224585-1-arnd@kernel.org>

On Wed, Mar 13, 2024 at 05:36:56PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-14 warns about this strncpy() that results in a non-terminated
> string for an overflow:
> 
> In file included from include/linux/string.h:369,
>                  from drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:20:
> In function 'strncpy',
>     inlined from 'create_component' at drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:940:2:
> include/linux/fortify-string.h:108:33: error: '__builtin_strncpy' specified bound 128 equals destination size [-Werror=stringop-truncation]
> 
> Change it to strscpy_pad(), which produces a properly terminated and
> zero-padded string.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Thanks, Arnd!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

(Greg is on vacation so I'm playing Greg for two weeks).

In real life, 128 is way larger than necessary so it's not an issue,
which is presumably why you left off the Fixes tag.  Anyway, it's always
good to replace another strncpy().

I see another bug here where m.u.component_create.pid is never
initialized.  I'll send a "m.u.component_create.pid = 0;" fix for that
based on top of your patch.

regards,
dan carpenter

