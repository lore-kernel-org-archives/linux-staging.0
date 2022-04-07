Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9BB2570;
	Thu,  7 Apr 2022 18:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9239EC385A4;
	Thu,  7 Apr 2022 18:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649356123;
	bh=KXuI+L3w9Z+hWbCVUNJjBVgqsQdywLD3Cgb4k1A4MyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSTmqpdXdMR4dTBSJzbShdzgRXW9GFkSV2irjpwGelaRuzHAyMbxykVvNPt4aHEBF
	 RfiTzGNF8wCVVZmS2mZbn+j2of8xoZxxZTHxzxGzn/BomOuW423R2HueDdq1gdIqSq
	 PgXjawVP5VpA6hV4s7JpUM1lmJ67/18AKuOSSTBE=
Date: Thu, 7 Apr 2022 20:28:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
Cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8712: remove unnecessary parentheses
Message-ID: <Yk8tVxot2znwyWLm@kroah.com>
References: <20220407125947.8525-1-eng.alaamohamedsoliman.am@gmail.com>
 <Yk8jbTSjvsHXpX2U@kroah.com>
 <96a1de63-5b66-b6a6-731e-d7263f3328a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96a1de63-5b66-b6a6-731e-d7263f3328a5@gmail.com>

On Thu, Apr 07, 2022 at 08:02:37PM +0200, Alaa Mohamed wrote:
> 
> On ٧‏/٤‏/٢٠٢٢ ١٩:٤٦, Greg KH wrote:
> > On Thu, Apr 07, 2022 at 02:59:47PM +0200, Alaa Mohamed wrote:
> > > Reported by checkpatch:
> > > 
> > > Remove unnecessary parentheses around structure field references
> > > 
> > > Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> > > ---
> > > Changes in v2:
> > > 	- Edit commit subject
> > > 	- Edit commit message
> > > 	- Fix the same check in more lines
> > > 	- Remove space before '.skey' in
> > > "memcpy(psta->tkiptxmickey.skey," in lines 84 and 86.
> > > ---
> > > Changes in v3:
> > > 	return the space before '.skey' in
> > > "memcpy(psta->tkiptxmickey.skey," in lines 84 and 86
> > > ---
> > > Changes in v4:
> > > 	edit commit message to be clearer.
> > > ---
> > Why did you send this patch twice?
> That was by mistake , sorry

When you do so, please let us know which to take, as it is hard to know
if there was a difference or not.

Realize that for some of us, we get hundreds of patches to review daily.
Being obvious as to what to, and not to, ignore, is helpful.

thanks,

greg k-h
