Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB84370D45;
	Wed,  6 May 2026 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051656; cv=none; b=m6EhRQGboTFnuOyxDLr+TmDqKpHtdDbmL9ARQGeYiPbp8qjFN7rrKjKu8hnm7MfKYffNVkxb61MzRANDw79U0Fmwl3zpoC+GF2bf7UM+o4T1dPHswO+Or7oQ1twNwcoMwNwa3eJnqBoqwoddZJFCZV+fylwgpejHZFyiqbcVjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051656; c=relaxed/simple;
	bh=vtIkiSWfxRkPEyv05CMtAYn2ynQAD8wup7kuijMa85I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2tdAIfK+hKw+k2eki7SFBzJCvWklzwYFz4KxK7Q1AJKzDmFVcen8yGXoXgoN/EE1XvYHLZO0A6wIHPXp+5pkbBRraN86QY4bnbalOROXHHVxvoYkoZC+ktlPg6gZh4yYEUjMGUnr9Q5vPwsCR+PQs0W4ItT50cSrDZtFRiKHRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g4JhqEEF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g4JhqEEF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01004C2BCB8;
	Wed,  6 May 2026 07:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778051656;
	bh=vtIkiSWfxRkPEyv05CMtAYn2ynQAD8wup7kuijMa85I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4JhqEEFeQpjM5Oh1S8z3aUurdeqhxEZ74x2AxaiS5oHQisO7cA0VbKoYtMurcZC7
	 omCd66wEWTT5LwbqIhpinSzY8Jzpc14HnHxSQ8nz1TW2QqYq7mHwvpvwvSlA7M/cju
	 ZGYwFJbbiPHMijloiGmlHcsXqcR2wJh3jOOf2/no=
Date: Wed, 6 May 2026 09:14:13 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-staging <linux-staging@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary comparison to
 true
Message-ID: <2026050625-counting-paprika-7198@gregkh>
References: <19dfbab05a8.2d751ade4111.3028810368318669188@zohomail.in>
 <2026050614-roster-walrus-6995@gregkh>
 <85d6c003-500f-41a6-a9e1-ad83a586d694@zohomail.in>
 <2026050626-blinked-armadillo-c405@gregkh>
 <19dfbf2f695.283866a26574.4001086986822756666@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19dfbf2f695.283866a26574.4001086986822756666@zohomail.in>

On Wed, May 06, 2026 at 11:51:37AM +0530, Ashwin Gundarapu wrote:
> On Wed, May 06, 2026 at 10:33:02AM +0530, Ashwin Gundarapu wrote:
> > Remove explicit comparison to true in check_fwstate() call and
> > add spacing around the bitwise OR operator to improve code style.
> >
> > Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> > ---
> > v3: Fixed double --- line and corrected whitespace formatting as
> > requested by Greg KH.
> 
> Changes from v1:
> - v2: Resent with corrected whitespace via Thunderbird plain text mode
> - v3: Fixed double --- line and corrected whitespace formatting
> 
> The original v1 was sent from Gmail web client which corrupted tabs
> to spaces. v2 attempted Thunderbird plain text. v3 fixes the double
> --- separator and uses Zoho webmail plain text which preserved tabs.

This all needs to go below the --- line.

Please add it to v4 when you resend that in a day or so.

Also realize you did not run your patch through checkpatch to verify
that you did not add any issues with your change :(

thanks,

greg k-h
