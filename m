Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900843FC2
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:39:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C8576108E;
	Thu, 26 Aug 2021 10:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629974368;
	bh=Kb2BRqJnhgCEFtwwhEQxATLUmyDZuDxe9+QdYedO9iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzAxaPWoy2aAMRtvCvBRb/MtNk0GOEfGvNTAb+0dDMr59Aa6AvhC+P2RetXyksCsH
	 VR64JQaY2QUT2r3iw3dZvifvkB1KOAOsIm41qyEKBI17QuwkyOqcvH7EsWO+0SJXAG
	 X2Uec6IjXwEhBTHYBUSGXYFHi23sHVjxutjgFBsI=
Date: Thu, 26 Aug 2021 12:39:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] staging: r8188eu: remove {read,write}_macreg
Message-ID: <YSdvW7RYpgnr8Xpg@kroah.com>
References: <cover.1629789580.git.paskripkin@gmail.com>
 <d591e29d77da73790c71f7a8e508a8b16fd48f65.1629789580.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d591e29d77da73790c71f7a8e508a8b16fd48f65.1629789580.git.paskripkin@gmail.com>

On Tue, Aug 24, 2021 at 10:27:13AM +0300, Pavel Skripkin wrote:
> These 2 functions are unused, so they can be simply removed
> 
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mp.c    | 39 ------------------------
>  drivers/staging/r8188eu/include/rtw_mp.h |  2 --
>  2 files changed, 41 deletions(-)

write_macreg_hdl and the read version can also be removed, right?

thanks,

greg k-h
