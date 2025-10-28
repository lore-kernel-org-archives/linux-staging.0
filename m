Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454452D5C74
	for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 09:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643622; cv=none; b=QWrG97vNoDTPziPrvxGYATaSPrppG6yC9WtZbsKfQHPphy983217PQ+31X7AiWN7zSot2uh7M6SKnjvXGBgEnxEF5uuEfndUvNqs4jxmoxW4MvS/oasp2OOJLAFqiA0/p70PMYNiR4SSA78A2xFQHOrNR9Lsinm9gmoYP188+iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643622; c=relaxed/simple;
	bh=uCUQbnC5YY7OOPb59zklwMScHb7oEZBWPNrqLHPe32I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKNRo3Qqf4DIw1L8ivSGL6iIdvdQ1Yzjsj409Q9O+5eyM7tC2cWENnRuynYTPVCMfueN1+Ui0gM4TAiKoy4rHNwW0TPjVqxCGAm28PHeg51MSaWoVbZvQWS5BYwI+nawmFGNaczVOK1gtLiaEteOmsoW531BPHaFjwQp/uDlI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dprUeeFy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dprUeeFy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9A1C4CEE7;
	Tue, 28 Oct 2025 09:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761643621;
	bh=uCUQbnC5YY7OOPb59zklwMScHb7oEZBWPNrqLHPe32I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dprUeeFyX715+bJiAUeUwrl7hGScV4TmMdPwTxalb9AUVPF1jnzIpBonOaA0Cgorj
	 kvkIgpAMq0Nt+rtM1q1lXsFLS8UfUuOYOJStbxEUujWzDwu53b9EQbF4X+A8irWFz7
	 3kWqFwc3/C8piF3Es3bLV5580OAMnyRJ76QjVbPQ=
Date: Tue, 28 Oct 2025 10:26:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: rafiqul713 <rafiqul713@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: rtl8723bs: remove unused rtw_sprintf macro
Message-ID: <2025102806-gutless-follow-db99@gregkh>
References: <20251028092022.80186-1-rafiqul713@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028092022.80186-1-rafiqul713@gmail.com>

On Tue, Oct 28, 2025 at 10:20:22AM +0100, rafiqul713 wrote:
> From: Rafiqul Islam <rafiqul713@gmail.com>
> 
> The rtw_sprintf macro is defined in osdep_service.h but has no callers in
> the driver. Remove the dead code.
> 
> Changes since v2:
> - Addressed review feedback to delete the macro instead of replacing it
> 
> Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/osdep_service.h | 6 ------
>  1 file changed, 6 deletions(-)

{sigh}

Again, go back and take a look at the links my bot pointed you at, to be
specific, read this:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

Take a few more days, relax, and try again.  There is no rush here.

greg k-h
