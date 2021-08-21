Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869652F80
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:42:53 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f10so7394263wml.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 03:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=kbLqnZRKHYWI/LXP7guX+yhqPeRJbgFmWn9L3bxAxt0=;
        b=DxDmNMb226dqentrpO+PDtzDmxQeuMtpoaK8OgWXXZFZ08wCpXzBXc9GChgcjWS5h7
         JVenDIF+I1xaCHuMV3Sm6jR19WtHe4hGhbT+OPd1DBv6S9aTVUkU4fh1AlABvWwWvxAs
         mG1YXW6Xva0OucwIYZSbWzdAR3rkOjvaRhVO+n0zyyHP8qyHYT9MhjmqnUjbcSM1RjX/
         vLBejuiOFgaAxIyU4JNeCbTeP3p4OHp5Ox0+4hAramtR6Fxp3EEvV837In0bO41I8eTb
         bZVqxUK4C4HW7J9tjjg2+S8nx7d9Exn/ug4vbtYbdinZ9JFymQlXus5y7IiG4w3QM6BI
         IXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kbLqnZRKHYWI/LXP7guX+yhqPeRJbgFmWn9L3bxAxt0=;
        b=d+FJYR1vxTEfdK56IOcvCm4U6wsOa8xMKBDz/hhz4lCAPqCdaDj+1n/JrDUn2nsHej
         vR6g2iLF5PLzrnPeJkxQQYdyNc1gbTdVNJsQc2kci1wrWWXmFJAt4C53VbZDNNsIy/Vi
         2lmKj1d6wz3g/jUE8URQLARNDpfUQIWAtXIE4mRRNtW4OMeGtlcD3PpUsEkBLQPy0TDL
         LXqSbJEBos945En0cwE2Qay+rq3A4lWTjXWvL8VUXzGDMZEm4V3bxVIlVC2lV+yxiN9E
         3M1HKQdZ4vpmlb9O1s1P3AkoxmmBxo7yGD3b1riGncSFpSgMC8/T5hnRk5an00VQAHAh
         bwMw==
X-Gm-Message-State: AOAM5326EIcJWjuv3z2b6GyroqhAv0kvuxP9vKd6dxI/o12xmac2aH3O
	ttDZahIU64pXwnhhT3/uxKmgCA==
X-Google-Smtp-Source: ABdhPJz4F2GWC0oCYtm6NQgz7eJNi5Xy0pzoWniBsWqI+BTXWIIHXB0NaVPZ+eGQtSA0IZ4okD6/7A==
X-Received: by 2002:a7b:c8d9:: with SMTP id f25mr6384023wml.7.1629542571822;
        Sat, 21 Aug 2021 03:42:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:dfde:e1a0::2? (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id l2sm8462154wrx.2.2021.08.21.03.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 03:42:51 -0700 (PDT)
Message-ID: <1cd1be12f42411b7d6d72cd4839cbbbb8153d400.camel@philpotter.co.uk>
Subject: Re: [PATCH] staging: r8188eu: remove forward declaration of
 Efuse_Read1ByteFromFakeContent
From: Phillip Potter <phil@philpotter.co.uk>
To: Michael Straube <straube.linux@gmail.com>, "Fabio M. De Francesco"
	 <fmdefrancesco@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	martin@kaiser.cx, Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org
Date: Sat, 21 Aug 2021 11:42:50 +0100
In-Reply-To: <b0819fe2-e7cf-b6bc-5930-a31e10da811d@gmail.com>
References: <20210821000508.79422-1-phil@philpotter.co.uk>
	 <5110838.kRcMR4ARJC@localhost.localdomain>
	 <b0819fe2-e7cf-b6bc-5930-a31e10da811d@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 2021-08-21 at 10:30 +0200, Michael Straube wrote:
> 
> 
> On 8/21/21 5:17 AM, Fabio M. De Francesco wrote:
> > On Saturday, August 21, 2021 2:05:08 AM CEST Phillip Potter wrote:
> > > Remove forward declaration of Efuse_Read1ByteFromFakeContent
> > > function
> > > from core/rtw_efuse.c, as the function is defined in full
> > > directly
> > > after this and therefore this forward declaration is redundant.
> > > 
> > > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > > ---
> > >   drivers/staging/r8188eu/core/rtw_efuse.c | 6 ------
> > >   1 file changed, 6 deletions(-)
> > 
> > Philip,
> > 
> > It's pretty clear that this function has only a translation unit
> > visibility.
> > Why don't you make it clear by defining it with storage class
> > "static"?
> > 
> > Thanks,
> > 
> > Fabio
> > 
> > 
> 
> Hi Phillip,
> 
> I agree with Fabio, making the function static avoids the 
> [-Wmissing-prototypes] warning and makes it clear that it is only
> used 
> in this file.
> 
> Thanks,
> 
> Michael

Dear Michael and Fabio,

You're both absolutely right, thank you for the feedback. It did occur
to me at the time that I could just make this static, and indeed the
change introduces a kernel test robot warning as it is currently, due
to -Wmissing-prototypes as mentioned. I shall rework, many thanks.

Regards,
Phil

