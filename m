Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21661E506
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YAnJT4E1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BFDC433C9;
	Fri, 20 Oct 2023 16:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697817732;
	bh=WefkTqJBqzx7ciMu7quS5jTwqdF/GzGrpsyn7JxjXCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAnJT4E1xLbKDKqYfCTV2Poz/bylMunLLHsqVTzXt9Jandj/BAbqBRoNOFFRgjEK/
	 JbD/o+7rtDvp7Lx4xOOL+fVn1FR1XpxkaH2hocXerup2Vt4iUzFU4bxyhZT012KWyP
	 MVqAEMWAsvCLC7/EeNPRlTgiIORxzJAsYtS36IdE=
Date: Fri, 20 Oct 2023 18:02:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chen Shuo <1289151713@qq.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: camera: fixes alignment should match
 open parenthesis
Message-ID: <2023102039-smoking-dirtiness-14c0@gregkh>
References: <tencent_2E5278ECD059882823EF2A5209D98B53E306@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_2E5278ECD059882823EF2A5209D98B53E306@qq.com>

On Fri, Oct 20, 2023 at 11:12:03PM +0800, Chen Shuo wrote:
> This patch fixes the checks reported by checkpatch.pl
> for alignment should match open parenthesis

No it does not, sorry.

Also, any reaason you did not also cc: the proper maintainers as
scripts/get_maintainer.pl told you to?

thanks,

greg k-h
