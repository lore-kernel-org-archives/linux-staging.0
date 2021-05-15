Received: from smtprelay.hostedemail.com (smtprelay0096.hostedemail.com [216.40.44.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8AE72
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 07:03:28 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave07.hostedemail.com (Postfix) with ESMTP id EBB6418013213
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 06:55:45 +0000 (UTC)
Received: from omf10.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay04.hostedemail.com (Postfix) with ESMTP id 66D571800AC96;
	Sat, 15 May 2021 06:55:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id 1A7DD2351F4;
	Sat, 15 May 2021 06:55:37 +0000 (UTC)
Message-ID: <4f757b9bab4c9575f0257db6b9ed5a75419a3420.camel@perches.com>
Subject: Re: [PATCH] staging: greybus: add declare_ to declaring macros
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Shreyansh Chouhan
	 <chouhan.shreyansh630@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Fri, 14 May 2021 23:55:36 -0700
In-Reply-To: <YJ9dDwKMKkifeICJ@kroah.com>
References: <20210515034116.660895-1-chouhan.shreyansh630@gmail.com>
	 <YJ9dDwKMKkifeICJ@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.40
X-Stat-Signature: 7auarewnqardbaqc4w55mhyxtzkjhgpj
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 1A7DD2351F4
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+gFUlaiLQi2Cj5HT380ymyZQO+RTOUjn4=
X-HE-Tag: 1621061737-853347

On Sat, 2021-05-15 at 07:33 +0200, Greg KH wrote:
> On Sat, May 15, 2021 at 09:11:16AM +0530, Shreyansh Chouhan wrote:
> > Prefixed the names of all the macros that were used for declaring things
> > with 'declare_'. This should help with clarifying about what these
> > macros do.
> 
> Thanks, but I think I will leave the code as-is.  It's a good "test" for
> people who try to modify the code without actually building it :)

This improves the code for the human reader.
I think wherever reasonable, code should be improved.

In any case, it's a test as checkpatch will emit the same message.


