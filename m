Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7037770
	for <linux-staging@lists.linux.dev>; Wed, 30 Jun 2021 23:25:33 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id v7so4159258pgl.2
        for <linux-staging@lists.linux.dev>; Wed, 30 Jun 2021 16:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yDF6eIHYx4lHuUbnt6LeNa9ic07VE8wVLsInf5Lm3v4=;
        b=mzdMGpAm6raA+Ilfd/q3Lm9o4IC5cFgtB+eiGiZq/Qie4h4inL+mPTOn4BIMTU3Rj7
         4cuPR9g0Nvf7LC0DNKI6/wUiDmRB7ez9yP8HRd3ddDY+GkTVgmE+CtNcp785qr1Ah+lN
         165ZpJpUOn8TxGpsgW+OWuEz623u9Bf5ITB53YXhKylhayDgZR+oU5y8ZSND87uxmnjc
         9pg0JfP6zUZ1flPC0YKRRKOMzUyAgA6FtuTm3AIj4EqK9/yu34xIsdVnFWKlDkGOMtEP
         HcUmpIPJQSWY6l7Sob5AcpBpzUE4js3N0ZQfXTC7wdtyteMv4lxoFD92kLoL67v6DSIp
         2ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yDF6eIHYx4lHuUbnt6LeNa9ic07VE8wVLsInf5Lm3v4=;
        b=h4coZSw+Bqf6D0IJWrCnAHLH/wOlYqVfSwj4Tc/os6Z8dblDpUMgh7S+kwmywUSMsS
         ZBevZKprWRCXIafpMM43QtIaB3odDpyws1lyCCEJNvOeatWksnpA3ja/8uSoHkKDko9I
         WYZ2ozWkLnuwJcZdNbvrleqNE2mx2Y3jiW6YalXVcPcP+qPKV++/cwgRrNEyGJfQrYwW
         N0isT33Z+27kFDB4uiMcKEI1zp14txf7iNy9hyjMwRKTkAPAHPNNGgvPzCGOVEDmiyAT
         WM35EmMd9CY3uCpUBT+o8HvmAJUq6Gcj8g8tX8PKbHk7xWJbXNpvqix9xVrfIFpZS5Ur
         0uyQ==
X-Gm-Message-State: AOAM532Xng2Y+hhD5OfqIS623i2PIIdcdOwzXiH5EwYANgHUR8L8zs9t
	ocnGJyoWYo6s78B4fwRQWtA=
X-Google-Smtp-Source: ABdhPJwpbvjG6ISQ62Gx1WauLZDhTJ+HP2fPc575a/6kC6mOk201hah2ghg4/MGOXEX8ubIcZga8ag==
X-Received: by 2002:a63:e114:: with SMTP id z20mr36045534pgh.207.1625095533023;
        Wed, 30 Jun 2021 16:25:33 -0700 (PDT)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id y3sm24461324pga.72.2021.06.30.16.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 16:25:32 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 1 Jul 2021 07:19:49 +0800
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 16/19] staging: qlge: remove deadcode in qlge_build_rx_skb
Message-ID: <20210630231949.gpmk433lrztp6iau@Rk>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-17-coiby.xu@gmail.com>
 <20210622072939.GL1861@kadam>
 <20210624112500.rhtqp7j3odq6b6bq@Rk>
 <20210624124926.GI1983@kadam>
 <20210627105349.pflw2r2b4qus64kf@Rk>
 <20210628064645.GK2040@kadam>
 <20210629133541.2n3rr7vzglcoy56x@Rk>
 <20210629142201.GQ2040@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210629142201.GQ2040@kadam>

On Tue, Jun 29, 2021 at 05:22:02PM +0300, Dan Carpenter wrote:
>*sigh*
>
>You're right.  Sorry.
>
>I misread IB_MAC_IOCB_RSP_HV as IB_MAC_IOCB_RSP_HS.  In my defense, it's
>a five word name and only one letter is different.  It's like trying to
>find Waldo.

That's fine. Thanks for reviewing the patch and prompting me to write a 
more comprehensible commit message!

>
>regards,
>dan carpenter
>

-- 
Best regards,
Coiby
