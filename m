Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013923ACF0C
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911268; cv=none; b=CsmmFfEXR+D3ZAePVnCSHiemUyEqGiy9ajQpPay/T0RutEdY2ZlwE++QGYr/jMUKPkBWDJio1aOmopK1NTwdsBHedQUoyUaEXaw5z4HMSCO9zQPZKwiHb1fl663w3++T+e8Roy9VSvDoFMzVQNuoU88DUJgCumVYsUnvoduMWIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911268; c=relaxed/simple;
	bh=o86R9G5fnyVuwrye1sXZ5WhIYoTZ+cpEGEY4sGc2ctU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8eYQ4p8HYY/vvktqbK8n7ddU3flcU07VPP1YZzpEHoE+EEzvgXIJg/GUSh1P8Sg0KpfQNGChIqVTd/9b8UKvS47VGBAfdA1ZZHLQWyEDl1z5IwS42LBIJErorBszhiZ1cC8keN2L5aFnRLC5UxMSCPmEar1c9Qy83aglNVnSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ABz5+yha; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ABz5+yha"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4853aec185aso2968315e9.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773911265; x=1774516065; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z0F5JNQiV35BL5CH81YZuUNB9w2WsW8N3Go7UxMq2lw=;
        b=ABz5+yha+wW25ffekXyMob2HYT5jWlAsWLipS0IlAbyMlBwCu8OX7j7/Zz20TiXF0G
         UInCvspVm8F9t7lTirGw7/lnPpcB7aiRnN3h9XJMcY/UCY+xHFtiJFL8tFEQQF9rxdjD
         sA9RjikwrgAgjh5CUJlH8QzKuCZZqeB02VQvJoxfuFX99m8tA+EHC7+3Ua0TyAoyWZ1X
         /4JoKIS2CMtTZv712DCNbFLj9wsUuLczN2vdtBc7bJ0dchA3dIl8SkACOOom0gQBeEZe
         eUT3X89TsI+7LSwiCGCREbrdPiWAjh3KX9P5YDR+yoe0VnNDHOREpuMqA+RxO3Sveoth
         lRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911265; x=1774516065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0F5JNQiV35BL5CH81YZuUNB9w2WsW8N3Go7UxMq2lw=;
        b=sb1NZM4hCijTq5y0VI4ols24MizwOUhEMZKNOOIkPallQTRr1eYAcUD4nDGVaulSjv
         jH0lx9F4g//QJcpu8etS+fZDHSrmdUa237YItjbQ3KBqR1fMvKbR0fj/7yp+4TuG0wpU
         jugYGVb8B210XDe0J6lOmvaO0zq9ierXddyoXlc+chjnf+kZDgkUYjU8cxdiV8IvhQl1
         hgj3+tjS1NJ6d5+/jfPL8F571iXcW8JesTIEslL0IszySeC6fmZfdKHkfGcrTN5QnqFj
         tfUPUZZf1s8Dz51EJII4IC8Xn2vwN/sinYvrl6uZF0EdRPivd5LQPczVL+aEfPObiBU5
         LhJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUwvEun5KsyIsJQSw9ScGfLVJrll7m48MQ62bCNFpET5xr0Hmhg48fTLx0Pye2LYk9sDdJBcZ7HID8q83W@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7OM30EENDDBmrIk7x+cjEDf0MUrqTF4g0k56bJj1P7ybUt6V9
	k9RyBaV+UItcoS0sudGN7vWEiI1RYy/XgsWoSAbdO5SYa1BGFIVjlIKoYAhoGnDlc38=
X-Gm-Gg: ATEYQzwVuPzjhmJHJBar8sk0f4HXypdxYy49Xj1VigjU6+2dG7NwAfK0MOJyomU41zo
	fORSOxJ9BLiGFCzY6lAnMUKe5arHwFvZanVqfiyMfV98GIXqrH398MioB+M2NQA0h27kfrtxi8K
	eg/VZ30DxDCdMFEd2QWDUzOUAvIJhr8XBQA1qDfNvxXeracw9xw2+27yWK2QbrvRHEOLsLNJoPY
	SqwE/bDHv9O67xzelB+sBplSHIFlRkj8ijoagMyIWPcKrJ9FOxgTzhEE7vPkjLqdXKqV/ORPz0V
	v98ft4a/fBm7FTANhk0qBuBx56EcYVxiffugajuYsOrOfjJ2hdJ+dTKW1Kgm1CRnQudtc8tI8V7
	/Vj93nYOioNhYY3DCiPCrOSsPdOeSwN2uXR4GkrfG2akUYOmROUdQFIa6y6UUdtzqca/Zfoz2xb
	vCnT+IXM3FxOg3Yrkt8ISifqoMPOOI
X-Received: by 2002:a05:600c:64c3:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-486f445e17dmr95988505e9.23.1773911265193;
        Thu, 19 Mar 2026 02:07:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852a64sm14866983f8f.14.2026.03.19.02.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:07:44 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:07:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Malavya Raval <malavyaraval@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Rename TrafficTransitionCount to
 traffic_transition_count
Message-ID: <abu83bI51-FNW1Bh@stanley.mountain>
References: <20260318195924.2096-1-malavyaraval@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318195924.2096-1-malavyaraval@gmail.com>

On Wed, Mar 18, 2026 at 12:59:24PM -0700, Malavya Raval wrote:
> Renaming CamelCase variable to snake_case to align with kernel coding style standards.
> 

Line wrap your commit message at 74 characters.

> -				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
> -					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 30;
> +				if (pmlmepriv->LinkDetectInfo.traffic_transition_count > 30) /* TrafficTransitionLevel */

You moved the comment out of the parentheses?  Why?  What does the
comment even mean?  So many questions.  Are we could to keep the
TrafficTransitionLevel name after we renamed TrafficTransitionCount?

Probably sort that out in a patch at the start and then do a rename.

regards,
dan carpenter

