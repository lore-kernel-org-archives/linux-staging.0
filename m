Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E9A10E8
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 02:19:54 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id h34-20020a17090a29a500b001eb01527d9eso14494603pjd.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 19:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i45DVLAIIMqvEaWYSwpuIS0opgqSETmmCquiuddLo3M=;
        b=Yu8c3qPoGd9CjhIdUnKjJvIoMxC2nNX/Mru2clcLp3/ITzfLfUlRn3Iu2L4fNAKV70
         1CFdLWSOT9pT6VYzb4RUMdVOSVdL1dXMMHL+14FEERrz/24ZA8sVzZIdB5SHvJxWXVbA
         i1askW7E3vUWrxly6vPW0Yj2PVEeS0lfFAi1g4d75YEnNntWqYiJhEEBCId9oTRG2Xsb
         Rxp2zL82cB85i5js+0n34BoZgcbJ7RZbbPlCFE8oK3/R4cCkY3ZVlujQADO0W5LrsbZe
         y8O0lc4nTlzNzt4K+hZWUcSD5n0ruebDCxZOB8Oyc0UXbZArBIWOp6+fOOBORUeXQPxb
         +YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i45DVLAIIMqvEaWYSwpuIS0opgqSETmmCquiuddLo3M=;
        b=wR8aKd9i1F1MmFlPAKr0NFl9lT2TyZigZ/SnDY7TR/IH05be6CvR4aYa0CtF7Hio20
         fCRA1zWaahKslpaQtfc8Sa9ZtW48aRjYpqmeq/c9eF2nVpxXHC8b6vQD6lY87dGcdHHU
         Si+kppixFdIh1JHG49rNVgvvcBbdVyQx6KI5DNaywP+0zYGfJM2XmLYXUXGVNakMjHje
         /IZC2dYbz4T7xlolcKCCkrGQTh23QpG000yv3sU5n/79OvTbTBzji+KC/El9k2zoLbP6
         NS4924WRWAXKBW1fzaOlw2Y9+wfgNRPk1InBUfka1Tlw6rTE3JcATRb7589OpuzAcPz8
         tM0g==
X-Gm-Message-State: AJIora/asv080jG+KHpzvdYhox7kfDMHSe0++ROSjQYuZg4TztM77FGP
	kTSvFyvJtCeeD1eYbekHgmECuw==
X-Google-Smtp-Source: AGRyM1uyDHTiR9BRAHTk5PB8yY3a141K8XcjfoLDdtVyLPfIuAK30qHwHmtDuh9+hMyXQGj04hVhZg==
X-Received: by 2002:a17:90b:3802:b0:1e3:3f3a:3621 with SMTP id mq2-20020a17090b380200b001e33f3a3621mr47404875pjb.65.1655864394421;
        Tue, 21 Jun 2022 19:19:54 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902c2d200b0015e8d4eb1dfsm11350332pla.41.2022.06.21.19.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 19:19:53 -0700 (PDT)
Date: Wed, 22 Jun 2022 07:49:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Dongliang Mu <mudongliangabcd@gmail.com>, vireshk@kernel.org,
	elder@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Unitialized Variable and Null Pointer Dereference bug in
 gb_bootrom_get_firmware
Message-ID: <20220622021951.gni6cnvriogg6onj@vireshk-i7>
References: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
 <YrHYZb2BT8fQMcaR@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrHYZb2BT8fQMcaR@hovoldconsulting.com>

On 21-06-22, 16:40, Johan Hovold wrote:
> On Tue, Jun 21, 2022 at 10:36:04PM +0800, Dongliang Mu wrote:
> > Hi maintainers,
> > 
> > I would like to send one bug report.
> > 
> > In gb_bootrom_get_firmware, if the first branch is satisfied, it will
> > go to queue_work, leading to the dereference of uninitialized const
> > variable "fw". If the second branch is satisfied, it will go to unlock
> > with fw as NULL pointer, leading to a NULL Pointer Dereference.
> 
> This sounds like the false positive that checkers keep tripping over.
> 
> Please double check your analysis and search the archives first.

And everytime I get this report, I wonder if I should change the code to be a
bit simpler :)

-- 
viresh
