Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD7EA6
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 12:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1669120193; bh=ZQVTktCaJMSJoAUilenuVtVqaVzw6QgpmXOKe+X/kzo=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=KiJWlsdEVvQG1zWCPN+LFYJETHdaHmp5LE8Awln8pzvwV4FcSs/OemxhucwgKdc0r
	 ke2Rg8xLlCSIX/0GmrzDShWx9Uo8Xb4ujKzlqFPJZ8nbFHwd6HFjPgzi1kozqLjaES
	 9zPcPAABagXa+cpUenkRKPziveL00gzgZPk0fJ9c=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Tue, 22 Nov 2022 13:29:53 +0100 (CET)
X-EA-Auth: Du6cW+R97fU19tg8ZpfTQyvMhiVbLDriT+NRPtYzKC4H6dSsFWPtqi4ukIDslkgLagjDOC+pFnGnV1YRwL4W3zGYh6ZdkLDo
Date: Tue, 22 Nov 2022 17:59:45 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: call set_lan_gain for receiver config
Message-ID: <Y3zAucwpK9TUgrig@qemulion>
References: <Y3kONX7KhQ1GX9QW@qemulion>
 <Y3y7v1WAumU1o5na@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3y7v1WAumU1o5na@kroah.com>

On Tue, Nov 22, 2022 at 01:08:31PM +0100, Greg Kroah-Hartman wrote:
> On Sat, Nov 19, 2022 at 10:41:17PM +0530, Deepak R Varma wrote:
> > Value for the LNA gain is captured from the user as part of the struct
> > pi433_rx_cfg, however, the corresponding function rf69_set_lna_gain() is
> > never called to set it. Include a call to this function as part of
> > setting up the rx configurations.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/pi433/pi433_if.c | 3 +++
> >  1 file changed, 3 insertions(+)
>
> How was this change tested?

Hi Greg,
This was compile tested only.

As per your message on the other patch for this driver, I am holding back such
patches until I have the ability to test the change with a real device myself.

I most welcome if there is any other feedback on the patches. It will help me
consolidate the feedback and react to them in one go.

Thank you,
./drv

>
> thanks,
>
> greg k-h
>


