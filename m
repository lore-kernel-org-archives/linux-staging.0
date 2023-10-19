Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFF7225D3;
	Thu, 19 Oct 2023 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F+EgP4kl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947D6C433C7;
	Thu, 19 Oct 2023 15:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697729357;
	bh=mnkMhnk2axsXdxIeL67WcvwlgUar4Ez3CJz5UsKmSWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+EgP4klkp9IlAjGTjUhs25NdFju9Q6yF19kwoTv87UnqVdTH1UvqbEO6lPpuCLsL
	 LHS+EXhddMZG8l1SVfXUgLzEx3IF4Txpb7fSem2KeHCaX4Ry5ETKEqL7LPP5BMPHnX
	 HR6VaKyjl7hQlWPq3/um2w5VUG/a3ikdlDd34QSo=
Date: Thu, 19 Oct 2023 17:29:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Calvince Otieno <calvncce@gmail.com>, gustavo@embeddedor.com,
	outreachy@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: remove empty functions
Message-ID: <2023101908-bouncy-dandelion-da1e@gregkh>
References: <ZTD677iqMkRPxT27@lab-ubuntu>
 <qqvbqinun7wbhaz47i6sk2awplknwbrfutrwfpvj6wq4wgdie6@smhzxank6val>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qqvbqinun7wbhaz47i6sk2awplknwbrfutrwfpvj6wq4wgdie6@smhzxank6val>

On Thu, Oct 19, 2023 at 09:50:07AM -0300, Ricardo B. Marliere wrote:
> Hey there,
> 
> just as a heads up, the vc04_services staging drivers seem to be
> actively developed elsewhere [1]. I'm not sure how they plan to upstream
> their code later.

They are being actively developed here, one the staging list, whatever
out-of-tree stuff will come after all of the required fixes and cleanups
will get merged here and then the out-of-tree stuff can be added later.

So no need to worry about random github trees please.

thanks,

greg k-h
