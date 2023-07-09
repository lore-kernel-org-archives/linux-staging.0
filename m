Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0CEC12B
	for <linux-staging@lists.linux.dev>; Sun,  9 Jul 2023 19:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7226C433C7;
	Sun,  9 Jul 2023 19:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688932135;
	bh=jhpEKEilITelwA0mIHfrSM6wUiPl4EHpLYuPHMUEwfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lirHW3QYoCxf4FSPQcglovPGKpxSJ7Xzt3TXoM8QkeZAX85c6m56EuJimwNnxxxvt
	 jhtyocDFxAiZ6vvIVVEJtXVTe/RhHGB9EQhK6BK036aR5juazjtaBDLr2HLIyFvJCA
	 ZXwMcv8TWcVeRV5ZFMZB/CTpcRD2gvJoYMiz31oo=
Date: Sun, 9 Jul 2023 21:42:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Zhang Shurong <zhang_shurong@foxmail.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Dan Carpenter <error27@gmail.com>, Xu Panda <xu.panda@zte.com.cn>
Subject: Re: [PATCH] staging: ks7010: potential buffer overflow in
 ks_wlan_set_encode_ext()
Message-ID: <2023070919-monetary-sleet-2f5c@gregkh>
References: <tencent_5153B668C0283CAA15AA518325346E026A09@qq.com>
 <2a41ca22-a0eb-df38-be43-7175e1230bd0@web.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a41ca22-a0eb-df38-be43-7175e1230bd0@web.de>

On Sun, Jul 09, 2023 at 09:21:45PM +0200, Markus Elfring wrote:
> > The "exc->key_len" is a u16 that comes from the user.  If it's over
> > IW_ENCODING_TOKEN_MAX (64) that could lead to memory corruption.
> 
> Please choose an imperative change suggestion.

Please stop reviewing staging patches, it is not helpful for anyone.

greg k-h
