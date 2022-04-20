Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB31867;
	Wed, 20 Apr 2022 16:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4F0C385A0;
	Wed, 20 Apr 2022 16:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650472995;
	bh=axIE71BWxhpfURlunGEn4kdJ+jDyraQG3XV8NJcaf+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AHT2wWiNoAyjmvH+wpqTwTL6gDisq3g7iQIHkw7298EA/XKHzXzbDTNKMayTrU5b4
	 JVm2gyFxUwRDQ4TMyvA4JVrRfaemRdhrKNqozXsrZOhb3RPCAVUPb8cgO71ifc/fQw
	 yA22qWOuF1vt8quqJzuSxCwWP3bt3X5olti/kabI=
Date: Wed, 20 Apr 2022 18:43:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bruno Moreira-Guedes <codeagain@codeagain.dev>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v2 2/3] staging: vme: Add VME_BUS dependency to Kconfig
Message-ID: <YmA4ILK5Gv/Gdaso@kroah.com>
References: <cover.1650321310.git.codeagain@codeagain.dev>
 <00de5644d7c2f8c8878eccf86b761e0602732080.1650321310.git.codeagain@codeagain.dev>
 <20220418233929.zz32dil4u6hbwtqv@AN5Bruno>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418233929.zz32dil4u6hbwtqv@AN5Bruno>

On Mon, Apr 18, 2022 at 08:39:29PM -0300, Bruno Moreira-Guedes wrote:
> Please, disregard the following message as there's a typo in the prefix.
> 
> On Mon, Apr 18, 2022 at 08:31:09PM -0300, Bruno Moreira-Guedes wrote:
> > The KConfig file for VME_USER ('drivers/staging/vme/devices/Kconfig')
> > sourced at "drivers/vme/boards/KConfig" misses a `depends on` line for
> > VME_BUS, which is unnoticeable for menuconfig users who aren't be able
> > to select it through this interface without setting the CONFIG_VME_BUS
> > option because it's nested on VME_BUS menu entry.
> ...
> >  	  VME windows in a manner at least semi-compatible with the interface
> > -- 
> > 2.35.3
> > 
> 
> It's already sent a new copy with the proper version number. Nothing's
> changed except for the message ID and the v2 typo.

I can't handle 2 v2 of this same commit, our tools get very confused (as
do people.)  Would you be able to unwind this if you were in my
position?

Please resubmit a v3 of this series with everything fixed up.

thanks,

greg k-h
