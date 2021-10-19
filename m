Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112752C81
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 20:33:06 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mcvnD-0003mq-Im; Tue, 19 Oct 2021 22:33:03 +0200
Date: Tue, 19 Oct 2021 22:33:03 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] staging: r8188eu: more odm cleanups
Message-ID: <20211019203303.sg7354fbd7zg7lfy@viti.kaiser.cx>
References: <20211019135137.9893-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019135137.9893-1-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> This series removes more unneeded and/or dead odm code.

> Tested on x86_64 with Inter-Tech DMG-02.

> Michael Straube (7):
>   staging: r8188eu: remove duplicate structure
>   staging: r8188eu: BTRxRSSIPercentage is set but never used
>   staging: r8188eu: rename ODM_PhyStatusQuery_92CSeries()
>   staging: r8188eu: remove unused cases from ODM_CmnInfo{Hook,Update}
>   staging: r8188eu: remove unused fields from enum odm_common_info_def
>   staging: r8188eu: remove unused enums and defines from odm.h
>   staging: r8188eu: RFType type is always ODM_1T1R

>  drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  82 +---------
>  drivers/staging/r8188eu/hal/odm.c             |  70 ++-------
>  drivers/staging/r8188eu/hal/odm_HWConfig.c    |  31 ++--
>  drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   7 -
>  drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |   2 +-
>  drivers/staging/r8188eu/include/odm.h         | 142 ------------------
>  .../staging/r8188eu/include/odm_HWConfig.h    |   2 +-
>  drivers/staging/r8188eu/include/rtw_recv.h    |   1 -
>  8 files changed, 26 insertions(+), 311 deletions(-)

> -- 
> 2.33.1

Hi Michael,

Looks good, thanks. For all patches:

Acked-by: Martin Kaiser <martin@kaiser.cx>
