Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AE771
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nbcw4udwhbGZK1KxJG3rMK3oFZk6fMlWAAr8sT0AiFg=; b=qdyXvIjyqBvlpBNt/ry9bySb5R
	SPRLhCOYGcLYrkePQ0JVs+3n80ANCv9IkeaLafifcOjUkmLdvN3+8mqbOGCo/X28I5H/Zk8liKa18
	jAraWVwhpjf/I42ZViXzJ/GvacHje0ei9bpch4pUKOBNnZ++qGmZxtIwjeNuB6dHdH+ka+7QuEhNd
	RhyCVLBfCdX4H6VE9vrnuM+CKHPdBGUQzCnnbods8UIrTPRIWr4fTCBOtGYCdbfy+f3JBYlXicrVZ
	Pba4ujJv8XNbIreHWgpQVNppvIfdSRMi3m+efGSqW0SbGhY5nMKT23qHpNswMv0ERnEJmQ7rztHH4
	AG0IgAZQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lWP1g-006BMB-RN; Tue, 13 Apr 2021 19:48:48 +0000
Date: Tue, 13 Apr 2021 20:48:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] :staging: rtl8723bs: Remove useless
 led_blink_hdl()
Message-ID: <20210413194844.GR2531743@casper.infradead.org>
References: <20210413155908.8691-1-fmdefrancesco@gmail.com>
 <2400087.QbMOWSuNhY@linux.local>
 <alpine.DEB.2.22.394.2104132123180.14108@hadrien>
 <7008359.Jy8utYDuns@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7008359.Jy8utYDuns@linux.local>

On Tue, Apr 13, 2021 at 09:45:03PM +0200, Fabio M. De Francesco wrote:
> 1) The driver doesn't call that function from anywhere else than the macro.
> 2) You have explained that the macro add its symbol to a slot in an array 
> that would shift all the subsequent elements down if that macro is not used 
> exactly in the line where it is.
> 3) Dan Carpenter said that that array is full of null functions (or empty 
> slots?).
> 
> Unless that function is called anonymously dereferencing its address from 
> the position it occupies in the array, I'm not able to see what else means 
> can any caller use.
> 
> I know I have much less experience than you with C: what can go wrong?

Here's where the driver calls that function:

$ git grep wlancmds drivers/staging/rtl8723bs/
drivers/staging/rtl8723bs/core/rtw_cmd.c:static struct cmd_hdl wlancmds[] = {
drivers/staging/rtl8723bs/core/rtw_cmd.c:               if (pcmd->cmdcode < ARRAY_SIZE(wlancmds)) {
drivers/staging/rtl8723bs/core/rtw_cmd.c:                       cmd_hdl = wlancmds[pcmd->cmdcode].h2cfuns;

