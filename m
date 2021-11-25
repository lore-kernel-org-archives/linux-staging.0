Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70E22C80
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 16:36:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4CB060EB5;
	Thu, 25 Nov 2021 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637858213;
	bh=9fnH95eMHD+AARZyCzt4YZ3kg3T21/xouuTuMp70H/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v5Hcr15dUkWVhX2vxmZbm0nvKdDLhoyXTRsuX8i7jg4UkppF33qZoTydfV8RxI/4S
	 uU/pJXAkWgWmK11kKQsfGjWDxMT29oqJPvNuddRzKbXVUVkwHY6FTkA/nr3A96bDcu
	 1nIl93Nt40wxjblAbTsWDyUeQXv9meHNvMClO3Ws=
Date: Thu, 25 Nov 2021 17:36:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zameer Manji <zmanji@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: 8188eu: remove unused code in ieee80211.h
Message-ID: <YZ+7lttAi1BPCgW2@kroah.com>
References: <20211117143234.1508695-1-zmanji@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117143234.1508695-1-zmanji@gmail.com>

On Wed, Nov 17, 2021 at 02:32:18PM +0000, Zameer Manji wrote:
> This header file contains lots of code that is unused
> and safe to remove.
> 
> Signed-off-by: Zameer Manji <zmanji@gmail.com>

You have a mistyped word in your subject line, please fix.

thanks,

greg k-h
