Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C558EDA94;
	Fri, 10 Mar 2023 19:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1678474951; bh=OKoro22+P0l/BvNkvQs1aVoy3cA+A5LYjwZwP+MShl0=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=mHGzmV1M0LexJYqbg7jQGbIRECBJeARhUZQWKiXnmfd791VcUIJ3t7yS9L1AvrLK7
	 v8piGG6BUHX2lrUO/d9n3d1bbKTeFk5ZQs6J4yAD4eGqGC6bTxK48+w559jzZVLthw
	 4fBSES5AIXuOtGvm7HbwW9WmO/qtmgCFXHnXfOV0=
Received: by b221-5.in.mailobj.net [192.168.90.25] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Fri, 10 Mar 2023 20:02:31 +0100 (CET)
X-EA-Auth: rNKDErQ2WgJ0q7YenK6SrXvnhV9bIKbbfmHRLR9ZhCkd/UAWAiqipH+VLN6hD4qukb04qnK176MqMjiIaMb55eW7XxnBW6Pz
Date: Sat, 11 Mar 2023 00:32:24 +0530
From: Deepak R Varma <drv@mailo.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix exceeds line length
Message-ID: <ZAt+wJIhq780Ms4T@ubun2204.myguest.virtualbox.org>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
 <ZAt4irZnVJW4zQNb@ubun2204.myguest.virtualbox.org>
 <ZAt9e8Xnd4wAnjPn@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAt9e8Xnd4wAnjPn@khadija-virtual-machine>

On Fri, Mar 10, 2023 at 11:56:59PM +0500, Khadija Kamran wrote:
> On Sat, Mar 11, 2023 at 12:05:54AM +0530, Deepak R Varma wrote:
> > On Fri, Mar 10, 2023 at 10:09:47PM +0500, Khadija Kamran wrote:
> > > Length of line 182 exceeds 100 columns in file
> > > drivers/staging/grebus/arche-platform.c, fix by removing tabs from the
> > > line.
> > 
> > Hi Khadija,
> > I think if you also include merging the if condition and the call to
> > spin_unlock...() on single lines, it should make the code more human. 
> Hi Deepak! Sorry I am unable to understand how to merge the if condition
> and spin_unlock...() together. Can you please elaborate. 
> Thank you

Hah.. my bad. The if condition is split on two lines. Join them to form a single
line if evaluation.
Similarly, join the spin_un..() call that is split on two lines into a single
line.

Hope that clarifies it.

Deepak.

> 


