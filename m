Received: from smtprelay.hostedemail.com (smtprelay0225.hostedemail.com [216.40.44.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83D42FA4
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 06:36:14 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave08.hostedemail.com (Postfix) with ESMTP id DE4D118019D48
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 06:11:14 +0000 (UTC)
Received: from omf11.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay06.hostedemail.com (Postfix) with ESMTP id 9336718001817;
	Sat, 24 Apr 2021 06:11:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id 0053320A295;
	Sat, 24 Apr 2021 06:11:06 +0000 (UTC)
Message-ID: <bc8873a274bf489ad856386a9d9ee1110de4c4d3.camel@perches.com>
Subject: Re: [PATCH] staging: wlan-ng: silence incorrect type in argument 1
 (different address spaces) warning
From: Joe Perches <joe@perches.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ashish Kalra
	 <eashishkalra@gmail.com>
Cc: Abheek Dhawan <adawesomeguy222@gmail.com>, Johannes Weiner
	 <hannes@cmpxchg.org>, Romain Perier <romain.perier@gmail.com>, Waiman Long
	 <longman@redhat.com>, Allen Pais <apais@linux.microsoft.com>, Ivan Safonov
	 <insafonov@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Fri, 23 Apr 2021 23:11:05 -0700
In-Reply-To: <YIOz6o8gwHv+cAN7@kroah.com>
References: <20210420090142.GA4086@ashish-NUC8i5BEH>
	 <YIE3IffGcjrkz4ZE@kroah.com> <20210423152619.GA2469@ashish-NUC8i5BEH>
	 <YIOz6o8gwHv+cAN7@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 0053320A295
X-Spam-Status: No, score=1.60
X-Stat-Signature: d46e7ubrbbr1korh9cwe8zg1ikogq443
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18/YY5GKoVs6gq4c54h+z9k+dUCREri/n0=
X-HE-Tag: 1619244666-743394

On Sat, 2021-04-24 at 08:00 +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 23, 2021 at 08:56:19PM +0530, Ashish Kalra wrote:
> > On Thu, Apr 22, 2021 at 10:43:13AM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Apr 20, 2021 at 02:31:42PM +0530, Ashish Kalra wrote:
> > > > Upon running sparse, "warning: incorrect type in argument 1 (different address spaces)
> > > > is brought to notice for this file.let's add correct typecast to make it cleaner and
> > > > silence the Sparse warning.
[]
> >  struct p80211ioctl_req {
> >         char name[WLAN_DEVNAMELEN_MAX];
> > -       caddr_t data;
> > +       void __user *data;
> > 
> > Does this looks ok to you and is there any other check possible if this is ok?
> 
> Wait, what is "caddr_t"?  Try unwinding that mess first...

Might not be that simple.

include/linux/types.h:typedef __kernel_caddr_t  caddr_t;
include/uapi/linux/coda.h:typedef void * caddr_t;
include/uapi/asm-generic/posix_types.h:typedef char *           __kernel_caddr_t;


