Received: from relay4.hostedemail.com (relay4.hostedemail.com [64.99.140.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7275C80E
	for <linux-staging@lists.linux.dev>; Mon, 18 Apr 2022 20:38:29 +0000 (UTC)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 9EE6D2466A;
	Mon, 18 Apr 2022 19:22:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 6EC2619;
	Mon, 18 Apr 2022 19:22:37 +0000 (UTC)
Message-ID: <24b3a1f5c1fa416ac5aed375afaa03c0c3ce2be1.camel@perches.com>
Subject: Re: [PATCH] staging: media: av7110: remove redundant space after
 cast
From: Joe Perches <joe@perches.com>
To: Aliya Rahmani <aliyarahmani786@gmail.com>, mchehab@kernel.org
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 18 Apr 2022 12:22:36 -0700
In-Reply-To: <20220418170900.16725-1-aliyarahmani786@gmail.com>
References: <20220418170900.16725-1-aliyarahmani786@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.41
X-Stat-Signature: ta1pnoj6dj87sbrqzcmi6i5ozqoac1o5
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 6EC2619
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19umMeH10kJGQ1Ot4hgxrCHJcCqVxKTlfg=
X-HE-Tag: 1650309757-686062

On Mon, 2022-04-18 at 22:39 +0530, Aliya Rahmani wrote:
> Remove the unnecessary space immediately after a cast. Identified by
> checkpatch: CHECK: No space is necessary after a cast.
[]
> diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
[]
> @@ -93,7 +93,7 @@ int av7110_record_cb(struct dvb_filter_pes2ts *p2t, u8 *buf, size_t len)
>  
>  static int dvb_filter_pes2ts_cb(void *priv, unsigned char *data)
>  {
> -	struct dvb_demux_feed *dvbdmxfeed = (struct dvb_demux_feed *) priv;
> +	struct dvb_demux_feed *dvbdmxfeed = (struct dvb_demux_feed *)priv;

It's also unnecessary to cast void pointers so the cast could be removed.

	struct dvb_demux_feed *dvbdmxfeed = priv;

And the code here uses dvbdmxfeed and feed rather interchangeably for
uses of a struct dvb_demux_feed *.

It might be better just to use feed and change the other uses too.

Do consider this just a coding exercise as the driver is for some
hardware that is effectively dead/unavailable/non-functional.

Look at:

commit 989cf18ed08f8b6efd1d1592d1d0108fa09b98f5
Author: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Mon May 31 17:27:09 2021 +0200

    media: av7110: move driver to staging
    
    This driver is really old, from devices that aren't
    manufactured anymore for more than a decade.

Maybe instead consider adding a MAINTAINERS section
suggesting this is obsolete and/or a TODO entry in this
directory saying "Delete this" after some time.



