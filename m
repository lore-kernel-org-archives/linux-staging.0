Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D0770
	for <linux-staging@lists.linux.dev>; Fri, 28 May 2021 03:33:04 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id i5so1558127pgm.0
        for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 20:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cei8oo+HPvVJ9fZxeoi8qQ5wH7hhKcS/mBu1SpW4Brw=;
        b=wcZbHtujfBzWSHe1CLq2E8os0pvIJ1mq/Y6f9N/+AjojdEWH3jQU1iFL2mVkihSa8m
         3V8uHxga9sLyNkEmS0toTIkZOnQzFg8JxkKa8x+z5xIeSz8+HBut0x/BDM22jmM07TI3
         UVlqp7ZBBAiUtqNulF1HEUC6iveUY1FndJb57M2jARio+AZOzNoydf1FulGo05VXGZ2w
         efzcJ7EcC4YYsQ+j88Pwyw7NxVEgAu+igIY5xgSQwRoyLDz3XIo/WTTEMg658nPPXRSB
         q9bT5+a2wJ7XrlJ9e/9F85Xo6zFSYfdkVvOGY0YSc+WeBq9e3ggaK25CTZDhTjzO3oXV
         XpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cei8oo+HPvVJ9fZxeoi8qQ5wH7hhKcS/mBu1SpW4Brw=;
        b=cOx68qvNElEg3OdzKzc3C4gXvPIdVplD8g0TATtzrnsYBoc8UPPd9J/liJFhtN2tcL
         TGnTgVzaPOJ2QYACRqLOihY6Ho2uU8+mVyLb+l8M/73q4628xR9TJ7lcsVnANMWCYDVL
         PFSQPmopxw6YR4gIhp1djrbzJmIM19f5bxhnQKT745hePx4j/xNduE1B9EQ5i9gY12i0
         ojeAQNBczOcIXyuieGum9PSebGuUVnnqQKPr7Z7dt7qMHMo2z9BzQrynroRLBLXY6y+I
         ruc/jNBcgt9c+HER+2Gcc4Fs8SVS0f/indubaSxj5i3BVhPOUvtkDKFy2YEa0aoXz2Uc
         R+Wg==
X-Gm-Message-State: AOAM533uGUpOjeb446Nud+1EIviQo6D0wCY1OLAyDiGGcB+aOBAVZskf
	uCrjNdgyUxIgIF+/Sb8S/2ktqg==
X-Google-Smtp-Source: ABdhPJzmecE+9e5/NyCm7sdGBNpfaskD2Bht/Jlndatn1M5IipDl+BlZTrVh8NcOArBsZSjWxdZKsw==
X-Received: by 2002:aa7:98c5:0:b029:2e9:4382:fa03 with SMTP id e5-20020aa798c50000b02902e94382fa03mr1686102pfm.38.1622172783909;
        Thu, 27 May 2021 20:33:03 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id w123sm2945993pfb.109.2021.05.27.20.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 20:33:03 -0700 (PDT)
Date: Fri, 28 May 2021 09:03:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: drivers/staging/greybus/bootrom.c: fw is NULL but dereferenced
Message-ID: <20210528033301.soqgwfwfy4ls6a2a@vireshk-i7>
References: <2015099.xVv48VzNit@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2015099.xVv48VzNit@linux.local>
User-Agent: NeoMutt/20180716-391-311a52

On 28-05-21, 01:39, Fabio M. De Francesco wrote:
> Coccinelle detected that fw is NULL but dereferenced.
> 
> static int gb_bootrom_get_firmware(struct gb_operation *op)
> {
> /* lines of code */
>         if (!fw) {
>                 dev_err(dev, "%s: firmware not available\n", __func__);
>                 ret = -EINVAL;

ret is set here.

>                 goto unlock;
>         }
> /* lines of code */
> unlock:
>         unlock:
>         mutex_unlock(&bootrom->mutex);
> 
> queue_work:
>         /* Refresh timeout */
>         if (!ret && (offset + size == fw->size))    <--- here

Since we are checking for !ret here, we will never access fw and this is a bug
in the tool and not the code here.

> 	next_request = NEXT_REQ_READY_TO_BOOT;
> /* lines of code */
> }
> 
> I really don't know if the following change may break something else:
> 
>         if(!ret && fw && (offset + size == fw->size))
> 	next_request = NEXT_REQ_READY_TO_BOOT;
> 
> So, I'll leave the problem to the maintainers or to other people who know how 
> the driver is supposed to manage fw == NULL.
> 
> Thanks,
> 
> Fabio
> 

-- 
viresh
