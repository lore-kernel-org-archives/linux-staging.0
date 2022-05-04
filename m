Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E822E258D;
	Wed,  4 May 2022 16:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181E5C385A4;
	Wed,  4 May 2022 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651680365;
	bh=mIu6gvR8TfoKz5CSa/RJWBPrsb5yAhojeG77OoPZbZ8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Lg3a9GYj9QSXNXBy62fQfvr7vDl8PPnqDYyWHWIsWbU5RdJWL7ytXsZqOmne4GJe+
	 EweVMY6JUHC1e86/QwLT5AofNVt/r3ms1o2lb1SZdyVhGgdjqk6+0OItLliYI5GFWq
	 jTHOLvSPOAEJFWUZvTSg/1ISqlhFfnEWWxLcd+GKHIAtZagtajytritLohV2Zgfos7
	 OTY3IU+qGg15iV0QVRL1gWbOxnopiOb765IuXAUAco7ibp/f7I21b4Fecle8Sgwe8o
	 sepuRDCrlUuYDUd50nt252yGyNfZpPAnL2yViqgFNf3eOvL9lHoyZJIvNyIQQOHYTF
	 8BWXghoaCh0Gg==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefano Brivio <sbrivio@redhat.com>,  Jaehee <jhpark1013@gmail.com>,
  =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>,  "David S.
 Miller" <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-staging@lists.linux.dev,  Outreachy Linux Kernel
 <outreachy@lists.linux.dev>
Subject: Re: [PATCH] wfx: use container_of() to get vif
References: <20220418035110.GA937332@jaehee-ThinkPad-X1-Extreme>
	<87y200nf0a.fsf@kernel.org>
	<CAA1TwFCOEEwnayexnJin8T=Fc2HEgHC9jyfj5HxfiWybjUi9GA@mail.gmail.com>
	<20220504093347.GB4009@kadam> <20220504135059.7132b2b6@elisabeth>
	<20220504132551.GD4009@kadam>
Date: Wed, 04 May 2022 19:05:57 +0300
In-Reply-To: <20220504132551.GD4009@kadam> (Dan Carpenter's message of "Wed, 4
	May 2022 16:25:51 +0300")
Message-ID: <87o80d9tay.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Wed, May 04, 2022 at 01:50:59PM +0200, Stefano Brivio wrote:
>> And that it's *obvious* that container_of() would trigger warnings
>> otherwise. Well, obvious just for me, it seems.
>
> :P
>
> Apparently it wasn't obvious to Kalle and me.  My guess is that you saw
> the build error.  Either that or Kalle and I are geezers who haven't
> looked at container_of() since before the BUILD_BUG_ON() was added five
> years ago.

Exactly, I also had to duplicate the error myself before I was able to
understand the issue. So I'm officially a geezer now :D

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
