Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704128E6
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 06:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A35EC340E9;
	Wed, 16 Mar 2022 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647412158;
	bh=WPffMnbLy+mRaNgF3nbJhYoZuUmvH1mApTBnDeQ8aOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgV1V9m1SWB0EHNeCEnd1BWo/M9Mk40nwknqztRUGBEgwz9/uKw1N5UP0qvQCVgnW
	 95IFKR86aNtYBUEpW5Hw+5RwBgBce5dW6R/Phm4oBfMPobJe3Zs48EhlNLY/kw7O4p
	 8eEepi/OJCvW/37LreNDnvNMzfAMdumJeoYXmJ+U=
Date: Wed, 16 Mar 2022 07:29:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Charlie Sands <sandsch@northvilleschools.net>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Resolve checkpath.pl issues.
Message-ID: <YjGDtLvysfyVQHLm@kroah.com>
References: <YjEB27xzf+krm3ew@sckzor-linux.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjEB27xzf+krm3ew@sckzor-linux.localdomain>

On Tue, Mar 15, 2022 at 05:15:07PM -0400, Charlie Sands wrote:
> > Always test-build your patches. Applying this change results in a build 
> > failure :(
> My apologies, I ran a build test on a copy of the repository with my changes
> stashed in order to look at the original checkpatch warnings.
> 
> > Please fix up and resend.
> It should now fix the below issues without build warnings.

None of this should be in the changelog, please fix this up and send a
version 2 of this patch, properly listing what changed from the previous
version.  Instructions on how to do that should be in the documentation.

thanks,

greg k-h
