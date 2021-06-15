Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73AB72
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 11:50:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEAED6145D;
	Tue, 15 Jun 2021 11:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623757818;
	bh=80BKNxMl4vfWn+OgvuwBg4oJz0whC/obf0+2MF/CC/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjlbJqiCP0gphqnn4Yl4Pybx7ifuZvVN4BXXX2ZNmutWWh8vZsgQv7SDS+W7oHJPv
	 fg5YUHiEz7zGOXrhgSPYzzqMUQBjboE/PlSGo3se/i0+j5pYDJ2fhWz++hVw/HuHak
	 WJvjKgiM6wWmeAcF3YzNzYugMAGHqTIpKBhPWcpQ=
Date: Tue, 15 Jun 2021 13:50:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: David Kershner <david.kershner@unisys.com>, sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v8 RESEND] staging: unisys: visorhba: Convert module from
 IDR to XArray
Message-ID: <YMiT9+msL8H2+3yV@kroah.com>
References: <20210514081112.19542-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514081112.19542-1-fmdefrancesco@gmail.com>

On Fri, May 14, 2021 at 10:11:11AM +0200, Fabio M. De Francesco wrote:
> Converted visorhba from IDR to XArray. The abstract data type XArray is
> more memory-efficient, parallelizable, and cache friendly. It takes
> advantage of RCU to perform lookups without locking. Furthermore, IDR is
> deprecated because XArray has a better (cleaner and more consistent)
> API.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Given a lack of response from the unisys maintainer, I'll go apply this
now and see what breaks :)

thanks,

greg k-h
