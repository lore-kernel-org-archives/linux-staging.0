Received: from smtprelay.hostedemail.com (smtprelay0251.hostedemail.com [216.40.44.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EA06D0D
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 17:37:55 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave04.hostedemail.com (Postfix) with ESMTP id D86261801E316
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 17:21:48 +0000 (UTC)
Received: from omf15.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id C3182180428ED;
	Tue,  6 Apr 2021 17:21:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 601A2C4182;
	Tue,  6 Apr 2021 17:21:40 +0000 (UTC)
Message-ID: <7d7be8bcc0e80d826083890ed7791070ad25e603.camel@perches.com>
Subject: Re: [PATCH] staging: greybus: Match parentheses alignment
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Zhansaya Bagdauletkyzy
	 <zhansayabagdaulet@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy-kernel@googlegroups.com
Date: Tue, 06 Apr 2021 10:21:38 -0700
In-Reply-To: <YGxhrLZPIPjILWUH@kroah.com>
References: <20210406124259.GA96537@zhans> <YGxhrLZPIPjILWUH@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 601A2C4182
X-Spam-Status: No, score=0.10
X-Stat-Signature: c6sadr7ectuaniqta9h19aj9ajc7unsy
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+jIsA223eKF3R6VcYnwZUQdsfBWilGY3I=
X-HE-Tag: 1617729700-769365

On Tue, 2021-04-06 at 15:27 +0200, Greg KH wrote:
> On Tue, Apr 06, 2021 at 06:42:59PM +0600, Zhansaya Bagdauletkyzy wrote:
> > Match next line with open parentheses by adding tabs/spaces
> > to conform with Linux kernel coding style.
> > Reported by checkpatch.
[]
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
[]
> > @@ -378,8 +378,8 @@ struct ap_csi_config_request {
> >  #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
> >  
> > 
> >  static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> > -		struct gb_camera_configure_streams_response *resp,
> > -		struct gb_camera_csi_params *csi_params)
> > +					   struct gb_camera_configure_streams_response *resp,
> > +					   struct gb_camera_csi_params *csi_params)
> 
> And now you violate another coding style requirement, which means
> someone will send another patch to fix that up and around and around it
> goes...

None of the coding style document is an actual requirement Greg.
It's all rules of thumb.  Useful rules, but not hard and fast right?

To me, the biggest issue with this code isn't whether or not the
code is aligned at open parentheses or stays within 80 columns,
but is the use of 30+ character length identifiers.

Using identifiers of that length makes using 80 column, or even
100 column length lines infeasible.

Perhaps seeing if include/linux/greybus/greybus_protocols.h
could be updated to use shorter length identifiers might be useful.

The median length identifier there is ~25 chars long and the
maximum length identifier is ~50 chars.



