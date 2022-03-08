Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C55C7C
	for <linux-staging@lists.linux.dev>; Tue,  8 Mar 2022 10:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D7AC340F7;
	Tue,  8 Mar 2022 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646736395;
	bh=IKXUYtmKjsKoAjOIxL2cGHVYl7X2/wSeAGkMxrw6wbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2HgbNvC3Zl7sd8IKCk+IBar9B5vPyQwHEDCQKWfVOSPk3Z85YuSayYAQC/6l5dKxT
	 Nw5PuSjss76hIwTLRNo0BeNQSaRwgX1E50WTH3phRbR4LWfAtcCzUuPD9LGBUCCeL/
	 6w2J6tEK5xl8aNLUZXMZjPebohzuKEIf3pkzOiEU=
Date: Tue, 8 Mar 2022 11:46:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 1/1] staging: fbtft: Consider type of init sequence
 values in fbtft_init_display()
Message-ID: <Yic0CN+qSvDtSiEz@kroah.com>
References: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
 <Yictcf0BCvveVT+V@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yictcf0BCvveVT+V@smile.fi.intel.com>

On Tue, Mar 08, 2022 at 12:18:25PM +0200, Andy Shevchenko wrote:
> +Cc: Helge
> 
> Maybe you can pick this up?
> 
> On Fri, Mar 04, 2022 at 09:34:14PM +0200, Andy Shevchenko wrote:

You sent this less than a week ago!  Please relax, staging driver
patches are way down my list of priorities at the moment.  Wait at least
2 weeks before trying to get someone else to take patches for this
subsystem.

relax...

greg k-h
