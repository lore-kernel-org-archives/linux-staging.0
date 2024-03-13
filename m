Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6393A64CCC
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710351374; cv=none; b=T8muBlJoNUmYuF5jKAmJAXXa0MANjJuCRIfQuAJ284LstlnT1Pmv6VCF2LTROqdZWXPP+oPNXtIdRnD9dwJ97ruCnQzpVpdFVh9i+I1FUZoz5fm1XiTLsC/EWAAIhJZZC62HGkp2+tSVP2cEF9QcLvK6n6c2Xdo/GiEEGVZTN2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710351374; c=relaxed/simple;
	bh=hy3ZcXqWsGnwgMjCN3gWHOD5wGz+6TfcBmfAdzS1Ayk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSl+VY9nUWNDDuySDkFM6f2Fu9rBijLf31Mg8+xcJflv+zO2w3lHtoGXxoAreFiUYxVhkPrhIuuXQiRHEDWAFG2iDq1YF32sbTiEvNbE8ssK43jpbaME/a50NhSERVsD4C/f+AlxBr56XICffyq/9E7t7ObjzKKKipBsVxFdZx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=knvK8mFw; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="knvK8mFw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5688eaf1165so120765a12.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710351371; x=1710956171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hy3ZcXqWsGnwgMjCN3gWHOD5wGz+6TfcBmfAdzS1Ayk=;
        b=knvK8mFwXRHcqUN5YaHEOqXWoevaZ/4e4yaWC5+2UcJKyzmCYtpc0Ugw+ajrtZfP0H
         tkjHtOIca70G2B0MB0fJIWV4nE5wNcv2CPczTQ9CQe8jY0hapS/BgEQqDI1OF0mAnUTM
         byJOHaKvgTufOuxTH3i0+D2dVS1nNUv7rrpntNJvupw0FsGVKd/kLoTUpFoZ8RQXoDCf
         Sd6/cPv5BMcXGrWd/PqoqzlPdx3R/CMIcKE6f0qKCQWHuX1Tv9ycWOn00P6Pj4itTRML
         6R6BV0J9hrLItHB7B3hDlbS/wDKW2NJQZJwcjV58kgMfxITBWBU4WtFJP8mHgVml2aMl
         Q72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351371; x=1710956171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hy3ZcXqWsGnwgMjCN3gWHOD5wGz+6TfcBmfAdzS1Ayk=;
        b=JHlcIscc+KwDcpXHtXfeZ64/Ta3TsaNsfOWRbAt8l8XrfbedEqDJ0HajWpyJ4zWT8+
         Aii2Aonm0LLQLVMAjnjcUkujNGDlITwxorchpmRD6tjKNnTrORk//h7h7bsDxSNId79S
         HICj2Nucj8F/W9eYJImCnZgqkDq9yKWOE5wxM3utLCY5sTYMDu5K3MmpmThxJcxLWvsi
         BCiWAJ+zJI662R3yBmFVtncO4e76NBXHBnGLSvhhhFOFGqrhnumLTR0JBtmP6DiXg9zg
         HMwcvw8Gu88iZdDuUmyxAqi7+xZG18SqJkUFB7ZlrLqitRVzfpa+RdpQ1s87sn7YyURL
         XEEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwYGLtbmgsDAYW6dsN5jl21M71riz0uuJ+zcht7nqXxZIotDEzzVQpkuUygI3vpjF1jgiJkMZEGjaWWSFp35HfV1ED0lEAJpEwj+Hvww==
X-Gm-Message-State: AOJu0YxzQzaCkuXwEqqLwlo3YwMvxmFgd5JqY1KN+L7XCN4528untL/W
	9FwLDfIe2ssm1qVI/yVV0zIlGdjH9EMhPG8W1vI6iVGwO6X4MyeZdWlppTur0XY=
X-Google-Smtp-Source: AGHT+IExQoPPhPaloxTdBAgfGGayI9aL78L5ibhJ6FmItWzqbpizfE4VIcY03GGG4q3JsKWFKpVR0A==
X-Received: by 2002:a50:aad2:0:b0:567:f643:fc5c with SMTP id r18-20020a50aad2000000b00567f643fc5cmr9870160edc.20.1710351370355;
        Wed, 13 Mar 2024 10:36:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id g16-20020a056402091000b0056886827496sm764414edz.70.2024.03.13.10.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:36:09 -0700 (PDT)
Date: Wed, 13 Mar 2024 20:36:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	deller@gmx.de, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/6] backlight: Remove struct
 backlight_properties.fb_blank
Message-ID: <8c6cb7ac-54ee-421d-b36d-644667309310@moroto.mountain>
References: <20240313154857.12949-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-1-tzimmermann@suse.de>

I was only going to comment on the staging bits but, heck, I reviewed
the whole series.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

