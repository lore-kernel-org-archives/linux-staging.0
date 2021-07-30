Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EFE72
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 08:23:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B344860EB2;
	Fri, 30 Jul 2021 08:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627633395;
	bh=XienLPypcT4jafbAb8E33tAQFMRDgUBzkXinX5F9wpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yx/G7xZb46VOfBacHThzsYc15i4H4qGxulqdiRlyro/2sqPqd9Km7UjwqKGI08LUD
	 Wf/d5rcKTOvP4VRDexS7iayUAJSlQ7Au4FH1ZGEDyXRgPn0xNDj2JgRxl/6BB5ChGW
	 Bhh66FCQ3Q3g+Ms5N+IxS5bNdfgQ7d6eQEZq/SwA=
Date: Fri, 30 Jul 2021 10:23:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] staging: r8188eu: Remove header file
 include/rtw_version.h
Message-ID: <YQO28PGmr1GB1FFb@kroah.com>
References: <20210729170930.23171-1-Larry.Finger@lwfinger.net>
 <20210729170930.23171-6-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729170930.23171-6-Larry.Finger@lwfinger.net>

On Thu, Jul 29, 2021 at 12:09:29PM -0500, Larry Finger wrote:
> This file contains only the definition of the driver version. This statement
> is moved into a header called by all the affected source files, and the now
> empty header is deleted.

And now that the driver is in the tree, the "version" can be removed
entirely.  But that's for a later patch :)

Thanks for all of these cleanups, now applied.

greg k-h
