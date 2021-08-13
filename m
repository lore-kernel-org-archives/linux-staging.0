Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC39E6D13
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 09:44:11 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mETjN-0002KO-Tj; Fri, 13 Aug 2021 11:44:01 +0200
Date: Fri, 13 Aug 2021 11:44:01 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: r8188eu: refactor Hal_GetChnlGroup88E()
Message-ID: <20210813094401.y2d6wehhdtuvbvp4@viti.kaiser.cx>
References: <20210813073109.25609-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813073109.25609-1-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> This series refactors Hal_GetChnlGroup88E().
>  - removes 5GHz code
>  - changes return type to void
>  - cleans up camel case naming

> Michael Straube (4):
>   staging: r8188eu: remove 5GHz code from Hal_GetChnlGroup88E()
>   staging: r8188eu: convert return type of Hal_GetChnlGroup88E() to void
>   staging: r8188eu: rename parameter of Hal_GetChnlGroup88E()
>   staging: r8188eu: rename Hal_GetChnlGroup88E()

>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 90 ++++++-------------
>  1 file changed, 26 insertions(+), 64 deletions(-)

> -- 
> 2.32.0

Hi Michael,

this series looks ok to me.

Acked-by: Martin Kaiser <martin@kaiser.cx>
