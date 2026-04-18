Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648A34CFBB;
	Sat, 18 Apr 2026 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776499525; cv=none; b=pNvZi2ffFWGPEurNwhg3GlhlSUYxenUTHxLozmjG0nHwx7ajGC4HEovzG83c4aTaI4p8IBVDoRrnyckf5nAlcpC1UOAlS4yyzaH/i7DdfCqn3r0Nv9V6Ujynf1KSvSWMJ10u/znG+lLL2xJ7MiyC0g+jyoIJW7JhjKJZBlez+kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776499525; c=relaxed/simple;
	bh=CPVcr7hun6q1wW0CZCUdJ6pwgHATGatgVkTwRUSOss8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roPyLt8P8Kuyy84gvMgorHwqyUW2Z1CApEG7ZFSKD2wXroD9NylxGBXACMP/wrlW9cGmdxCe5HUw0KFtzu0rhmGQcfcWrujnf12kQPGWrnuAEjUk547iWwQowyGTSxP01px0ER1FE76SEZEAIi3/ABplXCnKs63f19hqfhfqQi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l8bWvqzg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l8bWvqzg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942B2C19424;
	Sat, 18 Apr 2026 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776499525;
	bh=CPVcr7hun6q1wW0CZCUdJ6pwgHATGatgVkTwRUSOss8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8bWvqzgC+DubIn+GxG/WrTPvNULmmB4407Tn1ecykoQnTfqRXvvAaGtrna4lKxX5
	 vfvtCZHCZWuG5YHcYopxwWP/Kzn12sxSOUKa0mVwGXbugfqyFbkOjKxKkzUCeI1jI4
	 4aoNax6jVSAO0hmJuLAIX6Bw8N73G+fqpX890WI4=
Date: Sat, 18 Apr 2026 10:04:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: osdevhari@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix alignment issue in rtw_xmit.c
Message-ID: <2026041838-unworldly-mushily-1377@gregkh>
References: <CA+TGEkGJ4HaZZOVSXhkb93y9gdBZZf3e0G=zajdx9sAo4iBU5w@mail.gmail.com>
 <F7E0CC29-4E94-4759-9E3E-689AB61201F9@linux.dev>
 <2026041859-excretion-septic-b5a5@gregkh>
 <5182B112-74AC-4A7F-9D2D-79EA61B1983A@linux.dev>
 <2026041857-overpass-deepness-5a29@gregkh>
 <FDF5583E-F2E0-4932-9243-526758230803@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FDF5583E-F2E0-4932-9243-526758230803@linux.dev>

On Sat, Apr 18, 2026 at 09:44:20AM +0200, Luka Gejak wrote:
> On April 18, 2026 9:37:32 AM GMT+02:00, Greg KH <gregkh@linuxfoundation.org> wrote:
> >On Sat, Apr 18, 2026 at 09:29:40AM +0200, Luka Gejak wrote:
> >> On April 18, 2026 9:11:40 AM GMT+02:00, Greg KH <gregkh@linuxfoundation.org> wrote:
> >> >On Sat, Apr 18, 2026 at 08:57:08AM +0200, Luka Gejak wrote:
> >> >> Hi Osdevhari,
> >> >> Let's start from the top of the email. Firstly attachments are not 
> >> >> allowed, only plaintext. Secondly Signed-off-by tag must use your real
> >> >> name(Firstname Lastname <email>. Thirdly, you should setup git 
> >> >> send-email and use it to send patches. One more thing why did you 
> >> >> resend same email twice?
> >> >> Best regards,
> >> >> Luka Gejak
> >> >
> >> >Luka, please do not review patches like this, it is not the correct way.
> >> >Please do so, by not using AI results, and doing so in the in-line
> >> >fashion, like the style of what we do.
> >> >
> >> >And there is no requirement to use git send-email.
> >> >
> >> >Your email here alone has no context at all, making it impossible to
> >> >properly quote or respond to.  Please don't do that.
> >> >
> >> >thanks,
> >> >
> >> >greg k-h
> >> 
> >> Hi Greg,
> >> First of all it is not an ai response, and I didn't see need for 
> >> quotes because I didn't actually talk about code but if prefer quotes 
> >> at all times just let me know. And I suggested git send-email because 
> >> it is easier for sending patches without worrying about plaintext or 
> >> attachments. Also do you know how to get quotas from mailing list to 
> >> my phone without manually copy pasting and adding >, since I am not by
> >> my laptop right now and I don't know about something like lei for 
> >> mobile. Also to clarify I used such tone becouse he is a begginer if 
> >> that is what made you think this is ai review.
> >
> >Please do not us a phone email client that can not properly handle email
> >quoting for reviewing new developer's patch submissions.  There is no
> >rush here, nor need to confuse them with a style that is not the normal
> >way of development we use at all.
> >
> It can do proper quoting but it takes a lot of time to copy it. If I 
> was cced I would have no problem using quotes on my phone either. I 
> use an app called acode in which I write emails(because of formating 
> and line length) and then send it.

Again, don't do things that are not helpful for submitters, there is no
need to do this without the correct tools.  Please slow down, these
reviews do not have to be fast as there is no deadline here at all.

> >And yes, the "tone" sounds like AI, please don't do that.
> >
> I understand and I won't do that anymore. I thought since he was a 
> begginer it would be better use such tone instead of being bold for 
> example as he would probably take it in differently.

No one likes being pandered to as current AI tools do :)

thanks,

greg k-h
