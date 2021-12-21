Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EA829CA
	for <linux-staging@lists.linux.dev>; Tue, 21 Dec 2021 06:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4D1C36AE7;
	Tue, 21 Dec 2021 06:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640068463;
	bh=GqKv6SsDMyKQjlyuqv5ooOgCJHNhIUkebCCrAMLW5cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esqt9rPISh9ARptMMTKSJIn4DxJlXS8cfqNbruvlA1YFo3r99zqrwloD7dbJk5iLC
	 vdc/IV9g4Tc2sK9YqSFNtTaDuB5zEhV9vTt2FcR0IV7aZXNQ/c9gjaPnYMFHW1JpXv
	 5dP+d3VVn2CxdpQVO87kRI6fTWI9ZuKgbe/5NMM8=
Date: Tue, 21 Dec 2021 07:34:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linuxfancy@googlegroups.com, Forest Bond <forest@alittletooquiet.net>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: drop off byRxMode var in device.h
Message-ID: <YcF1baxVvP3j8Q/8@kroah.com>
References: <20211220202523.21805-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220202523.21805-1-tomm.merciai@gmail.com>

On Mon, Dec 20, 2021 at 09:25:20PM +0100, Tommaso Merciai wrote:
> Drop off unused variable byRxMode in device.h, this fix following
> checkpatch.pl check:
> CHECK: Avoid CamelCase: <byRxMode>
> 131: FILE: drivers/staging/vt6655/device.h:131:
> unsigned char byRxMode

No need to line-wrap this.

But this "problem" is not the real thing you are fixing.  The real thing
is the issue that this variable is not needed at all.  Just say that, no
need to justify it with a checkpatch warning, right?

thanks,

greg k-h
