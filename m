Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AF11C06
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 08:57:17 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso12793491wmb.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 00:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ic43VHVW9R6k6oI9UHAIL60iJzHQ67Y4AV951PlE8Q=;
        b=TxwlrCzTrDmmG+wTA3/tM+p9QAnafIRXqh4Ua1lSFsNVBWbF0OAh3Fc2WgbOY3uufN
         oWfGxCjxvdTtJlszSquF4XztipaxbqRYAo2zgwf/t5jOI2Ud+nCsatxvBO24Yzl6UztA
         LqNFW8XyWku+SS7o86rlIPpu4y+Nl5LMbUMdc/r3hSvesZfQtnmEzrpY6sg+U52ejUuE
         28kwsWUqlrxmAMUgtelA8FWn0cRyl4DB2j1DZ83G2/NBl0OdZVR0sNaO1BsZA27xTucD
         KlIVPZws7ugMec/ZotoJF2MkmgByZh6SLyGELS1R3swdE323Yzb7bIbbb4Kw2+iYw+FY
         MlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ic43VHVW9R6k6oI9UHAIL60iJzHQ67Y4AV951PlE8Q=;
        b=U43g7xZVBPDNDf55IHtInRsb7MFf6Rrsyk7MWeCCvnwdRi/c46+DJRnmU1aF9nQK9g
         WihN51q7uvqPA0u4yg2WywdH9928tXZohD5ahSEorgh0VcFrSuBBtjWC8TFqpc/pQYEH
         z+uEUCB6M8KIexfPvIHNsa/DRjPYR1JGPMqr3vXI+LJhgk+mymL7EdaYEWcX6kOR+hav
         U2VerIoV/5YLZxE17DDx+lZ8QxY2cHm+6Xn9aONVgc08+PC6VbzWklNoCIdrzaFphH7G
         x1kGsP9Znlja6qOqyclmOpOclPQ4sRJNkUJgdA99dkYo9tpltADocX+SasGe5rylDu8f
         uqKg==
X-Gm-Message-State: AFqh2kr5KmLzC9fH83bFC2WFtKQaPTpylNJ3wRgu1hqsUu3G44HxEs7o
	8K7s2+33aFpGTcGQPHExCMKDF56LRaw97A==
X-Google-Smtp-Source: AMrXdXvuGCKE9rhgMW5S5NuVWuaEzVHwAkNrJwGPH1OPX3mm1hl0B7t5Q7s1qhwe0EM2dQfW+RN2ug==
X-Received: by 2002:a05:600c:5014:b0:3d3:446a:b46a with SMTP id n20-20020a05600c501400b003d3446ab46amr20624683wmr.38.1672304235499;
        Thu, 29 Dec 2022 00:57:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b003d9780466b0sm17311651wmq.31.2022.12.29.00.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 00:57:15 -0800 (PST)
Date: Thu, 29 Dec 2022 11:56:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Anup Sharma <anupnewsmail@gmail.com>
Cc: bagasdotme@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: hal: Fix codespell-reported
 spelling mistakes
Message-ID: <Y61WSt4vzTjhDFS5@kadam>
References: <Y605bbJ+gPtBFrAZ@local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y605bbJ+gPtBFrAZ@local>

On Thu, Dec 29, 2022 at 12:23:33PM +0530, Anup Sharma wrote:
> They are appear to be spelling mistakes, initially identified in a codespell report and never been addressed so far.

You're going to need to wrap this line.  It's too long.  Run
scripts/checkpatch.pl on your patches before sending them.

> 
> drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:656: regsiters ==> registers
> drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:1696: beacause ==> because
> drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:2092: Checl ==> Check
> drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:2513: checksume ==> checksum
> drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:2726: sequense ==> sequence
> drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:2780: vlaue ==> value
> drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:3409: equall ==> equal, equally
> 
> Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
> 
> Changes in v2:
>   - Added codespell report to make the commit message more clearer.
> ---
  ^^^
You need to put the v2 note under this --- cut off marker.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

v3 now.

regards,
dan carpenter

