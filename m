Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308713FC9
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 20:09:18 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id gs10so2671795qvb.13
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QmINnGAQfwGBHFwHc6SAes9D9CAGNwUU4TpPcc6rrBg=;
        b=VgISpyV1S8lJSw+1NUxW+lmrq3b5kyEVzpD1xU0whvBl6PsXopMfzfkiY64uAFIdmY
         fiH/GfzDNB83Aiz6LMvrRZ6dRaoz2Uz1K/CeyM/eegCj6dI+GyyoPVpxGm6ugn7/8mPz
         JRW/W0XBOTehT2YLKyvWqN6cHEJa9DKmbS1Jt3jj3DhSIpW/mIueTXiw4ED+AvCI6eT9
         s9UlvaHCKnKIjm6NN92NWPd3bFSrXxnOivl0/CRHX64J3KhVgSXclVLh9E+kvkeVdkEK
         8MJd37Hy+lbVshg19ErDN6g1M7Z2QuYJfWHzsH2YRGsLEBiP/5DKc3PWXweDmJBhLi9D
         U6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QmINnGAQfwGBHFwHc6SAes9D9CAGNwUU4TpPcc6rrBg=;
        b=25qKP3zT3RIWvmpak6Oc4xRfvUrzVstFHwsC6OLUR4K1bpe7R9FzOwz8MIDV7DFzxv
         iX7Gaby2LtEP96kayZQzYftrnWdzt7O55uQCDphrqwDaaLP3X6jvpiCU5aoNzdbOo8Xy
         mfhRlW3q3LY4A6nujSZiAL/X6Sy7aXXJnW0ZDESCoyu4pkEY4ptrJlVJasP75VeiBQSv
         PQhjJ05hwNbNxdyrZ7xHnHEK3njHE80bZEVKT6a9GahYpGeMN/g7S7d4LiHhg3oR/94c
         aSjFr8PSFOCYp4RVk+ZQONZDk9B0W1eIf+GSooj2uE0yLzb1JraqsrwYSNIjr/PfC3ie
         9YXw==
X-Gm-Message-State: AOAM533Ct9RKRLPUeZhipEkbJCF27BqiUWHCni2z9wz08HgUiVQq1rDs
	lYfsPkpnIDHmr3OFaq5wcjA=
X-Google-Smtp-Source: ABdhPJxX2AkAoxlpY53qmSW3QTgL/efQ2x57ZQOGGfj58e9aKmD8KyTSDaqJkLCMGiG0tbb1FwAYXA==
X-Received: by 2002:a05:6214:726:: with SMTP id c6mr621533qvz.9.1631736557208;
        Wed, 15 Sep 2021 13:09:17 -0700 (PDT)
Received: from localhost.localdomain ([181.166.206.110])
        by smtp.gmail.com with ESMTPSA id m68sm755665qkb.105.2021.09.15.13.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:09:16 -0700 (PDT)
Date: Wed, 15 Sep 2021 17:09:02 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	nsaenz@kernel.org, stefan.wahren@i2se.com, arnd@arndb.de,
	ojaswin98@gmail.com, amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] staging: vchiq_arm: replace sleep() with
 usleep_range()
Message-ID: <YUJS3mFpFujQFRqV@localhost.localdomain>
References: <20210914213532.396654-1-gascoar@gmail.com>
 <20210915072904.GF2116@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915072904.GF2116@kadam>

On Wed, Sep 15, 2021 at 10:29:04AM +0300, Dan Carpenter wrote:
> On Tue, Sep 14, 2021 at 06:35:26PM -0300, Gaston Gonzalez wrote:
> > usleep_range() should be used instead of sleep() when sleepings range
> > from 10 us to 20 ms, [1].
> > 
> > Reported by checkpatch.pl
> > 
> > [1] Documentation/timers/timers-howto.txt
> 
> For this particular warning, you should probably just ignore it, if you
> can't test it...
> 
> You need a Signed-off-by.  Please run checkpatch.pl on your patches.
>

Yes, my bad...

Will drop this one and resend the rest of the series.

Thanks,

Gaston

> regards,
> dan carpenter
> 
