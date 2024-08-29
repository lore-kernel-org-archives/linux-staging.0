Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AF0146000
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 05:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909886; cv=none; b=UWU11cd8tpz4qwsn62eSpIJtEbfL5KPM72rUyLXlVdD6rftpzhbgGJc10CvbgEmWu3DjLWyTNfcrIcvH34oUPt2DfmU1ZjmbrU9vBMB2XtKnoE1WP7cOsQvCsT4f/2addbAUkKb6p9w3wnhwZ/r5CrR/DNcN6xf/+7q4XsCOIOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909886; c=relaxed/simple;
	bh=rl6MiMt55oOtH8dBw+mq1miCc0dLP9wb3iqcC7gtzlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eEa28It6Mvb0jGjPNY+CAlwgVpFEJWOWyuGvaHM9BMuCEOCopyOGe66qK1aH54/WrMdxkUBNt4cCfPtTSfZA3kDzckUYNE7ENgcFnuhy0+IKx6KG/k9OILx+tlZrqT5Oc9Ak77PIIq53DLebqrXPcIdVLeijLDZr66UGws3COoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lC38CFaY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lC38CFaY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428243f928fso2713665e9.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 22:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724909883; x=1725514683; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4fBUm0h6cRPfEHOMq53XB/Ov/Qr4PFpK1A6+YnznzAw=;
        b=lC38CFaY3D0/0C1JKDp1xTGpd1bp2x+vCU4xftHcghd0uksa3fnJJ5JcUTsYwIs3vi
         hPeVJ9dw4aZDU7LjDn8b2cOFf1ZZICk4jW4vldhvcywO77CSCDiOPEJA6YJmQyWIByjA
         M7XIA2+gf3KlcnUqwAQwTWDDiTmE2Z5x2fGK7YzXioPrAengLcHi2aGXmM9iSm4LmFL4
         Xi2OTMxL8pKRDl6/8sIITdUmudijC0WIXVv6oqaaaP7l073n45McuslgwwRxjjXYjqyB
         Sd8kmTdqBBdCit3Xd3482Q9xNb/wy0C53Z+48qi4iW2o4eD+ZpZOu5F0el+FsoURCDXH
         ZomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724909883; x=1725514683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fBUm0h6cRPfEHOMq53XB/Ov/Qr4PFpK1A6+YnznzAw=;
        b=Jcm8/ydHDgpHVQFG+asaKrpz1Y5Pj8rhQSQnBtmAkFIVpD+0JwCpSzvgf3fy+03ut9
         /uu23JakUigzEjq3mUOi+nX68CuVJcSuqBrYFQgB7fpsevkqp2DrBGlPNSWuwD0Aorgs
         8IrJO+LZy0dNyRfuo1ywIFgFNg1HeU2t20AjUGrh/2roaeyp7zRNJqOvepivNnd/LPAY
         2WSu9XNYR3W5+HpDj5b2Xc2+/x1sG2dQ8KM3fvGvFhCo/UYFSkndRAhdLWehItnk5/OQ
         nv8gYUPj3i9TjqHgXYFIqhLX2NcXlOwkQu3FGLxO/7cP/MPHeKwMLsBmZvuqvNH9osjP
         P8fg==
X-Forwarded-Encrypted: i=1; AJvYcCXcYOlLz05+0Zt0hd0YUuKTQBFqx46FaSyOtr6DClC3S6YIDbBPMCQF8DGGxBt0ix/8jhGymX37z+vDfKm4@lists.linux.dev
X-Gm-Message-State: AOJu0YwCJ54cwE5COXASAfrvR/87T2N8N+uY5MnmpGbNbWFppwMQAJr+
	Y86Z0h5d4D4KMQ7APDGdpY9lxQzkxlRzWLg9UJveNbZzXKHPI6qv
X-Google-Smtp-Source: AGHT+IHy1J5FktI6cmRfNoPz6x+FDas92ofFhixmO6MS40it5IQqU/ciqzng+Ya79H+JWorumkQoaw==
X-Received: by 2002:adf:f052:0:b0:371:72b3:643e with SMTP id ffacd0b85a97d-3749b57addcmr1355931f8f.42.1724909882914;
        Wed, 28 Aug 2024 22:38:02 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898908ebfasm29973266b.95.2024.08.28.22.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 22:38:02 -0700 (PDT)
Message-ID: <3d9f32ca-c21f-45cf-bc4e-2cc827385d0e@gmail.com>
Date: Thu, 29 Aug 2024 07:38:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] staging: rtl8712: Calculate size from pointer
To: Manisha Singh <masingh.linux@gmail.com>,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240828222153.68062-2-masingh.linux@gmail.com>
 <20240828222153.68062-4-masingh.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240828222153.68062-4-masingh.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 00:21, Manisha Singh wrote:
> Calculate the size from the pointer instead of struct to adhere to kernel
> coding style.
> 
> Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
> ---
> Changes since v2:
>          commit message updated.
> 
> Changes since v1:
>          Broke the patch into 2 different fixes.
> 
>   drivers/staging/rtl8712/rtl871x_io.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
> index 378da0aa7f55..20e080e284dd 100644
> --- a/drivers/staging/rtl8712/rtl871x_io.c
> +++ b/drivers/staging/rtl8712/rtl871x_io.c
> @@ -48,7 +48,7 @@ static uint _init_intf_hdl(struct _adapter *padapter,
>   	set_intf_funs = &(r8712_usb_set_intf_funs);
>   	set_intf_ops = &r8712_usb_set_intf_ops;
>   	init_intf_priv = &r8712_usb_init_intf_priv;
> -	pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
> +	pintf_priv = kmalloc(sizeof(*pintf_priv), GFP_ATOMIC);
>   	pintf_hdl->pintfpriv = pintf_priv;
>   	if (!pintf_priv)
>   		goto _init_intf_hdl_fail;

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> AW-NU120
