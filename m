Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B73E1DAC8E
	for <linux-staging@lists.linux.dev>; Mon,  6 Jan 2025 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736159563; cv=none; b=h1HjELaiU+zMUb+3D988DUazrdTqXSfDfl+jD3ZN+hjoR33nIhABIMyr0Bf6fvFY5vIz0uoIpaU/wkBCM3RAogbobC0lu5vwKfYR+Pvg4zYsZWPXDqXBPY+fDX/iop0FiNAYpBmdHejzx2WEpJx3f/+MQ0BEZiU1dDZW85ExUU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736159563; c=relaxed/simple;
	bh=HXMSDbasNbPdJOOO91H0ouSk4wRl+RFFGF+4VQfRjQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaprwTKY4UJI1zLlD0nKShVbiiCpTPR4zLCL31WDG2CYkc/jXk+tWnXYM+TMcgpGMIpbu5o7376Jd2qDQH9E4vxw5U7UohgNwmmHIiGWEIRJ1ywvQoT9O+UtdpF6g/BRfxSwvVYsqSwzTPbSyXSU3w7eV3arWstth0kLvJ+wnjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kax6izJu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kax6izJu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361c705434so102483695e9.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Jan 2025 02:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736159559; x=1736764359; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GH7hQT9jqMX1zVTGHAF/1/kQ0oSFq2NbxlUNFuaETgk=;
        b=kax6izJu5K5654q3nX/Regra3C0oRvZdP0qZD2WkMJxQjCEtQ4D59RwJsoNP5ZcaHa
         hxzGaav9k1S5KV3ch1MZ/1yYfq2DqY32cUm11mEdtXgUKasU23AfAuOqW0N6frzWVGiA
         AqEOtr01Zj9Jkx2Snw8Foh6GCRzBfMkwRfICaR0MKdubTDz4lYcW2GsR9inyXjpCrC/i
         srYv/i05zQlnxljbcojBkGZ14SR+6er9ErgYLzcfj3v3jZIUmjb7EeyxzvfkhAvTZBuZ
         6aQ2JVm77bEzaSRzUcMDaa8X0cwHZOa4pkUskbmFbKlDvpKp1DR0E3SADWCgMD2zcY2B
         psug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736159559; x=1736764359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GH7hQT9jqMX1zVTGHAF/1/kQ0oSFq2NbxlUNFuaETgk=;
        b=KpsVKKSrg24uZWpcJf7PPd8XiI3qJZUKALCc+hr62na3B+2aFNDXp6lzWue/804Hu5
         TIa19yd6WhLiWwujtNgZCBTQVaJYeMSTfL4LnCXFMur20dg70dJEegJ9GL/U7SWv2jTx
         0ILnlQykKE8CyJVuZBwLTz55nXDhgnbzSkjA9SdZZdyJEYRqebfuv6TRD7/cSVHfBsGz
         Er75QvmmaRe4Ora5We0ApxT9ht0l3Cyuz18AWVAuq93gVIX6WuaO4ukf3Wx8QsPFDOZu
         78lIjkOdMLCtOCreFYqjxrTouyqbAAvgbeSrxmx6MOXVoRLIJDAWObMOKClM9KvSTeZr
         jGXg==
X-Forwarded-Encrypted: i=1; AJvYcCUSuBbwGBZKx7Q9oFipb2B0hnDbrl/uDFeFhK+/RXo5WJFna6SU0vdb0Yxe8LhlJKmLwfuecuMp0c+j2KNL@lists.linux.dev
X-Gm-Message-State: AOJu0YybNhKER9X+88nL5zO0wkuRfNvA0ThTPymFPwAOru1Yb/at9Wm3
	1vF6kt4aK/6ZOYYSKon4Q3zga9ZvIt+e+0AGT9c7c/PhrGTCw1nvkn7UT0IoNeo=
X-Gm-Gg: ASbGncuT4gEKNqo1w8Sr7bAf9EugjN91bzRuNdnrO97ONC9474NRWSyLiVUmE+zrejS
	QvhVry7XKILIXIAfnEOdsPvyChUe9oyOkpXXLcp/w4H9m9DP5vjR7UeYQ+gMAhG58Op0HCD+LEU
	fOUApZ/rrg15V8Uw+avVXn2WRNLyuYYtWZWnLH28UCbl4i2b0M3C8Z/cewdg9YzWBnVQd4q9O79
	jd5O7KH9AATA19ZgghuLwYi9iTZpYDhxCcDKIiu8iGEMUWlasacUuRgPoWcWw==
X-Google-Smtp-Source: AGHT+IG8jBsrzdJBqVJTPrEb2Csym7PPrU1/28OeiLu54VeSEpWokYpDQycJjgMyw8hu2Rl2msTB5A==
X-Received: by 2002:a05:600c:46c7:b0:434:a4b3:5ebe with SMTP id 5b1f17b1804b1-43668b5e244mr439084205e9.24.1736159559633;
        Mon, 06 Jan 2025 02:32:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828d39sm49078425f8f.9.2025.01.06.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:32:39 -0800 (PST)
Date: Mon, 6 Jan 2025 13:32:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix network selection in
 rtw_mlme.c
Message-ID: <f6e9c698-60ec-4c46-82ea-9807074cf7b0@stanley.mountain>
References: <20241224132019.75475-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224132019.75475-1-evepolonium@gmail.com>

On Tue, Dec 24, 2024 at 06:50:17PM +0530, Atharva Tiwari wrote:
> this patch fixes the network selection logic to avoid selecting a network
> with the same ESSID as the olddest scanned network if it was scanned
> within the last 500 millisecounds

You need to try use proper capitalization and add periods to the end of
sentences.

> 
> and please give a specific value for "new enough" on line 481,
> i have estimated 500 millisecound but inform me if the value
> needs to be changed

If you don't know then just leave it as-is.  Don't just guess.
If you have a spec or an expert to consult, that's fine, go ahead and
change it in that case.  But probably if the answer was really obvious,
then someone would already have changed it.

> 
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> ---
> Changes since v1:
> - Changed the "new enough" value from 1000 millisecounds to 500
> - fixed some styling issue
> 
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 5ded183aa08c..6604619d1b99 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -481,8 +481,11 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>  		}
>  
>  		if (rtw_roam_flags(adapter)) {
> -			/* TODO: don't select network in the same ess as oldest if it's new enough*/
> -		}
> +			if (is_same_ess(&pnetwork->network, &oldest->network) &&
> +				time_after(pnetwork->last_scanned,
> +					(unsigned long)msecs_to_jiffies(500)))

This casting is unnecessary and puzzling.

> +				continue;
> +			}

This line is indented too far.

regards,
dan carpenter

