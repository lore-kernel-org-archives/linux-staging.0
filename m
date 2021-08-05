Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB770
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 10:54:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F68B610CC;
	Thu,  5 Aug 2021 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628160841;
	bh=SXDxzxSwLT5xZ6d2fE29M4QHMmsYatJUQggGaP9jyvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYhovmjktiZI+YdfCEc5GXQvXDnwLbz+H7mH4YHiMwavuEwdvcquhWysYHFBkk1gH
	 CNAyq6FeTRijPjdCFQdjCm+4XGJx2Q3ZbstYOVoTatOMPZgSpkterLiAXl4sscQigS
	 iyyKEuw43zHtYM32Xl9VLVDP1JkCt9yOTgJ1dip8=
Date: Thu, 5 Aug 2021 12:53:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Clean up some extraneous wrappers and some empty
 routines
Message-ID: <YQvDRjChHw4g2VKl@kroah.com>
References: <20210802192721.23110-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802192721.23110-1-Larry.Finger@lwfinger.net>

On Mon, Aug 02, 2021 at 02:27:15PM -0500, Larry Finger wrote:
> The original code created some wrappers to handle the differences between
> Linux and Windows. In a Linux-only version, these can be removed.
> 
> v2 - remove some .rej files

Only 2 of these applied, can you rebase and resend against my
staging-testing branch?

thanks,

greg k-h
