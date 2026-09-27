Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC01318EC7
	for <linux-staging@lists.linux.dev>; Sun, 27 Sep 2026 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790527167; cv=none; b=BZJXvCdVjatQ4Qrk6edouO2CuiDTJ4u44oRZyS42ey/IqoqKswrdKbXumJQERmFVYrhTO1rsJz3IicXC9hBYCkNehWk1+0Q8UFW98NlQ8srr+IR4h7hQHyivOopA8z7/6UdbKLSOPJypZDr0iWgO5/vtw75hfDUfErTruTw51Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790527167; c=relaxed/simple;
	bh=EmDExyIl1h5rwq6kZWiI3apXZpDkj0Wls+pjdJoy9zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ope3xNO9h4WcR0vXbXZnS54EJxEG80LDs+kC3G5pmyNcYUA/Ka7ojEGlygsRotDRpJV7Mj6KN0GWGnh8HVqx1pMYLOtm6lk2tdsZ6nl304XB3DVEA0t+1TLLPaqgVsSPr3IHaCvufktKY9CsFuKVzsbBs/YASG3hyP9MfQ61Q5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WxdcYfDW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WxdcYfDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B161F000FF;
	Sun, 27 Sep 2026 16:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790527165;
	bh=AWUg+a0Ed0UIbcpGCFnjRrPkG2bYfCNM3r5wEu0AvE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WxdcYfDWKK+cYlsoPZpg5qCnmyc7plSI8WI8/GB9zrZU1dK1SsTY409+TOKRDLFLk
	 cjpZy/zZb6P0FyrGmCVX9WwcnvghW1wTkwtROghDdVJSpodW9iHGNQosbgicbg6iqB
	 w71gvAG9Qu8n1yu67pOassgS78ObqklrqJGeUyBA=
Date: Sun, 27 Sep 2026 18:39:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace custom uint with standard
 unsigned int
Message-ID: <2026092747-happy-credibly-5b5e@gregkh>
References: <20260927111632.50423-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927111632.50423-1-work.ashmitkumar@gmail.com>

On Sun, Sep 27, 2026 at 11:16:32AM +0000, Ashmit Kumar wrote:
> The TODO file for the rtl8723bs driver specifies converting unusual
> variable types. The driver was extensively using the non-standard
> 'uint' type.
> 
> Replace all instances of 'uint' with the kernel standard 'unsigned int'
> across the entire driver. This improves code readability and aligns
> with the Linux kernel coding style guidelines.

That's not a good idea.  Do this slowly, and pick real variable types
for this.  Don't just do search/replace, otherwise we would have done
that a long time ago.

thanks,

gregk -h
