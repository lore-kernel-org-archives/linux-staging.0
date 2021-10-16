Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50212C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 16:33:05 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mbmcG-00068K-JN; Sat, 16 Oct 2021 18:33:00 +0200
Date: Sat, 16 Oct 2021 18:33:00 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/8] staging: r8188eu: another round of removals
Message-ID: <20211016163300.xlu2zsroe3frocpc@viti.kaiser.cx>
References: <20211016113008.27549-1-martin@kaiser.cx>
 <YWrxIllg1fMkV1/5@equinox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWrxIllg1fMkV1/5@equinox>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Phillip Potter (phil@philpotter.co.uk):

> On Sat, Oct 16, 2021 at 01:30:00PM +0200, Martin Kaiser wrote:
> > Remove some more dead code and unused definitions.

> > Martin Kaiser (8):
> >   staging: r8188eu: remove empty trigger gpio code
> >   staging: r8188eu: interface type is always usb
> >   staging: r8188eu: remove two checks that are always false
> >   staging: r8188eu: remove unused function prototypes
> >   staging: r8188eu: PHY_SetRFPathSwitch_8188E is not used
> >   staging: r8188eu: clean up Hal8188EPhyCfg.h
> >   staging: r8188eu: remove procfs functions
> >   staging: r8188eu: CurrentWirelessMode is not used

> >  drivers/staging/r8188eu/Makefile              |   1 -
> >  drivers/staging/r8188eu/core/rtw_debug.c      | 886 ------------------
> >  .../staging/r8188eu/hal/HalHWImg8188E_BB.c    |  14 +-
> >  .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   |   3 +-
> >  .../staging/r8188eu/hal/HalHWImg8188E_RF.c    |   8 +-
> >  drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  38 -
> >  drivers/staging/r8188eu/hal/odm.c             |   3 -
> >  drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   2 -
> >  drivers/staging/r8188eu/hal/usb_halinit.c     |   8 -
> >  .../staging/r8188eu/include/Hal8188EPhyCfg.h  |  78 --
> >  drivers/staging/r8188eu/include/hal_intf.h    |   1 -
> >  drivers/staging/r8188eu/include/odm.h         |  11 +-
> >  .../staging/r8188eu/include/rtl8188e_hal.h    |   1 -
> >  drivers/staging/r8188eu/include/rtw_debug.h   | 148 ---
> >  14 files changed, 6 insertions(+), 1196 deletions(-)
> >  delete mode 100644 drivers/staging/r8188eu/core/rtw_debug.c

> > -- 
> > 2.20.1


Hi Phil,

> Looks good from what I can see, many thanks. Built and tested on my
> USB-N10 Nano.

> For whole series:
> Acked-by: Phillip Potter <phil@philpotter.co.uk>

thanks for reviewing and testing.

Best regards,
Martin
