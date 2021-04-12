Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A596571
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:37:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B31B26121E;
	Mon, 12 Apr 2021 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618220263;
	bh=uBEBWCvKhDMQP4UP/TvSZxCggBLXt3IfEwGxtJ1Rg6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y+9Oxn25Slqjyi6P1Wetic+CokPt+pAZ3c4VmQlOpj1MHuqU+HoxKCDfhtE53JKOi
	 M7nJTq2gpRXNc8xq0Ys/OD1xQ7qQ1A7FuVEwQVqSBtLOrsduAQZD30SQiTnQ1z1Nqc
	 jkEMafIyVtu5L3f2dS6f6fCbwnWIycX1O1MMqgAA=
Date: Mon, 12 Apr 2021 11:37:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v5 0/4] staging: rtl8723bs: Change
 several files of the driver
Message-ID: <YHQU5NNLOGO///39@kroah.com>
References: <20210411110458.15955-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210411110458.15955-1-fmdefrancesco@gmail.com>

On Sun, Apr 11, 2021 at 01:04:54PM +0200, Fabio M. De Francesco wrote:
> Remove camelcase, correct misspelled words in comments, change 
> the type of a variable and its use, change comparisons with 'true'
> in controlling expressions.
> 
> Changes from v4: Write patch version number in 2/4.
> Changes from v3: Move changes of controlling expressions in patch 4/4.
> Changes from v2: Rewrite subject in patch 0/4; remove a patch from the
> series because it had alreay been applied (rtl8723bs: core: Remove an unused variable).
> Changes from v1: Fix a typo in subject of patch 1/5, add patch 5/5.

I'll take this, but the subject here is a bit odd, and obvious :)

thanks,

greg k-h
