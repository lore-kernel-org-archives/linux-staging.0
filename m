Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5527B
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 09:57:45 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c12so6785074plr.6
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vlikIKO1333lX4AaZjgRA1Bg7ja7XLdznCnk4eQrE/k=;
        b=mIf9inq8z2WTIztP1CLWeY+QoHPGbssx1rEGaCCx07CXZSOHwnLE5XlMN59SISjIPn
         pGFJ4eeRoxGQNXpvCHFqOQ1lA0lVuadJArdxjjGNRhvP+ql/lvMMfllTyqkLqn9vPBa5
         weFgHlGEVzACcFIEqFb4MPXNvjIYNUHo+xsyhD3TuIu4LRy26bEifE3QSVnLBFErCUZz
         AWEORTZTEUQLoHTXAEJqBr+XfmoewROp0dFvIcmMItDJHpcyEZEHFvRsVydO/Cz4ZGiA
         NRvpLVrgX4tNXQjTlqIHrByFZ9/ScO91tRjZibnD2W+IeA19Pgre/e60S/pGE/2DZYmc
         om4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vlikIKO1333lX4AaZjgRA1Bg7ja7XLdznCnk4eQrE/k=;
        b=SEj3a5BINHDbNw0Tbi2E3M5QHWbzgdQzzvYHd/ceT3FuM3NO34FixLGec7X29T49B6
         oWBcSVW1Y4XMSwTNwpVDsFyHXnOBL9f720sIPp8fsprzl5GuO3YHN3Dk/pweNR/c4O7P
         edgWNcmVH2b7teka7s79UoxQWDHc9MxFq7pXMC8MgJuODFiFHHHz8QbElhiA02vldLEd
         x3cGpbP3J7GZUFWXaice6ht9scTW+4Kk/dV3cGES2BdnVA1JXUCZh8sQx/uPGsdGYqn7
         K3E1nuOdaMZVQqmsH8hiB6ZwcABtaKB002JJgnGarnCUN0Dg95Tsj3u8lNCOu+diemFy
         xyEg==
X-Gm-Message-State: AOAM530rnqGq0ke7xPj791lPzWFLvreb5dyrw7BGUmFvmerwDp8bvmHX
	lx0DFGeGLy58XWUIdbxYn6U=
X-Google-Smtp-Source: ABdhPJziYAtFIOUcFZRB6U96Epf/tqOVNQNnP4DsB3SGkpbIqoqzS3GsYtZM9pXtP8KDuP3cPrzyKQ==
X-Received: by 2002:a17:902:b597:b0:158:1aee:1b59 with SMTP id a23-20020a170902b59700b001581aee1b59mr35202651pls.33.1650016665532;
        Fri, 15 Apr 2022 02:57:45 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id r6-20020a17090b050600b001d08a7d568bsm1614485pjz.7.2022.04.15.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 02:57:45 -0700 (PDT)
Date: Fri, 15 Apr 2022 17:57:41 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: fix uninit-value "data" and "mac"
Message-ID: <20220415095741.3zfuztivtgidvpqc@ppc.localdomain>
References: <20220414141223.qwiznrwgjyywngfg@ppc.localdomain>
 <68484555-f763-bc42-eb4c-9cea2ee8dadb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68484555-f763-bc42-eb4c-9cea2ee8dadb@gmail.com>

On 22/04/14 11:12PM, Pavel Skripkin wrote:
> Hi Wang,
> 
> On 4/14/22 17:12, Wang Cheng wrote:
> > Due to the case that "requesttype == 0x01 && status <= 0"
> > isn't handled in r8712_usbctrl_vendorreq(),
> > "data" (drivers/staging/rtl8712/usb_ops.c:32)
> > will be returned without initialization.
> > 
> > When "tmpU1b" (drivers/staging/rtl8712/usb_intf.c:395)
> > is 0, mac[6] (usb_intf.c:394) won't be initialized,
> > which leads to accessing uninit-value on usb_intf.c:541.
> > 
> > Reported-and-tested-by: syzbot+6f5ecd144854c0d8580b@syzkaller.appspotmail.com
> > Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
> 
> This patch will just hide the problematic API in that driver. Correct fix is
> changing usb_control_msg to usb_control_msg_{recv,send}.
> 
> IIRC this driver does not want read various length requests, so it should be
> fine

Hi Pavel, thx for your review.

Sorry, this patch is just confined to fixing uninit-values with
modifying the original code as less as possible. It sounds good to
refactor r8712_usbctrl_vendorreq() with better API.

thanks,
-- w

> 
> 
> 
> 
> With regards,
> Pavel Skripkin
