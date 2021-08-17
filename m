Received: from smtprelay.hostedemail.com (smtprelay0156.hostedemail.com [216.40.44.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17E62F80
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 10:06:39 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave06.hostedemail.com (Postfix) with ESMTP id D98058124C95
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 08:50:56 +0000 (UTC)
Received: from omf17.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id 6ACC0181CC1CF;
	Tue, 17 Aug 2021 08:50:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id 2B67627DD32;
	Tue, 17 Aug 2021 08:50:49 +0000 (UTC)
Message-ID: <5d8c6cb42c2ee156027699ab1e5fa5b476188678.camel@perches.com>
Subject: Re: [PATCH] staging:iio:ade7854 surround complex defines in
 parentheses
From: Joe Perches <joe@perches.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, daniel watson
	 <ozzloy@challenge-bot.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
	 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Tue, 17 Aug 2021 01:50:46 -0700
In-Reply-To: <YRtTRpioOFBYxcxJ@kroah.com>
References: <20210815023115.13016-1-ozzloy@challenge-bot.com>
	 <YRizb/FGfYpGbpJy@kroah.com> <20210817043038.GA9492@challenge-bot.com>
	 <YRtTRpioOFBYxcxJ@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 2B67627DD32
X-Stat-Signature: aj6zgh7o3amw79kd8ndqzy3na5mtho6u
X-Spam-Status: No, score=-1.26
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18HA2mP+Mt4fwdV5dckwI6oocs8qqrpHME=
X-HE-Tag: 1629190249-913308

On Tue, 2021-08-17 at 08:12 +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 16, 2021 at 09:30:38PM -0700, daniel watson wrote:
> > 
> > If this is a false positive from checkpatch, I can submit it as an
> > example to the checkpatch maintainers.  Do you think I should?
> 
> checkpatch is a perl script that does pattern matching, it is really
> hard for it to determine for things like this specific example, that it
> is not needed.
> 
> Try finding other valid checkpatch cleanups if you wish to contribute in
> this way, there are loads of others under drivers/staging/ that should
> be easy to find.

These macros, and several other '#define ADE7854_<FOO> <value>' instances,
are apparently unused and could possibly be removed instead.


