Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBF520F0
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 05:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1678080974; bh=mpBug5aM2wNF/1cZUEdJckQWwAuc8R6FgEfXLdvsBZs=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=NIQkWtdu733/gkxyQhVvfND8fZnt1VRloT7U6CDOOtEmeU72tcvthuPbYrHioef7u
	 F/SA8+JQNAEK4KPUHpmyYwUYBw2Fqf5cLc5FsuG9l8z8x+fhG7N0zGhDANpjIn8Q5g
	 dNaUaQLB88qFND2Povg2/fYWAGT8C71/GrTD+FwI=
Received: by b221-4.in.mailobj.net [192.168.90.24] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Mon,  6 Mar 2023 06:36:14 +0100 (CET)
X-EA-Auth: sTAQaEpFF15+mRVlMRDYd0Zy232OV9AJpbSkuDL9WgbKbvmnv2bRrBIgCBxAm0reL12y1ytPaLvcYyOf79a7GcOwVOPqqlAb
Date: Mon, 6 Mar 2023 11:06:06 +0530
From: Deepak R Varma <drv@mailo.com>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <ZAV7xvr3BCqByjy6@ubun2204.myguest.virtualbox.org>
References: <Y9/xXHvOAwfqoDxn@combine-ThinkPad-S1-Yoga>
 <3cb45313-209a-8190-12f8-6a2d49e4173b@wanadoo.fr>
 <Y+A+HF1vDeRIqye5@combine-ThinkPad-S1-Yoga>
 <Y+DL3O5lcMyZ/aNR@kroah.com>
 <Y+H9BT8Am4Ik2ZDA@combine-ThinkPad-S1-Yoga>
 <Y+IJgxF52lpgk0RC@ubun2204.myguest.virtualbox.org>
 <ZAVxo6WHGu3kO1nl@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAVxo6WHGu3kO1nl@combine-ThinkPad-S1-Yoga>

On Mon, Mar 06, 2023 at 05:52:51AM +0100, Guru Mehar Rachaputi wrote:
> On Tue, Feb 07, 2023 at 01:49:15PM +0530, Deepak R Varma wrote:
> 
> Hej Deepak,
> 
> I have a problem in sending patchset through mutt.
> I have been trying sending to my own mail address but it won't work.

This could be because of mutt configuration. There are some additional checks if
you are trying to use mutt with gmail. Search over google or lore old posts to
know more about it. The important aspect is to configure and test mutt well
before you use it for sending out patches.

> 
> When sending patchset I think we should use "In-Reply-To" flag and
> include "Message-ID" to which we want this to be in series to. I tried
> both "git send-email" feature and mutt "forwarding feature".

I have not used "git send-email", so can't help you there. But mutt has worked
very well for me. Ensure you are reading and following the instructions from
this page well: https://kernelnewbies.org/Outreachyfirstpatch

> 
> Another issue is, how to attach patch file from inside mutt(for example: 
> "mutt -H x.patch" from command line is used to extract header and body of a 
> mail in mutt)?

Why do you want to do that?
Build a patch file using "git format-patch" and then use "mutt -H" to send the
patch. Both the commands work directly from the command line. If there is a need 
for any additional attachments in support of your patch [configs, logs, trace as
evidence, test outcomes etc], you can attach those from within the "mutt -H"
execution context.

I suggest testing mutt well before you start sending any patches out by sending
the patches to yourself. Do not use any kernel mailing list for testing.


Regards,
Deepak.

> 
> 
> -- 
> Thanks & Regards,
> Guru
> 


