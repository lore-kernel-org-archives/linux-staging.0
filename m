Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4226F380FF5
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 19:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787512074; cv=none; b=s2VpoTi+EVAf4x7UM806bMi9rk+Ei6xTC+VMihf99968WCoTXXIFdSaKf8FiKziUVthIUYLks8bKnnMyXe01b9aa63bzpsg9lBVdwH2qqyu9CEH/jf+EG+iZV1BbJwQwFgDGygmupUsnc9MTwMK80I83vJNaJQFOxzQTUN8fnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787512074; c=relaxed/simple;
	bh=CQJC0E7wvssoytZ3/3JmBnW9KR5BX3DySTo42bmWmQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMbZu43i95sTh8db6zb0/SC0kUmzi6FXgAskxw+C4Ei2WjXHZOv+KvCJWijEZUgvNdhIsLi/+RU5bERc4605R48jyTPWAkVvAjWAKla18YXSwrcrmCHIoStS5inDFBNZmUHGOXNzWaZ2LXI6+jsTi6bC8Lhp+zcUJJ+GZuMZNaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRddi9L2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRddi9L2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so24960945e9.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 12:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787512071; x=1788116871; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ECmTe4mD+pvSxK0P8Riu9qjgxTYLH2HbsrTUqFg9uV4=;
        b=pRddi9L2RH/wkACLuhMNYkr+q9r0AvUtG1wXA5FnintZ9xoVYsv4IbDMSHjocNF3Yk
         Skh+HcFLWcD9zrmntVq7na8KFLeZhAiO2E7IURCDlSM0suUXQBa4zlTdFxzraPJojG3q
         niQRYPRLtQ6kq4VFToITwb3MJVXUfQpj0cpCfdNbK5dAgtcLWZ3aDlmbdp1x+0nrbU+P
         dg4pVtCLU/SwMiu9kapWDxtqOm6unL3CsinR26a5+3YRwwArMUbPD7Gdpa801/4xTr4u
         IeyDVQ1I3F0MnsVw8oZSfuh7fCkuFTp9Spvxt/2nXbBqE48QBBFqqfDvmX4FNa/Q8/Hl
         AqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787512071; x=1788116871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECmTe4mD+pvSxK0P8Riu9qjgxTYLH2HbsrTUqFg9uV4=;
        b=Ai5FNHEu+71XXAcgXCz9ZsCaBsk/gDARaC86DWsauku44s6ZHXSXBQnau8lf7EfF8v
         /gDsiRDBNSwKMZ4VWbG8NbhWKKhsZrAak6BBdfUfkerJWt7nuo1KBoRyqSlsQLJXdUNG
         AAa4aSvTLYwkmKR5aDkXGau5xWLoAbVw9yElAmt/j+9s+10sTF9z8yksFrUDyIR/XSa1
         dnj/NAkw6aYBXmNXsufnCvJqjOHKoJpVcHl64NAyM24YmLLvlOLerd8vDNjHquutXx9h
         bMUpyRwzWTuzal/CgnnD1XH5k/Kqa8oKJIQir4d4156x0ljcZ5cKSG+pAIO5W3n1+S/Z
         dPzg==
X-Forwarded-Encrypted: i=1; AHgh+RqrU4RShJjW1UP3Qss/lPcrCwn6ExK0OqdAHewQsWzXQmVCfyQ47QW0A8GrjdKRGhJHVZO2bVk9dZ+GmoTS@lists.linux.dev
X-Gm-Message-State: AFuF++nA/ERVJTcRx1OgP2dEeScAgxH1PstSV2vDlJB2NpKecWqQeYIK
	mjd5DQbELPcDZmeFxQgco9Crv41J7l8ggq9kFbK2yu5+c25qZyYkFRsITR1kan9wuIFGaYf9
X-Gm-Gg: AR+sD12O4m5RCGHlY/Fn5EtqY4vog9Pu1sU60EoBpJEDv+TxswphAI4vQFX8zsMY1kq
	5h60FVt9oRnCHjok3+t8jSGb07gn1WO7HqPgW1XUx+59Vqb70/N+efSqCKvqRUyPq7opAg1VtHR
	RCMA2EQ3zVte4FvPZ2nk6swyVUvYD67W9FJbUuoHukiNJ6xvBX2l3tTfghYvj2yv+34qVWcLgco
	/9M9DVYOBxGgV3CJtqpgWUO6tNMaOQ1A2SmdaRrOMheCpWFubgzSNkzJGI9ltt/6GQQUkFSeAZL
	vEekXQL2NsoDEZ8Fv+y0XaNPRWY0LwongoNbYfgogiG+Dcd0guEnFnXfpv0XdFkNYPdMmVKzAbp
	Ml1WGv/ydYld293diZKIXH+CC2rpfA1SX0xds8YGTUz1uEr8j8IyD31BWruEmr2vcRVj1upurxV
	TuljwPGCTz/qffPKYrqrSVpWQ9amhi7MWC7IDY5b435c4KaL8f/FKX1R+U
X-Received: by 2002:a05:600d:4452:20b0:499:7219:122f with SMTP id 5b1f17b1804b1-499c19a351amr106732185e9.4.1787512071453;
        Sun, 23 Aug 2026 12:07:51 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499cfea058csm4126055e9.2.2026.08.23.12.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:07:50 -0700 (PDT)
Date: Sun, 23 Aug 2026 22:07:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: fix space before tab in
 rtl8723b_xmit.h comment
Message-ID: <aotFA5yIsp33Ssua@stanley.mountain>
References: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-0-11f2600e470a@yahoo.pl>
 <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-2-11f2600e470a@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-2-11f2600e470a@yahoo.pl>

On Sun, Aug 23, 2026 at 06:46:32PM +0200, Tomasz Unger wrote:
> Remove a stray space before a tab in a comment.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Verified with checkpatch.pl - no new warnings introduced by this change.
> ---
>  drivers/staging/rtl8723bs/include/rtl8723b_xmit.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
> index ddf868c7899b..c2b5696554fe 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
> @@ -366,7 +366,7 @@ struct txdesc_8723b {
>  #endif
>  /*  */
>  /*  */
> -/* 	Rate */
> +/*	Rate */
>  /*  */
>  /*  */

I'm not sure that these comments after #ifdef add any value at all.

regards,
dan carpenter

>  /*  CCK Rates, TxHT = 0 */
> 
> -- 
> 2.55.0
> 
