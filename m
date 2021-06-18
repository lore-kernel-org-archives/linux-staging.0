Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A9D71
	for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 11:04:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DD196128C;
	Fri, 18 Jun 2021 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1624014283;
	bh=XDjioh1/EllDaNzB8OJYHn6BohHUeO4QCzLNotVCEug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZe7BvoOKisf179jzIwekgMGFUZ3Ub6pRims4VV83ccFutc371cvvD83sSMcsCpFu
	 F9c4rTXj07XnBQyDdkXbPB/WSJe3059CCTYUuFgzG2kh985skJOOBsJZ76NKq7MN+K
	 fkfbWO40dq2eoRI81eLiu+//hUhr8ftu9mB2PwN8=
Date: Fri, 18 Jun 2021 13:04:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5YiY5rW36b6ZKER1Y2tCdUJlZSk=?= <liuhailong@oppo.com>
Cc: "arve@android.com" <arve@android.com>,
	"tkjos@android.com" <tkjos@android.com>,
	"maco@android.com" <maco@android.com>,
	"joel@joelfernandes.org" <joel@joelfernandes.org>,
	"christian@brauner.io" <christian@brauner.io>,
	"hridya@google.com" <hridya@google.com>,
	"surenb@google.com" <surenb@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= staging:
 android: ashmem: add size field in procfs fdinfo
Message-ID: <YMx9vICXV7liMMoL@kroah.com>
References: <20210618095035.32410-1-liuhailong@oppo.com>
 <YMx0GIRQmpRC7pdQ@kroah.com>
 <HK0PR02MB31546ACD1FE5BA96CB49B54BAF0D9@HK0PR02MB3154.apcprd02.prod.outlook.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK0PR02MB31546ACD1FE5BA96CB49B54BAF0D9@HK0PR02MB3154.apcprd02.prod.outlook.com>

On Fri, Jun 18, 2021 at 10:40:28AM +0000, 刘海龙(DuckBuBee) wrote:
> Hi 
> No user tools use this proc file as I know, I added this line can help user locate shmem leak issue.

Ok, thanks, I'll go queue it up.

greg k-h
