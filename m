Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55DE168
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 18:32:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BB52610A8;
	Mon,  2 Aug 2021 18:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627929179;
	bh=Dvzptbd8ZTtD4syTBnOGc4lDUuSeivSX6Ocd36Xfy2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1VJogoxjRzd3f0pYSw3PEQHem6Z8utbiWqULBw23PJFv+Eza8cLeMLKYy5vKpdTQ
	 sOSU3iyFap2D0wd/+iWxq9CeDzXpscH3IHjlrjDjGjbab5gJHz6RzGrhilAUZkN27s
	 fanQHjqRKTzWbLBm6lNZt+2buYHy6AyoMrR+h/r4=
Date: Mon, 2 Aug 2021 17:46:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Subject: Re: kernel BUG in new r8188eu
Message-ID: <YQgTVWHmipH31NsA@kroah.com>
References: <80042e9f-6811-38f3-010b-1c0951ba88db@lwfinger.net>
 <cef19337-5ff3-c0cd-33ef-4f9990bcd4ec@lwfinger.net>
 <YQfKohnSRWHjlht6@kroah.com>
 <147993920.vpeT8VCmXh@localhost.localdomain>
 <dad0fc63-5419-ac38-3c23-110e4063bbe6@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dad0fc63-5419-ac38-3c23-110e4063bbe6@lwfinger.net>

On Mon, Aug 02, 2021 at 09:40:42AM -0500, Larry Finger wrote:
> On 8/2/21 6:45 AM, Fabio M. De Francesco wrote:
> > The following link points to a device that seems to be supported by this
> > driver. It is just $4.99, but I'm not sure whether or not they ship to Europe
> > (I suppose you're here):
> > 
> > https://www.amazon.com/gp/product/B00L28AN88/ref=ox_sc_act_title_1
> > About this item:
> > * Chipset:RTL8188EU
> > * Standard: IEEE 802.11n,IEEE 802.11g, IEEE 802.11b
> > * Supports 64/128 bit WEP, WPA encryption
> > 
> > Otherwise, I think that the following uses the same chip as the above.
> > However, it costs a little more and, above all else, I'm not really sure if it
> > works with r8188eu, since they write that the chip is a Realtek RTL8188EUS
> > (please note that final "EUS"):
> 
> The RTL8188EUS chips use the same driver as RTL8188EU. In fact, the one I am
> using is the EUS variety.

Ah, nice to know, I've ordered this thing from my local supplier:
	https://www.megekko.nl/product/2113/992461/USB-Wi-Fi-sticks/StarTech-com-USB-150-Mbps-Mini-draadloze-netwerkadapter-802-11n-g-1T1R-USB-Wi-Fi-adapter-wit

so I can test and not do stupid things like that commit...

thanks,

greg k-h
