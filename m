Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C057E
	for <linux-staging@lists.linux.dev>; Fri, 11 Mar 2022 08:40:22 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id n18so4462950plg.5
        for <linux-staging@lists.linux.dev>; Fri, 11 Mar 2022 00:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wwuk7jbsEHLeFz6+/LJoj/dUalVItLfs+0Q0dolP684=;
        b=AscHYslyW40mq2rObPXzCvGCX+EoUScZoojvmNC7ldKXcJk1h/Wj4jkAA9eDsVibbI
         wxtr9ieSMsc3g4KK+YNxI2L/I3k2J23Mn5cM9TgxWRW63yA8Y2T8Rd25fya+t/TUcdPC
         VBjSu5sY9Fsk6jfHKGhnq3zE0I1Jx9eU32Gy7/QJX6n5GHWeV+s5xyFcXBpAgctZ9e1j
         OnR5wMfeeJKau5C053ouHlcQER6qodF9fPvhK1XQ0qAd13Zq02C9ImJXa5cpq+NPU0w3
         kp7JWxA6DUPLTpwKpcQNtp4/AT4fx2516iKJtjXHUNDOBHYHzvM7wcw8jcYakE50ZUoA
         +JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wwuk7jbsEHLeFz6+/LJoj/dUalVItLfs+0Q0dolP684=;
        b=c1LdOiuzDPb7CtWDGOMWYT8lmwhCs096AsVAjzVQkrh3HNAXAPdQ9gnF6RakMpfiNw
         rsBtH4pkiIcPt9nXWh5mYvt6j7NG5n4Jr+Epy6FwIrO+Yce1/N67zdH1WIdS5AuTESTb
         0HNu/rIZz0S0g9V8etdp0l8gw7PUHcw8FyTekvS/8of1llKrpY4wnRoiJZ8IiakxRmdZ
         Rqq7QDPMHNWiCdjvrNn7P1wjIjlh0Z9o/CfwWLimJnvsdKA+ecKLza8JoOEkn+ClXYYm
         M+7UlGWPgW7IwPZG+ScKUM8N5sUgL+eIX38TLOeFkiwBDSX169wrfkBr0wo3a6uUxlRx
         6Dlg==
X-Gm-Message-State: AOAM5315lujMudJLmIjzONRymW+dNMewZX5bYGA4WV6RhUDZuN2lfrVy
	KpAblYd7+erEsBmXwtestFWVAw==
X-Google-Smtp-Source: ABdhPJwMI9VDRfAs/35Zo71vuqOBm7lSCHJlhIDhSpWXI0sH8nY+eBpFvl4Zco19ACPc6BMoC1S5XA==
X-Received: by 2002:a17:90a:9294:b0:1b9:48e9:a030 with SMTP id n20-20020a17090a929400b001b948e9a030mr20436733pjo.200.1646988021602;
        Fri, 11 Mar 2022 00:40:21 -0800 (PST)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id m11-20020a056a00080b00b004f791d0115esm1119613pfk.171.2022.03.11.00.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 00:40:21 -0800 (PST)
Date: Fri, 11 Mar 2022 14:10:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haowen Bai <baihaowen@meizu.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Fix potential NULL dereference
Message-ID: <20220311084019.w45kfluiamgosivu@vireshk-i7>
References: <1646987730-7597-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646987730-7597-1-git-send-email-baihaowen@meizu.com>
User-Agent: NeoMutt/20180716-391-311a52

On 11-03-22, 16:35, Haowen Bai wrote:
> Fix following coccicheck warning:
> drivers/staging/greybus/bootrom.c:301:35-39: ERROR: fw is NULL but dereferenced.
> 
> When goto queue_work but dereference Uninitialized fw will trigger a NULL 
> dereference.

Please have a look at earlier attempts like this:

https://lore.kernel.org/all/2015099.xVv48VzNit@linux.local/

-- 
viresh
