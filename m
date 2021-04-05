Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A835F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 06:21:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 259D961399;
	Mon,  5 Apr 2021 06:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617603691;
	bh=xKdGZ44ZwQ3VybqwUhF7c0iuUupdhhUePbVF00lo1Hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ma0jUVRBxeTvA5MX/MKMkCXamBJofQ9SmH38mKpEloZsRapwwGGEh64zmQUbU6R4B
	 fjCJ4UCRnJo9NY+4kvgpsozrM+4NCX9vgFGuqpOJ02MLap8g7ze+c57EwxmoulzJ+1
	 l0iBGaQzjeaUgimkJtbxkw1sZQTo5zluoRkBBH0A=
Date: Mon, 5 Apr 2021 08:21:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: manish@marvell.com, GR-Linux-NIC-Dev@marvell.com,
	outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: remove else after break
Message-ID: <YGqsaKVJM8pn1BYU@kroah.com>
References: <YGpcx9MZuZJFy0Z/@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGpcx9MZuZJFy0Z/@kali>

On Mon, Apr 05, 2021 at 06:11:43AM +0530, Mitali Borkar wrote:
> linux-staging@lists,linux-kernel@vger.kernel.org
> Bcc: 
> Subject: [PATCH] staging: qlge:remove else after break
> Reply-To: 

Very odd, why is this in the body of the email?



> 
> Fixed Warning:- else is not needed after break
> break terminates the loop if encountered. else is unnecessary and
> increases indenatation
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/qlge/qlge_mpi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_mpi.c
> index 2630ebf50341..3a49f187203b 100644
> --- a/drivers/staging/qlge/qlge_mpi.c
> +++ b/drivers/staging/qlge/qlge_mpi.c
> @@ -935,13 +935,11 @@ static int qlge_idc_wait(struct qlge_adapter *qdev)
>  			netif_err(qdev, drv, qdev->ndev, "IDC Success.\n");
>  			status = 0;
>  			break;
> -		} else {
> -			netif_err(qdev, drv, qdev->ndev,
> +		}	netif_err(qdev, drv, qdev->ndev,
>  				  "IDC: Invalid State 0x%.04x.\n",
>  				  mbcp->mbox_out[0]);
>  			status = -EIO;
>  			break;
> -		}

Indentation is now no longer correct :(

thanks,

greg k-h
