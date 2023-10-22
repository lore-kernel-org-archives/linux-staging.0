Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8CE17E6
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 11:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="afBYMa61"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2082FC433C8;
	Sun, 22 Oct 2023 11:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697973521;
	bh=7HLrsmOIb/DsMFPqh3P97aAYxVWou/9n9huI2vTErUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=afBYMa61PkdIdJQViO3od6LRZ597VUgJM5vacKWgQ8WKaLcu/TMmQRIecWLsg7uo3
	 yjMkTKg+c3aIPME85+ZxaMfsDQD/difEl/lB/H1Y4tj7gAYwmo/nDkaWx+cBMwzwyY
	 XYUBp21Y1Y7AxPg65QRciAxCDYrgZCWM82npfLUE=
Date: Sun, 22 Oct 2023 13:18:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumaran.4353@gmail.com
Subject: Re: [PATCH 1/3] staging: greybus: Modify lines end with a '('
Message-ID: <2023102217-irregular-accurate-a84a@gregkh>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
 <827f8417afa3943e8b71910a7ba88ea35614dd2c.1697969950.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <827f8417afa3943e8b71910a7ba88ea35614dd2c.1697969950.git.nandhakumar.singaram@gmail.com>

On Sun, Oct 22, 2023 at 03:39:28AM -0700, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> CHECK: Lines should not end with a '('
> 
> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>  drivers/staging/greybus/camera.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Subject line should be:
	"staging: greybus: camera: Modify..."
right?

thanks,

greg k-h
