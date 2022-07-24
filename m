Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737C33C3
	for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 16:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9800C3411E;
	Sun, 24 Jul 2022 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658679519;
	bh=nDB+o49XcTpu/QVchsj6bZI0yKCqaAixiuirPza3+48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJzeNwXBJ0O8+CNaWnyB44zQJf7QVtC/EXMa5JFo1E2JZX2Oy1I5mQBuFjEHPC1gu
	 jGwTxtO+RXLhvqc00dBcjmlHdeqkME4UHAX0gQ7QGMM4+Ki9/gQCh3wmAhKcjMSSCv
	 4cpwm1I/jaebiho4+BwZ/ksOJsCprRSBjSCbsNAQ=
Date: Sun, 24 Jul 2022 18:18:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: handle errors from
 ReadAdapterInfo8188EU
Message-ID: <Yt1w3MvAI7M4rKbD@kroah.com>
References: <20220724161405.146488-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724161405.146488-1-martin@kaiser.cx>

On Sun, Jul 24, 2022 at 06:14:05PM +0200, Martin Kaiser wrote:
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -332,7 +332,8 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>  	rtl8188eu_interface_configure(padapter);
>  
>  	/* step read efuse/eeprom data and get mac_addr */
> -	ReadAdapterInfo8188EU(padapter);
> +	if (ReadAdapterInfo8188EU(padapter) < 0)
> +		goto handle_dualmac;

You threw away the error returned to you here, why?  Shouldn't it
propagate upward?

thanks,

greg k-h
