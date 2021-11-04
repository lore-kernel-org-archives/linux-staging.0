Received: from smtprelay.hostedemail.com (smtprelay0080.hostedemail.com [216.40.44.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0072C96
	for <linux-staging@lists.linux.dev>; Thu,  4 Nov 2021 14:49:09 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave05.hostedemail.com (Postfix) with ESMTP id E749818085B71
	for <linux-staging@lists.linux.dev>; Thu,  4 Nov 2021 14:33:47 +0000 (UTC)
Received: from omf08.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay06.hostedemail.com (Postfix) with ESMTP id 012C2180CE8B1;
	Thu,  4 Nov 2021 14:33:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id 2F3521A29FB;
	Thu,  4 Nov 2021 14:33:39 +0000 (UTC)
Message-ID: <2dd81d1a081562dc38bf9d8c6c73b432c5c5f496.camel@perches.com>
Subject: Re: [PATCH v2 1/8] staging: vt6655: Introduce `idx` temporary
 variable
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Karolina Drobnik
	 <karolinadrobnik@gmail.com>
Cc: outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org, 
	forest@alittletooquiet.net, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 04 Nov 2021 07:33:36 -0700
In-Reply-To: <20211104120906.GZ2794@kadam>
References: <cover.1635773679.git.karolinadrobnik@gmail.com>
	 <34bd0e8f42597edf006a950d420345befc4e0bc2.1635773680.git.karolinadrobnik@gmail.com>
	 <20211104120906.GZ2794@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 2F3521A29FB
X-Spam-Status: No, score=-4.03
X-Stat-Signature: ym7brcnsortog1j73xkg4kdzqxc7tnr5
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18uR0zxuo0tNhsoMrtOh3B2gvog+OSoLGg=
X-HE-Tag: 1636036419-603949

On Thu, 2021-11-04 at 15:09 +0300, Dan Carpenter wrote:
> On Mon, Nov 01, 2021 at 02:31:59PM +0000, Karolina Drobnik wrote:
> > Add a local variable to store `MISCFIFO_SYNDATA_IDX` offset.
> > This change helps in shortening the lines in `rf.c` that
> > are deemed too long by checkpatch.pl.
> > 
> 
> I started reviewing the v1 patch but I should have been reviewing this
> patchset.  Please don't do this.  Leave the constant as a constant so
> we don't have to look it up.

It's just an intermediate step to use idx++.
Personally, I'd combine patches to add and use idx++ directly.


