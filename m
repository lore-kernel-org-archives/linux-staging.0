Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82753321E
	for <linux-staging@lists.linux.dev>; Thu,  9 Mar 2023 09:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4411C433EF;
	Thu,  9 Mar 2023 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678353003;
	bh=B6FKE/jSQi4/bSDONFJFsvuKCW4GcIgn++eqxrymCN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSakZWr5jQsAavM69tLBS/We5d9P14qRKjPiu2mTLR7ykHONJd7jk+hisQnBhcKNX
	 HaW6/I2s/j7VhPmwBa8MUs1wERO4/4XgmMtJL0dQAJd18IqgNaPk0Wws8/Pt5VcPC/
	 +nKBFPFd0v4iWERpr02j4K3BUnTpvNB9meUlMYc8=
Date: Thu, 9 Mar 2023 10:10:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	paskripkin@gmail.com
Subject: Re: [PATCH] Staging: r8188eu: Fixed block comment
Message-ID: <ZAmiaJT0wJkZq8dc@kroah.com>
References: <Y+8p7Hyaf4LhO/Sw@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+8p7Hyaf4LhO/Sw@khadija-virtual-machine>

On Fri, Feb 17, 2023 at 07:17:00AM +0000, Khadija Kamran wrote:
> Fixed block comment by adding '*' in each line. The Check message was
> shown by using checkpatch.pl script.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

This driver is now deleted, so this will not apply for obvious reasons.

thanks,

greg k-h
