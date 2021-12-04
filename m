Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4785A68
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 09:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41200C341C0;
	Sat,  4 Dec 2021 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638610155;
	bh=5GG4tyiK4gAxP5Kpyx9+aRYygBGXKkugP4utd+wzHKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k59/NFsXfSqgE8Migw6xfNnUcIXJzSQfpPdGW0FkOvv4OhA4nXv8dXW4zejB4rK1c
	 CcS4tah3qv5G5DJN3vT5Lz1dhDqrfALD2T/Gfykmt2K99ONyXEymN9se6A3/+wop29
	 X0iUUMAPPhcVAPARaHKok+JtPneF29KLCPhzijS4=
Date: Sat, 4 Dec 2021 10:29:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	Forest Bond <forest@alittletooquiet.net>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: refactor byMinChannel to min_channel
Message-ID: <Yas05neinXtoEC+6@kroah.com>
References: <20211204004041.3825744-1-alb3rt0.m3rciai@gmail.com>
 <e0fea904-1861-0003-1b04-6d2e966657da@gmail.com>
 <20211204090941.GA3805206@bulldog>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211204090941.GA3805206@bulldog>

On Sat, Dec 04, 2021 at 10:09:41AM +0100, Alberto Merciai wrote:
> On Sat, Dec 04, 2021 at 11:27:43AM +0300, Pavel Skripkin wrote:
> > Looks like this variable is set, but never used. Shouldn't it be just
> > removed?
> > 
> > Same for max_channel (or byMaxChannel).
> 
> To be honest, I would prefer leave them where they are. I'm only
> refactoring the code considering less the logic aspect.
> 
> I don't know if these variables will become usefull in a second
> moment.

Fix the code for today, do not worry about tomorrow for stuff like this.

> Anyway, If you consider that this could be a good moment to remove
> them we can proceed.

Please remove things like this that are not needed.

thanks,

greg k-h
