Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E770
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:34:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3B7460190;
	Fri, 26 Mar 2021 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616751240;
	bh=ozywuCe/NeMTTH6FqmHhUeqC8Fwy1YXXVeK7rORIDy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIlycJAf81tbDszupCyGPvoi3Ds3VV+CJbENSkdZVExP9PqjQnzVsd4KUbRTZ5HKq
	 gfVqhdCst39/COBH2bcdsjYez9EJ/6eOOdB9fqWjnvrrbf1di+BnGG1CchhWYfsyOd
	 QQvo7NuesBq/UP82PmTyEy8SF2EMYtvxPayHiua8=
Date: Fri, 26 Mar 2021 10:33:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: carlis <zhangxuezhi3@gmail.com>
Cc: zhangxuezhi1@yulong.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix a typo
Message-ID: <YF2qhUD1lz3LbEhC@kroah.com>
References: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
 <YF2dXIxMOUyLzfnQ@kroah.com>
 <20210326171634.000011f5@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326171634.000011f5@gmail.com>

On Fri, Mar 26, 2021 at 05:16:34PM +0800, carlis wrote:
> On Fri, 26 Mar 2021 09:37:48 +0100
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Fri, Mar 26, 2021 at 04:05:15PM +0800, Carlis wrote:
> > > From: "Carlis" <zhangxuezhi1@yulong.com>
> > > 
> > > Change 'tft' to 'TFT'  
> > 
> > Why?  What is wrong with "tft"?
> > 
> I think abbreviations should be capitalized.

Why?  What requires this?

thanks,

greg k-h
