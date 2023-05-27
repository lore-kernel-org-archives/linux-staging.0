Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA5D7E
	for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 07:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98317C433EF;
	Sat, 27 May 2023 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685173175;
	bh=JicBv+V/s9eE627xqKdQDBgHyA8/oY5+KtkcLzLvObs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrKQ1uNcCuhSRhoSJ44BxjpbCs8UVqzYqMCPWmdq2nV6pK7mXYrdQe8Ad8qgGPwjo
	 v7TpjbfDObBPjmtxtbHEcxg8o2Ph2h675Fg8gHN2Ks2XgU6DjuJAelyzSXyXTBtoVD
	 VBdQ2Wb+vt8aICG/05W4jhfB5Z7JFflG43ZLppA4=
Date: Sat, 27 May 2023 08:39:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] Staging: rts5208: rtsx: Moved else statement to same
 line with else if
Message-ID: <2023052758-taco-clarinet-5d7e@gregkh>
References: <20230519101920.27342-1-kartikey406@gmail.com>
 <20230519101920.27342-2-kartikey406@gmail.com>
 <CADhLXY6HuOZK3atwP8FBXU2Yxojkx9SKL87L3dg_SBfrPVN-Cg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADhLXY6HuOZK3atwP8FBXU2Yxojkx9SKL87L3dg_SBfrPVN-Cg@mail.gmail.com>

On Sat, May 20, 2023 at 03:56:29PM +0530, Deepanshu Kartikey wrote:
> Hi Greg,
> 
> Any update ?

Please do not top post.

> On Fri, May 19, 2023 at 3:50 PM Deepanshu Kartikey <kartikey406@gmail.com>
> wrote:

This was one day later, please realize that coding style cleanups are
usually at the bottom of my review lists (for obvious reasons).  You
only need to resend if I haven't responded within 2 weeks.

Take the time to do other work, like review other patch submissions,
making my (and other maintainers), lives easier.  Don't just ask others
to do work for you :)

thanks,

greg k-h
