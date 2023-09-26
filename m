Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230412B73
	for <linux-staging@lists.linux.dev>; Tue, 26 Sep 2023 09:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9E7C433C7;
	Tue, 26 Sep 2023 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695719636;
	bh=Y+odGCOczssjR27qb7hGuZghKba17wGbQ+Fm6GLNnFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2gydh655lyZCnI+wjfFSVuoKOwPzdGfBn7ZdmdQYpx9dOzM+V6UQnb/Wba/hWeVdv
	 vTXx3o01rrnH44UQagmltNR/5/c3QvbDKXRVIGSuF88PXCm8VPfhn2h9dsFxOlmXNj
	 Hqtf8x0xAtjSDX+mNjlSoT/Qx7Z+ciSC4vTy2Y/M=
Date: Tue, 26 Sep 2023 11:13:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dan Carpenter <error27@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH RFC] staging: vchiq_arm: move state dump to debugfs
Message-ID: <2023092638-tacky-although-65ef@gregkh>
References: <20230923235325.14329-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230923235325.14329-1-wahrenst@gmx.net>

On Sun, Sep 24, 2023 at 01:53:25AM +0200, Stefan Wahren wrote:
> Besides the IOCTL interface the VCHIQ character device also provides
> a state dump of the whole VCHIQ driver via read. Moving the state dump
> function to debugfs has a lot advantages:
> 
> - following changes on state dump doesn't break userspace ABI
> - debug doesn't depend on VCHIQ_CDEV
> - dump code simplifies a lot and reduce the chance of buffer overflows
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
> 
> Hello,
> 
> since recent discussion raised the question about the future of debugfs
> for vchiq [1], i want to submit this cleanup patch as part of the
> discussion. The patch itself based on the latest series [2] of
> Umang Jain to convert VCHIQ into a bus. I'm aware of the checkpatch
> warnings which will be fixed in the next version, but not revelant
> to the discussion.

Looks good to me, thanks for moving this to debugfs.

greg k-h
