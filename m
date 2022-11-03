Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836F37E7
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 00:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A872C433C1;
	Thu,  3 Nov 2022 00:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667435999;
	bh=YKWn58dmDD7dizOwkZI+UoBBgnZZBQrAVh6R22M5RZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEiJthF07Dhd9guFACsmUO1uBNYiWT7YGUmDQcsGIv3q5OK9nm0MXRvOMGGMvPKii
	 k9E8JkMz1RMoPqkf4cM4QySGvCjiR8WrLo7s4z6N1+sfpITb1jun0eKslKA2VQo4L0
	 MMHFC3z1RDZrcHOtcgC/usF5ZejdDFOZJUHCUaJA=
Date: Thu, 3 Nov 2022 01:40:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] staging: media: atomisp: make hive_int8 explictly signed
Message-ID: <Y2MOFrprCkZVAiCr@kroah.com>
References: <20221103001914.81849-1-Jason@zx2c4.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103001914.81849-1-Jason@zx2c4.com>

On Thu, Nov 03, 2022 at 01:19:14AM +0100, Jason A. Donenfeld wrote:
> The current definition of hive_int8 is a naked char, without any sign
> specifier. This is incorrect on platforms such as arm, where char is
> unsigned. Fortunately nothing in the kernel actually uses a hive_int8
> type, but in case it gets used later rather than removed, this makes it
> explicitly signed.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Greg - if you're going to take this for 6.1, that's fine with me.
> Otherwise, if it's for 6.2, I'll take this in my unsigned-char tree to
> keep all of these fixups together. -Jason

I don't take drivers/staging/media/* patches, they go through Mauro's
tree, so I'll let him and you fight it out here :)

thanks,

greg k-h
