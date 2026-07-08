Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA87439352
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522706; cv=none; b=SjcLFJHB+giloTKO2DFHlqQRRqobMxHrwc37ewM0Ppya+Gx9nEsMFvxasfYUqiXoWeBPbOj0Fhl4BQ1oDT8W34DiY5XJWAA5WLn46JaykZZbkEXcB9Xs2Zld7nK7xGcIQ5xv8VNEnjeQLXiAU6kGUev2SsSczTTPQHp/AmpeWDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522706; c=relaxed/simple;
	bh=Y7qu6BjeDcyhx8AeV8SErGo/uwIdzxKpbhMH/r2OZYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfcY0+xvb0nyA35a7PV+gC7+vaHZXVS2zx5llsa+MEN6cLX4HEmiNG/CKTM4743I9nmZ+c5SeC4JX169yTh5f3+6fl3ON3PNyI78NINGt9fisIYVP/kxw++isFDmt/g6mfiKSXdT9qhNNNIhPwv65THqJpRKI18w0mkrjsVA/zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QuN32O/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QuN32O/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53ECE1F000E9;
	Wed,  8 Jul 2026 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783522704;
	bh=rYNQwhAyJ12gsw1LhKuOPpG5KxtrFRr6ygtQFDo5JQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QuN32O/liGYI7TigRwgdfiVuwJAKcVUx+yg2Vgv0BXEr234FIJ6J0rgwaVCsJM5V3
	 0MLFgO+2QFOkA02iOKdvpTtndG8Nj1EmbLbmtr6VwiZ2SNDE3swJWtctqft14HOFwQ
	 P+Y7mrtNUuaS47CTwkY6+rSb9MIfcstFqgkcrWHA=
Date: Wed, 8 Jul 2026 16:58:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-staging@lists.linux.dev, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: rtl8723bs: replace beacon timing magic numbers
 with named constants
Message-ID: <2026070849-undoing-upright-f814@gregkh>
References: <aiGMXBNQ0TbIGbpP@stanley.mountain>
 <20260604151828.242801-1-inasj268@gmail.com>
 <2026070714-presume-spider-a28b@gregkh>
 <ak5bkRTGALDhBMAL@fedora>
 <2026070820-unclog-busboy-dad9@gregkh>
 <ak5fovHVro3YTh9m@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ak5fovHVro3YTh9m@fedora>

On Wed, Jul 08, 2026 at 03:36:23PM +0100, Jad Keskes wrote:
> On 07/08, Greg KH wrote:
> > On Wed, Jul 08, 2026 at 03:17:02PM +0100, Jad Keskes wrote:
> > 
> > <snip>
> > 
> > For some reason you sent this only to me, which is a bit rude to
> > everyone else on the mailing list.  I'll be glad to respond if you
> > resend it to everyone.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Apologies, meant to send that to the list. Resending:
> 
> Yeah, that info is from the out-of-tree driver Dan linked in the TODO thread.  

What thread?  Point to it please in the changelog.

> REG_TBTT_PROHIBIT has the same hold/setup layout as rtw88's WLAN_TBTT_HOLD_TIME / WLAN_TBTT_PROHIBIT.
> 
> REG_BCNTCFG — check rtl8192cu in the tree. Same register, same 0x66 CW byte. 
> Production writes 0x660F, test chips write 0x66FF. Only the AIFS changes.

Great, document this and where you got the info from in the changelog so
that it doesn't look like you just made it up out of the air :)

thanks,

greg k-h
