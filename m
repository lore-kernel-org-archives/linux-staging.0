Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073B77E
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 04:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB36C385A4;
	Mon, 25 Apr 2022 04:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650861937;
	bh=WfUDenzRqSwN+2AH8dGvIQOwxPGHWP2uyfmC+8Ufc7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MpqNSxAFm6ZPMthlxgGs7DN919OioAO5tKDtC8Q4Q5ZJku+Yq99/NIrjpcbx1JcTq
	 eHzNF//Em+O77zNpc0CU3vIEYCoz8OrpaDndn24lbDHDAPOBAR8d3DRb1KUljfSN/g
	 pnRwmGb+mJGV0bNhfBRyJzBnUJd7WXxd8TkLof2w=
Date: Mon, 25 Apr 2022 06:45:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Solomon Tan <wjsota@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com
Subject: Re: [PATCH v2] Revert "staging: r8188eu: use in-kernel ieee channel"
Message-ID: <YmYnbKeqce5TZuM1@kroah.com>
References: <20220425011612.113664-1-wjsota@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425011612.113664-1-wjsota@gmail.com>

On Mon, Apr 25, 2022 at 09:16:13AM +0800, Solomon Tan wrote:
> This reverts commit 0afaa121813ed602bd203759c339cb639493f8c2 as changing
> rtw_ieee80211_channel to ieee80211_channel causes a memcpy bug as reported
> in
> https://lore.kernel.org/linux-staging/67e2d10b-7f0f-9c5a-ce31-376b83ffba9e@gmail.com/
> due to their size differences.
> 
> Signed-off-by: Solomon Tan <wjsota@gmail.com>

No "Reported-by:" tag?

