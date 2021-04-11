Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DB270
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 06:37:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF9BF61074;
	Sun, 11 Apr 2021 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618123056;
	bh=tOHvDuMAXXJQXqYCynFIajbrhi0Vc0ah+1ALFrZkLwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNz6/wzjz8nqhPTQ287a+aT47Hdj3k6Q5LTb/gu0/fp3IHA5wrqM2gKgVH1JAIunm
	 pNWeWsQ/dETx8Q8pJ7uAToSBiwd538FRHew8aoW6+cHxfHMjclvsASituD2YLOa3Ts
	 rcEN4L1FOihF8DMxZlgT+2/astx263k3KRzC6p1o=
Date: Sun, 11 Apr 2021 08:37:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH v4] staging: rtl8192e: fixed pointer
 error by adding '*'
Message-ID: <YHKZLVJRqgO8ni5e@kroah.com>
References: <YHG8qARLUX2KPWwI@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHG8qARLUX2KPWwI@kali>

On Sat, Apr 10, 2021 at 08:26:40PM +0530, Mitali Borkar wrote:
> Fixed pointer error by adding '*' to the function.

That really does not describe this at all.  I'll go fix this up...

greg k-h
