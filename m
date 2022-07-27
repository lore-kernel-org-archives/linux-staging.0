Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC8AA3D
	for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 06:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0543C43142;
	Wed, 27 Jul 2022 06:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658904230;
	bh=IJf4TgefHFadagzVeTqif8QAQCz24R5RnXBmjOKxUSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RP4nLawu1SjE42GGT2T0CYiFNI88lBUX+ScZxBWJLO0PNbKOfC4o0ofueHOXdOTl5
	 8c5lzI5TuuwAhRJWVVM2MYUihNNGv8P93IJqNjTWtSsSpAi/WQp+a+MzOorFpTOytp
	 Vhtrpy96W+KoGCIwIMrKQN7K4LV/aZ5mrlap3+cw=
Date: Wed, 27 Jul 2022 08:43:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: r8188eu: get da from ieee80211_mgmt
Message-ID: <YuDeo4qHOqDkdZy9@kroah.com>
References: <20220724153917.138848-1-martin@kaiser.cx>
 <20220724153917.138848-2-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724153917.138848-2-martin@kaiser.cx>

On Sun, Jul 24, 2022 at 05:39:13PM +0200, Martin Kaiser wrote:
> Define a struct ieee80211_mgmt in the OnAssocRsp function. Read the
> destination address (da) from this struct.

This explains (sortta) what this patch does, but not why you are doing
this.

To me this looks like a step backwards, why is this change needed at
all?

thanks,

greg k-h
