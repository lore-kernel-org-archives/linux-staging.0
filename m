Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5107C4A11
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 17:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4A4C433D7;
	Wed, 28 Sep 2022 17:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664385867;
	bh=iFk5at/Ghv9eaLMsjDQ5VJjQoIpldLo9YQDXrHPp7BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IA198PsTGjw6EEhl+ovr28SQcKMiYjpZ6EQiLuSnJlUWun2N7KauRjxH5BqvLZowJ
	 2BXXF9EmWFAXV/mM4BCvr+ynRXkJ2cbcGrZSfueXvd1vey6I55myk1Azz6cHJkc/2L
	 rRUHL20N+f5QybTfC4kbvaRtIznvZql95tUrinnk=
Date: Wed, 28 Sep 2022 19:24:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joash Naidoo <joash.n09@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	dan.carpenter@oracle.com, straube.linux@gmail.com,
	paskripkin@gmail.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: r8188eu: fix too many leading tabs
Message-ID: <YzSDSNDd/IIdMeiq@kroah.com>
References: <20220928075324.1605-1-joash.n09@gmail.com>
 <YzQALwjz5VT0uCyB@kroah.com>
 <87r0zva18v.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0zva18v.fsf@gmail.com>

On Wed, Sep 28, 2022 at 06:20:28PM +0200, Joash Naidoo wrote:
> > But also, shouldn't you just be using the ip_hdr() call instead of doing
> > the crazy cast above?
> 
> I would need to investigate and test first before commenting. If a change
> had to be made, I believe it will go in a separate patch?

Yes, that would be good to do as a patch series.

thanks,

greg k-h
