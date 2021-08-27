Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25863FC6
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 13:10:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B0D360F4F;
	Fri, 27 Aug 2021 13:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630069852;
	bh=c5+YHnWY7DrCFsFr+252fUHx97s4CmCD8ry0QtL+h4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYayoHH8cnQsGb3BQJeBWbDrfEEFMvQzpYNQrxweB/011kC6zcrTe0KOzMHFvvnbt
	 iQnFh0If8StZnOZycShtpWVrr4LrsFMvLOaMvZYUTOQWhg+L8fCLEB2qmGGwuBP4B0
	 mzzdSbSYz8wM8XMsqnGozo4bz1DcO2zwnlOmn2e0=
Date: Fri, 27 Aug 2021 15:10:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wenlong Zhang <yixiaonn@gmail.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com,
	insafonov@gmail.com, cyruscyliu@gmail.com, yajin@vm-kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: rtl8723bs: prevent ->ssid overflow in
 rtw_wx_set_scan()
Message-ID: <YSjkVtvhgOgDq1qa@kroah.com>
References: <YSfjtZsISLH6cktF@kroah.com>
 <20210827125059.26694-1-yixiaonn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827125059.26694-1-yixiaonn@gmail.com>

On Fri, Aug 27, 2021 at 08:50:59PM +0800, Wenlong Zhang wrote:
> Commit 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
> fixed up the staging driver rtl8188eu by adding another check
> to prevent writing beyond the end of the ->ssid[] array.
> 
> Resolve this by properly fixing up the rtl8723bs driver's version of
> rtw_wx_set_scan()
> 
> Fixes: 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
> Signed-off-by: Wenlong Zhang <yixiaonn@gmail.com>
> ---
> v3:
> - Added the changelogs for this patch.
> v2: 
> - Fixed the description of this patch.
>   Thanks Greg KH for the review and guidance

This doesn't apply against any tree that I can see.  Neither my
staging-next or the 5.14-rc6 kernel release.

What did you make it against?  Please rebase and resend it against at
the very least, 5.14-rc6.

thanks,

greg k-h
