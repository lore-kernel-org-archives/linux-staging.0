Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EE928EE
	for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 15:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E30C385AA;
	Thu, 19 May 2022 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652974816;
	bh=RbvK8aV/78BpbsVs3Z9yMYmjbk92gPu8qsgf7q2Rpbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQg/EZ2OyCiJ9kbC6akFhhun28RPrI2xHnJHI55h/kwFSngLDZ9DGSiBW7NLjyGdc
	 18OroyFhhR+A/IUk0wyydAKSNYg5ezz3vU52/O2tGgqGLVobaEV6sw5WDaoE/XYWV/
	 9c2Alzq4EbcWie9XlrfhH7kZVexojud0PgJvHnpE=
Date: Thu, 19 May 2022 17:40:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Denis Efremov <denis.e.efremov@oracle.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	dan.carpenter@oracle.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, stable <stable@vger.kernel.org>
Subject: Re: [PATCH] staging: r8188eu: prevent ->Ssid overflow in
 rtw_wx_set_scan()
Message-ID: <YoZk3YLEDYKGG5xe@kroah.com>
References: <YEHymwsnHewzoam7@mwanda>
 <20220518070052.108287-1-denis.e.efremov@oracle.com>
 <855d90d7-70a2-da82-d62c-e8c030411852@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <855d90d7-70a2-da82-d62c-e8c030411852@oracle.com>

On Wed, May 18, 2022 at 11:49:27AM +0400, Denis Efremov wrote:
> 
> 
> On 5/18/22 11:00, Denis Efremov wrote:
> > This code has a check to prevent read overflow but it needs another
> > check to prevent writing beyond the end of the ->Ssid[] array.
> > 
> > Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
> > Cc: stable <stable@vger.kernel.org>
> > Signed-off-by: Denis Efremov <denis.e.efremov@oracle.com>
> > ---
> > 
> > This patch is a copy of Dan's 74b6b20df8cf (CVE-2021-28660).
> > Drivers r8188eu and rtl8188eu share the same code.
> 
> I also found same code pattern in rtl8723bs driver in
> stable kernels 5.10, 5.4, 4.19, 4.14.
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c?h=linux-5.10.y#n1354
> I can send the same fix to stable trees if appropriate.

Please do!

thanks,

greg k-h
