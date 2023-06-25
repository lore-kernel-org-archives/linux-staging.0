Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E536117
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 13:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C91C433C8;
	Sun, 25 Jun 2023 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687701343;
	bh=TU57kKZ70jIL08bQ4GXtej05ic6Fbtxc5OE3lmyT3lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b23i67TyzFrV3pSljYSOA8X/1g1w1EOSad1+nIUKl2TRq2P1Fmsrs503lcRAE8cMu
	 rI/Z5T4CAOaNQjj20iWSWmObMevfGlfWZEgeXE0sDLcvpjZH7nuZnPjyQ2xposZGQr
	 rgVThAZilJ33D11Ab0T97EDf3fKSefCkWC8+fNBY=
Date: Sun, 25 Jun 2023 15:55:40 +0200
From: "<gregkh@linuxfoundation.org>" <gregkh@linuxfoundation.org>
To: Franziska =?iso-8859-1?Q?N=E4pelt?= <franziska.naepelt@googlemail.com>
Cc: eperi1024@gmail.com,
	Franziska =?iso-8859-1?Q?N=E4pelt?= <franziska.naepelt@gmail.com>,
	hdegoede@redhat.com, johannes.berg@intel.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com, quic_vjakkam@quicinc.com,
	tegongkang@gmail.com
Subject: Re: [PATCH v2 0/5] Fix some checkpatch issues
Message-ID: <2023062527-bride-unsolved-3b56@gregkh>
References: <F9C4E29E-C355-4B08-A2EC-2197A6EB7AFD@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F9C4E29E-C355-4B08-A2EC-2197A6EB7AFD@googlemail.com>

On Sun, Jun 25, 2023 at 03:33:59PM +0200, Franziska Näpelt wrote:
> Thanks for your feedback :)
> Since not all the patches of my first patch series have been applied, I thought I have to submit the whole series again. Submitting a series of 5 patches, where 3 have been already applied of course fails.
> So does it mean, if 3 of 5 patches of a series have been applied and I want to submit a new version, I only submit patches for the remaining work and not all of them again?

Yes, just submit the remaining ones.

thanks,

greg k-h
