Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1C92C83
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 14:43:29 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mjjOG-0001YN-Rp; Sun, 07 Nov 2021 15:43:24 +0100
Date: Sun, 7 Nov 2021 15:43:24 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Kaiser <martin.kaiser@paytec.ch>
Subject: Re: [PATCH 0/4] staging: r8188eu: clean up the calibration code
Message-ID: <20211107144324.xqoab3imqxawymfz@viti.kaiser.cx>
References: <20211107143100.9047-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107143100.9047-1-martin@kaiser.cx>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hello Greg,

Thus wrote Martin Kaiser (martin@kaiser.cx):

> From: Martin Kaiser <martin.kaiser@paytec.ch>

Sorry, the cover letter uses the wrong address.
The actual patches are ok.

Could you take the patches anyway or should I resend the series?

Thanks,
Martin

> Remove a bit of unused code related to calibration.

> Martin Kaiser (4):
>   staging: r8188eu: remove unused phy_PathA_IQK_8188E parameter
>   staging: r8188eu: remove unused phy_PathA_RxIQK parameter
>   staging: r8188eu: remove constant phy_IQCalibrate_8188E parameter
>   staging: r8188eu: clean up _PHY_PathADDAOn

>  drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 114 ++----------------
>  .../staging/r8188eu/include/HalPhyRf_8188e.h  |   5 -
>  2 files changed, 12 insertions(+), 107 deletions(-)

> -- 
> 2.20.1


