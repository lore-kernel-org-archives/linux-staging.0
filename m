Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970951F959
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AdE+FxrF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B27EC433C8;
	Fri,  6 Oct 2023 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696599464;
	bh=UuJSYGmAh6rK9NuQvs+gSQo0Y9YEQ6o68p+4gUIe9fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdE+FxrFaxnUzuhnsnrrrVZGGiqdqqGPdwFfkCgmaiK6k3/MaqVM5OEB436Zs+imZ
	 XpuwhcQAOgq+nYz+q0F9MwgVkl39Z0SRxRjOYy57avhKMr2Jq35OKTTW67OxB2IFDs
	 YbNxO4D9zursk1jFWlps+kG1HWN4Fuu/TlO1L+74=
Date: Fri, 6 Oct 2023 15:37:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [lvc-project] [PATCH] staging: rtl8712: fix buffer overflow in
 r8712_xmitframe_complete()
Message-ID: <2023100645-vicinity-nuclei-3d84@gregkh>
References: <20230919092318.14837-1-Igor.A.Artemiev@mcst.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919092318.14837-1-Igor.A.Artemiev@mcst.ru>

On Tue, Sep 19, 2023 at 12:23:18PM +0300, Igor Artemiev wrote:
> The value of pxmitframe->attrib.priority in r8712_issue_addbareq_cmd(),
> which dump_xframe() calls, is used to calculate the index for accessing 
> an array of size 16. The value of pxmitframe->attrib.priority can be 
> greater than 15, because the r8712_update_attrib() function can write 
> a value up to 31 to attrib.priority, and r8712_xmitframe_complete() 
> checks that pxmitframe->attrib.priority is less than 16 before 
> calling r8712_xmitframe_coalesce().

But that number comes from the hardware, so how can it ever be larger
than 15?

> Found by Linux Verification Center (linuxtesting.org) with SVACE.

How was this tested to verify that it can be triggered and that this
change solves anything?

You have read the kernel documentation for what is required when using
"research tools" like this, right?

thanks,

greg k-h
