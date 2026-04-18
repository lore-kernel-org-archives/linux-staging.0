Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BC7314A83;
	Sat, 18 Apr 2026 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776497884; cv=none; b=HocfGxAn576glP/l46EzIs7Czq6KuCxOvESwjm0YHMbtwbU3Q940fsnuy3ielooMeCVWyhsMObebYXV0ZxCA6G8deR+cHE1UXy6Y4ch6jMV0qPjnZl0Z2OV/ibYSPvz2jwXfdlH/MQf8dfHo+Br62w74bkWkYAHMgyBsX0Du0Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776497884; c=relaxed/simple;
	bh=6JEkWNz8FY0l3WaJK/2ArFSllUBDQVanW4T5/DrMN1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8+twh1NaCfUWCrI749ONOFV4FInmOx1X3V3EoOy1AX0txkzRC2oMtu98yhodDrasy/8/vAx/TCrRCiogaXCoVwwkgNMgpnVjFNpsPGR4EEfCXgD4StYdCcdA3+fOhu6wiivVbMFdePBktTCu4q6ob5PVF8phqLPnhrAkYIhVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k7kQiHj1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k7kQiHj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C5AC19424;
	Sat, 18 Apr 2026 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776497884;
	bh=6JEkWNz8FY0l3WaJK/2ArFSllUBDQVanW4T5/DrMN1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7kQiHj1ld3yuzJN34k0BoSsDpwcf9I4L04A5OJdedb8uFIIoz6gI47OBEbGB+0T2
	 gQRsffbY+JO7zxd67VREoSewh6XEIFocZmPTJ191cQYvajOtL74zh09VSU7Vp9iUc8
	 K7Og6GNWbRjvBLaHcYRjgJVuzoDAR4UAEslHUwc4=
Date: Sat, 18 Apr 2026 09:37:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: osdevhari@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix alignment issue in rtw_xmit.c
Message-ID: <2026041857-overpass-deepness-5a29@gregkh>
References: <CA+TGEkGJ4HaZZOVSXhkb93y9gdBZZf3e0G=zajdx9sAo4iBU5w@mail.gmail.com>
 <F7E0CC29-4E94-4759-9E3E-689AB61201F9@linux.dev>
 <2026041859-excretion-septic-b5a5@gregkh>
 <5182B112-74AC-4A7F-9D2D-79EA61B1983A@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5182B112-74AC-4A7F-9D2D-79EA61B1983A@linux.dev>

On Sat, Apr 18, 2026 at 09:29:40AM +0200, Luka Gejak wrote:
> On April 18, 2026 9:11:40 AM GMT+02:00, Greg KH <gregkh@linuxfoundation.org> wrote:
> >On Sat, Apr 18, 2026 at 08:57:08AM +0200, Luka Gejak wrote:
> >> Hi Osdevhari,
> >> Let's start from the top of the email. Firstly attachments are not 
> >> allowed, only plaintext. Secondly Signed-off-by tag must use your real
> >> name(Firstname Lastname <email>. Thirdly, you should setup git 
> >> send-email and use it to send patches. One more thing why did you 
> >> resend same email twice?
> >> Best regards,
> >> Luka Gejak
> >
> >Luka, please do not review patches like this, it is not the correct way.
> >Please do so, by not using AI results, and doing so in the in-line
> >fashion, like the style of what we do.
> >
> >And there is no requirement to use git send-email.
> >
> >Your email here alone has no context at all, making it impossible to
> >properly quote or respond to.  Please don't do that.
> >
> >thanks,
> >
> >greg k-h
> 
> Hi Greg,
> First of all it is not an ai response, and I didn't see need for 
> quotes because I didn't actually talk about code but if prefer quotes 
> at all times just let me know. And I suggested git send-email because 
> it is easier for sending patches without worrying about plaintext or 
> attachments. Also do you know how to get quotas from mailing list to 
> my phone without manually copy pasting and adding >, since I am not by
> my laptop right now and I don't know about something like lei for 
> mobile. Also to clarify I used such tone becouse he is a begginer if 
> that is what made you think this is ai review.

Please do not us a phone email client that can not properly handle email
quoting for reviewing new developer's patch submissions.  There is no
rush here, nor need to confuse them with a style that is not the normal
way of development we use at all.

In short, if you are going to do reviews, do them properly, in the
correct style, otherwise it just causes confusion.

And yes, the "tone" sounds like AI, please don't do that.

thanks,

greg k-h
