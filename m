Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ACA31581;
	Thu, 19 Oct 2023 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T2y01ksz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D633EC433C7;
	Thu, 19 Oct 2023 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697729518;
	bh=b1u5ZZNo1Vy3uUena6xiBCZRIVHTFi+/MiagIVA8ebs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T2y01kszfN+Ghq7P6SJtsHreDmU25roecuHM2LiTIhwVzEg/6ftFiNpyd0oboJCvq
	 r7NHszGvqfI/c/QArEidv5lOqfYHDWZnIOwL6H+1gDIFLCJ/GUpD9Jd2wYaocT3w8f
	 zO85i7XPkvys7ebC14PTdjSnlKutshxqUAAlKF+Y=
Date: Thu, 19 Oct 2023 17:31:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/2] staging: vme_user: Replace printk() with
 pr_*(),dev_*()
Message-ID: <2023101939-portable-spoof-5fa0@gregkh>
References: <cover.1697696951.git.soumya.negi97@gmail.com>
 <cad6da28b5f772957ced5b561b21b5d8c8204bc9.1697696951.git.soumya.negi97@gmail.com>
 <cbe2092b-e36b-899a-cccd-1e166534b5e0@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbe2092b-e36b-899a-cccd-1e166534b5e0@intel.com>

On Thu, Oct 19, 2023 at 12:45:30PM +0200, Karolina Stolarek wrote:
> On 19.10.2023 09:20, Soumya Negi wrote:
> > vme.c uses printk() to log messages. To improve and standardize message
> > formatting, use logging mechanisms pr_err()/pr_warn() and
> > dev_err()/dev_warn() instead. Retain the printk log levels of the
> > messages during replacement.
> > 
> > Issue found by checkpatch.pl
> > 
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > ---
> > Changes in v2:
> > * Change the pr_*() calls used to replace printk's in v1 to dev_*()
> >    wherever possible, as it adds more context to the message.
> >    (as per feedback from julia.lawall@inria.fr &
> >    gregkh@linuxfoundation.org)
> 
> You don't have to include the change log here, as it's already in the cover
> letter. This space is usually used when a patch is not sent as a part of the
> series.

Either or both is fine, this is not a real issue at all, thanks

greg k-h
