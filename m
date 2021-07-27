Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E69672
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 13:17:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61F85601FD;
	Tue, 27 Jul 2021 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627391859;
	bh=OOCCNXzx21q2l0kDMmSD+oFNhSnD0BpDuNRFYaqiBOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+g+iNG6pSkq4HWM5+uUlVZe7mk3unP/5rdNkCygIFoFQKYJ/j5Jq59Sj1cucJR7f
	 FWkCExX0dU8cuoteuzWxfBV+FhtpWJ3+ChjHlmZbAqGIgOKIArNkw4SrDuvi7dbN9c
	 YmfwOSKUCDVRUmMLhydGtpt3MNBkUFOUTnn1LVn4=
Date: Tue, 27 Jul 2021 15:17:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v4 0/2] staging: rtl8188eu: Replace a custom function
 with crc32_le()
Message-ID: <YQAHcbOeh2ohAmTg@kroah.com>
References: <20210723192620.10669-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723192620.10669-1-fmdefrancesco@gmail.com>

On Fri, Jul 23, 2021 at 09:26:18PM +0200, Fabio M. De Francesco wrote:
> Use kernel API crc32_le() in place of the custom getcrc32(). Remove no
> more used functions and variables after the changes made by patch 1/2.
> 
> Fabio M. De Francesco (2):
>   staging: rtl8188eu: Replace a custom function with crc32_le()
>   staging: rtl8188eu: Remove no more used functions and variables
> 
>  drivers/staging/rtl8188eu/core/rtw_security.c | 81 +++++--------------
>  1 file changed, 19 insertions(+), 62 deletions(-)

Much nicer, thanks!
