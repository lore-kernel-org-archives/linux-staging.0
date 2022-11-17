Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA76B8BFF
	for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 18:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16F1C433D6;
	Thu, 17 Nov 2022 18:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668711025;
	bh=fs0+884Rrp2ydND1a+01LKBd9qfdHL/I8ilA5m9iX/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUuE2gRnahBKuyvdosL624a3uTa22KUYNAIL7aowwYNXSjrY8dCG5NFZsfr1sJTpj
	 KiMKWwsUg+Y/6g4q5yDRBUVA3bBjjuMipaTXHHx1P+45aPO2CV4EnaoyxypS+8I191
	 Nds7XZwtF7f6CYiFNj47O+AZh3GfaL7ihww7vzd8=
Date: Thu, 17 Nov 2022 19:49:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: johan@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: gdm724x: Replace macro GDM_TTY_READY with
 static inline function
Message-ID: <Y3aCV4rSrfrptA0q@kroah.com>
References: <20221116192412.22446-1-bpappas@pappasbrent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116192412.22446-1-bpappas@pappasbrent.com>

On Wed, Nov 16, 2022 at 02:24:13PM -0500, Brent Pappas wrote:
> Replace the macro GDM_TTY_READY with a static inline function
> to follow the Linux kernel coding style.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
> ---
>  drivers/staging/gdm724x/gdm_tty.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> index cc6d80554c98..93d50d42a367 100644
> --- a/drivers/staging/gdm724x/gdm_tty.c
> +++ b/drivers/staging/gdm724x/gdm_tty.c
> @@ -21,7 +21,10 @@
>  
>  #define MUX_TX_MAX_SIZE 2048
>  
> -#define GDM_TTY_READY(gdm) (gdm && gdm->tty_dev && gdm->port.count)
> +static inline int gdm_tty_ready(struct gdm *gdm)

Why is this "int" and not "bool"?

thanks,

greg k-h
