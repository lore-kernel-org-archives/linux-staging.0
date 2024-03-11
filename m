Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2783FB87
	for <linux-staging@lists.linux.dev>; Mon, 11 Mar 2024 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710166189; cv=none; b=jHhLR8sawffpxafVZdQkvvhqve2XMtWgD2rWOBytISCGMgzpSOSB5ArS7DbHSCWevLwydjGAGxthBA/zE9BwXw/9EIA83RAMg2N8H+8i1CsI+pSBiJHcbiliLIjOMUXZGztSaoKtTz3ZQeMpa8cJElACy7m/1d2POObuu6C6lv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710166189; c=relaxed/simple;
	bh=mgxPhZa7itiP3y8g8ze/hDZxipnyP4hm2UnmBNC9sKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiDeqjg8J2TzT5iTbi8jD0vJcpaffMigVo5c3/g3/znW474QEhaaqPUrm/NLQ0Lf4sU7PEct0MprQ2Qg1WYKSNa7B6tpLIKJd/VS+iHAEev1tWlRg1tPZ+lrziu5T3lgCRvaPfez9/5g23ZcTAxynHgw34Z2RZ0GJSKfD+XJ1O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzp1alqF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzp1alqF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-413183f5e11so16792475e9.1
        for <linux-staging@lists.linux.dev>; Mon, 11 Mar 2024 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710166186; x=1710770986; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yl6YfvPFhweYRwRy68I4o7i+ufbSeARu9E5f/nZY69c=;
        b=mzp1alqFAcX7YShcNhqaqt9rRLAYctAjaSJ4azWx5kLXuJG5mj9LQ2Uzyg+T8KCpga
         xN/jYJ441cBd2hB9AUmiBNkOG5Fr0mJHvTiHq9oWN9VRx1TUSZpu/A+AW4NGxJ1Na6a9
         xDvFQFbTnVkzRtESA2j1tV/dvC72IXviHBceUl/mokQtqenqiYqT6FL6QXyAGfOq0JR9
         whcN5ra+fi/WWsH9vFbitSxt2mSRv+zf66C3xNb94gQGZ+fyHT8J73xcy05JBOvBlyqL
         r+VK9mlitI7RCTfFCgckgDDcrpgIlZx204C6NM44swttfSnIMLLIzHgd7PcC+H6SN9Bt
         WB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710166186; x=1710770986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yl6YfvPFhweYRwRy68I4o7i+ufbSeARu9E5f/nZY69c=;
        b=Sbm7knUObUohWbc6TUUmPD9k95Ug7jY7JHrUdKGA0y21e7eyGOfWLaelugxcgdff2T
         fiI4vXtAST0iDN3y8499KGei37Pn1GeKiBTRtDaobIG5QwXZOv7u0rMChYm/1IvwsDNi
         F1rAFhxleZlvgVVSN0nRp0ph8f7NPVx4VFNV7kMh73p4K9vFDnWbq5TqA3anLVrVRxnD
         7XkM7EdD5scpzVBu49njvWoCKaasqvF2wXycUiW441oX5HkSw99tHQmFLwwY/iL/zN7r
         kuif+l2SAEGpP472rIG1xi/FoOBFSayiozFYMaYJkMuo2VpUobiH6fVRgIFinnB4xGQs
         1U2A==
X-Forwarded-Encrypted: i=1; AJvYcCUZyZVhA5MUOfoNygmFLORpGmHs7ppbB5BcVaG2rsrGK5RatFsVWMxPCCa7sxyKYPrD88YqJ/eokuzzYImA40EhIOZSht2/y0fE5m79BA==
X-Gm-Message-State: AOJu0YxAY3lOidDGFzX8xfVlRorcVg6twstDDU+DlCEeNRqArgihJVX8
	JwfiSa5rRYIr25JCaVLb53zsFCICfVQvh0f2/7SSRkdFHVfxyZ1MNRVGj1G+Zd4=
X-Google-Smtp-Source: AGHT+IGQYnC6s8vq/AC95aOrVG5lPMt5L/uK8n2CYBjMezpKRJ3nt4A8EEH/Dx53g29OqUA7Km8LVA==
X-Received: by 2002:a05:600c:4f50:b0:413:15a5:5029 with SMTP id m16-20020a05600c4f5000b0041315a55029mr6835212wmq.10.1710166186035;
        Mon, 11 Mar 2024 07:09:46 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c1d8800b004122b7a680dsm9399239wms.21.2024.03.11.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 07:09:45 -0700 (PDT)
Date: Mon, 11 Mar 2024 17:09:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Felix N. Kimbu" <felixkimbu1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: cfg80211: Remove parentheses prism2_get_station
Message-ID: <ac756a79-0522-4286-a464-2a62a4fb1cde@moroto.mountain>
References: <Ze8LBf6xSjCRt4rd@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ze8LBf6xSjCRt4rd@MOLeToid>

On Mon, Mar 11, 2024 at 02:45:41PM +0100, Felix N. Kimbu wrote:
> Remove unnecessary parentheses around 'wlandev->msdstate != WLAN_MSD_RUNNING'
> in static int prism2_get_station(...)
> 
> This change ensures adherence to coding style guidelines.
> 
> Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
> ---
>  drivers/staging/wlan-ng/cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
> index 471bb310176f..7451fd2bb580 100644
> --- a/drivers/staging/wlan-ng/cfg80211.c
> +++ b/drivers/staging/wlan-ng/cfg80211.c
> @@ -247,7 +247,7 @@ static int prism2_get_station(struct wiphy *wiphy, struct net_device *dev,
>  
>  	memset(sinfo, 0, sizeof(*sinfo));
>  
> -	if (!wlandev || (wlandev->msdstate != WLAN_MSD_RUNNING))
> +	if (!wlandev || wlandev->msdstate != WLAN_MSD_RUNNING)

Sorry, we're ignoring this checkpatch warning.

https://lore.kernel.org/all/?q=prism2_get_station

regards,
dan carpenter

