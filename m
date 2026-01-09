Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6119309C;
	Fri,  9 Jan 2026 04:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767934246; cv=none; b=Md3/bdQu/suQil2VMQubzJ7cid6ZHucvYEgYGLN+bR8c0MFy865Ev2urSatYaSU6rP5x++NA/qCcFIsmV2oasGBQ8BJCFxP/sSFpgkjmZ01jHH01e0g4UzW/9BdJJThjnH/h9wKsplpyNZcxi1cp1kBjqDDO9lnzPvC4RuUpcSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767934246; c=relaxed/simple;
	bh=bK8kgb2iTeD3PzMAoUmqNvVEvc5HdYv7RPUHZH5Ak3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVxqQ8aBKR53l5AGKJATj2iS9wpv3mefYCNBhF5LXPca+ZkWeo9Q/N+0Jo7obs3TPM0IXJs1HXdJANrJcOzllzFQ0i6m7tlbD7sIMUq1teyW4uVkpZt8oxqhJujNaCGJmZGIRBPiJyICjUDbMN3v+YmRkC5XbmKKH4HMxnv917I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tx6mflWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tx6mflWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AA2C4CEF1;
	Fri,  9 Jan 2026 04:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767934246;
	bh=bK8kgb2iTeD3PzMAoUmqNvVEvc5HdYv7RPUHZH5Ak3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tx6mflWx6ZWjKfXv6Svz6YIXM1/BBmC8noHUOL6gVFYEYQM130gRo6054vuxWSf4/
	 wfCEQeI7/iLzn4RJr1W2PKzo7Lm+pWb86p72oAOgd8q0BB3+ZDFywpsCEMrjauDduJ
	 7zT5k/97WjUFWqffRrFUOooMnQjvkJEG5mh2t75Q=
Date: Fri, 9 Jan 2026 05:50:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] staging: rtl8723bs: add IS_ERR() check for
 kthread_run()
Message-ID: <2026010936-koala-recharger-ca16@gregkh>
References: <20260108181612.2340796-1-samasth.norway.ananda@oracle.com>
 <20260108181612.2340796-4-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108181612.2340796-4-samasth.norway.ananda@oracle.com>

On Thu, Jan 08, 2026 at 10:16:11AM -0800, Samasth Norway Ananda wrote:
> kthread_run() returns an ERR_PTR on failure, not NULL. Without this
> check, rtl8723b_stop_thread() would later check "if
> (xmitpriv->SdioXmitThread)" which evaluates to true for error pointers,
> potentially causing issues when trying to complete or wait on an invalid
> thread. Set the pointer to NULL on failure to prevent later code from
> attempting to use an invalid thread pointer.
> 
> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 56ceedd5a26a..27d490204fcc 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -2922,6 +2922,8 @@ void rtl8723b_start_thread(struct adapter *padapter)
>  	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
>  
>  	xmitpriv->SdioXmitThread = kthread_run(rtl8723bs_xmit_thread, padapter, "RTWHALXT");
> +	if (IS_ERR(xmitpriv->SdioXmitThread))
> +		xmitpriv->SdioXmitThread = NULL

Shouldn't the function be returning an errror if this fails instead of
relying on the pointer to be NULL?

And this is a "wrapper function" and only called in one place, why not
just get rid of it entirely?  Same for rtl8723b_stop_thread()?

thanks,

greg k-h
