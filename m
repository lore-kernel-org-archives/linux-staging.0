Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7833516FF23;
	Sun, 10 Mar 2024 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710088181; cv=none; b=moVKhEwGussg7U+Nl4fbDRE/Cml7241uVdgdINYFrdeobNRTz7KPw6QRO42F1EnmFmSRH6VpzJ4NAj9bU5gj439Dp+Cx074gb6xjZetr5DHqu4lJZAedb6P9ZTch3I+jm8lvTFhVkWODTq6LnM2VhxZU78iGOXbV6g+1EUifVLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710088181; c=relaxed/simple;
	bh=Bhgl7iLOJ9bWkXk1PYvBnj5ZmIr7o++0aDS0XeRB6F8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WAXPuPDcHFhQt6x6MpGM/5vhQBUci/uzFL82umbMfxiaotYRXiQJ0id1X6oqSSL3aXx4oZK+U7/WUHHB7vmEIdb5VDlFTucCN4xWjbucNJfWZX/7/scDK4t28s7Cgoc5SjEQULSndZsz8ZgbCYu3zPoS2LwiYBYZmzU/QP04cjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=V98GAzLs; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="V98GAzLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6V7NVYdsI5fbdSfAZ9YDn3yYbyROXGzRGkBAlXFca2w=;
  b=V98GAzLseBy1tKjDYPs5BNv9j96bYDInKGyAA+sMK7ryjcJ2JvhIH5jm
   awPtaCEDLt0rMgWpXaE9PeC5LWCEfkSivslNe5SYIgWmyBznLi3nvwAVK
   tVPTtEYxDWwlHfaQDruFe+dLCoikOwunfJuhJpaKhBkSYvKyO7bORUpSe
   8=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,114,1708383600"; 
   d="scan'208";a="155883146"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 17:29:35 +0100
Date: Sun, 10 Mar 2024 17:29:34 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Dorine Tipo <dorine.a.tipo@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: vt6655: Fix line length exceeding 100 columns
In-Reply-To: <20240310161407.3345-1-dorine.a.tipo@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2403101728560.51678@hadrien>
References: <20240310161407.3345-1-dorine.a.tipo@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 10 Mar 2024, Dorine Tipo wrote:

> Break function declaration into multiple lines.
>
> This patch breaks the RFbAL7230SelectChannelPostProcess() function
> declaration into multiple lines to improve readability and compliance
> with coding standards.
>
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  drivers/staging/vt6655/rf.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
> index 6f842ac00526..057860a5e100 100644
> --- a/drivers/staging/vt6655/rf.h
> +++ b/drivers/staging/vt6655/rf.h
> @@ -69,7 +69,8 @@ void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
>  		  long *pldBm);
>
>  /* {{ RobertYu: 20050104 */
> -bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel, u16 byNewChannel);
> +bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel,
> +				       u16 byNewChannel);

Maybe there is a way to make the name of the function shorter instead?  It
looks pretty long y Linux kernel standards.

julia

>  /* }} RobertYu */
>
>  #endif /* __RF_H__ */
> --
> 2.25.1
>
>
>
