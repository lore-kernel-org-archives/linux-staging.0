Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE71115AB
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 09:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E8AC433EF;
	Sun, 28 May 2023 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685265062;
	bh=b0uQpJssTN2YlKfc+1W3Bzj60JNXWST+Vhax3gxkEQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLCFpgVoRPbAMl2BXgug0RsPcMLyHWvSflQpuWezISn5fAV3NwV59mbBSgY+gEfNR
	 J1OmvBqyJqOOBZRU3T9vshbnNxTpZH4g0cdAebSVuFZRvrft5Ls5lXoFepx2chF8ac
	 g1pgBdTsUvo/G8UTH0S82seeaYXvclUX7YhKfTNI=
Date: Sun, 28 May 2023 10:10:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: David Tadokoro <davidbtadokoro@usp.br>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Fix BRACES warning
Message-ID: <2023052830-steep-runway-fceb@gregkh>
References: <20230524040051.235250-1-davidbtadokoro@usp.br>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524040051.235250-1-davidbtadokoro@usp.br>

On Wed, May 24, 2023 at 01:00:51AM -0300, David Tadokoro wrote:
> Fix checkpatch warning "braces {} are not necessary for single statement
> blocks".

Why do you have "BRACES" in the subject line as all caps?  Where did
that term come from?

No need to shout :)

thanks,

greg k-h
