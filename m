Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7672
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 08:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29B2960FC3;
	Fri, 13 Aug 2021 08:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628842815;
	bh=R2t/HkTfw4iNuHnkpQLxoKAEyy4GosUZbPrQovzCfTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nyuqa5aQXSZ6GUZWcEcZv0Id4SVtTlXsNz9UtCd4ZlNnFf4KQEEgFX5crXQm/E1ya
	 +6yBMTJAZZcoN9SYQjy7q4KOq1n2Mz93W7A1yOUmlYE4gr4tSFzYNDn819Ds5EjetO
	 TZFVZBa2vnDIRfxw88FJFcMUTWRBQRzoTdvppxRM=
Date: Fri, 13 Aug 2021 10:20:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Graute <oliver.graute@kococonnector.com>
Cc: oliver.graute@gmail.com, Carlis <zhangxuezhi1@yulong.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] fbtft: fb_st7789v: added reset on init_display()
Message-ID: <YRYrPfEHrcvDL4va@kroah.com>
References: <20210813062511.14537-1-oliver.graute@kococonnector.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813062511.14537-1-oliver.graute@kococonnector.com>

On Fri, Aug 13, 2021 at 08:25:10AM +0200, Oliver Graute wrote:
> staging: fbtft: fb_st7789v: reset display before initialization

What is this line here, and why is this not your subject line instead?

> 
> In rare cases the display is flipped or mirrored. This was observed more
> often in a low temperature environment. A clean reset on init_display()
> should help to get registers in a sane state.
> 
> Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>

What commit does this fix?

thanks,

greg k-h
