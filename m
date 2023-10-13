Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DB03C36;
	Fri, 13 Oct 2023 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="su3F6wnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=do1ejETpZeeA7uGrvhUBwMkbFjN6NkVLG5rCWNrdvKM=;
  b=su3F6wnUJWweb9YxR6sJpwVg0vJKYcBbVbhBmhb/sCfcAgB1pMc7OaDU
   ScI2nVoCz0lWorgcK9x8sxMvH2/kYBXCne9Q2jWhCgi2FG3mlrpuTxOTs
   YF2eEVDcXn8YMDG9kMmZUtHFjmPYhR4x7B8plq7XhMeglWRS4BTk5BCbY
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,221,1694728800"; 
   d="scan'208";a="131020345"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 08:42:42 +0200
Date: Fri, 13 Oct 2023 08:42:42 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Soumya Negi <soumya.negi97@gmail.com>
cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tty: gdm724x: Match alignment with open parenthesis
In-Reply-To: <20231013060123.13400-1-soumya.negi97@gmail.com>
Message-ID: <51deee17-33a5-d46c-1211-ca9186a4fe4@inria.fr>
References: <20231013060123.13400-1-soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

This and the next patch need to be in a series because they touch the same
file.

julia

On Thu, 12 Oct 2023, Soumya Negi wrote:

> Fix CHECK: Alignment should match open parenthesis
> Issue found by checkpatch.pl
>
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>  drivers/staging/gdm724x/gdm_tty.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> index 32b2e817ff04..4e5cac76db58 100644
> --- a/drivers/staging/gdm724x/gdm_tty.c
> +++ b/drivers/staging/gdm724x/gdm_tty.c
> @@ -271,8 +271,8 @@ int register_lte_tty_driver(void)
>  	int ret;
>
>  	for (i = 0; i < TTY_MAX_COUNT; i++) {
> -		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
> -				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
> +		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
> +					      TTY_DRIVER_DYNAMIC_DEV);
>  		if (IS_ERR(tty_driver))
>  			return PTR_ERR(tty_driver);
>
> --
> 2.42.0
>
>
>
