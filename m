Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDF070
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 14:12:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E9E4613A7;
	Tue,  6 Apr 2021 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617718343;
	bh=oodJRS58Zr1qQH9SbmkMEge3e6GJAXCXrN3+8c6DR+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iX8vd2yVg6MTs3na1+dWeT7zDgItRlbYpahwppEZNl9l7vVcdB3be9YoNkfocNXKH
	 09TuLpxKe+w6dnDwOEKa/dXYXA1WFvhvG9fsrN0QnXx+7pvrkjqibp54EmNXiQ/iTN
	 rIv4i8K7z96gXSL7u1J9rylVBWS2O3QgtSlrZw1Y=
Date: Tue, 6 Apr 2021 16:12:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: Re: [PATCH v2 1/2] staging: rtl8712: Rewrite NULL comparisons
Message-ID: <YGxsRarVAblIa1l+@kroah.com>
References: <cover.1617710602.git.zhansayabagdaulet@gmail.com>
 <74471865b399584d73a18696d2008006301dfd71.1617710602.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74471865b399584d73a18696d2008006301dfd71.1617710602.git.zhansayabagdaulet@gmail.com>

On Tue, Apr 06, 2021 at 06:09:56PM +0600, Zhansaya Bagdauletkyzy wrote:
> Replace NULL comparisons with boolean negation to be more consistent with
> the rest of the Linux kernel code base.
> Reported by checkpatch.
> 
> Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
> ---
>  drivers/staging/rtl8712/rtl871x_recv.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

This does not apply to my tree :(
