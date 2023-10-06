Received: from mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CAC1F959
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 13:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mailo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com header.b="mif+BjF/"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1696597926; bh=bpFnRu/wSLaJ36e2cl256f9SsrE5uKGcDH1qTSECnRU=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=mif+BjF/RrX5QmfsFXDVzq1+LjM6YDhcbbFGCbpo7r/S/YgH+cCF4bAf24tPOiVsB
	 CbC8kp7ztBLFm6NePvANL8dXzHtqIGtVclbNxornv9JAO9dEG3elKRBZ3oMrWBwrl7
	 85RScX+L/ucfbQdwv4niVTIFhdDtcLcHBG2gkmZ0=
Received: by b221-2.in.mailobj.net [192.168.90.22] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Fri,  6 Oct 2023 15:12:06 +0200 (CEST)
X-EA-Auth: vQHFtkQs5JwsO7pjZoUof/uBK5tNUlViDT4elZhpx7PPqUypgNv2GuvWR2ovBDzoWwk5+rN1GRS7JKpvG0VRxg==
Date: Fri, 6 Oct 2023 18:42:00 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>
Subject: Re: [PATCH 1/3] staging: greybus: raw: make raw_class constant
Message-ID: <ZSAHoIN8p2ROXvh/@runicha.com>
References: <2023100533-broadband-hunk-9e91@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023100533-broadband-hunk-9e91@gregkh>

On Thu, Oct 05, 2023 at 03:58:34PM +0200, Greg Kroah-Hartman wrote:
> Now that the driver core allows for struct class to be in read-only

Hello Greg,
When you say "Now", has anything changed recently that facilitates this
improvement? Where can I read more about this change?

Thank you,
deepak.

> memory, making all 'class' structures to be declared at build time
> placing them into read-only memory, instead of having to be dynamically
> allocated at load time.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---


