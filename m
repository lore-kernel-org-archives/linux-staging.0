Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CB72C80
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 18:06:33 +0000 (UTC)
Received: from dslb-188-104-058-096.188.104.pools.vodafone-ip.de ([188.104.58.96] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <postmaster@kaiser.cx>)
	id 1n45FW-0005cX-BA; Sun, 02 Jan 2022 19:06:30 +0100
Received: from martin by martin-debian-2.paytec.ch with local (Exim 4.94.2)
	(envelope-from <martin@martin-debian-2.paytec.ch>)
	id 1n45FV-000NCe-LX; Sun, 02 Jan 2022 19:06:29 +0100
Date: Sun, 2 Jan 2022 19:06:29 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] staging: r8188eu: the next set of cleanups
Message-ID: <YdHppRqgNdPRGhBg@martin-debian-1.paytec.ch>
References: <20220102131141.12310-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220102131141.12310-1-straube.linux@gmail.com>
Sender: "Martin Kaiser,,," <martin@martin-debian-2.paytec.ch>

Thus wrote Michael Straube (straube.linux@gmail.com):

> This set
>  - removes some unused structs, enums and defines
>  - removes set but not used fields from some structures

> Tested on x86_64 with Inter-Tech DMG-02.

> Michael Straube (11):
>   staging: r8188eu: remove MAX_CHANNEL_NUM_2G
>   staging: r8188eu: remove struct rt_channel_plan_2g
>   staging: r8188eu: remove unused enum and defines
>   staging: r8188eu: struct rx_hpc is not used
>   staging: r8188eu: clean up struct rtw_dig
>   staging: r8188eu: clean up struct sw_ant_switch
>   staging: r8188eu: struct odm_sta_info is not used
>   staging: r8188eu: enum hw90_block is not used
>   staging: r8188eu: remove unneeded comments from Hal8188EPhyCfg.h
>   staging: r8188eu: remove unused defines from Hal8188EPhyCfg.h
>   staging: r8188eu: remove unused defines from rtw_eeprom.h

>  drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  2 +-
>  drivers/staging/r8188eu/hal/odm.c             | 11 ---
>  .../staging/r8188eu/include/Hal8188EPhyCfg.h  | 34 +------
>  drivers/staging/r8188eu/include/odm.h         | 90 +------------------
>  drivers/staging/r8188eu/include/rtw_eeprom.h  | 31 -------
>  .../staging/r8188eu/include/rtw_mlme_ext.h    |  5 --
>  drivers/staging/r8188eu/include/rtw_rf.h      | 24 -----
>  7 files changed, 3 insertions(+), 194 deletions(-)

> -- 
> 2.34.1

for all patches

Acked-by: Martin Kaiser <martin@kaiser.cx>
