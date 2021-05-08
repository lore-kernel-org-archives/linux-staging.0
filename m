Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2572
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 10:58:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 878E861414;
	Sat,  8 May 2021 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620471489;
	bh=H/jXYFQXLAmIIakuyQqiit+5QqWQgTX/kFXq/0VpIH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyLiTcFH2B0Q2YAJfl0liVNUB0fK2q7FFh4C1w8szsHQNO6/vid52u/4UVXRyZTyw
	 Hkxyl3Gh1MMidre9szM/jhDt+yRgH498gZaWA5MRNrcixxa3Y9bcCYVg5EkML4RIzE
	 yfXlB9zt1DWTxUxdhly5vK256JvflOcAruNgwyLM=
Date: Sat, 8 May 2021 12:58:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: code cleanup
Message-ID: <YJZuviLa3SRLWASk@kroah.com>
References: <20210507075458.GB3@paasikivi.fi.intel.com>
 <20210508105129.2698-1-paskripkin@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508105129.2698-1-paskripkin@gmail.com>

On Sat, May 08, 2021 at 01:51:29PM +0300, Pavel Skripkin wrote:
> Breaks are not useful after a return, they can
> simply be removed.
> 
> Also, dropped the individual return statements
> after or inside switch cases

Almost always, when you say "also" in a patch changelog, that means this
should be split up into two different patches.

I recommend doing that here as well, this should be a 2 patch series,
right?

thanks,

greg k-h
