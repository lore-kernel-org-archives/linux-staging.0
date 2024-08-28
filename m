Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A766D328DB
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724869166; cv=none; b=JJOtN3CPeduOcX+b6xRGECQDV0ljg8GZx/NeJSfccFRXz7ta7ZCL9v7NHsa+6XWdhJITMw9hIgzW0RYvbeb10VJr3gebhaqArQ/S+GzGy6md/QoQgJxWdVAtxyWU8sC9ebsxAnDe1P3yGQD7t2XKmfN5KEKh1A4b4y9zL555+NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724869166; c=relaxed/simple;
	bh=VYf0FLEIruLhqU+c7pX10cJgxFA9uzvQv4RY7T3laNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2b9G2GsyhaZ+8SBiiXyvSN0qo08iUijnA33OkbtQDCxfYrUCTHNlWgO17idXg84L7wzTWRxwiYOm0FD+QJBrmTcBKi2eg/8K/7yAifhPhujJPQ9HtebJf/JLw4OYm7yozs5V5MJ6PGPorFcpCuOOSy610+i/eT6zq53hvjsZzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxxMTru9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxxMTru9"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8695cc91c8so738591466b.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724869163; x=1725473963; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ll9ymQRK3c89EjXOhHQT99dVXSCw3AdvtufLABRmB1w=;
        b=OxxMTru9Qth2dZcC+ZdOYrWxQCNnO3q3tdyX7jeltOPq9HSOxPa+u6rAAdB39EhxwK
         ok6kF6kZ8Oyhwnc3d2hWY6ELfEBNmnhcVg0aeNnUvs0lqeYCIGJNWuhHilWgG5SgNYQS
         wTb7xRRoOMmIBwzQh1nnIm+EYlHg5w0JksLycx2MJaWtsprh+es2zuYpWQwWWSN6qrTh
         UjXmHbfaMeCOJ0oWy8yGz12pKbvB14BsxWCsoPS84ewuzUS3PEr3yfkpx8QqAYaSiKXl
         QRm4IM5IpCgd8d7nxWVBiZ/kJ6vsgV4fYyQbAbvVW1lXnRU+1AvP1MsFJAFfLUS3okn8
         ZzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724869163; x=1725473963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ll9ymQRK3c89EjXOhHQT99dVXSCw3AdvtufLABRmB1w=;
        b=ahnh8c96DTibKu+6R/i54DOqWLw1xsCZeWezCLz6dQ4ln/v00k2dE8HNTGFx+b5yLm
         1RXcNUrpnOQ7+KThn7IP/FWbhuAcZqOIwj/vJsyrIzsVVnsdk2f2oaFtIfbbuBqL5W3w
         jYaDXIG5cArYHL4BOEHZ7EDTaymVxHV2TxOQ32RJuPUiD8t0SS/tc6I+1uZSb3QNPH0f
         b7Qx+1bUPylf8aGojiq3t920xJfzGf+PFqAb9OT2nyrviGUCkpUl1k7f5spb8VuMQ6KZ
         9muxixmLgTNmBfP+9DkHOyW2jmYgZY03ca4LzZ0Vs4758+cosT/LXY2AEgVo3DZDIK+A
         SmKQ==
X-Gm-Message-State: AOJu0Yy/r2+o+v7jbw3hh5Zt6wwNr+xAR5TaY4ZvHWjGpIhjSs5uRoGm
	YFsQi5iee6o6yAYK/PYsfqUWb7MYsqc0F238gzAK6JvNOqdPEwvo
X-Google-Smtp-Source: AGHT+IFC2Ev0cl1EQk+8n2j5eX7pDfbLUfTbTHVX9l3u/QRBzew8sNGv73RCGUqMWrcarR5Lyc0fyg==
X-Received: by 2002:a17:907:da5:b0:a86:67e7:c740 with SMTP id a640c23a62f3a-a897f84bbf3mr24063466b.17.1724869162561;
        Wed, 28 Aug 2024 11:19:22 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8553:56e9:1165:4741:30be? (p200300c78f2a855356e91165474130be.dip0.t-ipconnect.de. [2003:c7:8f2a:8553:56e9:1165:4741:30be])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e594e5c3sm269743266b.216.2024.08.28.11.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 11:19:22 -0700 (PDT)
Message-ID: <6d8c9d38-0df2-4aef-975d-6a0eb9594513@gmail.com>
Date: Wed, 28 Aug 2024 20:19:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vt6655: Update maintainer in TODO
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240828144545.76022-1-dominik.karol.piatkowski@protonmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240828144545.76022-1-dominik.karol.piatkowski@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/28/24 16:46, Dominik Karol Piątkowski wrote:
> Commit ed394dbf5371b03a5335a7ba1973ba124c0ced3d replaced Forest Bond
> with Philipp Hortmann as vt665X maintainer in MAINTAINERS, but
> drivers/staging/vt6655/TODO was not changed, rendering it stale. This
> patch fixes it.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@protonmail.com>
> ---
>   drivers/staging/vt6655/TODO | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6655/TODO b/drivers/staging/vt6655/TODO
> index 63607ef9c97e..529bc22cd608 100644
> --- a/drivers/staging/vt6655/TODO
> +++ b/drivers/staging/vt6655/TODO
> @@ -18,4 +18,4 @@ TODO:
>   - integrate with drivers/net/wireless
>   
>   Please send any patches to Greg Kroah-Hartman <greg@kroah.com>
> -and Forest Bond <forest@alittletooquiet.net>.
> +and Philipp Hortmann <philipp.g.hortmann@gmail.com>.


Hi Dominik,

I propose to remove this two redundant lines from TODO as it can be 
found in MAINTAINERS.

If you like you can remove this information from vt6656 as well.

Thanks for your support.

Bye Philipp
