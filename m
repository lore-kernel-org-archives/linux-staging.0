Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4319B46AB
	for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 14:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0D8C433C8;
	Mon, 28 Aug 2023 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693233910;
	bh=gItZ/b/cT8XHJYljt+p4zktoff3dL4UmwlQU6B+fOV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ql0sro2OmTgWdUWo399MBvzRoUoYRXTySvYh1prNaVv5cp7seuufZq3uJMYZ/krFg
	 yTduhYpkzkfNfOohTk/m20m2dutHsXwLljNhhRdKhtGMAA+ooqGMHzcPPSnBM6/EqS
	 7zsCHnAiH5JKn0kg6FF4QfMivHpnlCPTwNxRf3wk=
Date: Mon, 28 Aug 2023 16:45:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: Oliver Crumrine <ozlinux@hotmail.com>, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 1/6] staging: octeon: clean up the octeon ethernet
 driver
Message-ID: <2023082849-crushable-emission-862b@gregkh>
References: <cover.1693229582.git.ozlinux@hotmail.com>
 <PH7PR11MB7643C65E067BAB032F930488BCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
 <ZOyxaLDCI81W96/X@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOyxaLDCI81W96/X@nam-dell>

On Mon, Aug 28, 2023 at 04:38:32PM +0200, Nam Cao wrote:
> On Mon, Aug 28, 2023 at 09:39:14AM -0400, Oliver Crumrine wrote:
> > Make the octeon ethernet driver better adhere to the
> > kernel coding standard
> > 
> > Signed-off-by: Oliver Crumrine <ozlinux@hotmail.com>
> > ---
> > v2: Actually send the patch set properly
> > v3: Fixed a bug where I forgot to change all instances of a struct
> > v4: Actually fix that bug (this is my first patch, give me a break)
> 
> Don't give up! You will get it right eventually.
> 
> This is not important, but I prefer you revert the order of the change log.
> The changes compared to the last version is most relevant, so preferably they
> should be put on top.

Either way is fine, this isn't an issue.

What _is_ an issue is that all of these have the identical subject line,
and the identical changelog text _yet_ they do different things.

Oliver, please read read the section entitled "The canonical patch
format" in the kernel file, Documentation/process/submitting-patches.rst
for a description of how to do properly.

thanks,

greg k-h
