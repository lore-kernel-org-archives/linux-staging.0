Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E3B8F59
	for <linux-staging@lists.linux.dev>; Mon,  8 Jan 2024 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RybaHS/m"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e43fb2659so9833205e9.1
        for <linux-staging@lists.linux.dev>; Sun, 07 Jan 2024 23:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704700707; x=1705305507; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=22GnWJEolWDoUmtgnWlTz2yR3gzlLLCnrhahsHJ5GNM=;
        b=RybaHS/mJViPIT/mzGdLnnvIS7zMHHgDNhCjG6qG3tV5qUch3JivEZOu3yW/P6UkdO
         soOPHDMSqlMXIZvRmc6jHKUMXOvQGg1YUWnHdj6gwCNl42P3AE2qNSPL+SUTR8TvI5cm
         TWrBb7kurZsyTSCXkDMpJaMCKDrFVmRFWPAtKhyLumkWCKTZNbJBvklGnkGuoqP4MZXe
         9EpP6UmTxiwyDTrZUqUQhxq4E1V1ZGQhx6zk5SEl8uhT34uO6R7vksro+3a61reCJWts
         5uR8V4mRCNieWnsiDRBlDYEsctpq3SeSdvzeKYVljurQVkKbqgJzv8QOIzYtHfJEeJjj
         DWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704700707; x=1705305507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22GnWJEolWDoUmtgnWlTz2yR3gzlLLCnrhahsHJ5GNM=;
        b=UhKUvpOJBn52k6L8EFkWHWx/QZbYucnDXrv3rumRaDrtcBfwPb75ivTNyofsDKEBHg
         eUsaU5tbyn7PKJNJ9dS4h1VO5KFhnzif0lwXZaxSF6Ct1nJ7ILd1mjd/YC5rqesVc56r
         7sttCgfFrJfSlN5e/+zW6y0u/1mgYuCLDM68xhu3bNQEpLBr5HX0Edp1LewTU5rKDpFm
         DFJ0xVdt1enfwc/H1XOj0PcpiHzKJFSgSPYDF58jdD7YJmB3AD5o7afaqxpzuPPwJPsU
         gecpiPqSMr/b6kUq9cSvPc0URfpnFiP5kqxgKUnrj58Sje9D6cSuaRl9Cx+y3PwhTeyr
         mGEg==
X-Gm-Message-State: AOJu0YyotDVA/4XKEhAEc5uX39S2//Ua4LykFvbMvbUOMrSbVM+eyq13
	o/qE1rO7FACgen4teGumM4eyS2JM29CWvA==
X-Google-Smtp-Source: AGHT+IEhO8W9NrKFr+1v+YuEt3zSnIMP1x5ul3UCIbMMaDcO/kuxMS2uVdG1do1yLqS3HEuwFOeNig==
X-Received: by 2002:a05:600c:4fd0:b0:40d:6ea3:9bd6 with SMTP id o16-20020a05600c4fd000b0040d6ea39bd6mr1648289wmq.178.1704700707353;
        Sun, 07 Jan 2024 23:58:27 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c314400b0040d7c3d5454sm9967101wmo.3.2024.01.07.23.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 23:58:27 -0800 (PST)
Date: Mon, 8 Jan 2024 10:58:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: rtl8192e: rename variable is40MHz
Message-ID: <897a8bb4-a1d7-46ab-96cf-fd5ba447d2d8@moroto.mountain>
References: <20240108032233.4280-1-garyrookard@fastmail.org>
 <20240108032233.4280-2-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108032233.4280-2-garyrookard@fastmail.org>

On Sun, Jan 07, 2024 at 10:22:29PM -0500, Gary Rookard wrote:
> Coding style issue, checkpatch avoid CamelCase,
> rename it. is40MHz -> is_40mhz
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---
>  drivers/staging/rtl8192e/rtl819x_HTProc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 6d0912f90198..1b1cb9514028 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -87,36 +87,36 @@ static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 mcs_rate)
>  {
>  	struct rt_hi_throughput *ht_info = ieee->ht_info;
>  
> -	u8	is40MHz = (ht_info->cur_bw_40mhz) ? 1 : 0;
> +	u8	is_40mhz = (ht_info->cur_bw_40mhz) ? 1 : 0;

This should be is_40MHz.  It's metric.  M means Mega.  m means milli.

regards,
dan carpenter

