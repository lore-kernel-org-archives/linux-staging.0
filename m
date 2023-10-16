Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7CD20B22
	for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="AtaZUGbo"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507a0907896so2659530e87.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1697460423; x=1698065223; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6qlswPv1xYuo23Eivhw9YGnLAMdr4T3bJoXkm2ZqKu0=;
        b=AtaZUGbouXYQERr1U0bSRc2QYnW8Bqe8xeeXgjf+ilc3BBKGFNmZqI2o+grtl5QvbJ
         T0T2+dawqFTA4sUIlG+LqkM5uHFIQzDAmE67CpuFwUj6t7xaIGmsNTsNfSfHDMOMJVyk
         JmUdziBNk85JQrgwyw/NoG5ha/NwtdEBNVXAwUUnmkkGu6RJOj5MLdM62Xg1tQ+tWAeC
         lOHwi03++2SBCNZD+T6bPCvZxEDUSG9AKu2mSsWW/PznxlGZ4P6dOwDkd1XOqe255o7R
         oc1gsi0a3R++CV/rknkqZiYst1AQWl8YYdSGxCW9th2TE9/o1MZuMGrWxtYILiQKxth/
         sZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697460423; x=1698065223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qlswPv1xYuo23Eivhw9YGnLAMdr4T3bJoXkm2ZqKu0=;
        b=k7tmFDkLbVf+84xtA86u7guOG2d1aosJ0SPAEpYrILMW1S8WxeuMo1WKMHjQxqMn0w
         ZNg73E+setzal0DKW3pikiV5Om/nrzsRzYmOgvANFqQuTc3Zr4jxh3CkSPJ14PW1qkIn
         UC9MuvS5nAuSy1fvVu0g9FA7T6kYazHF7snHDsTvFd+GRfNp7cid+jVxUPN5Z0aNuzp5
         /+PmFLFY9pU8DYO/7atgIfX4WFsTYlisxvmblw1cWmYM8D0Ig5smSrPwQphvJicSvltV
         L0wnuCyagie8YTzkKdoYXrOQczaSND7dUnPhVI6tdBZddGZTRQpwOSfwPt9CW8H48Eqd
         Lueg==
X-Gm-Message-State: AOJu0Yypp5NWYrhZD92HNVOCYUwuxJtxE4bq1S1E0Wpk68TIUdNoMB/Y
	RE2toU8oIPA/PYe2xqAvpmaB9w==
X-Google-Smtp-Source: AGHT+IEfwP8Ny2CwS5u9o3Y03kbQA8zl0t+JymNxTJZnFAbynfJOWtpPhq+AvNPWML0qNRbwl2S3YQ==
X-Received: by 2002:a05:6512:282b:b0:505:7371:ec83 with SMTP id cf43-20020a056512282b00b005057371ec83mr33967223lfb.48.1697460423511;
        Mon, 16 Oct 2023 05:47:03 -0700 (PDT)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512070400b00502e2ab7118sm734431lfs.50.2023.10.16.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:47:03 -0700 (PDT)
Date: Mon, 16 Oct 2023 14:47:02 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: ihor.matushchak@foobox.net
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: staging: max96712: fix copy-paste error
Message-ID: <ZS0wxi7SUhJcVh5Y@oden.dyn.berto.se>
References: <ZSq4-7W_ke5XKsrE@oden.dyn.berto.se>
 <20231015212447.7072-1-ihor.matushchak@foobox.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231015212447.7072-1-ihor.matushchak@foobox.net>

HI Ihor,

Thanks for your work.

Maybe use a more descriptive commit title? The idea is to describe the 
issue a patch addresses in the title. Not the reason why the issue was 
introduced, this goes into the commit message. Imagine another 
copy-paste error is found in the driver, then we would have two commits 
with the same title.

How about?

  'media: staging: max96712: Fix device name in description'

On 2023-10-15 22:24:47 +0100, ihor.matushchak@foobox.net wrote:
> From: Ihor Matushchak <ihor.matushchak@foobox.net>
> 
> Fix the device model name in driver description,
> which appears to be a copy-paste error

Super-nit: Missing trailing dot.

> 
> Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>
> ---
>  Changes in v2:
>  Add commit message describing the change;
> 
>  drivers/staging/media/max96712/max96712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index c44145284aa1..ea67bcf69c9d 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Maxim MAX9286 Quad GMSL2 Deserializer Driver
> + * Maxim MAX96712 Quad GMSL2 Deserializer Driver
>   *
>   * Copyright (C) 2021 Renesas Electronics Corporation
>   * Copyright (C) 2021 Niklas Söderlund
> -- 
> 2.30.2
> 

-- 
Kind Regards,
Niklas Söderlund
