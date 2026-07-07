Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298703DB65A;
	Tue,  7 Jul 2026 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422344; cv=none; b=Q06Y6VN7uvQ785CutQ8puUG4LU+TNyLnsEUhtSRTeStpy2xjOJY9uy5uEIegYQbX3O6WgFQOTE9SNgmVvTytg5gngDAqC9t4gGv+mEJ9/AFQn3qtZ22kkbcULiszyl569lDTF0rLy+lbu59yptlS9MSvO1meHqRmUVUIXBAzZAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422344; c=relaxed/simple;
	bh=8ED+SRWl96uQ+BaxlTnVyLlPyztEXNvszEvfGeJr9gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adEY66xlBCQ+cKweQGrrqgluSxwJkEmCkbweT/wCSwISa7BL1O68ZxUaEDJmGjODUYJmA+k+wrhHNaZXo3qCsTtJBJWc7MYA2wuQXnsNQ7UuCLiBleUugo9rh5hPA3pjfMFRgvmz2NpLYOabRDrccebFiQ3ktNkzypc20jRbeFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jIw3kmlx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jIw3kmlx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1BE1F000E9;
	Tue,  7 Jul 2026 11:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422342;
	bh=r/rOnUX6X6x0tEKYqwyIt3g8/b8ro/y3z3HrIaVdsrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jIw3kmlxsZm5+9ZPg/+fqpvnIKRYf7hHTrXoQUZF9cvXL2an1sQDENvoEScaDpQjg
	 hnbaa4L+Wg9SWVc4aDN2hwQqIy3v1bwVqynbLQi5ZMp9XzmgtV9J8OH18zlC5wObjU
	 Xpbqm26v3D/kiYky9Ea+BftBXkUo3XZNVuIT/hFE=
Date: Tue, 7 Jul 2026 13:05:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace beacon timing magic numbers
 with named constants
Message-ID: <2026070714-presume-spider-a28b@gregkh>
References: <aiGMXBNQ0TbIGbpP@stanley.mountain>
 <20260604151828.242801-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604151828.242801-1-inasj268@gmail.com>

On Thu, Jun 04, 2026 at 04:18:28PM +0100, Jad Keskes wrote:
> Decompose the beacon timing magic numbers in
> rtl8723b_InitBeaconParameters() into named constants with bitfield
> expressions to document the register layout.
> 
> REG_TBTT_PROHIBIT (0x0540): The value 0x6404 splits into hold time
> (0x64) in the upper byte and prohibit setup time (0x04) in the lower
> byte, in 32us units — matching the layout used in the rtw88 driver
> (WLAN_TBTT_HOLD_TIME << 8 | WLAN_TBTT_PROHIBIT).

Where did this info come from?

> 
> REG_BCNTCFG (0x0510): The value 0x660F follows the same bitfield
> layout as the adjacent EDCA AC parameter registers:
> AIFS = bits[7:0] = 0x0F (disables contention before beacon Tx);
> CWmin = bits[11:8] = 0x06; CWmax = bits[15:12] = 0x06.
> This layout is confirmed by rtl8192cu which writes 0x66FF (test chips)
> and 0x660F (normal chips) — only AIFS varies, the CW byte stays 0x66.

Same here, where did you get this information from?

Did you use a LLM for this change?

thanks,

greg k-h
