Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF87B2F3A
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 14:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE8CC385A1;
	Tue,  5 Apr 2022 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649167927;
	bh=vH0lA9xexLl2Q4ZuTZMoUwtmOPngDKTGoM1yj3E7AVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PoOoCd+d0WwbV6Jw0bdOraI2w+PW3nl4cD7gFp54G3bjCCn96k4o+YouLinO4gfWk
	 N58RCT+ZEKDXRAhBk3qUOAd4KVPJGV9vRrlqsRRIfxiw+Q8nPB4XnfH3uEu5k9zMre
	 kPbSzlsFu4WExW6lobHz/ID1hNbbjndmzB5itutk=
Date: Tue, 5 Apr 2022 16:11:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] staging: r8188eu: remove GetHalDefVar8188EUsb()
Message-ID: <YkxOJ1YEEke2jcmM@kroah.com>
References: <20220405104910.9769-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405104910.9769-1-straube.linux@gmail.com>

On Tue, Apr 05, 2022 at 12:49:06PM +0200, Michael Straube wrote:
> This series removes the function GetHalDefVar8188EUsb(). This is part
> of the ongoing effort to get rid of the unwanted hal layer.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> v2:
> - remove dead code first
> - use better function names
> - make one function static
> 

Thanks for the changes, now queued up.

greg k-h
