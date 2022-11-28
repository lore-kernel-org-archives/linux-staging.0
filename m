Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA70620E2
	for <linux-staging@lists.linux.dev>; Mon, 28 Nov 2022 08:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1669623813; bh=Up2CIk+sVry4Iqd7WUDeEJ6nDcGy7Lz3qIlKH0hlXwI=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=mg4eeOMGMRGLj3CabrcToaMssyTGdJXKrN8B1x0j3dOk7RV/dlVK4dhQidOR6uKG8
	 weTR0DxUlQ6Jbj6ZUIkNghvb5q1Q5+B6dNC2ahuesGYQT5OgNszGqmC94ufXX4RkJ4
	 Ji7/N/e4B+7QGe+YSnpH2PwCka//W+sb66t4weLE=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon, 28 Nov 2022 09:23:33 +0100 (CET)
X-EA-Auth: 3FuYknn2C0S5EzZ3ymcyRQ2tJE93l7iZmX0JVwD1HNJl5YC/XK/xJijrTnTKQOn+seUuz8vxLvh3kLUp2dj1qF17vGCh8o5F
Date: Mon, 28 Nov 2022 13:53:28 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gustavoars@kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Y4RwAJb/aoC0WIhZ@qemulion>
References: <Y3YKhee8L+kAfHM4@qemulion>
 <Y3YvGdkyGm7azGg4@kroah.com>
 <Y3Y1N6AwWEXLpSrx@qemulion>
 <Y3Z3aatcaISvqURJ@kroah.com>
 <Y3jqUpNOygJ4+2jy@qemulion>
 <Y4RnJyiCDYavLAJq@qemulion>
 <Y4Ro+Ex+E1WemSrs@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4Ro+Ex+E1WemSrs@kroah.com>

On Mon, Nov 28, 2022 at 08:53:28AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 28, 2022 at 01:15:43PM +0530, Deepak R Varma wrote:
> > >
> > > For your quick reference, the zero length structure declaration are online 963
> > > whereas the union is on line number 1080 of the file drivers/staging/wlan-ng/hfa384x.h
> >
> > Hello Greg,
> > can you please suggest how should I approach this clean-up/correction?
>
> Sorry, but I do not have the bandwidth to help out with this.  I will
> gladly review changes submitted only.

No problem. I completely understand and appreciate. Thank you Greg.

./drv

>
> greg k-h
>


