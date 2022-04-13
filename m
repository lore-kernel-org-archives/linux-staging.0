Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DED23D6
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 06:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA4FC385A3;
	Wed, 13 Apr 2022 06:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649832856;
	bh=CbMgaxB/pZ/pmuqyPdSa2A9bsEC8vggjZGsYLDigH0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mhOYn/cCzc2iN9KJdyyUYemUvXd+hCOrO5trCttEb7wJ0EZiVpIi7SvbABqIOahRh
	 Q3PU9rLvoBwXVU1xQgjJnZRMFBKnMO9sHzLyLfSgeFUL5t0+lK4hpQXXAJhFAyoPbV
	 xUTbDo/xiCzL0aDN9kJOTz2PsHnzH1J9cvWkAGs8=
Date: Wed, 13 Apr 2022 08:54:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] staging: r8188eu: rename parameter of block_write()
Message-ID: <YlZzlRumS5KH7aih@kroah.com>
References: <20220412185754.8695-1-straube.linux@gmail.com>
 <20220412185754.8695-3-straube.linux@gmail.com>
 <YlZzeEOn6VC4Tmre@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlZzeEOn6VC4Tmre@kroah.com>

On Wed, Apr 13, 2022 at 08:53:44AM +0200, Greg KH wrote:
> On Tue, Apr 12, 2022 at 08:57:50PM +0200, Michael Straube wrote:
> > Rename the parameter buffSize of block_write() to avoid camel case.
> > 
> > buffSize -> size
> 
> How about "buffSize -> buffer_size"?
> 
> That makes more sense, right?

Ah nevermind, it's fine as-is.

