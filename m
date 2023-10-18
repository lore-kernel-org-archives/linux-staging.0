Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B8318636;
	Wed, 18 Oct 2023 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zgW50rre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36355C433C8;
	Wed, 18 Oct 2023 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697635712;
	bh=jgCv0a1mlOuqJCd6p2vD9dhvth5LauxDgfbxCVtY3fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zgW50rreyLuaykwNNcQrZpzkgzR7rqaEEwlKWHgfNT5bEf0pvw49DWbOzAGCdKcOD
	 rryTMIvdMc7iKjIZCMtxozz71x2WzzbVG8rUJODaSCQYXpcu2AQCUa4kHRKah7foAx
	 l8scmNu4hXL3QD29Hqcg+j0eJdO53+9foM506PtM=
Date: Wed, 18 Oct 2023 15:28:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumaran.4353@gmail.com
Subject: Re: [PATCH 0/2] staging: qlge: Replace the occurrences of (1<<x) by
 BIT(x)
Message-ID: <2023101856-visa-unlimited-a365@gregkh>
References: <cover.1697568757.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697568757.git.nandhakumar.singaram@gmail.com>

On Tue, Oct 17, 2023 at 12:03:57PM -0700, Nandha Kumar Singaram wrote:
> This patchset performs code cleanup in qlge driver as per
> linux coding style and may be applied in any sequence.
> 
> Nandha Kumar Singaram (2):
>   staging: qlge: Replace the occurrences of (1<<x) by BIT(x)
>   staging: qlge: Replace the occurrences of (1<<x) by BIT(x)

You have two different patches doing different things yet they have the
same identical subject lines.  That's not ok, sorry, please make unique
subject lines as obviously you are doing different things.

thanks,

greg k-h
