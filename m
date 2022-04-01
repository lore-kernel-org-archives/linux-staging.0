Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C6EBF
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 05:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEDEC2BBE4;
	Fri,  1 Apr 2022 05:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648792794;
	bh=qCcMx9byE4xfXIPUK4SlECAw5kqRNKP8ujTTBZIIvaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7FGfiGuBqwAGGnebrpzucqN/fxAvqT2KNhOzs3rlSnhqM4tMsQKxV/xWzOP4jw31
	 CQ2ZyDyKXRRb81fKUCT+GbqRQaaxtN+WYhxVjYXTxTfeniOemoZcE7vlTEwSV6A0c4
	 BcW7RgBfnwLxCdXHRpUVV6gFvQ+5MsC4sgSFP6pI=
Date: Fri, 1 Apr 2022 07:59:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] staging: r8188eu: remove GetHwReg8188EU()
Message-ID: <YkaU11B4MV3EE9oP@kroah.com>
References: <20220331130522.6648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331130522.6648-1-straube.linux@gmail.com>

On Thu, Mar 31, 2022 at 03:05:17PM +0200, Michael Straube wrote:
> This series remove the function GetHwReg8188EU(). This is part of the
> ongoing effort to get rid of the unwanted hal layer.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (5):
>   staging: r8188eu: rename clear_bacon_valid_bit()
>   staging: r8188eu: remove HW_VAR_BCN_VALID from GetHwReg8188EU()
>   staging: r8188eu: remove HW_VAR_CHK_HI_QUEUE_EMPTY from
>     GetHwReg8188EU()
>   staging: r8188eu: remove HW_VAR_FWLPS_RF_ON from GetHwReg8188EU()
>   staging: r8188eu: remove GetHwReg8188EU()
> 
>  drivers/staging/r8188eu/core/rtw_cmd.c        | 14 +++----
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 14 +++++--
>  drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 19 +++++++--
>  drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  6 +--
>  drivers/staging/r8188eu/hal/usb_halinit.c     | 40 -------------------
>  drivers/staging/r8188eu/include/hal_intf.h    |  4 --
>  .../staging/r8188eu/include/rtw_mlme_ext.h    |  3 +-
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  4 +-
>  8 files changed, 39 insertions(+), 65 deletions(-)

Nice work in getting rid of that mess!
