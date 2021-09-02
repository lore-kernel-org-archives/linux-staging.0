Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EC972
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 09:09:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D66560F3A;
	Thu,  2 Sep 2021 09:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630573791;
	bh=jFSjaHNRrvSfw9oo1CIK9IlMRICSB0i/tyFZeos8Ovs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xkvi2Ng8adDzk4xrozFJyq4d/Xrc7cU29DboiqFwf0G5XVZZrQA+er0ee5/CaPFgv
	 ni42Cwxh4MktHJG9kEREIf+oQcAgPQrdPDKyu6+fxt5MotQ647LHrj1g4W8js7K36+
	 PsmheSIGaCgVmaXnknafD2S2VBQHsfAHZg2/tjiY=
Date: Thu, 2 Sep 2021 11:09:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krish Jain <krishjain02939@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] Fix formatting for file "hsdma-mt7621.c"
Message-ID: <YTCU3SpFgyFbxXs3@kroah.com>
References: <20210902111339.GA577108@panther>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902111339.GA577108@panther>

On Thu, Sep 02, 2021 at 01:13:39PM +0200, Krish Jain wrote:
> This patch fixes the format of the code. It properly formats lines that should not end with a '(' as suggested by checkpath.pl.

Please properly line-wrap your changelog text like your editor asked you
to.

Also, your subject line needs work, look at other commits for this
driver with:
	git log --oneline drivers/staging/mt7621-dma/
and notice how they say the driver name and the subsystem.

Please fix up and resend a v2.

thanks,

greg k-h
