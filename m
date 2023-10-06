Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24231F614;
	Fri,  6 Oct 2023 13:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CfACQxOS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E8DC433C9;
	Fri,  6 Oct 2023 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696599151;
	bh=J16OmmTjaecD4/PoAb2njb0cPL7n3/wpyLjeH1OTmF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfACQxOSn0ThLhWzxysG4qT3xfyk5N28YD/GUdEZGrH+DnjqnmDbXLfuwYFJ0SHSF
	 x0CT9fg0xQ9W4z69hskfC9aBKTYSqA3rqDDTRZT6IFJ41/QyBSCJSBicNyta1Vh+Gl
	 beWSpTPc0slJeOOEcaZ3DCNcaDTrWwKGDNtAmzbE=
Date: Fri, 6 Oct 2023 15:32:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ricardo Lopes <ricardoapl.dev@gmail.com>
Cc: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Replace strncpy with strscpy
Message-ID: <2023100657-purge-wasting-621c@gregkh>
References: <20231005191459.10698-1-ricardoapl.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005191459.10698-1-ricardoapl.dev@gmail.com>

On Thu, Oct 05, 2023 at 08:14:55PM +0100, Ricardo Lopes wrote:
> Avoid read overflows and other misbehavior due to missing termination.

As Dan said, this is not possible here.  Can you redo the changelog text
and resend it so that people aren't scared by the text?

thanks,

greg k-h
