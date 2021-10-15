Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9E2C81
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 08:32:22 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mbIdP-0001aj-JY; Fri, 15 Oct 2021 10:32:11 +0200
Date: Fri, 15 Oct 2021 10:32:11 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove MSG_88E calls from
 hal/usb_halinit.c
Message-ID: <20211015083211.ngbgtmhkh3lh5kzj@viti.kaiser.cx>
References: <20211015000233.842-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015000233.842-1-phil@philpotter.co.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Phillip Potter (phil@philpotter.co.uk):

> Remove both MSG_88E calls from hal/usb_halinit.c, as these calls serve
> no purpose other than to print the name of the function they are in
> (_ReadAdapterInfo8188EU) on entry and on exit, with a timing of the
> function, which is better accomplished by other means. Also remove
> the jiffies assignment at the start of the function, as it is no
> longer used.

> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/r8188eu/hal/usb_halinit.c | 6 ------
>  1 file changed, 6 deletions(-)

> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index f6db5b05e6e7..abbd107ad3c1 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -1073,15 +1073,9 @@ static void _ReadRFType(struct adapter *Adapter)

>  static int _ReadAdapterInfo8188EU(struct adapter *Adapter)
>  {
> -	u32 start = jiffies;
> -
> -	MSG_88E("====> %s\n", __func__);
> -
>  	_ReadRFType(Adapter);/* rf_chip -> _InitRFType() */
>  	_ReadPROMContent(Adapter);

> -	MSG_88E("<==== %s in %d ms\n", __func__, rtw_get_passing_time_ms(start));
> -
>  	return _SUCCESS;
>  }

Makes sense to me. We should get rid of the prints that show only the
function name.

Acked-by: Martin Kaiser <martin@kaiser.cx>
