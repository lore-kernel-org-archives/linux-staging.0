Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14D13D539;
	Mon, 20 Apr 2026 10:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679397; cv=none; b=tc5I2vvDFbQu9nDiEMkAcQLsYmVSD5BZOIWEu30c2Q3Wlmn6u1WHSihXe+XdToQAg+9XVl1dMm5m+fZoq3KLa0HfL4Fkr73wBtinMl7/Jdrmi94bT7shEsF4DIYe89URNABGEg0Tc1mTtIzf5nJSHtnBeYGeBDSutJaGj7pN5WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679397; c=relaxed/simple;
	bh=q6c4W4UgTmS03qq7YzkPl96j7Ihqfka/wO5Apk7qLPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGLMDAeV9NtQwPWIS7uBj7DH4t8AppNscqiWgrHZu6tC0O0DKger6MTYbfAINEScRExPxPpCMG7J6VkGcJAdoZE0vCtW6tTJ+uEb+cM67mee2BpSnKqCnP7ARIdU7s9XUWLZvG77kda8XbrVr7Wi4ZwSLpneVGBgKQh9CKN/XOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xKVzoM4d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xKVzoM4d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060C0C19425;
	Mon, 20 Apr 2026 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776679396;
	bh=q6c4W4UgTmS03qq7YzkPl96j7Ihqfka/wO5Apk7qLPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xKVzoM4dMsX5tsZoRIzv61EmiFZ6HofkbrA6gSSnxKLtVc0JrVB6zfmDXXRMMJnyg
	 PxrliOZyJ3AnECojc0RIY4yWowd+YPTMGILU2T5VxviLrzWZgpF4ud69/zJMvd7AH4
	 x1l7yRsRpO1Gdpv+DCcTv712YywhxRlroEPUd69o=
Date: Mon, 20 Apr 2026 12:03:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Minu Jin <s9430939@naver.com>, Ingo Molnar <mingo@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	linux-kernel@vger.kernel.org, Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>, Taegyu Kim <tmk5904@psu.edu>
Subject: Re: [PATCH v1] staging: rtl8723bs: remove shadowed bDumpRxPkt
 declaration
Message-ID: <2026042020-yodel-educator-1c7b@gregkh>
References: <20260420030543.72423-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420030543.72423-1-dbgh9129@gmail.com>

On Sun, Apr 19, 2026 at 11:05:43PM -0400, Yuho Choi wrote:
> DBG_RX_DUMP_EAP redeclares bDumpRxPkt inside validate_recv_frame(),
> shadowing the existing function-local variable. Drop the inner declaration
> and reuse the existing variable to avoid unnecessary shadowing.
> 
> Co-developed-by: Myeonghun Pak <mhun512@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Co-developed-by: Taegyu Kim <tmk5904@psu.edu>
> Signed-off-by: Taegyu Kim <tmk5904@psu.edu>
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 337671b1211f0..cf5698dda91fc 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1534,7 +1534,6 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
>  			precvpriv->rx_drop++;
>  		} else if (retval == _SUCCESS) {
>  #ifdef DBG_RX_DUMP_EAP
> -			u8 bDumpRxPkt;

If you trace this back, why is this variable being used at all?  Look at
how it is being used, and please explain the logic here.

Personally, I think this can be deleted entirely, but please verify
this.

thanks,

greg k-h
