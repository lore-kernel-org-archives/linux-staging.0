Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A024D8CC
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 19:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726601535; cv=none; b=Nf+9VxKYnXAjk0J1YYQBG2CtynTsKM4lOPV3YiFMhhWXSKmgrVvV21ODJCaWSdH59NYn7qGuSAZ4qeFrLSj7zwOnfUkUm8o8/DX2MwBn9GOtvzSrUP88ofyQYNrHe8aYhbLzHgUNRpa3ZeZIxfAum6RUZgYXisrvew7NEwhuYfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726601535; c=relaxed/simple;
	bh=fh0reOq4EMpswxJsKKqpsiw6Czuf9g0WTzNlxS7UO+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4uCqYIQTrj0UYa+q0S0HR5qHCMukdIgwz+XaD3ppByTCnmwQdCmm4rwx8m/a7LP4m075FNwPtz0wuY0v9uucZPixhtzdYgKLIYA1ktRESd0u9uPytEpBxkI6uygmODHAV2zjOfUBEnYyYIqUvBirsCcvUzDAMCfb9lg+VX64MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMD0e7Pe; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMD0e7Pe"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c24ebaa427so75848a12.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 12:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726601533; x=1727206333; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hkmmdj8+A5vEF10W6axwToELtCxiF54w4XBSo8dtkiI=;
        b=FMD0e7PejcvpJbsOeOIEIPeaNViShULN1kX7UCJZH9wKnyeRAcEEVjviUrhhrfWryD
         JNoX1U86+yq108T9s6uY8Qs0WQ8Ptd3qDrubEunhhr7A+iO1YB1aArCNiFXzQbdVVKsc
         lS+d9dixNdXTbfOmEVVgjnsWuM+TCOn4qC3XmdZbHMRb29KX+RJPEcs7/asvZapXf+z8
         4RL7Q1lUP0AAS+njsv+g42/g7VPxP7Cr6M1ieb5me7yjjIcZlhmb1tihBe/7VlybHGsM
         vtHv1kNzGKPDSl+Oh1jDOcoCU/LfzawleRdJi2v1egYV8+eWwyCrOfTjOm94EAkd2zX8
         /geQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726601533; x=1727206333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkmmdj8+A5vEF10W6axwToELtCxiF54w4XBSo8dtkiI=;
        b=SJ+5PbT058yGqrXE7XZ9n02HxUjSGsZb5IXWx8Xv6Z1nZLexxKFgTFxLGESPrm4sdU
         PKuEqdGghLgcWO0GqjwjwVlJVjJ52K3/Q+9o58sfNnqZZxvdnPozRl0x7I2bhH9ixx3O
         q5WcDyD4qUj6dXpPmheKcBFSHy4TJqpcKGOGlojVGiH1Shc6u3wStpwOpBoibSjX4BbG
         9zOTIr3cVjEGg4NftmnbwPW81atBD1BcYE5ozFNIT4CzgKshyTNWw+U1NzaK/iWLwv+0
         07TH4+UqIVt8OajmUXg0fjEPHtgYg9Xbj5NGkYaBb/VPaemEs8ISet+hALNjOegkZltl
         eVMg==
X-Forwarded-Encrypted: i=1; AJvYcCVuiwkBlQ4iay5CcOVhNRnp74zL+GFVLwqoYPd6pcW7leyqx2cWoW9SCwW0meGwA2bp9j50jsW2Xe4Ewwaf@lists.linux.dev
X-Gm-Message-State: AOJu0YyJd9+RPpuxJYKFcbFjLfP7YQVr7YFD13KHCKl4oF6WxYSwACDZ
	25530oRPufo2Bz7wBjWA6/MiRgsQ5zRQJnyM4cOGWJg17QdHfRv5
X-Google-Smtp-Source: AGHT+IHjViEgRqChvdDDupCbfhMxeWHkVe8bOAjS1ZJMdYIRVrgzeYd+dQEAUUKVjV5exB5Ga0t1lA==
X-Received: by 2002:a05:6402:d06:b0:5c3:d8fb:df6a with SMTP id 4fb4d7f45d1cf-5c414383763mr22757109a12.14.1726601532369;
        Tue, 17 Sep 2024 12:32:12 -0700 (PDT)
Received: from kernel-710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bc88d02sm3989780a12.80.2024.09.17.12.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 12:32:11 -0700 (PDT)
Date: Tue, 17 Sep 2024 21:32:10 +0200
From: philipp hortmann <philipp.g.hortmann@gmail.com>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] Staging: rtl8192e: Rename variable nDataRate
Message-ID: <ZunZOjL0E3bU7Oht@kernel-710>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
 <20240917053152.575553-2-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917053152.575553-2-tdavies@darkphysics.net>

On Mon, Sep 16, 2024 at 10:31:35PM -0700, Tree Davies wrote:
> Rename variable nDataRate to data_rate
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>  drivers/staging/rtl8192e/rtllib.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index d6615f787d53..21d8ea153368 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1743,7 +1743,7 @@ extern u16 MCS_DATA_RATE[2][2][77];
>  u8 ht_c_check(struct rtllib_device *ieee, u8 *frame);
>  void ht_reset_iot_setting(struct rt_hi_throughput *ht_info);
>  bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
> -u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
> +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 data_rate);
>  int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb);
>  int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb);
>  int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
> -- 
> 2.30.2
>

Hi Tree,

we also need to change the following line:
u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);

Thanks for your support.

Bye Philipp

