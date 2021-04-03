Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F370
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 07:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9ACD361177;
	Sat,  3 Apr 2021 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617435611;
	bh=SeLXz6T4CcIQOyXu4N3CLhfUFpDVaT2Qg2mT3xXx9p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjvKpT9DjAoN14OtfBVwzFpTJAo2yzr7pOUvBkvH/bG+XuTTDkL9Cb3DWVStm7bEK
	 uAlI+bOoLzAVEoFTThBh9782o8PYG2HbyryPN8EWyT+NH6ooNYMOcIX7rp9v5cMkbF
	 EcHr2PU+DWXTsAzMPWIkuVH6GcGZwUlK3mjM8sfo=
Date: Sat, 3 Apr 2021 09:40:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: dan.carpenter@oracle.com, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/30] staging: rtl8723bs: remove RT_TRACE logs in
 core/rtw_xmit.c
Message-ID: <YGgb2Mtzyp79elQ6@kroah.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
 <34b6f0b80cd3913722b258e9554dbc77268fb2bf.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34b6f0b80cd3913722b258e9554dbc77268fb2bf.1617384172.git.fabioaiuto83@gmail.com>

On Fri, Apr 02, 2021 at 07:29:43PM +0200, Fabio Aiuto wrote:
> remove all RT_TRACE logs
> 

I don't mean to be a pain, but this changelog text needs some work.

This says _what_ it does, but not _why_ you are doing this.  The kernel
documentation has a section on how to write a good changelog text, you
might want to look at that.

For this type of series, this could be as simple as:
	Remove all of the RT_TRACE_LOGs in the rtx_xmit.c file as they
	currently do nothing as they require the code to be modified by
	hand in order to be turned on.  This obviously has not happened
	since the code was merged, so just remove them as they are
	unused.


Or something like that.

Most of the time, writing the changelog can take more work than the
actual code change itself, but it's important as we need to know what is
happening both for the reviewers, as well as people in the future who
might have to look back and try to understand the reason for specific
changes.

Can you fix up this series based on this and resend?

thanks,

greg k-h
