Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA242123F
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042336; cv=none; b=Zx0kHpbEwCrSOSIW8TGEIHF+8rc3pTlPZrAp2XYVOtiULUtWSw/1YhrwCot1xTHTXTK6vmKaZLN/BOX6pfz/RFO15BTTSjH88MAlaJgZL5Mhm0I0XXuhexOBtgNRhzxoJYYHqUr2J3iv9UaAo+24iMmQgZpHhuoGV8HFVM0Y0No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042336; c=relaxed/simple;
	bh=TWc3sURKh4nI6UC6uz8V/Pe7xhJ7nTD4JzkHKRkHOpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2JpCqfjkSssUKrvotn9uYUOanED1Gx/oNzxxSBLS3+ZPIdd+JBMU9UYsYK3l5xb1Sd5hInZP50WRb0fI6bdxPry4tv1pV2aGYpcAaB5WwDd8UFtZIwqntKh/muJzIWuRxcSTnbIiEoZ9yG26GVgNY02B/eqZkdJtNt+68jnxnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=FGQZjOIQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eeowv9ki; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="FGQZjOIQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eeowv9ki"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3F78C1400179;
	Tue, 18 Aug 2026 04:38:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 18 Aug 2026 04:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1787042333; x=1787128733; bh=WLecwbCeCC
	ntmXLv5R5Gntk1q/p0Lv/rnZcsZLN4E1g=; b=FGQZjOIQalJc174UsRUVXtatwN
	X62SIy1MOc/dQfw1G2kA06v9OV+jGZWCiHV+2Qb/ZJgiby15O4mZ97VMCrticGSH
	GODJnICC+l584ocGTcBXVYdpaIe81la3s8b165EhAjVs1GLviQ3tHjSrtv0qt/mk
	5nJkq+jPVgcav/Jz6XfX38E871kC4eas3YC+c4JD4QhENXJb85I5yHus505r+hi2
	5Bm3aPNvRNeR/++ByRpTLSS6LycYOwjucHUuQCAGwI3Aq05Z/LSnixC1V5IYnhgN
	F7x+cWkQXiV4/IBaZp73PYVmR4kmTSggrHDbRHJq7Pf2C1OdlkFVoCB8sUfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787042333; x=1787128733; bh=WLecwbCeCCntmXLv5R5Gntk1q/p0Lv/rnZc
	sZLN4E1g=; b=eeowv9kif9Rd9rwPZfSFZwKDJL6VV9OBCMnBmSxObGNTIiDE/ZC
	d5Vd9lYPmawiyPEMV9StOYrmm8XR9PyfAYUc4S/Ivb4OKa/2myq6Y/r6wvRcsfqX
	gAXiHiUeuxsvi/b1G1e+sHLGRWOYuCb0RbADhLAIyXbRrr39q1h90qRKL/sIqZgr
	wTFQVOwXVNLmEaACecqOtA3sgR5inaNWgJo/JyTbs5Wm7vFdaLpDmPsKorDU0/oS
	9DwaT8L37h6fkUvoQRKQxsdE/BYVV/UmML+dmj2bT7tdeP1uUkYExRVWjCEfS8c9
	MeBwiIb0vVVxcQj0cty0owy3tlUDo8qpArw==
X-ME-Sender: <xms:HRqEanZsrf7ehI1BBENKHDUJY7ZjU8x16WbtSWakdadqnr5BRwv57A>
    <xme:HRqEaulCg1KjH6VIEVuAzvjdWs2EEL6p-3-nL09aPfFBmoJNWJB_Fg0IRxzrtsCS3
    lIrSqaKPTeGE5q3k_vOOSyMmCBetSoK0iiGwjtJYpljsx02PQ>
X-ME-Received: <xmr:HRqEaliVR1bw_fTG4ypfNqV47KabhkA24eGRLFxTWTHTmFvo0C9DTUD1WDdlBbF8W0cieAEC6W5BnoiOSfhC4SKrX49ytOzBpKNXAsw1y_M>
X-ME-Proxy-Cause: dmFkZTFqlW00ZvOfaDoVBkSt+LrBdEdSTEaY/VhOFioGS3tBhdLe8ijcJEYi8y0VNglA8m
    YzBMPATlCoyT4QtWUEhX3Oy2G9ZjDwRyqtc0dZB6Nqg9fqr7caU/ntNu6gMKQmHtdDWXIN
    OgGoQE8uK2X7GL8R66rH6ElEMk+rxFg7grht+m/RYy2YIraowMqxNTUhGgxCNYCcjzkU6r
    6mq7W3IMsPOGAMeldRf2caNlqAE5lcSbqk2v0q05itsEVmX0nYc9s1SQ/juqvRPWoxLBcZ
    ZZdBzR6Kr2hkfwFjO1VAsB89UrhKZejm+J8RWL46Gwd7fMOqrNdqmKJz2fatAZ0GRwf7sY
    ZloTpu7Vei6YdbBh1yYzj58Pj1b5EqXpQCnVAMk8Oblixw1/HAcud3Nl59POHFmJXPiBPo
    Y+F6/9B6FgEzE62aHKCfAhj8leOPC5rIK6CXjri4Djk7lGvoL6FXTCD1Yu8Yx8pwl+KISB
    H9tQz22PKlAHFkYlXUezVAEGVwHXhWpZkD1UeWMzV/uuqvIJbaCAprzdE3sA5Vw3F+RKAv
    1RecvOhA8zRBtmUGJxCrrj1nhwjc9LEgL5JjgpQo2Xf6wT56BTB1K6ejazvzxxixs/XWDs
    bDVUrItyFGe3Fx+Vce0gW+/3z8njZhYo68+YKuqj/ht2pl0D4Dd4h80ip9cg
X-ME-Proxy: <xmx:HRqEaoQsQGx24Hoa62e_S_8XD_yIJ7zEQONcAwJFxGQ-mYXgwNIv-g>
    <xmx:HRqEaubPTzi0Z_BC7lThmRep9i4lvC7K8hYzThGIThGgwVuPCT6jfQ>
    <xmx:HRqEatT7sMES93co02NDbf3uX2acAYnx5vKEhfC1pgyDec0PgeSjiA>
    <xmx:HRqEal_M1kkJXDstIN753brd3ySEkpyFYb5cL3bjgKaqoblLPngLDA>
    <xmx:HRqEahn2ytDqCPQHiUjQgiTSYFy2pIXgrHC7BHHfBEQoRQH9raAZy7oS>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Aug 2026 04:38:52 -0400 (EDT)
Date: Tue, 18 Aug 2026 10:37:16 +0200
From: Greg KH <greg@kroah.com>
To: qvkap <qvkapp@gmail.com>
Cc: Parthiban Veerasooran <parthiban.veerasoorian@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: fix typos in driver_usage.txt
Message-ID: <2026081831-sappy-alongside-6d68@gregkh>
References: <6a841634.1f5f34ed.15764c.8636@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a841634.1f5f34ed.15764c.8636@mx.google.com>

On Tue, Aug 18, 2026 at 01:22:12AM -0700, qvkap wrote:
> >From 1efeca4e18fb084e21e8b1719953b076305ade3b Mon Sep 17 00:00:00 2001
> From: qvkap <qvkapp@gmail.com>
> Date: Tue, 18 Aug 2026 10:59:21 +0300
> Subject: [PATCH] staging: most: fix typos in driver_usage.txt
> 
> Signed-off-by: qvkap <qvkapp@gmail.com>
> ---
>  drivers/staging/most/Documentation/driver_usage.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
