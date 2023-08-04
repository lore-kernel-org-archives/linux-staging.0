Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0417BBA51;
	Fri,  4 Aug 2023 13:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CEAC433C7;
	Fri,  4 Aug 2023 13:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691155327;
	bh=D+Jumq8HlCYdtzD29UJrDAOGyogC+AaDp4mnOIgYNIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHydYzUI00zBYQDYbPlv5Ch2nHvVILEefDbWFfiihDyFUKQIAQvcqlptZNFfxj3U5
	 CtLS6c+7LtpqfxFxAUe53v0Fz/A3TYEUd4tLebH7sGqSU8ql5DPq4nBUIsXBcsDOdt
	 GdkGc5LYng21MV7+qaYoZgSQLOGwrsDtARsV9duQ=
Date: Fri, 4 Aug 2023 15:22:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pavan Bobba <opensource206@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linuxkernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: replace camel case by snake case
Message-ID: <2023080451-sauciness-observer-fdf7@gregkh>
References: <ZMpZixfZ4WQgpzF1@ubuntu.myguest.virtualbox.org>
 <f967a1d0-639c-4cab-8fa0-e04ccde4ed5f@kadam.mountain>
 <ZMzmrADhbNCZFm5f@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMzmrADhbNCZFm5f@ubuntu.myguest.virtualbox.org>

On Fri, Aug 04, 2023 at 05:23:16PM +0530, Pavan Bobba wrote:
> >From 15487baaf86627009a06ab5217428d3b29028c32 Mon Sep 17 00:00:00 2001
> From: Pavan Bobba <opensource206@gmail.com>
> Date: Wed, 2 Aug 2023 18:12:56 +0530
> Subject: [PATCH v2] staging: vt6655: replace camel case by snake case

This shouldn't be in the email body :(

thanks,

greg k-h
