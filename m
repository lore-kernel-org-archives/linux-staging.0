Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D12622
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 06:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DCCC433D6;
	Fri,  9 Sep 2022 06:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662703605;
	bh=7zGDU3BdHmCGK+cAAZcKUbBNWba3iuCoLKqtyl2YkKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwlFn8Vc8k1c3GicNVCJM6ZPQ4AEPqwnGqALd3wmuCXlNKSX/UtK3udbFz0MP0FU8
	 nlq1VsEHpyM1DW68cppLDGeDxBsuH1s/a9L0xibzksW1W/Pyan4h0Tbck1HAnPvB2L
	 CATfE0rcSPnvgY1dMU5AyhjuV1+SU+xHspm7nlXg=
Date: Fri, 9 Sep 2022 08:06:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vt6655: fix potential memory conruption bug
Message-ID: <YxrX8tNR4uHCUWPT@kroah.com>
References: <20220909053038.33188-1-namcaov@gmail.com>
 <YxrTiN1OuJ2cbtrn@kroah.com>
 <CA+sZ8B_VtmUWnvvfWBUV1WVq_=gRid+6ffGRQwdxp+9DYcLDtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+sZ8B_VtmUWnvvfWBUV1WVq_=gRid+6ffGRQwdxp+9DYcLDtw@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Fri, Sep 09, 2022 at 08:01:29AM +0200, Nam Cao wrote:
> Hi Greg,
> 
> Just out of curiosity, how can we be sure that sizeof(unsigned int)
> is never 8 bytes? The C standard doesn't say anything about this, as
> far as I know.

Do you know of a Linux architecture that this is true?

Linux has a few more requirements than C does (i.e. an unsigned long has
to hold a pointer) so don't go by the C requirements please.

thanks,

greg k-h
