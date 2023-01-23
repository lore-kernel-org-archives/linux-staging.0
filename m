Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D342BA4F
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 09:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2470DC433D2;
	Mon, 23 Jan 2023 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674466506;
	bh=FXhXJlr+cLkMcSTugaksPHqtIC6spO4n9eSK6eK8mFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eq1xZ8mm4P8695nXM5Zew9rk/rLqzecsJA6toBtq2M8HYbFnVZ6zStftKRkK88QTu
	 DAeAPumSRwibn09DyaCUehGlwhXxK1ybabz5UGDEBeJMy4RQ3qsCsIXS4s+LfsMmy1
	 ZjwKASp2Jd7vLvAILfoQtH7m2owvX0m5FkYh/5Xk=
Date: Mon, 23 Jan 2023 10:35:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Diederik de Haas <didi.debian@cknow.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Fix full name of the GPL
Message-ID: <Y85Ux0uGYl0c//mz@kroah.com>
References: <20230122191047.58769-1-didi.debian@cknow.org>
 <Y84wk+sw/gR7gNW4@kroah.com>
 <Y85Kkax5+U4AUedT@debian.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y85Kkax5+U4AUedT@debian.me>

On Mon, Jan 23, 2023 at 03:51:29PM +0700, Bagas Sanjaya wrote:
> On Mon, Jan 23, 2023 at 08:00:35AM +0100, Greg Kroah-Hartman wrote:
> > - You did not specify a description of why the patch is needed, or
> >   possibly, any description at all, in the email body.  Please read the
> >   section entitled "The canonical patch format" in the kernel file,
> >   Documentation/process/submitting-patches.rst for what is needed in
> >   order to properly describe the change.
> > 
> 
> Hi Greg,
> 
> drivers/staging/wlan-ng/hfa384x.h (for example) has already SPDX identifier
> that matches the verbose copyright notice below it. 

I have no context here at all, sorry.
