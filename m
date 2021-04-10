Received: from smtprelay.hostedemail.com (smtprelay0045.hostedemail.com [216.40.44.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B8170
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 02:48:15 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave04.hostedemail.com (Postfix) with ESMTP id D66B31816086D
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 02:32:02 +0000 (UTC)
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay06.hostedemail.com (Postfix) with ESMTP id 396D718150A50;
	Sat, 10 Apr 2021 02:31:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 3314B13D94;
	Sat, 10 Apr 2021 02:31:55 +0000 (UTC)
Message-ID: <04fcc5ac37f750e335447aee57da5aad072e321d.camel@perches.com>
Subject: Re: [PATCH 4/6] staging: rtl8192e: matched alignment with open
 parenthesis
From: Joe Perches <joe@perches.com>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com, 
	mitali_s@me.iitr.ac.in
Date: Fri, 09 Apr 2021 19:31:53 -0700
In-Reply-To: <YHEMrQdEFpXgmMh/@kali>
References: <YHEA2Te3Hik5J39t@kali>
	 <f5fe04d62b22eb5e09c299e769d9b9d8917f119c.camel@perches.com>
	 <YHEMrQdEFpXgmMh/@kali>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.10
X-Stat-Signature: qyweys8gmc393ikshcq9nfi1t1idfwm4
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 3314B13D94
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/jsGVRnYflYxVFQhm6ZrKMmWNfkAc0CcM=
X-HE-Tag: 1618021915-880427

On Sat, 2021-04-10 at 07:55 +0530, Mitali Borkar wrote:
> On Fri, Apr 09, 2021 at 07:07:09PM -0700, Joe Perches wrote:
> > On Sat, 2021-04-10 at 07:05 +0530, Mitali Borkar wrote:
> > > Matched the alignment with open parenthesis to meet linux kernel coding
> > > style.
> > > Reported by checkpatch.
> > []
> > > diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > []
> > > @@ -154,7 +154,7 @@ bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
> > >  	    (net->ralink_cap_exist))
> > >  		retValue = true;
> > >  	else if (!memcmp(net->bssid, UNKNOWN_BORADCOM, 3) ||
> > > -		!memcmp(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM, 3) ||
> > > +		 !memcmp(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM, 3) ||
> > >  		!memcmp(net->bssid, LINKSYSWRT350_LINKSYSWRT150_BROADCOM, 3) ||
> > >  		(net->broadcom_cap_exist))
> > 
> > checkpatch is a stupid script.
> > Look further at the code not just at what checkpatch reports.
> > Align all the contination lines, not just the first one.
> > 
> Sir, I have aligned them in last patch of this patchset.

This sort of change should not require an additional patch.


