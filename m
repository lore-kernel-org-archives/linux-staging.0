Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878082C80
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 21:22:27 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mstWy-0007ka-Uy; Thu, 02 Dec 2021 22:22:16 +0100
Date: Thu, 2 Dec 2021 22:22:16 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] staging: r8188eu: odm cleanups
Message-ID: <20211202212216.uev4psqudy3ze2qm@viti.kaiser.cx>
References: <20211202192309.9362-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202192309.9362-1-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> This series removes unused and some set but never used variables
> from the odm_dm_struct structure.

> Tested on x86_64 with InterTech DMG-02.

> Michael Straube (5):
>   staging: r8188eu: remove unused variables from odm_dm_struct
>   staging: r8188eu: pbNet_closed is set but never used
>   staging: r8188eu: pSecurity is set but never used
>   staging: r8188eu: pNumTxBytesUnicast is set but never used
>   staging: r8188eu: pNumRxBytesUnicast is set but never used

>  drivers/staging/r8188eu/hal/odm.c         | 12 ----
>  drivers/staging/r8188eu/hal/rtl8188e_dm.c |  4 --
>  drivers/staging/r8188eu/include/odm.h     | 73 +----------------------
>  3 files changed, 1 insertion(+), 88 deletions(-)

> -- 
> 2.34.0

Looks good to me. For all patches:

Acked-by: Martin Kaiser <martin@kaiser.cx>
