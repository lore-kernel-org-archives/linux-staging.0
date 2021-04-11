Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2290970
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 06:40:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EC05610A7;
	Sun, 11 Apr 2021 06:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618123257;
	bh=ez2/qmN7ucaZmOhlZErFDvgVp7Q+SCQWNUwCs8UCI/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1Ernrul8z79N88iBRqTlSVtfZcPYCAuMf12yJQfY2+brSaHO/+UyZdMurBDljaRAb
	 x1SPuyU56YBRGpYtrv/YgViZLW57CtN2/pBPOEaTgMefzZ4Jiaj44Rrnl3pHB56df/
	 d6XZg/SfgKaS5OvN8JialWFp5qppar0T6xfyKESo=
Date: Sun, 11 Apr 2021 08:40:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v2 2/5] staging: rtl8723bs: include:
 Fix misspelled words in comments
Message-ID: <YHKZ99v1FOmDem4L@kroah.com>
References: <20210410150008.5460-1-fmdefrancesco@gmail.com>
 <20210410150008.5460-3-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410150008.5460-3-fmdefrancesco@gmail.com>

On Sat, Apr 10, 2021 at 05:00:05PM +0200, Fabio M. De Francesco wrote:
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---

I can not take patches without any changelog text at all, sorry.
