Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C0C33D6
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 07:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D09C433D6;
	Fri, 29 Jul 2022 07:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659079627;
	bh=mNXidyBqhxoR6hoaNGWZwtljkSmbontLwFbTMLJMeSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jtEPqD4lItHgk91ObDPGgn8sKuevQfWrbxs/NDLxUM/bpODfxFy3TrEV0+IQQS6ot
	 /oak3PduZpzEZYN7bC9CJkcdc4TWpl9Cu2Bcgyd7jRycm1qeIFiFOzol3kLLPBLVNz
	 qPv+bYMeWcG49de+qLIJm0VGEijpI7GZIs+4pFfI=
Date: Fri, 29 Jul 2022 09:27:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tong Zhang <ztong0001@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Colin Ian King <colin.king@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH v3 3/3] staging: rtl8192u: fix rmmod warn when device is
 renamed
Message-ID: <YuOLybUZ8cBWntY/@kroah.com>
References: <YuDdHMaB6jWARQzA@kroah.com>
 <20220729035230.226172-1-ztong0001@gmail.com>
 <20220729035230.226172-4-ztong0001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729035230.226172-4-ztong0001@gmail.com>

On Thu, Jul 28, 2022 at 08:52:20PM -0700, Tong Zhang wrote:
> @@ -164,11 +164,19 @@ void rtl8192_debugfs_init_one(struct net_device *dev)
>  
>  void rtl8192_debugfs_exit_one(struct net_device *dev)
>  {
> -	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
> +	struct r8192_priv *priv = ieee80211_priv(dev);

This change is not relevant for this patch :(

