Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E21F582E
	for <linux-staging@lists.linux.dev>; Fri,  3 Oct 2025 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759475436; cv=none; b=FvEbA9+cb4P33D8egCNF/S/oavR46NyDfmx3pslNdc665tR6cBh+BN/Ws1jaXbdJneXYykYK7dZCM57F1gOoee7TuaLKVV7yZMoDIaQzLQX9woOLrSx4KeNcUj0ayBMEuMuVWA474eOOGhB2zrqT3pyeM2o8kYpqT2qFl/RWhJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759475436; c=relaxed/simple;
	bh=tsd6LCwVXoBWfeuPShaVDWTPYeYbCB/+fp3ZoHm+AEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyhYwVIcV+LqjuW1bersN123Oe/qQRYVZC8+ag0zEzINlnS8CVX3Rr8iB/sZMqbzbRHJfDGruuP5Ox4LPdXWG4VyhJuLYFVR34GdNQERBvzAT8P9QUfquaOs7bdvuNrrixfAY9cLwm5Ao/d62rPlJM1QY3CA00+2/GD56+9xn8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZWE6Ua9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZWE6Ua9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e6c8bc46eso10779965e9.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Oct 2025 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759475433; x=1760080233; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4KPy/MaUI1T6LJVDJjF2ILhSPnvDqNZYew/YLG6etAQ=;
        b=lZWE6Ua9/LI+NsGKoW+nl4NIQZiz54tiRttLVecM1ut30xfYkInudulwTOr9DVzbSX
         QLIEzm/fptzX2c6x+ZGw/05SU7zgEr1IseLVjpufCZlHRuvBmMQiP3U7qeAXQ3JQtCxX
         VP17mqUdclWBzA8kfbNOmWxAovkKDyebkNt4+1vkIQZcVCzsjtFPP71sDkS2RuQnQlwh
         1c0FaI0kf5adtZejxCzRPvlJ4RTv7uSx1LvvFLYY3vBdRKeDQBq5wkGtykRsq1jLo9wT
         ZfUwGh6hpuIywm0QekGvUWVjlJV2WeQHlIFM7dOnpnK32SvNHEJuclIEsGVIPYrv4zR0
         X4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759475433; x=1760080233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KPy/MaUI1T6LJVDJjF2ILhSPnvDqNZYew/YLG6etAQ=;
        b=KqrcRgOcb/wVb1y88TIQy63OaWt9fBxkVsfKFMlIrnoGLX7/ze/V7X5Nixjvr+kWRn
         9aaNTIG3k51bkmJ4qf0hMdWFG8VF2NQJNBxWC7qjkM5oaWE+cLZtMlTDg78an7NvbbXg
         W+5Wz2nCYQpIuqvcBEBwIJwJtbEJ2Gh+4OUWuL2DeqNF8/897soZirVWxMvHx9cpwhX2
         RTaTverimB319RXhYHLA8VT+L7qXCN1YG5ujk46v6sGhpgJOp23vtxPyfq8mGn/FoQ4g
         mRBUlVnQVe4Mvl3Or+F8yj7Ga3oQTEuSx/R3VwPcR7ljuWTCLtfkVMwsCsVOaTj/JB4+
         g18A==
X-Forwarded-Encrypted: i=1; AJvYcCXsineWJ0rxMH6tzOClGuuA0NSSxtDzLNmHq2rK4ss6fQtEUDyx8l5k1H5oQl3GEZbhd/uCu+/XjpTr2X/x@lists.linux.dev
X-Gm-Message-State: AOJu0YzTR4vduw+skXoowEEqQeQmYwF7tHki9siaSfA7EjZDFzoI2e5/
	gw+FmzeGoUi8yXvmHrmsaGcO2b3GodjiHuARxkm2zezK+az9lvLVIvShCg0cQuSKbfcshf8rMrN
	93BRJ
X-Gm-Gg: ASbGncuNCaDF9QYLCc9eLYopTvF3Q46+ok2oR1lXhuPFsDKP9Vn96f17Eo9I7T6Zo1c
	NLQ3L8TEvfPGwTpzXpK5hv96JO3SdkyqFkck3DdTuVc9TkiaKxO4/biRDFugTtNhJYRkZkiIP7W
	lhAqmN1DJgoc/QxRh1F3nUPGK2fnVeYJH0Fh+OQz1bLHD4+D4OzDFAFyCGccZgWkvTUph9BK79G
	51F9+FSHpctj+JCA32SzXACwtaQFPzkpifxI4XisLOHwQzz5h0GDD/r08N0zWK0Mcr5E87sg+iC
	y1XPfcEepRwqyXyGmKFHYj0Zvw8OGDxVor04EyKTozXDvfRvyfNtz7HwgwwJLClfGePl9LY9V0i
	UBnL/DgIiv51/Vr7Tu4TOYfH6bXJ+Yt2m0b7KIg75F81ldsCW0XbRJiueTDCi9V7Z3Fk=
X-Google-Smtp-Source: AGHT+IGrprpeaPN2zsG3GLeeDlcPWzpaZct4FH883LRsib2xD+eagd//CjbhareJG/Mp7u+BFhq4lA==
X-Received: by 2002:a05:600c:354e:b0:46d:996b:826a with SMTP id 5b1f17b1804b1-46e7115d49dmr13480395e9.36.1759475432701;
        Fri, 03 Oct 2025 00:10:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8ab8b0sm6653233f8f.18.2025.10.03.00.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 00:10:31 -0700 (PDT)
Date: Fri, 3 Oct 2025 10:10:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 15/16] staging: rtl8723bs: merge nested if conditions
 for clarity and tab problems
Message-ID: <aN924wqH--MgGEak@stanley.mountain>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
 <20251002172304.1083601-16-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002172304.1083601-16-vivek.balachandhar@gmail.com>

On Thu, Oct 02, 2025 at 05:23:03PM +0000, Vivek BalachandharTN wrote:
> Combine nested if conditions for clarity and fix tab indentation in one
> place to match kernel coding style.
> 
> No functional changes.
> 
> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index aa842905a467..f17b16fe8819 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1254,8 +1254,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>  						rtw_free_stainfo(adapter,  pcur_sta);
>  
>  					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
> -					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
> -					    if (ptarget_wlan)
> +					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true &&
> +					    ptarget_wlan) {
>  						ptarget_wlan->fixed = true;
>  					}

Delete the curly braces as well.

regards,
dan carpenter

