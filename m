Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870C2F80
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 13:32:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C567D610FC;
	Tue,  4 May 2021 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620135125;
	bh=dOWj9KpD6YYv1QfoTJTLmqbkodKnlVInixOTiaxzaDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrKeShIRzVWeWIlX5XlGbsfFUzFwzWIoIUTY3WM6l7grGpMLe7H+JCQscqGttBAe5
	 RsOxkPfjfMAurlRPuQ4tAYGFbYpLTHScwdXgCW1KDOKcVkhWPa5LWi0f2nu6jCmvAd
	 mcFTymLjDpJWlCzXPFIQkhAXtoQNBMBfCxU8+5OA=
Date: Tue, 4 May 2021 15:32:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8723bs: use in-kernel aes encryption in
 OMAC1 routines
Message-ID: <YJFM0igHeonjMra5@kroah.com>
References: <cover.1620133620.git.fabioaiuto83@gmail.com>
 <8c1c680a6498045746ca579e4caa3c87d13b3b49.1620133620.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c1c680a6498045746ca579e4caa3c87d13b3b49.1620133620.git.fabioaiuto83@gmail.com>

On Tue, May 04, 2021 at 03:12:56PM +0200, Fabio Aiuto wrote:
> --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> @@ -7,6 +7,7 @@
>  #ifndef __RTW_SECURITY_H_
>  #define __RTW_SECURITY_H_
>  
> +#include <crypto/aes.h>

Why put this .h in a .h file?  Why not just put it in the .c file(s)
that need it?

You will note that this .h file does not have any other #include lines
in it...

thanks,

greg k-h
