Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7439D39946
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ktNMbIz6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66100C433C7;
	Wed, 11 Oct 2023 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697046319;
	bh=3yB3MGnG5LYuZh2Gk5/27ItGSm3h3ltI6dhABEYpMA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ktNMbIz6u1lt+g4ygcdRjznLIZBBbx2ftqlUZemfLmYFXK7TOwjV6TLpzh9bU4s60
	 Gwe9s2lRePd5fRO4EIaVTGiTEMD7AIQJ6aNaJ/F+ZH3LA8VdrZj3aWMPOU4ZF/zxsG
	 UIVMqD4CMYV9xHTpOpeW/DKf/evE5DvztEtCrJkY=
Date: Wed, 11 Oct 2023 19:45:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chen Shuo <1289151713@qq.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] tty: gdm724x : fixes missing a blank line after
 declarations
Message-ID: <2023101135-hazy-policy-88d0@gregkh>
References: <tencent_90918480328EADE29768BD24360687D70F0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_90918480328EADE29768BD24360687D70F0A@qq.com>

On Wed, Oct 11, 2023 at 08:53:16PM +0800, Chen Shuo wrote:
> This patch fixes the checks reported by checkpatch.pl
> for missing a blank line after declarations
> 
> Signed-off-by: Chen Shuo <1289151713@qq.com>
> ---
>  drivers/staging/gdm724x/gdm_tty.c | 1 +
>  1 file changed, 1 insertion(+)

Why are you not cc: the proper developers and maintainers and why does
your subject line have "tty: " as a prefix when this is not in the tty
subsystem?

thanks,

greg k-h
