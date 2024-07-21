Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B5B1396
	for <linux-staging@lists.linux.dev>; Sun, 21 Jul 2024 05:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721538485; cv=none; b=hMYhgspzty6RmoDb9sLE3/GHlif37krtUdNPSZ4AK8DS6KXsdS+pM9DcuqMnByaEGXlJg99PS4pSfT45kLKncjQp0/8SCXnc6EBnQ0ffTxPqur3+qt/y8+4rPMJq4FmkT6ZnfsdMaF2mYZskobS/WA7t6pxeYDg1wspjqo/lFhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721538485; c=relaxed/simple;
	bh=/qfp6haoxAp+P7/rXPVQmI0NbGclWMRTGo2HusJhrNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtQc3bUOjFOFbvZn9f7OOhUEAkYn1KbVz8JFOguYonkdV+mwVbOGsfkM7WBODiT6xW/TnL+a31VPMWOuUOAxoPGHwaEPOXUYnKPPnS1safOuIY3+VU4BwmPPdbYav3MMD64jFjf/PzlnuB5ShftNYceNXMy04TnX5RU3uEdANsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dF+bAA+g; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lSVpkj6q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dF+bAA+g";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lSVpkj6q"
Date: Sun, 21 Jul 2024 07:07:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1721538473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwIIFGkpInLoq4kIWlRrj8tQsUMA/+OSQAqT4PqbkmQ=;
	b=dF+bAA+gADPkuECW3VJiPXHiRypSxFAs+y5ahF3Hz/SLx3QDFzprqo4jO7kfwSKk0/+xQf
	+koQ9x+UNGyzrvKhpqicajL/1LdyrIpdYuhL4VYvIXz2ETuL8mSYuuGUe0aplNzjGIdW0t
	6qHkkLz9tV/seBa9Z8RlEzsWZ24RR1QKdlaS42XoQ51hZp3ScwM3xF1NmTo5pIgb5VaJdO
	f3wlAZfVn7w7HPvpErx49ceZ+wu/4ETn/NfdLhpYF/oN3GYj2DNzYpuniICehm4T+J9Hrc
	A40yS7GWSgtYQzsxSjb5quV+MHbjwnVF9G1FHONFeRvmCe4yrgCjleg9XWyWkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1721538473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwIIFGkpInLoq4kIWlRrj8tQsUMA/+OSQAqT4PqbkmQ=;
	b=lSVpkj6qSY62AUlFJS/TgkGwff3boI1FpfMscZNnWqYBKzKqcfFTFGGVT/VxFA3QuA5iVa
	BgM7uNlJiUlzJBDQ==
From: Nam Cao <namcao@linutronix.de>
To: =?utf-8?B?66y47Jew7IiY?= <yyyynoom@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org
Subject: Re: [PATCH v3] staging: rtl8712: style fix multiple line dereference
Message-ID: <20240721050717.dQ7Kwrkh@linutronix.de>
References: <20240721040504.1483-1-yyyynoom@gmail.com>
 <CAAjsZQzTMtsX4bVqadG1ZKDt+8XLUOHGt0bkoBS+M8vqw-X5Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAjsZQzTMtsX4bVqadG1ZKDt+8XLUOHGt0bkoBS+M8vqw-X5Bw@mail.gmail.com>

On Sun, Jul 21, 2024 at 01:43:37PM +0900, 문연수 wrote:
> 2024년 7월 21일 (일) 오후 1:06, Moon Yeounsu <yyyynoom@gmail.com>님이 작성:
> > From: Moon Yeounsu <yyyynoom@gmail.com>
> >
> > It fix the following checkpatch.pl warning:
> > Avoid multiple line dereference - prefer %s
> >
> > Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Signed-off-by: Moon Yeounsu <yyyynoom@gmail.com>
> > ---
> > v2: Fix email address and checkpatch.pl warning
> > v3: Fix incorrect commit index, start with new thread for new version of patch,
> >         place notes below the cutoff line, provide appropriate CC,
> >         include 'Suggested-by' sign for those who gives good guideline.

The "Suggested-by:" thingy is for patch idea, not for "guideline". Have a
look at Documentation/process/submitting-patches.rst.

...
> Sorry and thank you to all of the reviewers and maintainers who take
> care of my patch.
> I make a new problem... I think I check my patch and email over and
> over and over.
> but, again, I sent the patch incorrectly. The body of the patch
> contains improper content,
> and also sends the email as my nickname, not a real name.
> 
> Sorry for making spam and taking your invaluable time.
> Next time, I'll send a right and valuable patch.

Oh no worry, I'm sure people are happy to help. Linux's email-based
workflow is not the easiest to get right.

If you worry about "making spam", you could send the patch to yourself and
try "git am" the email. If it works then send it out for real.

Good luck,
Nam
