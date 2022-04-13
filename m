Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF10D23D6
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 06:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D39C385A4;
	Wed, 13 Apr 2022 06:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649832826;
	bh=0I72LaNEy81sBYN4sBltxcvkm4ZSShxeclxpZ+4r0iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1qVO0SpIxtRYnK2KxnSqScWNEnjkYkPfMXlwzV5oQtmHBH1PTvF76qA2JTcYZEWXg
	 ISJEkpVcTbyNU7NUgjl3dAOYJztu982VlEEX9Y66UZIRvkQjXOtFosEDFL4WTSS73E
	 sAQb9p6x9zPk1N7toJgwuxglvqpkvOERypFwdhxo=
Date: Wed, 13 Apr 2022 08:53:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] staging: r8188eu: rename parameter of block_write()
Message-ID: <YlZzeEOn6VC4Tmre@kroah.com>
References: <20220412185754.8695-1-straube.linux@gmail.com>
 <20220412185754.8695-3-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412185754.8695-3-straube.linux@gmail.com>

On Tue, Apr 12, 2022 at 08:57:50PM +0200, Michael Straube wrote:
> Rename the parameter buffSize of block_write() to avoid camel case.
> 
> buffSize -> size

How about "buffSize -> buffer_size"?

That makes more sense, right?

thanks,

greg k-h
