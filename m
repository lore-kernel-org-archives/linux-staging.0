Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2D072
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 16:44:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13849610A2;
	Mon, 14 Jun 2021 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623689047;
	bh=Ye0zQtj+te6CtBz9QXGkfBj+iOKH2E+XR9ONDLGB3Mw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OSSPh76pyLk2fyCNWEIp0jxZ4H8cPuhV7TRSOiBIiNcI7R60m1e/nJU/GgUz1Yh+A
	 R6OP5dx9qBpTuoSvPFQ/HumgiOOg0y9bGavIh5tj73DZIDIswXIAs/TrZhGV9vQvPR
	 kyEjMwYhxSoxczCsZpNTOmfv/w9UHk1I/yHRSFJUwW3Pey+Wo+x264j55DxE6YoP9D
	 n8pvsSbsq0LZQhZHs6sXkpOKpLvDwM6OF0z2hfexsJG0vFZLAY9u8FBO9X+rP9Sn1T
	 deemQf9ANGlF9ltp63pq5F7Wc0H366kw9zVI1nIR1fyZStvKyJwmQ3c94pFPPEmSrY
	 xDWtBsiBZSdBA==
Date: Mon, 14 Jun 2021 18:44:03 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Remove unnecessary tests and cast before
 kfree/kvfree
Message-ID: <20210614184403.5e3097ba@coco.lan>
In-Reply-To: <3355688.ByQz1z8koQ@linux.local>
References: <20210605020855.1065-1-fmdefrancesco@gmail.com>
	<3355688.ByQz1z8koQ@linux.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 14 Jun 2021 18:33:55 +0200
"Fabio M. De Francesco" <fmdefrancesco@gmail.com> escreveu:

> Hi All,
> 
> I've seen that some patches of mine, more recent the following ones, have 
> already been applied. In the past I had noticed that the patches are 
> (usually?) placed in a time of submission ordered FIFO, unless they are 
> rejected.
> 
> I'm wondering if I should re-send them or if I am missing some details about 
> the specific workflow of staging/media.

Any patches sent to linux-media@vger.kernel.org are automatically stored
at patchwork:

	https://patchwork.linuxtv.org/project/linux-media/list/

If the patches you sent are there and are marked with "New" state,
there's no need to re-submit. On a quick check, there are 3 media
patches from you there:

	https://patchwork.linuxtv.org/project/linux-media/list/?series=&submitter=8492&state=&q=&archive=&delegate=
	
No need to resubmit those, except if some reviewer asks you to
change your patch(es).

Thanks,
Mauro
