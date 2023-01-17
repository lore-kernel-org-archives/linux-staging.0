Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9477D532
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 18:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A23FC433D2;
	Tue, 17 Jan 2023 18:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673980746;
	bh=vM2fqHktL0s7+JaqK1Vmzmomp2n2N/6TF7pZeT0CVy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Go7Tgsc9fvKPhQV3ISeb9wf27R/HrBG7OyXZiIYs+WoaiHmZaJOIozYkvjp9o+dJb
	 MtQrBcJU0IBs3tdMTWyaB5ishvDTLxVn67fOpFQAkPwoVwPvFD/B8bA6hV0M5usoe/
	 VcHDT8f/QYQ9VCZiCFQtbp9kOInkjDt1aoEogMdk=
Date: Tue, 17 Jan 2023 19:38:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/20] staging: r8188eu: pass struct adapter to usb_write
Message-ID: <Y8brJFAjan6DuhwF@kroah.com>
References: <20230111195640.306748-1-martin@kaiser.cx>
 <20230111195640.306748-19-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111195640.306748-19-martin@kaiser.cx>

On Wed, Jan 11, 2023 at 08:56:38PM +0100, Martin Kaiser wrote:
> The usb_write function takes a struct intf_hdl only to extract the struct
> adapter from it. We can pass struct adapter directly.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

This commit did not apply to my tree so I stopped here in the series.

Please rebase and resubmit the remaining ones.

thanks,

greg k-h
