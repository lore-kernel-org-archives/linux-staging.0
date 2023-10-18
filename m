Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787378486;
	Wed, 18 Oct 2023 07:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D77LelGs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADDCC433C7;
	Wed, 18 Oct 2023 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697615126;
	bh=jN8Gu0zwwTk2T/Rm8uUvwNo07IXv7bqneP/+YCv2VHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D77LelGsNGyGVb9jo8+wvAZ2dDN75xuAR6+LAhtrECuKhbwTICV1u0ZPKXMlFyZ2P
	 Zrbk4WK7WUV33L7GsRMnzGpFw9yJfCdtkdne6E6aENB7cKVmGY7hhz8/hyHeJ/Uf/k
	 X5vUYRMt/XcmitzIMTFrT1dJVGFZVZqGtk72jkfs=
Date: Wed, 18 Oct 2023 09:45:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	kenechukwu maduechesi <maduechesik@gmail.com>,
	outreachy@lists.linux.dev, shreeya.patel23498@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Replace delay function.
Message-ID: <2023101853-axis-stylist-f1b9@gregkh>
References: <20231018004300.GA3189@ubuntu>
 <7bc719c4-459f-3d8-7ed-b1e1adf158@inria.fr>
 <1118ec6d-e1e7-79f3-08e4-9a79c996eed1@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1118ec6d-e1e7-79f3-08e4-9a79c996eed1@intel.com>

On Wed, Oct 18, 2023 at 09:32:46AM +0200, Karolina Stolarek wrote:
> On 18.10.2023 09:03, Julia Lawall wrote:
> > 
> > 
> > On Tue, 17 Oct 2023, kenechukwu maduechesi wrote:
> > 
> > > Replace udelay() with usleep_range() for more precise delay handling.
> > > 
> > > Reported by checkpatch:
> > > 
> > > CHECK: usleep_range is preferred over udelay
> > 
> > This message is typically not a good candidate for outreachy patches,
> > because you need access to the device to be sure that any change is
> > correct.
> 
> Could we add a paragraph on how to pick good checkpatch.pl error to fix to
> the Outreachyfirstpatch docs? This could go to "Find a driver to clean up"
> section, for example.

The ability to find a "good" error changes over time, so this might be
hard to do.

good luck!

greg k-h
