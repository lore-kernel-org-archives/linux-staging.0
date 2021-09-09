Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B1C3FE1
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 12:24:52 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mOJ6f-0005nk-Q1; Thu, 09 Sep 2021 14:24:41 +0200
Date: Thu, 9 Sep 2021 14:24:41 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove unused macro READ_AND_CONFIG_TC
Message-ID: <20210909122441.cawtj7sivoey4k6k@viti.kaiser.cx>
References: <20210909110517.15243-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909110517.15243-1-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> The macro READ_AND_CONFIG_TC is not used, remove it.
> Found with GCC -Wunused-macros.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/odm_HWConfig.c | 1 -
>  1 file changed, 1 deletion(-)

> diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
> index ada22a526fee..058d04f6aa58 100644
> --- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
> +++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
> @@ -6,7 +6,6 @@
>  #define READ_AND_CONFIG     READ_AND_CONFIG_MP

>  #define READ_AND_CONFIG_MP(ic, txt) (ODM_ReadAndConfig##txt##ic(dm_odm))
> -#define READ_AND_CONFIG_TC(ic, txt) (ODM_ReadAndConfig_TC##txt##ic(dm_odm))

>  static u8 odm_QueryRxPwrPercentage(s8 AntPower)
>  {
> -- 
> 2.33.0

looks good and compiles for me

Acked-by: Martin Kaiser <martin@kaiser.cx>
