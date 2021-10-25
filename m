Received: from smtprelay.hostedemail.com (smtprelay0132.hostedemail.com [216.40.44.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B52C9F
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 23:28:18 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 06F1A1830BB48
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 16:20:20 +0000 (UTC)
Received: from omf04.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay02.hostedemail.com (Postfix) with ESMTP id F1E1330C9F;
	Mon, 25 Oct 2021 16:20:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id 872D5D1513;
	Mon, 25 Oct 2021 16:20:11 +0000 (UTC)
Message-ID: <a1e76a303ec4dc1ffd53e1d22634363bdb0ffcd0.camel@perches.com>
Subject: Re: [PATCH 1/2] staging: rtl8192u: fix control-message timeouts
From: Joe Perches <joe@perches.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Johan Hovold
 <johan@kernel.org>,  cocci@inria.fr, Florian Schilhabel
 <florian.c.schilhabel@googlemail.com>,  linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org,  linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Date: Mon, 25 Oct 2021 09:20:10 -0700
In-Reply-To: <YXbSfYIuyj3PI6pm@kroah.com>
References: <20211025120910.6339-1-johan@kernel.org>
	 <20211025120910.6339-2-johan@kernel.org>
	 <fdb677be-6e06-fef9-811d-bb2c71246197@lwfinger.net>
	 <094a8f50ccef81e0317c89d0a605c327c825d5cb.camel@perches.com>
	 <YXbSfYIuyj3PI6pm@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.61
X-Stat-Signature: s57wnjk3sazm6ya3cfjfmqterpgjdyme
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 872D5D1513
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18H09QZhcxyfnc+dKXrrgxF7zoOKHJVloU=
X-HE-Tag: 1635178811-876912

On Mon, 2021-10-25 at 17:51 +0200, Greg Kroah-Hartman wrote:
> Look at the lists, he's sent a bunch of fixes for this today to all the
> subsystems...

Yay Johan. Thanks for doing all of them...

