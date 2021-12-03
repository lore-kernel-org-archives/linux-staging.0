Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F72C9E
	for <linux-staging@lists.linux.dev>; Fri,  3 Dec 2021 14:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED970C53FAD;
	Fri,  3 Dec 2021 14:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638540444;
	bh=WEsQ0YJT+JFvn7QDLZTVVdMDj0ZbFJUPEDcXxcmqgb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2DWYXrjYmNzSNDnhxE/MEx/GMkOnZw+kLuV0oub7rrSZ52F9c4mFo6+SauUHZh1PU
	 eVkBF3maLXvofb0p27PsEYxte9z0hKrmX5aF9kbQvWv4DRJEklH9CZks4mgJ2q5bKN
	 L1t9R9baN2GsSTsj/dZHNBg/ap/ej/hFH0HcHE0M=
Date: Fri, 3 Dec 2021 15:07:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	sboyd@kernel.org, john@phrozen.org, linux-staging@lists.linux.dev,
	neil@brown.name
Subject: Re: [PATCH v5 4/4] staging: mt7621-dts: align resets with binding
 documentation
Message-ID: <YaokmRHYsazdMByi@kroah.com>
References: <20211107074200.18911-1-sergio.paracuellos@gmail.com>
 <20211107074200.18911-5-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107074200.18911-5-sergio.paracuellos@gmail.com>

On Sun, Nov 07, 2021 at 08:42:00AM +0100, Sergio Paracuellos wrote:
> Binding documentation for compatible 'mediatek,mt7621-sysc' has been updated
> to be used as a reset provider. Align reset related bits and system controller
> node with binding documentation along the dtsi file.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)

This patch does not apply to my tree :(

thanks,

greg k-h
