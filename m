Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0044A31581;
	Thu, 19 Oct 2023 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UmNCDDyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2B7C433C9;
	Thu, 19 Oct 2023 15:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697729479;
	bh=eFIqv6PT8zFfTS2Wvhm/KJywp22U/mEaQLbVWOOiAG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmNCDDyUIYcCrJMG7idhPxGRpIvOAwchg9u02JNpbMkQNdDnD6nufLI9vlCbNLYlj
	 z02/7uT8fz7vYP97lXebp4v+4yXsr6l9Su54GV1YwZI1zJx3uO+QkSR7zG8EcasXLl
	 psLjXbmANIHQBeAa0d2omrSs4pLcVC0h1g6WfwKw=
Date: Thu, 19 Oct 2023 17:31:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: remove empty functions
Message-ID: <2023101938-canopener-evasive-3590@gregkh>
References: <ZTD677iqMkRPxT27@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTD677iqMkRPxT27@lab-ubuntu>

On Thu, Oct 19, 2023 at 12:46:23PM +0300, Calvince Otieno wrote:
> The functions vchiq_debugfs_init(), vchiq_debugfs_deinit(),
> vchiq_debugfs_add_instance(), and vchiq_debugfs_remove_instance()
> are declared and defined but contains no code or statements.
> They do nothing.

On the contrary, they do a lot!  Try building with CONFIG_DEBUG_FS
disabled and see what happens with your patch applied (hint, it breaks
the build badly...)

To be fair, the "empty" functions should be moved to the .h file, not
the .c file, so if you want to do that, it would make more sense
overall.

thanks,

greg k-h
