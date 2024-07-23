Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0873D55D
	for <linux-staging@lists.linux.dev>; Tue, 23 Jul 2024 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721748158; cv=none; b=szBZuSUKfOPJnb/xX+KebYDT4enJeissjbi7l9uZ5aQFyeYYJ1ziNgmaNIUf7kUSc0n6M0u4/Kgbk0Kl9QIqj5vUE/rqEWoMaBK/1EpJCdgY0T9L84L9ZxrOLYB8FliRonaRJyWT6RP1XR/jyoO39VGKp0nxRsmMm1XFo7nQjq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721748158; c=relaxed/simple;
	bh=rAM0tOrdVr1oTVnDxoefadTEVvfD31aTLLg06Sx0Bpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhozFrKHGWIW73rm+pJ7MkRpen9BCK4t0w/H9ZyjqeeTRziaY7a/6flF4OMYXtnjr9SIk/rqHSC01st2pI1jQYUU80tytMxdmx6GjxApwhdZNjQevTbCD0AtQdDC8CSB04gI4qnd4Zc6hNv8Bmtc1oYcgzqwFMkHLfDvByDYAdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CY0bhmcm; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CY0bhmcm"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3cabac56b38so3559123b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 23 Jul 2024 08:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721748155; x=1722352955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LppTAIWu0SbteKnxPRFZ4M9rdwfxTFW7ej85RHldG1Q=;
        b=CY0bhmcmT9ZRKJSREVmJx0dSMcCVOQ/Z0Jw0PXtzNpRrXelmocZMkyPpytGsViaZV9
         J5WPvo1ORUcJPbtAKPTpLU4Q6yfAagnHIqtSbQPWI8/AA6I1wAuqKnibVK3/QAZL5Uij
         wg3DoRp8FRrWHwt+4CSunE9r0IFcowyv3gHiztpND7gefrGuRKrHTNCfBzRwYxmtddmA
         +5/+TG3KFPGOGMCiOMZ6GqD2nyDDNa+3G1ubtl8PRSOmwwGTNZr5/kURTP1sQs+Uw3nu
         UcseQsqNfe3g+6Qe+SP1BHigvodUTgBaiKlvsX6dhhksOYovjq+iW4CV12SENaYIjYzK
         +npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721748155; x=1722352955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LppTAIWu0SbteKnxPRFZ4M9rdwfxTFW7ej85RHldG1Q=;
        b=ZM0RLuD27q96G7we7icszWk7UEZkJkPCFxvRYKVkckrLsp/l9hUnjrVyyHHNiyz6P7
         Q94oVBYINQJHO5NKm/0k7VJcycMX6ilyVsMizuOSnDOhsjkfASHX2TtxTH5dywEGHfJM
         n8xox/IeuixXPxLsSb4muE79My/JiHzFJX29JFVXQrKsnr03Ki/ZQEgNxBgFnmh5q/JF
         0crgBso8squSM4msq3PsegpIgVu0I+JW5IArxIOZ9bIFgFy/dfHKfZ/H9ygeCgxPqsIk
         UPlrAKCyfqAlRSFT02GzF4/MRvY53Qfsj6nkktOklcFTlHuLgc9PD40ddyD8GRuwgbYf
         ndiA==
X-Forwarded-Encrypted: i=1; AJvYcCX2LAmrpncaomLoM86bA9jRR1MQAlX9g9BYwnzdWSLj8Wlf8y6YUPv9OBaI8RPz1eXe8pGdGMY/EWW48LV4E4loXDnxlcjxw4DotpELrg==
X-Gm-Message-State: AOJu0YzpCUIiurIc53M6MKOVSI+IKivuiHU7YUBJmnfPLRFiND/lnLJd
	ppdNFA6ho4xk0yoTmc4piW1DqgEsJhUXtHwHdYL9RxQ6NaN01S2TJzq4OkAlEpg=
X-Google-Smtp-Source: AGHT+IESon+tGt9HEPSFLIJ7d0cJjQslEakpeQe1qE1Y2C4sR/W6gbAxocKAYk0vwAUUakxYQrBj2Q==
X-Received: by 2002:a05:6808:1985:b0:3d9:3a2f:959e with SMTP id 5614622812f47-3dafcde5c04mr3719600b6e.0.1721748155686;
        Tue, 23 Jul 2024 08:22:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eca3:bb93:d28d:1005])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dae09ce887sm2002102b6e.38.2024.07.23.08.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:22:35 -0700 (PDT)
Date: Tue, 23 Jul 2024 10:22:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cruzer-S <yyyynoom@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com
Subject: Re: [PATCH v3] staging: rtl8712: style fix multiple line dereference
Message-ID: <5005ffef-0ac1-4481-a139-fbf3b456069a@suswa.mountain>
References: <20240721040504.1483-1-yyyynoom@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240721040504.1483-1-yyyynoom@gmail.com>

The patch still doesn't apply.  Sorry.

cat ~/tmp/yyyynoom | patch -p1
patching file drivers/staging/rtl8712/rtl871x_cmd.c
patch: **** malformed patch at line 132: 2.43.5

The 2.43.5 thing is the git version.  Not sure what went wrong there.

regards,
dan carpenter


