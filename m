Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DCC28EE
	for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 15:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C921EC385AA;
	Thu, 19 May 2022 15:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652975134;
	bh=grMrez5z/qqSwQfDRZjfSNqC7wVFEopD1oJJWSiFoLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrk0HJqiDHGsWZNXPq68+mIaObqaevRudF9yM+wIPbrZ967oq1V/YgY1OopBbe2GL
	 Hu5bwu2Ue/AV2h3DJuSxElAYPYVqaOKx49MzyHwMNCvAVDV8QgBGXsob+KRyapthIn
	 OKzOQ2/3INec1Nf6Txp/YOn9ek493BKfBSCPslwk=
Date: Thu, 19 May 2022 17:45:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Denis Efremov <denis.e.efremov@oracle.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	dan.carpenter@oracle.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, stable <stable@vger.kernel.org>
Subject: Re: [PATCH] staging: r8188eu: prevent ->Ssid overflow in
 rtw_wx_set_scan()
Message-ID: <YoZmG98rI7oK5qgf@kroah.com>
References: <YEHymwsnHewzoam7@mwanda>
 <20220518070052.108287-1-denis.e.efremov@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518070052.108287-1-denis.e.efremov@oracle.com>

On Wed, May 18, 2022 at 11:00:52AM +0400, Denis Efremov wrote:
> This code has a check to prevent read overflow but it needs another
> check to prevent writing beyond the end of the ->Ssid[] array.
> 
> Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Denis Efremov <denis.e.efremov@oracle.com>
> ---
> 
> This patch is a copy of Dan's 74b6b20df8cf (CVE-2021-28660).
> Drivers r8188eu and rtl8188eu share the same code.

This does not apply to my tree at all. This file is not present anymore,
what tree did you make it against?

confused,

greg k-h
