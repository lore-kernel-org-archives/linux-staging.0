Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6893D3FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 06:52:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5C9B60EE5;
	Fri, 27 Aug 2021 06:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630047162;
	bh=B+mVYYKfDGlL4DqFrbOpqVvGn4+tX4m1MV+mH78PBew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wm/p9oBbZLqRVCXOL2ucMQ+S+fYUvCW9eNgExcmPRMgAlNp+Sv0X3JQ3VTdSYy2eg
	 xOmmbB/Dj0gdl/4RfdTF3gdIYDfvqzGSQum7Ey6CHjxCcy9CBXS7Nre7KJJWWEBTbj
	 Qo9oqq1hZv1Z4ds1KGdr9KjJKiYFqni97Pa9GNvc=
Date: Thu, 26 Aug 2021 20:55:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wenlong Zhang <yixiaonn@gmail.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com,
	insafonov@gmail.com, cyruscyliu@gmail.com, yajin@vm-kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: prevent ->ssid overflow in
 rtw_wx_set_scan()
Message-ID: <YSfjtZsISLH6cktF@kroah.com>
References: <20210826154622.55361-1-yixiaonn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826154622.55361-1-yixiaonn@gmail.com>

On Thu, Aug 26, 2021 at 11:46:22PM +0800, Wenlong Zhang wrote:
> Commit 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
> fixed up the staging driver rtl8188eu by adding another check 
> to prevent writing beyond the end of the ->ssid[] array.
> 
> Resolve this by properly fixing up the rtl8723bs driver's version of
> rtw_wx_set_scan() 

Odd trailing whitespace :(

> 
> Reported-by: Wenlong Zhang(iLifetruth) <yixiaonn@gmail.com>
> Fixes: 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
> 
> Signed-off-by: Wenlong Zhang <yixiaonn@gmail.com>

No need for a blank line here.

Also, you don't need a reported-by: if you are the author and sign off
on the patch, that would just be implied :)

Can you fix this up and resend a v2?

thanks,

greg k-h
