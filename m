Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A37E1852
	for <linux-staging@lists.linux.dev>; Fri, 29 Apr 2022 15:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C5BC385A7;
	Fri, 29 Apr 2022 15:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1651247149;
	bh=kBM6kQmhpUtl/wmfrWy7OsKdo/vnZ9LEog2jNyiLtOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBDLXgd3tcBJ2rl9FhsIsoTZDt6Re19HjJkP/8SAWnv7+SmcO+5BSP4Z/5rLB4nLb
	 RBKCsX2nGXaXLtwflSnvFEzDpvt6F/Q/qTePkt6T/ug9u17VoLPUhhKAv+qK/sTj4T
	 1r1v0vifVLfkUoagSMQWbKCrTdNLl2vk9kX/lARM=
Date: Fri, 29 Apr 2022 17:45:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: vt6655: Replace VNSvInPortD with ioread32
Message-ID: <YmwIKoTONmfeNjZE@kroah.com>
References: <cover.1651036713.git.philipp.g.hortmann@gmail.com>
 <7a5f7f98379fb2af2741f613f5ddda53e5d4813e.1651036713.git.philipp.g.hortmann@gmail.com>
 <Ymjaxby2vDJYz6KA@kroah.com>
 <b3d6b773-4ca1-a72e-933b-455c5d2b91c9@gmail.com>
 <YmwDZi3mmWRHzKAT@kroah.com>
 <1d70d285-c839-8e5a-e3f8-d5184acdf769@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d70d285-c839-8e5a-e3f8-d5184acdf769@gmail.com>

On Fri, Apr 29, 2022 at 05:32:05PM +0200, Philipp Hortmann wrote:
> On 4/29/22 17:25, Greg Kroah-Hartman wrote:
> > And for a big endian system?  Do you get the same result?
> 
> Just looking if I can buy one.

Ick, no, don't do that.

> Can you propose a low cost big endian system with PCI bus?

Try testing the code out on something like https://godbolt.org/ maybe?

I think there might be a qemu big endian target as well but I can't
remember it's been a long time.  Don't go buy an obsolete box just for
this one old staging driver :)

thanks,

greg k-h
