Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFCC15852F
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724840718; cv=none; b=U30M1g/yLsIbSiAk43QrxZlm2SMZJEO8qu2o46VF9Ja5VbX/uODjB0Fj+MoqLxAQHSMeRgCjbUFAT0U75h4S8Cayj52mlwJmU7qlUopzOP2ESwgDXtrQmJuCG9NYzbQQCfL69Q6PkEvz4ZhAwt8xJ8SooHy4wr62CXpsbEXlgLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724840718; c=relaxed/simple;
	bh=v2U9Jvrzu8FM9RThS8YhoqSwZg/ytfc+nZ8NshoJWOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpjfNi6gYxg1g3KH4KJHSbH41wPgVIKYuAzS8OfKs49h2PKhHp7KH84fhSd6FYIN62hxkbhFFD2a4T2SE1fkD+xXaeEAbYclvDmsDgnxiR4ntROUyBPJf8ul1yNazTFyxqXaorxdEnaGov702jy0O07v1Nn4z8dyWxKyOFPoRck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MPwJXcde; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MPwJXcde"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-429e29933aaso54816895e9.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 03:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724840715; x=1725445515; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Lzp4oHGEN8/PxMaUUHsZAh0vkNYG+xd0zc2zsHZgl4=;
        b=MPwJXcdeOB/74sTfqMf8Xnf7S4FXDuC572mpf83MQ2GxLI3O3eWz1g/XI1ygFXUxXE
         u7bVGT0JM5sB2cJcFQXMSVbZ0TIroGwg6DRAuYQutbjnJquWOmA4KFwOalTBMvN6IQvI
         +4wGlLDSPwgg8g5EnoBBnFMOJcyxgJHDo7tgETDZQ8Q4Yb7y/YdAUn2F2IQ+jh97nNEA
         4V6vdve3Iyw4YmsOoTHMIev+UEoydesensl9ozwIXcQitXO5lDCN/9JZ89hQQ5MwpnEF
         QMCuU/qnSBzKlzsbD+EKqMbVhHyGLu3uuX+T/ucl3MuQDu+CAETiMFHsiAfg+C2W7cVA
         rBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724840715; x=1725445515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Lzp4oHGEN8/PxMaUUHsZAh0vkNYG+xd0zc2zsHZgl4=;
        b=lcZGlX/5tP3V3DsxKjAZRx62k/JnFekpYqvKFUUU6LrS8DeLEfbIr32LveYCF9YcXz
         HtbnBunfH4jXKOyZEbe1+TXlAeQG3CjdbQXCw8xf65X8oS7UqKK151PC8LBBXfCId/s/
         S4qgEwJRlNdakIco5TyhK2i46BIOvK4wkfToE2TSF6rCeFgedPAXuro1BebaCANL9XKi
         Y/YHVngrHRCYHosYiOv5t521SbTXpUzzOIhPmuyInELQIR1YWFDUgiokIrEJgMjt1nAy
         CzUX33CIrLvqZGQTr4BRJSkpkuZRBsMo7PmiSYVxsBCUcV3ORVZ9e+GnLfukLa9RrjiR
         +DQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYoH3SlBbVc+fhuUF2BDxP0jpyLlrA1XEkofdzxrHa+kGoKG7ruj7fc+/bkoLY2wJqya5p0Gi1FipLuM98@lists.linux.dev
X-Gm-Message-State: AOJu0YyaxhKRg8dVHz+VlUWVLEuM8a/5wq4uC4zwCueEgs6KdvXcW4dQ
	Ppj692ta6Wzh6zDl4zJn0wEOoIWJ9MjkbxmXIgX/kaWX7kYkxQBgWT593eTAs/dmYLJYz6JK4dK
	a
X-Google-Smtp-Source: AGHT+IEp4R0TyxUVAN/DCult+Gly4yNrgEo0qXCuWLCZ3cQk3nKdUAD4f8ccgCbvcdHUOkn0Xldt1A==
X-Received: by 2002:a05:600c:1d0b:b0:426:593c:9351 with SMTP id 5b1f17b1804b1-42acd542a3cmr103707135e9.6.1724840715323;
        Wed, 28 Aug 2024 03:25:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6425a82sm17164015e9.44.2024.08.28.03.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 03:25:14 -0700 (PDT)
Date: Wed, 28 Aug 2024 13:25:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: vivek t s <vivek6429.ts@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8723bs: Rename function SelectChannel()
Message-ID: <2092a3f1-e319-45c5-a33c-3f271e70785f@stanley.mountain>
References: <Zs7vQXhcYRCxCDaH@victor-IdeaPad-Gaming-3-16IAH7>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs7vQXhcYRCxCDaH@victor-IdeaPad-Gaming-3-16IAH7>

On Wed, Aug 28, 2024 at 03:04:57PM +0530, vivek t s wrote:
> Rename SelectChannel() to select_channel() to avoid
> CamelCase warning from checkpatch.

I wouldn't have commented on this except there are some other issues.
Line wrap your commit message at 72-75 characters (similar to email).
So "CamelCase warning" moves to the line before.

Rename SelectChannel() to select_channel() to avoid CamelCase warning
from checkpatch.

> 
> compile tested.
> 

Put this under the --- cut off.  (This is the real reason why I'm responding to
your patch)

> Signed-off-by: vivek t s <vivek6429.ts@gmail.com>

Your signed-off-by is like signing a legal document.  If you were buying a
house, then would you write your name like this?  If so then that's fine.

> ---
  ^^^
Cut off line here.

regards,
dan carpenter

>  drivers/staging/rtl8723bs/core/rtw_ap.c          | 4 ++--
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 4 ++--
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

