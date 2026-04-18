Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985F834CFD0;
	Sat, 18 Apr 2026 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776496333; cv=none; b=uSWB55+SfSVUVb6L7e48PmJSRszbn5E77vzYreMKiIkx+AkvGMTnMVUGCbIphinkhl6m3W2UeUaZqWbqnLlR9cvi0d5tYHvIhuefGPCjdBJUGVlHjno/zCnPqIK2Ml1rYomWwwo0mIlVSLRhC5YVrINV7Zvvqk/FoxJVWJRT9O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776496333; c=relaxed/simple;
	bh=4FVK6m9rlAwZ/CKGypJFB/Khj3D3V/iZ/yN64E2EE3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ibc+yo5Ij53EFnuEHdHHLN0wu9ep3P5HVTGZwgfNFx4ibulB9qrvzOEfiMW6a0SFQKNZ3JfaIb1lsswSdnxP8EkT2seGpm5L6+Q6+8aI/qa6JSs/gdz0veSxmd5JdOdh/CHCXYGO1CXOWS8b1Cd+ey6hF+ngewfBLnfyQbaDlkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PtJS6Ipf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PtJS6Ipf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD989C19424;
	Sat, 18 Apr 2026 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776496333;
	bh=4FVK6m9rlAwZ/CKGypJFB/Khj3D3V/iZ/yN64E2EE3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtJS6IpfqZr8lBUa8wEntE00oGRfl2bMFI3xAcvPddx8GRtgVTHsrBKwN8Y2S2k2L
	 k69uq9L6NgD19VxjxmJX3LwjqQHX3fIshLzwayhOLc+Z4RIf08YlkWrZ1SALe4Ey1q
	 eb3oZA9ZOu46TcSyEWRwqF8f6lz7Vp7l/zI/u9l8=
Date: Sat, 18 Apr 2026 09:11:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: osdevhari@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix alignment issue in rtw_xmit.c
Message-ID: <2026041859-excretion-septic-b5a5@gregkh>
References: <CA+TGEkGJ4HaZZOVSXhkb93y9gdBZZf3e0G=zajdx9sAo4iBU5w@mail.gmail.com>
 <F7E0CC29-4E94-4759-9E3E-689AB61201F9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F7E0CC29-4E94-4759-9E3E-689AB61201F9@linux.dev>

On Sat, Apr 18, 2026 at 08:57:08AM +0200, Luka Gejak wrote:
> Hi Osdevhari,
> Let's start from the top of the email. Firstly attachments are not 
> allowed, only plaintext. Secondly Signed-off-by tag must use your real
> name(Firstname Lastname <email>. Thirdly, you should setup git 
> send-email and use it to send patches. One more thing why did you 
> resend same email twice?
> Best regards,
> Luka Gejak

Luka, please do not review patches like this, it is not the correct way.
Please do so, by not using AI results, and doing so in the in-line
fashion, like the style of what we do.

And there is no requirement to use git send-email.

Your email here alone has no context at all, making it impossible to
properly quote or respond to.  Please don't do that.

thanks,

greg k-h
