Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0CC7E0
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 07:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79517C433D7;
	Fri,  9 Sep 2022 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662709604;
	bh=KUQj+khAWvMzxaLV6sNI+tFYdaIn84Exf2f+2qqu2/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcdX1HfN1yj+dcxpwQKq65vojRuo0Nk0a1KapSqOoGRZ5w6FfMilH4uh+9urLy0bd
	 v6RGft7NVPMfKSOrt9eKJryatD4WS2qSshekFgWou73huk+rvvjJ6+XYohQC+gXk6H
	 A9xxKuJDfx7oLAXLJuuqGtt685McpYlaBJq4z9Tc=
Date: Fri, 9 Sep 2022 09:46:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: GUO Zihua <guozihua@huawei.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: rtl8723bs: Fix return type for
 implementation of ndo_start_xmit
Message-ID: <YxrvYuVFqSg+CcyF@kroah.com>
References: <20220905130310.11489-1-guozihua@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905130310.11489-1-guozihua@huawei.com>

On Mon, Sep 05, 2022 at 09:03:10PM +0800, GUO Zihua wrote:
> CFI (Control Flow Integrity) is a safety feature allowing the system to
> detect and react should a potential control flow hijacking occurs. In
> particular, the Forward-Edge CFI protects indirect function calls by
> ensuring the prototype of function that is actually called matches the
> definition of the function hook.
> 
> Since Linux now supports CFI, it will be a good idea to fix mismatched
> return type for implementation of hooks. Otherwise this would get
> cought out by CFI and cause a panic.
> 
> As returns from _rtw_xmit_entry() would always be 0, remove unneeded
> variable ret and use enums from netdev_tx_t as return value instead.
> Then change return type to netdev_tx_t.

If _rtw_xmit_entry() can never fail, then it needs to not have a return
value at all, and that needs to also be fixed.  Can you make this a
patch series that does the return type change for _rtw_xmit_entry()
first, and then this change on top of that one.

thanks,

greg k-h
