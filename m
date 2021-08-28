Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858FB72
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 08:45:31 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d17so5592155plr.12
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 01:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mj2fJEfaUbBANZczs67LmtlLb+z0I2pfGwPFTif1uss=;
        b=a5U8orWsTW9nmja3DLUQLHRrt6u268wBDqykSLZLkcWxzmf0S2objaM9mRyzqL/+XL
         OpQPm6anCzlcOsxblKlapb2pmWERlwqiM/S42+2thugh77Go5FjGj1UlLsTht6o1vXYI
         enAD4Jou6qZN7IWDWSrhxIUziJujyN2FbY6mPMi0RX6BrZ8iMl3bFgDiosPzmGcgJfmS
         711fQo5SiQcDSdZdYfJLMM3ZW9sVqp0KBrhj/EQr425C5v1x9wPLMHOSmbtDcjv9uTny
         45EdZvoCJ4xZX6LesPrksUzYuC7MueSvjlSNTm07e6raNNpOGRNLe/J6uh9M1JGo+m6a
         pAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mj2fJEfaUbBANZczs67LmtlLb+z0I2pfGwPFTif1uss=;
        b=jQ0gMwUz+yHehN9g41bOGXT/xl4okB0QYjbT3lkJAWeyD84bXtdCMzQW6tSmxmoIwv
         N5L3wD6JFboNjPWgCjaFMiV6SV16pOE8Cnm09yci900AuTqP0n6tO4h4SrqdnJkfIbls
         KI0z0Vup0Yy8NBB2V2Iyq7/s1eQnxt9hgbPOIg60N4iTzLdbVPLBEz9UFRCEJqsDS+HD
         wEFi8QHFaaJA2oucLmiZuict6O7DxrRWulCC11hODNiXLASjQt5HwHcuU0blLXfhZXeB
         z8to6+qzAEh+/fk5rr9/HzTLx4KYhXKqBtZgA1xUsAA+5YQLxSwqeLLMFp2mngsKBryt
         Ohww==
X-Gm-Message-State: AOAM530dIdcijGS77gHnbef2eJUOnMwI0zQ5ApsyvWWz2oSRXNpDkJsf
	vI4NpE1f5moEvniv4lSkDR/LQy1xfi2lWA==
X-Google-Smtp-Source: ABdhPJyuWKjgRpdDqPoc221JsZzAUhi9aYvdY1P3sSv0Dmbcho5r8FvZ2OQZBnoXHyGrbXWeZAFuig==
X-Received: by 2002:a17:90a:1957:: with SMTP id 23mr14936632pjh.141.1630140330967;
        Sat, 28 Aug 2021 01:45:30 -0700 (PDT)
Received: from localhost ([49.206.124.188])
        by smtp.gmail.com with ESMTPSA id r3sm8280120pff.119.2021.08.28.01.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 01:45:30 -0700 (PDT)
Date: Sat, 28 Aug 2021 14:15:28 +0530
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: David Laight <David.Laight@aculab.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/5] staging: r8188eu: incorrect type in
 csum_ipv6_magic
Message-ID: <20210828084528.gbkqcgqaaf3adyb7@xps.yggdrasil>
References: <cover.1629563318.git.aakashhemadri123@gmail.com>
 <392082864befe91bb03d16ff7ca5e57ba2a8e549.1629563318.git.aakashhemadri123@gmail.com>
 <f2ab21eab23c4863b1b5c004a75d834d@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2ab21eab23c4863b1b5c004a75d834d@AcuMS.aculab.com>

On 21/08/25 09:23AM, David Laight wrote:
> From: Aakash Hemadri
> > Sent: 23 August 2021 18:00
> > 
> > Fix sparse warning:
> > > rtw_br_ext.c:771:84:    got restricted __be16 [usertype] payload_len
> > > rtw_br_ext.c:773:110: warning: incorrect type in argument 2
> >     (different base types)
> > > rtw_br_ext.c:773:110:    expected int len
> > > rtw_br_ext.c:773:110:    got restricted __be16 [usertype] payload_len
> > 
> > csum_ipv6_magic and csum_partial expect int len not __be16, use
> > be16_to_cpu()
> 
> This is a behaviour change on LE systems.
> Even if you are testing on BE the commit message should say
> that it fixes the length passed to the checksum code and
> was detected by sparse.
> 

Thanks for the note david.

-Aakash
