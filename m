Received: from smtprelay.hostedemail.com (smtprelay0186.hostedemail.com [216.40.44.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6BE2C80
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 20:19:25 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave03.hostedemail.com (Postfix) with ESMTP id CE30718446BA7
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 16:42:54 +0000 (UTC)
Received: from omf12.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay01.hostedemail.com (Postfix) with ESMTP id 4D16F100E28CD;
	Mon,  1 Nov 2021 16:42:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 406F9240238;
	Mon,  1 Nov 2021 16:42:47 +0000 (UTC)
Message-ID: <dc4c54b79fb350c9c682ec9bca27562dc32c63e5.camel@perches.com>
Subject: Re: [PATCH v2] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in
 atomic context
From: Joe Perches <joe@perches.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Phillip Potter
	 <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Larry Finger
	 <Larry.Finger@lwfinger.net>
Date: Mon, 01 Nov 2021 09:42:46 -0700
In-Reply-To: <11283844.I1tDBM3C2B@localhost.localdomain>
References: <20211101142732.5638-1-fmdefrancesco@gmail.com>
	 <d1a8eb91-adb9-2163-dc3d-9f86ebdc45e3@lwfinger.net>
	 <11283844.I1tDBM3C2B@localhost.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.75
X-Stat-Signature: 1pjiayp4ndtd8irm3pjd7jxa7cc44m54
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 406F9240238
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1886r81CKQZejC6cJRLm96f4oyoY+7QmQA=
X-HE-Tag: 1635784967-872930

On Mon, 2021-11-01 at 17:30 +0100, Fabio M. De Francesco wrote:
> On Monday, November 1, 2021 4:11:26 PM CET Larry Finger wrote:
> > Incidentally, I disagree with checkpatch in that I think that 
> > sizeof(struct foo) is more descriptive than sizeof(*bar). 
> I agree with you in full

It's not checkpatch in particular, it's from coding-style

The preferred form for passing a size of a struct is the following:

.. code-block:: c

	p = kmalloc(sizeof(*p), ...);


