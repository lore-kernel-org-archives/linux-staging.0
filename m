Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BDE2574;
	Sat, 25 Mar 2023 12:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EEFC433EF;
	Sat, 25 Mar 2023 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679746958;
	bh=YuqdbWe/XYdqPWicCpygLVXjj3TI/mTA8gm6+zYlqwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbOaCoDSp+LuQYYFoCHRohft6b9nn24xSX/S4Ruqbmqtk0Q+hyC5oSeRQRNvUo8pw
	 RxiX0V/0F+McY/J0rEaYrfjbHX77Ql93xSGAEdJz7G6w8yUq5b1iCTa01desermExr
	 fYVH1fEaiOcq6GPpIIFoLEbscffkPURLDRMBKgxs=
Date: Sat, 25 Mar 2023 13:22:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8192u: remove code from comments
Message-ID: <ZB7ni6yQdTvuhOIW@kroah.com>
References: <cover.1679744684.git.kamrankhadijadj@gmail.com>
 <70aacb99144b4c776f8efa4c47a8423c58a9454f.1679744684.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70aacb99144b4c776f8efa4c47a8423c58a9454f.1679744684.git.kamrankhadijadj@gmail.com>

On Sat, Mar 25, 2023 at 05:13:18PM +0500, Khadija Kamran wrote:
> Writing code in comments is generally not considered a good coding
> practice.
> Remove all the code comments from the file.

How about something like:
	Remove all of the commented out code lines as they are not being
	used and can be brought back in the future if they are ever
	needed again.

And the subject reads a bit odd too, how about:
	staging: rtl8192u: remove commented out code

> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/rtl8192u/r8192U_dm.c | 127 +--------------------------
>  1 file changed, 2 insertions(+), 125 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
> index 885c5966342f..f210ede8b1c7 100644
> --- a/drivers/staging/rtl8192u/r8192U_dm.c
> +++ b/drivers/staging/rtl8192u/r8192U_dm.c
> @@ -50,11 +50,9 @@ static	void	dm_init_bandwidth_autoswitch(struct net_device *dev);
>  static	void	dm_bandwidth_autoswitch(struct net_device *dev);
>  
>  /* DM --> TX power control */
> -/*static	void	dm_initialize_txpower_tracking(struct net_device *dev);*/
>  
>  static	void	dm_check_txpower_tracking(struct net_device *dev);
>  
> -/*static	void	dm_txpower_reset_recovery(struct net_device *dev);*/
>  

The extra blank lines can now go away as well, at the same time, right?

thanks,

greg k-h
