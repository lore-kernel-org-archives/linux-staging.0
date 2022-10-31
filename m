Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEF42F27;
	Mon, 31 Oct 2022 16:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8D8C433C1;
	Mon, 31 Oct 2022 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667235216;
	bh=5FSyXkqQ+xG6XJPWEaNeDpN+GhxNh7sIjAazomfszxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhDTJbR2xkaiNkwUqUNHpFYx21ABX1SaHTNxi1yNIbXUOqzzeqwQTAi6iY0Mr6yOz
	 8Uwr5JbltXRtFW6GPdlnwprPUXgDex3PDHYcvcEe0iom1AQpVTyLf4NZMarlOZcu21
	 q6+xbmoEetX4A5puqYLCppVlz3qqg3KsKtKRYxbY=
Date: Mon, 31 Oct 2022 17:54:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: vt6655: change variable name wTimeStampOff
Message-ID: <Y1/9yBVf4AcSp8Cs@kroah.com>
References: <Y1/fLjJmma28LudO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1/fLjJmma28LudO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Mon, Oct 31, 2022 at 02:43:58PM +0000, Tanjuate Brunostar wrote:
> The Linux coding style does not allow CamelCase variable naming.

That is a correct statement, but why say that here?  We have
documentation that describes this already :)

Please read the kernel documentation for how to write a good changelog
text and resend this as a v2.

thanks,

greg k-h
