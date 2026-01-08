Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF7A352C3D;
	Thu,  8 Jan 2026 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871042; cv=none; b=GpwLYzuegXMEXAfYh235pVe9hb3Skv/jLiKJ/3/+FsfIRAdSMr7QvibxBI3OQG/50ZtzS4ZEaGTQG1UVQfEgEFNlfza3HbeYTJrVi6odN2OldT4rtsV7HgUzzbTgGtB9ROq0l8sdCsy6zVvtURuHQ6XSdmk7y823Zd2ZuPYgTN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871042; c=relaxed/simple;
	bh=8HmUY6jU1/tE0JqNSMsK4tHgMTYr3KfrhOzzyfGYcPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAAH09Y/XyaDmDp28FiFTs1mevsfxZioKnqOVb5SaE+PSxrKkn5EYpC2hnUaPI8CeRcBuXbAUUSHJyaPAlJVetr3LwGr7F6egRe3fWRXYvS1QMH99DyA8pEFMGIIoTD+7CrSHM/n7NXTg9FLAn/KvM/slV49VgAR0fqrZghIVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bjwc2oVj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bjwc2oVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FAFC116C6;
	Thu,  8 Jan 2026 11:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767871042;
	bh=8HmUY6jU1/tE0JqNSMsK4tHgMTYr3KfrhOzzyfGYcPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bjwc2oVjojoN76nHdHUnXexW2yKCXvwiceNeK6vqlyp+9Wge8FtwXT1ZBTX9s0VZB
	 VdBBwNrCy/49NfA8OWtGnTwfagidS9mOb/SIq8IgeB5KcMYsgn4RTUS1AuNnOjU3U/
	 XQ0QqIqDWc1mGHcDEAhamvXbPRCfv0pkxaI6Xhww=
Date: Thu, 8 Jan 2026 12:17:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
Cc: rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: lights: avoid NULL deref
Message-ID: <2026010824-debtless-junior-4d18@gregkh>
References: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
 <20260108110351.27771-1-chaitanyamishra.ai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108110351.27771-1-chaitanyamishra.ai@gmail.com>

On Thu, Jan 08, 2026 at 04:33:51PM +0530, Chaitanya Mishra wrote:
> Hi Greg,
> 
> Found by manual code review while walking the error paths in
> Gb_lights_light_config(): channels_count is set before channels
> allocation, but cleanup uses channels_count to iterate and dereference
> light->channels. If kcalloc() fails, that becomes a NULL deref.

Might I ask why are you manually reviewing the error code paths of this
driver?  Do you have this hardware somewhere?

> Fix is simply deferring channels_count publication until after the
> allocation succeeds; v2 includes the requested comment.
> 
> Tested with:
>   ./scripts/checkpatch.pl --strict -g HEAD
>   ./scripts/checkpatch.pl outgoing/0001-staging-greybus-lights-avoid-NULL-deref.patch
> 
> I couldn't build-test locally on macOS due to missing <elf.h> for
> kernel host tools.

For obvious reasons, sending out patches that you didn't even build test
is probably not a good idea :)

thanks,

greg k-h
