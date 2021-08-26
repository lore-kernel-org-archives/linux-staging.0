Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF5A3FC2
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:38:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40EDE6108E;
	Thu, 26 Aug 2021 10:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629974282;
	bh=VnfV2BVfaslmfYlEK9+6jV7Vwu0OBzuNc8ALqlT2AFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwOz/TevojjD8DdKYxYawLvUrvisCvSXi04MS1ScZJ5Rv12spUOBsDasy94UmBdNp
	 boT9NA9h8zelDFzIcLjX3OUipPoPj0WJ1y0sGQCdgVmTTMYLiWpu9mLesJ1Qli4Bhv
	 qYO9WaBVpkGHUuRbICn5IyFF0eL0EYZpZY4UV/tw=
Date: Thu, 26 Aug 2021 12:37:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] staging: r8188eu: add helper macro for printing
 registers
Message-ID: <YSdvBlNlScsuPnbz@kroah.com>
References: <cover.1629789580.git.paskripkin@gmail.com>
 <84e388b0eaaf3c56f575216b0571318ed799a4d2.1629789580.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84e388b0eaaf3c56f575216b0571318ed799a4d2.1629789580.git.paskripkin@gmail.com>

On Tue, Aug 24, 2021 at 10:27:20AM +0300, Pavel Skripkin wrote:
> There are a lof of places, where DBG_88E() is used to print register
> value. Since following patches change _rtw_read*() family
> prototypes, we can wrap printing registers into useful macro to avoid
> open-coding error checking like this:
> 
> 	u32 tmp;
> 	if (!rtw_read(&tmp))
> 		DBG("reg = %d\n", tmp);
> 
> So, added DBG_88E_REG{8,16,32} macros for printing register values.

No, please work to remove these messy things, do not add new ones.

Why is this ever needed?  And if it is, use the correct in-kernel debug
functions please.

thanks,

greg k-h
