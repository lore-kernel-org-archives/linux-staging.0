Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1197E20E2
	for <linux-staging@lists.linux.dev>; Mon, 28 Nov 2022 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1669624019; bh=/NvhJG+rqUvTCbK0vNxiyNK+85hTvfLth9ocA0GhXQo=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=Jh9UXgXtey/aO6iW2SnkwMt2AqIvHvWSW/exFVhMPIHzH5mryO+xbG6DlgUrIyGP6
	 2JWaJQG8NkWQ1+Evoxn03frfIUEcIYurPgnYYezSaGHlCRC3WzdDNG+A8a2mXMyDpL
	 KPlYZkKsFHA26ReC4KxwAUcg998ikFZucy2lvAJ8=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon, 28 Nov 2022 09:26:59 +0100 (CET)
X-EA-Auth: uZKC0MjozQHYPB5F8zENZ73MSjUBB7FQ7PGAv5EJpMeRH8PX1WJwoP8kQkJKelMJEGp+EGK1S+bGxuUZf57Tvox8z43eMp15
Date: Mon, 28 Nov 2022 13:56:53 +0530
From: Deepak R Varma <drv@mailo.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gustavoars@kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Y4RwzX2Wzguw703W@qemulion>
References: <Y3YKhee8L+kAfHM4@qemulion>
 <Y3YvGdkyGm7azGg4@kroah.com>
 <Y3Y1N6AwWEXLpSrx@qemulion>
 <Y3Z3aatcaISvqURJ@kroah.com>
 <Y3jqUpNOygJ4+2jy@qemulion>
 <Y4RnJyiCDYavLAJq@qemulion>
 <Y4RoOxgo76Hc5RRP@kadam>
 <Y4RvpvpmFL8zNvfB@qemulion>
 <Y4RwXSs9ha0zepxZ@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4RwXSs9ha0zepxZ@kadam>

On Mon, Nov 28, 2022 at 11:25:01AM +0300, Dan Carpenter wrote:
> On Mon, Nov 28, 2022 at 01:51:58PM +0530, Deepak R Varma wrote:
> > On Mon, Nov 28, 2022 at 10:50:19AM +0300, Dan Carpenter wrote:
> > > Like this:
> >
> > Thank you Dan. This takes me back to the very first version of this patch. I
> > will send in the clean up.
>
> Don't just send what I sent you, look around and try to see if there are
> other issues with the code.

Yes, I will follow your advise.

Thanks,
./drv

>
> regards,
> dan carpenter
>
>


