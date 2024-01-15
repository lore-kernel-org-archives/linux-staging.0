Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57AD5232
	for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zAyPek0/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e68d0dbf9so25338275e9.2
        for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 00:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705305693; x=1705910493; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/aE5YgSwZvRxpVfNEI0v5SWIFUTsbI7X+o9Mrjo03s=;
        b=zAyPek0/kdVjN+FJROEAzeBcSgEYUXMfZFo2sgXetHhq39gt/fkvGrVGmwUY8zBqKw
         CKRPPK4JsKxYPEZS0Oyr5m3Jsyqp4qxs32H/VxYKclnsPHKGa57cnQVxNVTKRQdT0t1L
         Hh1RXT0qi6SLbMFtwTDrfVpCaSYtuZDiYGOSgBk8S9CYxUJomRqgVhUnlf7Q9X+9scwN
         H6ZJWsAwgO58LZInVg1X1NPbiqP0EK1pBfI1tPalBhP2O1oem5uQokoPglaU6uk5dYtm
         bHHP0BY1+axZDdz6WU5vgyasE0iRz9PdJ7ZJESzEJaS3KEvyY+ihL+gtcnZJDaD33QF+
         U7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705305693; x=1705910493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/aE5YgSwZvRxpVfNEI0v5SWIFUTsbI7X+o9Mrjo03s=;
        b=v6aq3eBknU/7C++HHF4yPU6OiNC6iDpP41uVnLNl9Gm2If6Jhy2OV+tydGC6X6dpD8
         eP2JuQul326Wqn2p6y8xd56oPFfrcXl7JkiXLqJqCQBxR8V7GIzoVYIukxPfg+7X5JYn
         dKiBA1jb/UxLai3aOA5jdQtFunWqRpq/GQ6jXSiaprqBZZ3PyzJLr1cu77OKfUSygp55
         Atg3pjXbvC2HRfnELcw5wqYTbfOa2Ypu/g1UiifdJC23BZoGZelo8cF1o8+SXpXSGNm9
         To+/lVWkrdks1frUxaLKoPA6ai16b5MnnBhwsz877jzQV+Azc/reQhG26c4Av4maqJcw
         NQiA==
X-Gm-Message-State: AOJu0Yx66oRB1mQz18EhpbxJrehFxvfTuVBdzESbqIiPPorSbEkyf+ku
	EYVXzppD6Cu8XAJbzQjhzY3m7HWM3I2y3Q==
X-Google-Smtp-Source: AGHT+IHRBYCALoZlXWdYDqozlX5c1sfq0QbOuoCaTO6X2o64cTganWJbbuW3QhU6P0q3+XQnYu+NuQ==
X-Received: by 2002:a05:600c:378f:b0:40e:5f61:56e3 with SMTP id o15-20020a05600c378f00b0040e5f6156e3mr1572573wmr.47.1705305692978;
        Mon, 15 Jan 2024 00:01:32 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id q28-20020adfab1c000000b003372b8ab19asm11199087wrc.64.2024.01.15.00.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 00:01:32 -0800 (PST)
Date: Mon, 15 Jan 2024 11:01:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meir Elisha <meir6264@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8723bs: rtw_ieee80211: Remove extra space
Message-ID: <15008951-9c0d-4bf8-8bc6-a639a6726105@moroto.mountain>
References: <20240115075425.108134-1-meir6264@Gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115075425.108134-1-meir6264@Gmail.com>

On Mon, Jan 15, 2024 at 09:54:25AM +0200, Meir Elisha wrote:
> Fix checkpatch warning: please, no space before tabs
> 
> Signed-off-by: Meir Elisha <meir6264@Gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 30e7457a9c31..cfa994835008 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -1036,7 +1036,7 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
>  	struct HT_info_element *pht_info = NULL;
>  	struct ieee80211_ht_cap *pht_cap = NULL;
>  	unsigned int		len;
                    ^^^^^^^^^^^
How about we delete these as well.

> -	unsigned char 	*p;
> +	unsigned char *p;
>  	__le16 le_cap;

regards,
dan carpenter

