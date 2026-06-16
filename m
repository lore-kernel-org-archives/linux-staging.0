Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73561369965;
	Tue, 16 Jun 2026 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611832; cv=none; b=HKp93kwGqLEHIa/zt96PxQgyruZzc2v7soWiHsQKsUlmyhVPNKAsuPZ2XZXPO49Qnuax8qsk1ykCKRpdDUAwfabqd/ILQCz8x5d9f4LwJiy8BOUdf+kB9TM3PBcVnz4u+ce2aukbuwHso36s13IYwPRJFllntJzKigcjpgUonVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611832; c=relaxed/simple;
	bh=BY8YQoRAsKvL4XFSfR/6kYIobtg+m7o8K1fApWqzMZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H81p6jmiiQqh1rs/1kkYLpBOMqzwJLdAFQ/+Iuq7TfnlPUIz8HcQeUCLeZvDSmRwrwxivP1sg/PSFgXjiPN6tYmQ5usJFr89I+VRII0s90cx7v9QUf/hySbRZ8OC3dlvVXrP73lSR0V5FB1Kl4JG/M9YexSNaZuEjA06WvULVMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=akeyiK4e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="akeyiK4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC9C1F000E9;
	Tue, 16 Jun 2026 12:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781611831;
	bh=mT3liRWva+7/CzNTzJUYvvuKvZJTvcr+tG0YoLIzsm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=akeyiK4eovIapV1QAgE7oVsvul/8LxOABdAzVmzL8JkGC9ypTzh5MskU2WjggXEJn
	 2KUA0rzZP2X929fwN4hR5/pCpOnGbnIe5tTyWCVX9jHDmayZ71yyhgQKAYFx01XtVA
	 aCCTQjhGgyCK5eufG4iaIy/vbzY+D+S6d9eTjJ4c=
Date: Tue, 16 Jun 2026 17:39:02 +0530
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] staging: rtl8723bs: Fix coding style issues in
 header files
Message-ID: <2026061651-talisman-pogo-a0ff@gregkh>
References: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616110048.45541-1-subhrojyoti0609@gmail.com>

On Tue, Jun 16, 2026 at 04:30:43PM +0530, Subhrojyoti Bala wrote:
> This patch series fixes various coding style issues in the
> rtl8723bs staging driver header files, as reported by
> checkpatch.pl:
> 
> - Fix multi-line comment style in wlan_bssdef.h
> - Fix enum indentation in rtw_mlme.h
> - Fix block comment style in rtw_mlme.h
> - Fix multi-line comment style in rtw_mlme.h
> - Fix whitespace in comments in rtw_mlme.h
> 
> Subhrojyoti Bala (5):
>   staging: rtl8723bs: Fix multi-line comment style in wlan_bssdef.h
>   staging: rtl8723bs: Fix indentation in enum in rtw_mlme.h
>   staging: rtl8723bs: Fix block comment style in rtw_mlme.h
>   staging: rtl8723bs: Fix multi-line comment style in rtw_mlme.h
>   staging: rtl8723bs: Fix whitespace in comments in rtw_mlme.h
> 
>  drivers/staging/rtl8723bs/include/rtw_mlme.h  | 55 ++++++++++---------
>  .../staging/rtl8723bs/include/wlan_bssdef.h   | 14 ++---
>  2 files changed, 35 insertions(+), 34 deletions(-)
> 
> Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
> -- 
> 2.54.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
