Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BB53F7ABE;
	Tue,  7 Jul 2026 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423568; cv=none; b=PLYYXUAMJgFFj1rifGrbimB7eOoAdlIXqfQS6FFskq0bDUfFAJUULFq7qYqo0rDg9M2Oz3e9w22fQaPj3wK0IvS5qFNJ9/nckHU1Un/dWUCNBHoJJ6AdKgvYt/dQ+bttniz+jgJWOcj9Q8MRAmXkAKBBd6B6uHgoBKgOynjIkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423568; c=relaxed/simple;
	bh=CzFCETi5LwZnorsB1agbbfp2nLl/0pSHktqqEMHqet0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+gOKK4WmYiHXWJ9hKCEAq2Wp7mYP4KWPMJCMkvmbg8G0QTcOnWDor/PM7LBklKCNL95mHCElKjr0vsHrd/ecEM4z7/t3Z6VselduGU6P0XNB1bq9VP1mN8aSlClX2ZrKeaPrYObVaXRT5GAj0oU8HTODub5Pv59R/Tq+Lc5CWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QaM1FtMd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QaM1FtMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119571F000E9;
	Tue,  7 Jul 2026 11:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423561;
	bh=uTxTIa+E+eT5hcRL0TNwpUyYe95IcNWRZBIkZglWsaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QaM1FtMduILnCpNslZvN41tSLfFr+1Ylwf+A7bymOFzqQnxYDTWlEwAsasSet0Q1B
	 kh4rSPAEsxYr6XFGR1YpQ3jpDx+8nDXDdytHUYeo1ngTHZze14bVNyndC4t9pv9gQN
	 aadmwo7enGcsCgqBcxpJeZKaYZAyoQeuX329Wcqc=
Date: Tue, 7 Jul 2026 13:25:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bruce Ou <oubruce1234@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase warning for bAllow
Message-ID: <2026070748-violin-dilute-24ce@gregkh>
References: <20260622095236.10932-1-oubruce1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622095236.10932-1-oubruce1234@gmail.com>

On Mon, Jun 22, 2026 at 05:52:36PM +0800, Bruce Ou wrote:
> Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index c1185c25e..c23cf4216 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -299,12 +299,12 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
>  int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
>  int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
>  {
> -	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
> +	u8 allow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */

Shouldn't this now be a boolean?

thnaks,

greg k-h
