Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBCA173
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:01:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87BCA60C3F;
	Mon, 16 Aug 2021 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629126065;
	bh=BbMCr1w/Hongz20Hd6ukvY3O6D1eg3r8Timq5lfmDzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcKxIx5DxjH0LIjpcd5U4Bp8a9YXLLAcNK/oGoaNC3t/+6xHrYVppP7buyX8qfCXT
	 7m9LbZUHH8EIvtk/vAWgNsk6ZEMB71fIzNrOVmcMTmZ2YbK8Z3QXFopR8wCNe+Ypjg
	 XrZTM+5V5To9v9SNoalp82RpcvNwHyfXeApzYCG4=
Date: Mon, 16 Aug 2021 17:01:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alex Elder <elder@ieee.org>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: greybus: Convert uart.c from IDR to XArray
Message-ID: <YRp9rnCardsCukju@kroah.com>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>

On Mon, Aug 16, 2021 at 09:46:08AM -0500, Alex Elder wrote:
> On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
> > Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> > is more memory-efficient, parallelisable, and cache friendly. It takes
> > advantage of RCU to perform lookups without locking. Furthermore, IDR is
> > deprecated because XArray has a better (cleaner and more consistent) API.
> 
> I haven't verified the use of the new API (yet) but I have a few
> comments on your patch, below.
> 
> 					-Alex
> 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> I'm not sure I'm right about this...  But the actual change you're
> making has nothing to do with what the Intel test robot reported.
> I personally find the "Reported-by" here a little misleading, but
> maybe the "Link" line that gets added will provide explanation.
> 
> Anyway, unless someone else contradicts/corrects me, I'd rather
> not have the "Reported-by" here (despite wanting to provide much
> credit to <lkp@intel.com>...).

You are correct, "Reported-by:" does not make sense here.

thanks,

greg k-h
