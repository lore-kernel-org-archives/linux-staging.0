Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F3737416C;
	Thu, 26 Feb 2026 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772070092; cv=none; b=ejIuu0eatzHEp4N1aFiOuQiF1bjbD5YWlUFqTPUQhkepk0YD85Z7Ew6W9vAVx2uSpFMzI1Pjiu2VB7HpLBIlm66kyERUkRLOub8IY+vBRjk3knnCMg0x5epxDDZkzM6tEzwZkrj5jcQsHqjPPoVR6GqxtbW60er4oy6FQbSycVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772070092; c=relaxed/simple;
	bh=nPPfgriCI4clyWwIspOe0u1mrgnR4/u2O+KI0zKSwzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLK7VykGd7giv1WDjUy8sJL+nHVcbINKwYgSV6nKh27VKY5BAOfCPPSbNRGE18lg3rEu4vs95EEKwNGppqzzqQhaqWo3k3CRRBmP8Nvs5Hd0lsi5HHtH+DJqsMLToUDEjky6zyeYR2Y7mWgikXSHLMwD0ZYb9KJFGpLLbx+kNeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XcEqC/ii; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XcEqC/ii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE63C116D0;
	Thu, 26 Feb 2026 01:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772070092;
	bh=nPPfgriCI4clyWwIspOe0u1mrgnR4/u2O+KI0zKSwzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcEqC/iiQ43Y275EJIkZhg0mhM93H79uArCIoA5hvHiXh7dmanirjl7rPzf0YmTFq
	 +lXsGxz7C63Evy/FzTxK54vq9hbzZaRlwL1Ou2Bu4jYo683joQBHNVefKM03pSWQkl
	 h/vn1QYmGnLnWIXsSDj2Dh22yuq+vWmk+E/3MdIU=
Date: Wed, 25 Feb 2026 17:41:24 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Keith Teeple <keithrteeple@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	s9430399@naver.com, andriy.shevchenko@intel.com
Subject: Re: [PATCH] staging: rtl8723bs: split chained assignment in
 xmit_linux.c
Message-ID: <2026022503-slightly-cement-7efb@gregkh>
References: <20260226001019.1100684-1-keithrteeple@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226001019.1100684-1-keithrteeple@gmail.com>

On Wed, Feb 25, 2026 at 07:10:19PM -0500, Keith Teeple wrote:
> @@ -6,7 +6,6 @@
>   ******************************************************************************/
>  #include <drv_types.h>
>  
> -
>  uint rtw_remainder_len(struct pkt_file *pfile)
>  {
>  	return (pfile->buf_len - ((SIZE_PTR)(pfile->cur_addr) - (SIZE_PTR)(pfile->buf_start)));

This change has nothing to do with splitting chained assignments :(

