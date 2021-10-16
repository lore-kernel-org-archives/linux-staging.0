Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0472C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 09:59:27 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mbgTK-0003KE-RK; Sat, 16 Oct 2021 11:59:22 +0200
Date: Sat, 16 Oct 2021 11:59:22 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: r8188eu: Remove redundant 'if' statement
Message-ID: <20211016095922.4jf7nkwycgkfectz@viti.kaiser.cx>
References: <20211016091042.19614-1-fmdefrancesco@gmail.com>
 <20211016091042.19614-4-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016091042.19614-4-fmdefrancesco@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Fabio M. De Francesco (fmdefrancesco@gmail.com):

> Remove a redundant 'if' statement.

> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c | 6 ------
>  1 file changed, 6 deletions(-)

> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 2900c31d8ec9..2263e35b45cb 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -255,12 +255,6 @@ int rtw_cmd_thread(void *context)
>  		if (wait_for_completion_killable(&pcmdpriv->enqueue_cmd))
>  			break;

> -		if (padapter->bDriverStopped ||
> -		    padapter->bSurpriseRemoved) {
> -			DBG_88E("%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
> -				__func__, padapter->bDriverStopped, padapter->bSurpriseRemoved, __LINE__);
> -			break;
> -		}
>  _next:
>  		if (padapter->bDriverStopped ||
>  		    padapter->bSurpriseRemoved) {
> -- 
> 2.33.0

Acked-by: Martin Kaiser <martin@kaiser.cx>
