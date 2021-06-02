Received: from smtprelay.hostedemail.com (smtprelay0232.hostedemail.com [216.40.44.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6C270
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 10:26:09 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave04.hostedemail.com (Postfix) with ESMTP id CACB018019A3F
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 15:36:50 +0000 (UTC)
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay07.hostedemail.com (Postfix) with ESMTP id C7AB8181D3039;
	Wed,  2 Jun 2021 15:36:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id CA30D2448B4;
	Wed,  2 Jun 2021 15:36:42 +0000 (UTC)
Message-ID: <a5b5c871537bcc6931894e8f61ca7b28950c114a.camel@perches.com>
Subject: Re: [PATCH] staging: rtl8192u: fix coding-style issues in
 r8192U_hw.h
From: Joe Perches <joe@perches.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sh4nnu
	 <manikishanghantasala@gmail.com>
Cc: Michael Straube <straube.linux@gmail.com>,
 linux-staging@lists.linux.dev,  linux-kernel@vger.kernel.org
Date: Wed, 02 Jun 2021 08:36:41 -0700
In-Reply-To: <YLehYmLYBMmI8MOk@kroah.com>
References: <20210602151038.53794-1-manikishanghantasala@gmail.com>
	 <YLehYmLYBMmI8MOk@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.40
X-Stat-Signature: fdn61jqfrued3rz84iyaj1h6kw7d7xuh
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: CA30D2448B4
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/etj0Okt/imVx4DoqXZjgv7mC4m5+TRs4=
X-HE-Tag: 1622648202-847602

On Wed, 2021-06-02 at 17:18 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jun 02, 2021 at 08:40:33PM +0530, sh4nnu wrote:
> > staging: rtl8192u: r8192U_hw.h: Clear the coding-style issue
> > 
> > "Macros with complex values should be enclosed in parantheses"
> > by enclosing values in parantheses.

parentheses

> > Signed-off-by: sh4nnu <manikishanghantasala@gmail.com>
[]
> - It looks like you did not use your "real" name for the patch on either
>   the Signed-off-by: line, or the From: line (both of which have to
>   match).  Please read the kernel file, Documentation/SubmittingPatches
>   for how to do this correctly.

Might be useful to have the patchbot script reduce the content of the
message when it's identifiable.

The patch itself looks OK.


