Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48B4D531
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667838451; bh=Mg3Id1/fkypwOfC8wSYIW3Daq138C5v1hZ6ElXptx3w=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=Ad6bDeeRL6UDBnT2widUFcAT8BUumtDjzMOfhEfKqCGnyRWfm4VStTPzWW3SMObHg
	 Ur2sqDex2qZLMoGADvy0GyJxqhiWzio1YrPuHqTzHgTcjTqv5384orlZLPhvSgiZPa
	 HFMoRX3xrdx0HEyA71+gsplF6ix/57i2ayDi4R6U=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon,  7 Nov 2022 17:27:26 +0100 (CET)
X-EA-Auth: iW97wWXq7wu86/I281m0xgHIxJjEWPKb6RpDVe9GmtL39NqzPnDHdijSL/LFBCfxpHq/8ZVf676fiuiEBW1lz9iA0X4yNR8N
Date: Mon, 7 Nov 2022 21:57:21 +0530
From: Deepak R Varma <drv@mailo.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Joe Perches <joe@perches.com>, Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: meter: use min() for comparison and
 assignment
Message-ID: <Y2kx6d9T9/1pzKk/@qemulion>
References: <Y2iFGA3A1w+XMlYU@qemulion>
 <Y2kDTxE38epBN368@kadam>
 <41a43f3865f3c86c6c2d1fbf3d82c42b685c7041.camel@perches.com>
 <Y2kme/FDg/4K2VW5@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2kme/FDg/4K2VW5@kadam>

On Mon, Nov 07, 2022 at 06:38:35PM +0300, Dan Carpenter wrote:
> On Mon, Nov 07, 2022 at 07:22:24AM -0800, Joe Perches wrote:
> > > In terms of run time, this patch is fine but in terms of reading the
> > > code using min() makes it less readable.
> >
> > It's not a runtime question, either should compile to the same object
> > code.  It's definitely a readabiity and standardization issue.
> >
> > In this case, IMO it'd be better to use the much more common
> >
> > 	if (ret < 0)
> > 		return ret;
> >
> > 	return 0;
>
> I also prefer this format.
>
> But at the same time, I can't advise Deepak to go around changing
> existing code where the author like ternaries.

Thank you Joe, Dan. Just to conclude, I will leave the line untouched as it is
no big advantage and the current format is more readable.

./drv

>
> regards,
> dan carpenter
>


