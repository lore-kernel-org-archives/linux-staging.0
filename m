Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E54362;
	Sat, 25 Mar 2023 12:31:17 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso4615225wmb.0;
        Sat, 25 Mar 2023 05:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JbN5mOcBlmckGxX4Bx9VedlDXlZrxrgvxWsGRNZfOb8=;
        b=fBTHm3m9tr4SUPIf7MA2Q/ZCS+Cy/eWwuDKX13u6VAbLUHYEfa2pjzM4c6MEOIowrR
         5X4eZC5xSzoiWrdPcZ2N6TkcC7Cru3ZxwFJzX+eWf4NnY7+xdE7VZwlXZG5SAmQahRGm
         7lMSDZyYj7DUPiDXEazYAmXSUISTb9CK0XKATX45ftBTkWxjlkUih4zo1QwLGawLDs8W
         C3OLM+zmJya1AKFyPcYUmgn79GGWPZqiQYIdo7c+kA6wFcd5hbEfTPibfpkEpWP4ajpP
         GQ/uXnXNPev5dA5EpbN0rOhjBMKrKyAz+p5ywOkBH73IHf/IlGw3Kr+7u1z0IbQGo4Wm
         QpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbN5mOcBlmckGxX4Bx9VedlDXlZrxrgvxWsGRNZfOb8=;
        b=kIHXqJKvUB7sb6/NuBZJA1A10IL5bL8xDg+1o2N5htRp/bpjT+0tqbtSnHTWqF3Dsn
         9E1JA55DehHHvkrffo9hGc/EbPrEryvSQB8d/phY3aNnFEYyPo+6SkkW71/RfIa5kmvZ
         HqiX3hXWAudJIX3w0S+P/AHwRAty3lQLvUJPyU1KLAe4rsXTdo4Mo/fXrPCg0LrcfeGW
         j6VbhdkXdYj7UiX4ACfOJzhNSU2d4GzOM7S/xJPj5Uesi5+W8OZEnFyQq95ZrSd8vwmD
         we1ByyJdT8LlH2VJ3XZA8hb0GAg8fF1de7bwkhtyE2Clp/loN26Qqu4YfuDeGbbctM4k
         PBpQ==
X-Gm-Message-State: AO0yUKV7jxT1vo4VYVP+NH/Jo9bRJ7xcj2y6nSeRetTMToM+PfbU1ufr
	HpH3XEWpm67Tp5UDEMInB/RQR1QLUdsexQ==
X-Google-Smtp-Source: AK7set+d0Z8L6oj1YStFuqTpLA2m4CrUH2H31YvcIdyRSE24MQisjvY/b3cBIhpUQdZLE0mXFHtdCA==
X-Received: by 2002:a05:600c:2214:b0:3ee:289a:43a7 with SMTP id z20-20020a05600c221400b003ee289a43a7mr5778380wml.22.1679747476051;
        Sat, 25 Mar 2023 05:31:16 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003ee63fe5203sm7777290wmm.36.2023.03.25.05.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:31:15 -0700 (PDT)
Date: Sat, 25 Mar 2023 17:31:13 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8192u: reformat block comments
Message-ID: <ZB7pkWRn9093sBnZ@khadija-virtual-machine>
References: <cover.1679744684.git.kamrankhadijadj@gmail.com>
 <2974a7ba0e2d3cc693b2a7229cf150c10f395ac5.1679744684.git.kamrankhadijadj@gmail.com>
 <ZB7nsz1UQ9kn6d6p@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZB7nsz1UQ9kn6d6p@kroah.com>

On Sat, Mar 25, 2023 at 01:23:15PM +0100, Greg KH wrote:
> On Sat, Mar 25, 2023 at 05:13:16PM +0500, Khadija Kamran wrote:
> > Linux kernel coding style for block comments uses a column of '*' on the
> > left side and  uses '*/' on a separate line.
> > 
> > Fix block comments by adding '*' on subsequent lines and moving '*/' at
> > the end of block comments on a separate line. These issues in block
> > comments are reported by checkpatch.pl script.
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/rtl8192u/r8192U_dm.c | 162 ++++++++++++++-------------
> >  1 file changed, 86 insertions(+), 76 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
> > index 6a33ca02c3dc..a88686be3523 100644
> > --- a/drivers/staging/rtl8192u/r8192U_dm.c
> > +++ b/drivers/staging/rtl8192u/r8192U_dm.c
> > @@ -1,19 +1,20 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  /*++
> > -Copyright-c Realtek Semiconductor Corp. All rights reserved.
> > -
> > -Module Name:
> > -	r8192U_dm.c
> > -
> > -Abstract:
> > -	HW dynamic mechanism.
> > -
> > -Major Change History:
> > -	When		Who				What
> > -	----------	--------------- -------------------------------
> > -	2008-05-14	amy                     create version 0 porting from windows code.
> > -
> > ---*/
> > + * Copyright-c Realtek Semiconductor Corp. All rights reserved.
> > + *
> > + * Module Name:
> > + *	r8192U_dm.c
> > + *
> > + * Abstract:
> > + *	HW dynamic mechanism.
> > + *
> > + * Major Change History:
> > + *	When		Who				What
> > + *	----------	--------------- -------------------------------
> > + *	2008-05-14	amy                     create version 0 porting from windows code.
> > + *
> > + *--
> > + */
> >  #include "r8192U.h"
> >  #include "r8192U_dm.h"
> >  #include "r8192U_hw.h"
> > @@ -147,20 +148,20 @@ void dm_CheckRxAggregation(struct net_device *dev)
> >  	unsigned long		curRxOkCnt = 0;
> >  
> >  /*
> > -	if (pHalData->bForcedUsbRxAggr) {
> > -		if (pHalData->ForcedUsbRxAggrInfo == 0) {
> > -			if (pHalData->bCurrentRxAggrEnable) {
> > -				Adapter->HalFunc.HalUsbRxAggrHandler(Adapter, FALSE);
> > -			}
> > -		} else {
> > -			if (!pHalData->bCurrentRxAggrEnable || (pHalData->ForcedUsbRxAggrInfo != pHalData->LastUsbRxAggrInfoSetting)) {
> > -				Adapter->HalFunc.HalUsbRxAggrHandler(Adapter, TRUE);
> > -			}
> > -		}
> > -		return;
> > -	}
> > -
> > -*/
> > + *	if (pHalData->bForcedUsbRxAggr) {
> > + *		if (pHalData->ForcedUsbRxAggrInfo == 0) {
> > + *			if (pHalData->bCurrentRxAggrEnable) {
> > + *				Adapter->HalFunc.HalUsbRxAggrHandler(Adapter, FALSE);
> > + *			}
> > + *		} else {
> > + *			if (!pHalData->bCurrentRxAggrEnable || (pHalData->ForcedUsbRxAggrInfo != pHalData->LastUsbRxAggrInfoSetting)) {
> > + *				Adapter->HalFunc.HalUsbRxAggrHandler(Adapter, TRUE);
> > + *			}
> > + *		}
> > + *		return;
> > + *	}
> > + *
> > + */
> 
> Do not reformat things, only to remove them in the last commit in the
> series.  Instead, remove the commented out code lines first, and then
> fix up any remaining ones, that should make the churn much less.

Hey Greg,

Thank you for the feedback. Let me resend the patchset after doing all
the advised changes.

Regards,
Khadija

> 
> thanks,
> 
> greg k-h
