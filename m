Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7218BE5
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 13:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAADBC433C8;
	Mon, 19 Jun 2023 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687182812;
	bh=kCKiD5fhFEy0gvMVk7RDP9g5QMN6OPehQVjGRcV+P8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FAMVwzQmxhRioT42KFYyC7x9NbIPwZmIL+XoxvE/UrpB49eF9jv4TeItklHVLOPub
	 RJ43cO6RPlhUsuVDb0XmOLn/BJ/7T7183OcrtHdGlZkzbM1pA44l5hAmV7zDCiZ6fH
	 Vz5SWKZGu/oEJbir2k6gQNyI/argnwH2+f7x5DGU=
Date: Mon, 19 Jun 2023 15:53:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: Re: [PATCH v3 0/4] Trivial code cleanup patches
Message-ID: <2023061922-numeric-runner-f36d@gregkh>
References: <cover.1687092111.git.yogi.kernel@gmail.com>
 <e80d385d-5515-ed42-e5dd-f9c977f7d4d1@gmail.com>
 <2023061938-unbounded-unbent-e706@gregkh>
 <ZJBc4bok1krfjqWf@zephyrusG14>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJBc4bok1krfjqWf@zephyrusG14>

On Mon, Jun 19, 2023 at 07:19:21PM +0530, Yogesh Hegde wrote:
> Hi Greg, 
> On Mon, Jun 19, 2023 at 02:57:56PM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Jun 18, 2023 at 10:26:37PM +0200, Philipp Hortmann wrote:
> > > This patch series alone is fine. But when my patch series ([PATCH 0/9]
> > > staging: rtl8192e: Remove unsupported modes a and 5G) is applied before it
> > > fails as we change same lines. Will see what happens.
> > 
> > Yes, none of these apply :(
> > 
> > Yogesh, can you rebase this on my staging-next branch and resend?
> Sure, will rebase and resend. Did you mean staging-testing branch instead of 
> staging-next branch ? 

Yes, sorry.

