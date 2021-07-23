Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A80F72
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 11:01:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3C1660EB2;
	Fri, 23 Jul 2021 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627038112;
	bh=kzaEsoa7UY8A1naT/RVW8iZLVR/8UwfLgBZJB/INriw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPqNPXtS2iHj9F3euqoq67XYGF8u57UxgaMeUcBYA/qryy0f25/7U3pYFtkkIIsTl
	 fif/jdDRBfCe3nEFsunZGvtukF40s3Pw6Y+5uWjYBX9Bd85XoE9P0UhcZMSfYSUcY5
	 oyIMT5/GIJJWC5AAFh+s8iLlzjculy06zUWG/Ybw=
Date: Fri, 23 Jul 2021 13:01:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	fabioaiuto83@gmail.com
Subject: Re: [PATCH 0/7] staging: rtl8188eu: replace driver with better
 version
Message-ID: <YPqhmjYDj0rq7V7r@kroah.com>
References: <20210723004214.912295-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723004214.912295-1-phil@philpotter.co.uk>

On Fri, Jul 23, 2021 at 01:42:07AM +0100, Phillip Potter wrote:
> I had to break this patchset up a bit to get around the file size limits
> on the mailing list, and also I removed the hostapd stuff which is
> userspace related and therefore not required.
> 
> The driver currently in staging is older and less functional than the
> version on Larry Finger's GitHub account, branch v5.2.2.4. This series
> of patches therefore:
> 
> (1) Removes the current driver from staging.
> (2) Imports the GitHub version mentioned above in its place.
> 
> There is plenty of work to do to this driver, including to its Makefile,
> but it is at least buildable/usable for now.

Looks like it failed to build :(

And does this replace the 0/2 series?  If so, is this a v2?

confused,

greg k-h
