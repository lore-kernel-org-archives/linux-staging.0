Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A6DA3D
	for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 06:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9702C433D7;
	Wed, 27 Jul 2022 06:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658904497;
	bh=O3pWBNFy+mhF4rfrd3ZoZjiwnupWwUro4mk5hWfHJjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJk/I0eR8PRR91+7Srhy7DSl1ravoz8r92rp38zmgS7mYUTDZdrOpnGuJ2ZC/7o0v
	 zDsHgXrCqLHOzf9zkc9r6PAoTcmTv7GjXeRST9fW33JM3eO+K1bWxqwXG/HFM/K+sj
	 6BpPnco1PkrRrsWwW7EvOX7D4LSJ3gJHyZMB41wI=
Date: Wed, 27 Jul 2022 08:48:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: vt6655: Rename MACvClearStckDS
Message-ID: <YuDfrsZeglr1+y7n@kroah.com>
References: <cover.1658333350.git.philipp.g.hortmann@gmail.com>
 <3bdaf8401f49276c3176d073c7f77da57d7c1e70.1658333350.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bdaf8401f49276c3176d073c7f77da57d7c1e70.1658333350.git.philipp.g.hortmann@gmail.com>

On Wed, Jul 20, 2022 at 06:24:36PM +0200, Philipp Hortmann wrote:
> Fix name of a macro that uses CamelCase which is not
> accepted by checkpatch.pl

You do have 72 columns to use here, feel free to do so :)

Also a bit better description would be nice.

thanks,

greg k-h
