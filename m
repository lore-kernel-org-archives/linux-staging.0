Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1558B2F54
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 21:05:21 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-edeb6c3642so24771223fac.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Jun 2022 14:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hZGYROhtc+r5EuBPRXRPsq3auazBOIHrsoWkHCkus/A=;
        b=E6z/y3535PwEvaGG/kczDZYWKzEVC6yPiv3C5AOpZUUtDJzOO9teoQRjjnYAXGY/MK
         kTE/tyJWS3Zrxfva/UTAXkMXotRgAFmuAyFavxkHgbGfgyN9LP3pOizIrjZic/ngk6Cp
         kufmfKYN+H8sKOKZhCFGm+yOu+ewKoIOUHoyuFimHPlvSoUQBhuP4KYxaOyFwg7D+zMF
         WOJLKXYglQ+/VHqh5e0vVKVyKEY06n/ZzlR3ybpTbpo1W7vkWXet9QHfkGWCEGJjZHBp
         XnCXsWkRXca5yIfU/yOLjuJMe5j0nypTixqvhRDiwV15tugZS+I7LOVjsaGkMdZcyjCy
         bn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hZGYROhtc+r5EuBPRXRPsq3auazBOIHrsoWkHCkus/A=;
        b=OoP9ngpMyus38MacR6goNcmnqieh+AhMCIZ/E4Xm6nrNtecXYACS+Vynmgy5D9g2Yi
         JuQPmloxmR2zavcAbi3HNw+rb/WMVlVBxxpubJ2MJUFKLeawIEnei25tcb1PFGZLM59M
         P761ZV0QkBmqiRan63quAYkJFq27UXjuujJaaJelBzA/8TafkRC4nCSQSqWRivupVmCe
         uKWZmN8tE+GV9gaLEanL/vxcwzl5g8F4WEJzVHRMkbPaq41VA9f0nLEtTLruqllKqID6
         HE4kC/PwCr6DKCOiV5NClKQz0vbcERN3QyA8oCN/5UX8dfh5wwwxmBhVpczq/IJsjn5B
         nNiA==
X-Gm-Message-State: AOAM533oRYVx48jbpfqW1sN0azSFYeeq0Yk0L7OvBK6lTe7dFoTU4GOH
	zCJKGBlzZCNXF5AvtKRPJ0s=
X-Google-Smtp-Source: ABdhPJw0ntHjWYuJvNi+dH0TcqFOGxYGzKyN3xmI9s3cUSfSR64Qm1HKl7eYIQiwkRtnt+5C7f+Bew==
X-Received: by 2002:a05:6870:b41c:b0:f2:5d2b:9a77 with SMTP id x28-20020a056870b41c00b000f25d2b9a77mr514272oap.62.1654635921154;
        Tue, 07 Jun 2022 14:05:21 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id g3-20020a056870ea0300b000f33ced2c50sm8519389oap.56.2022.06.07.14.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 14:05:20 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <69f9ec95-a680-d251-ebfc-1b4c20bfff5e@lwfinger.net>
Date: Tue, 7 Jun 2022 16:05:18 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 4/4] MAINTAINERS: add myself as r8188eu reviewer
Content-Language: en-US
To: Pavel Skripkin <paskripkin@gmail.com>, gregkh@linuxfoundation.org,
 phil@philpotter.co.uk, straube.linux@gmail.com, dan.carpenter@oracle.com
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <cover.1654629778.git.paskripkin@gmail.com>
 <d6f6420a0d5ceff6bb50d268023f7d2e117027c5.1654629778.git.paskripkin@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <d6f6420a0d5ceff6bb50d268023f7d2e117027c5.1654629778.git.paskripkin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/22 14:26, Pavel Skripkin wrote:
> I was reviewing r8188eu patches for a while, but I am missing some of
> them, since I am not in CC list. I want to be CC'ed to help reviewing
> and testing more patches.
> 
> Acked-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> Acked-by: Phillip Potter <phil@philpotter.co.uk>
> ---

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Larry

>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a6d3bd9d2a8d..60e5e4007844 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18920,6 +18920,7 @@ F:	drivers/staging/olpc_dcon/
>   STAGING - REALTEK RTL8188EU DRIVERS
>   M:	Larry Finger <Larry.Finger@lwfinger.net>
>   M:	Phillip Potter <phil@philpotter.co.uk>
> +R:	Pavel Skripkin <paskripkin@gmail.com>
>   S:	Supported
>   F:	drivers/staging/r8188eu/
>   

