Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B737A4AF
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931401; cv=none; b=XE+h/hwjbFwe7LJ/j5GgUccL8buyBdJZQKPJlElIKdEUC3svmQ4AkNb/1/bt6SWg6Zrujo3PDPJDgfkqJqPht74uTm1y7f/T2J+IzflmZpVWBjDPjkw0qO0R1XtogNVrCbZUL7Nu4pJbt6fzkbRwAfnQyfKH+hit6fjS0Yz/aHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931401; c=relaxed/simple;
	bh=KbHkSdaA/HNHuD/jlKmnBC2p7F3jusOzmqufE2z7jAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPMLMyEHU4BFl0Xg5CMoLtMBhN5jWdblxo89BQlTNm/swAMBXH+qIfJ4xUelc3c6NWZYQ8I5B51qScYcnA2znmrl3NsUft9ABag3dhBFQRy7QX6+Y+4m/7iAKynlyhXqRTBv6trIYXAwPpmWS8ygWcettK0/6UAVaVUH8VNNOTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKUokl3z; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKUokl3z"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4376de3f128so3835553f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 03:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771931398; x=1772536198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xb5ipTNXNt1FgRFvgDAfAbpjnKeGkqewyNLLgEM4Hyc=;
        b=gKUokl3zOWlSzRp3SVwFraD5dRk+clt6kamIWGwyhvez0tjfjIZSYp9BJacQ11HyEw
         ZtMF394pqDlPN7H8agpyrrT3qRPteUNSpQPUkMtAM1+muMTiYZD+zjpCdF72hINic+M5
         8AGGMOmx+VvX8IQkrxDRtfO0lC7zkgtkKdP4jdaXltDocrJqeW6S2+cKTiNd6eJMpMkw
         uewuBhH2psGzgCvt6GXv0Xuly4JY+IXLI++JhjKLHjvMGqI+MbiRWWCZV+lJmvzfARRY
         dML86gTypIIZ5I9yHjtnyTbkUUvcij8TK2NnIrbMskBJFxuIRLExPe0g4+YGrivb8hm2
         RABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771931398; x=1772536198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xb5ipTNXNt1FgRFvgDAfAbpjnKeGkqewyNLLgEM4Hyc=;
        b=boFTnd1dDa6VIdwJQCY6cSy5EjGmVXQQR2ymFZxUMzxBr7fFWt06aaxL+x7Pb2rRgp
         acX0kr4/8uGWmnbKr+s7ZbJLX45CCFNmLURliOTUUwHrBuZgSu9oEqJoIgi6lcU3uoGN
         4tN8YBVTJt1cwP9Tz7NCpkiPuvcvMkEJ9a0s1vOzHHivkAnJPwi2oFIJFbsFcN8BV3jV
         ePOC0xPq9IYBlONoPA7L77gTNYdHCQZ/qs4zZoqGp4444TaYXgRPFNpllE9gPLk7C7Jx
         qk4Qm63RC/N1j/wJS2/8hkeumC/T1C55vACaLJi1LIJsmg1ce8xECHhBrt/Z7YMWEsta
         NVyA==
X-Forwarded-Encrypted: i=1; AJvYcCUU6XO79eTPDIzOizAjUwDUV76XBUBL6a/oprz0JGwF34HXD+6cAOJK5I5w2YLMnapx/1LrOQ0gofYqgSpq@lists.linux.dev
X-Gm-Message-State: AOJu0YwIppgcNoM1iQdj+ETeaxFVGihy6s9EeN+LNY9Mjul+e0lHF5fv
	rclPLy8051AE7ll/jnAJ1xj9jMBs/gSgFrI6cRGyBP/qHiLq54dBbxo9qhMlkL9NHJs=
X-Gm-Gg: ATEYQzx/DxLBLPpaA1XcGoNIoJ2Jssm7zORC7+pY2l1C6Dx9s42X3cJDDG6yuPBX5KF
	ThTS98iZeCP3luI8qE1z49eOS4Cs4CngUC5B27ifJ/an+/mBq7coP4WpqWjTSFmgA+io+vNIHlK
	uRspeuInbQouzkwL4QeSrli++0q6WetzvsfOrCyeBljOLVN/7acl2AQF5XwuQzXRsU4SgamcWM5
	5/xxDVjjnCnMtLXyDHxnWii1gFVUF4x4DrMIn3n7RaqXdwaxFNnfmIrLTfOpn8CCcp5lT9CvxEL
	eqbuEaSF7P4hp3d226SYW9bE3AmNg3LN1bfiusmS6RbfYz2FxEgvXJc8liJHpqJjpsYXh4TpW4K
	6LQfUxry0k6RcLfO+UiisWhMeXhUkAzyXEroVoOJr4Gtn4qmVI7b/4nX772eSyONNRgrnRDdAsS
	l8V89d/LhHmsWwykPpa5E+nC77RAGB
X-Received: by 2002:a05:6000:4201:b0:436:38a4:2423 with SMTP id ffacd0b85a97d-4396f168784mr19960854f8f.22.1771931398006;
        Tue, 24 Feb 2026 03:09:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm23907947f8f.24.2026.02.24.03.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:09:57 -0800 (PST)
Date: Tue, 24 Feb 2026 14:09:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com
Subject: Re: [PATCH v3 3/3] staging: rtl8723bs: Fix "adpative" typo in
 rtw_xmit.h
Message-ID: <aZ2HAfXD2_llaHwK@stanley.mountain>
References: <20260224103413.48216-3-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224103413.48216-3-giorgitchankvetadze1997@gmail.com>

On Tue, Feb 24, 2026 at 02:34:13PM +0400, Giorgi Tchankvetadze wrote:
> Change "adpative" to "adaptive"
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
> v3: resend as series with unique subject lines (Greg)
> 
>  drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
> index 544468f57692..67a5d5f78a1d 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
> @@ -157,7 +157,7 @@ struct pkt_attrib {
>  	u8 key_idx;
>  	u8 qos_en;
>  	u8 ht_en;
> -	u8 raid;/* rate adpative id */
> +	u8 raid;/* rate adaptive id */

Add a space before the /*.

regards,
dan carpenter

