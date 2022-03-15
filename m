Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA27E2912
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 20:55:31 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1nUECW-00088x-NG; Tue, 15 Mar 2022 21:55:28 +0100
Date: Tue, 15 Mar 2022 21:55:28 +0100
From: Martin Kaiser <lists@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] staging: r8188eu: some rx cleanups
Message-ID: <20220315205528.vfby3delkhyidbv5@viti.kaiser.cx>
References: <20220305185351.1409232-1-martin@kaiser.cx>
 <Yi97s4Eu20CVE/Ds@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yi97s4Eu20CVE/Ds@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Greg Kroah-Hartman (gregkh@linuxfoundation.org):

> On Sat, Mar 05, 2022 at 07:53:45PM +0100, Martin Kaiser wrote:
> > Here's another set with simple cleanups in the code for receiving frames.

> > Martin Kaiser (6):
> >   staging: r8188eu: remove unnecessary initializations
> >   staging: r8188eu: remove three unused receive defines
> >   staging: r8188eu: remove unused function prototype
> >   staging: r8188eu: make rtl8188e_process_phy_info static
> >   staging: r8188eu: remove some unused local ieee80211 macros
> >   staging: r8188eu: remove local BIT macro

> >  drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  6 +---
> >  .../staging/r8188eu/include/rtl8188e_recv.h   |  6 ----
> >  drivers/staging/r8188eu/include/wifi.h        | 34 +------------------
> >  3 files changed, 2 insertions(+), 44 deletions(-)

> > -- 
> > 2.30.2



> This series breaks the build:

on x86_64 - and I tested only on arm32 :-(

> drivers/staging/r8188eu/core/rtw_wlan_util.c: In function ‘update_IOT_info’:
> drivers/staging/r8188eu/core/rtw_wlan_util.c:1279:42: error: conversion from ‘long unsigned int’ to ‘u32’ {aka ‘unsigned int’} changes value from ‘18446744073709551611’ to ‘4294967291’ [-Werror=overflow]
>  1279 |                 Switch_DM_Func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
>       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/r8188eu/core/rtw_wlan_util.c:1285:42: error: conversion from ‘long unsigned int’ to ‘u32’ {aka ‘unsigned int’} changes value from ‘18446744073709551611’ to ‘4294967291’ [-Werror=overflow]
>  1285 |                 Switch_DM_Func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
>       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors

> I'm going to drop it from my queue now.

The driver's BIT(x) macro was 1 << (x), the "global" one uses 1UL << (x).
DYNAMIC_BB_DYNAMIC_TXPWR needs a cast to u32. I've just sent v2.

Thanks,
Martin
