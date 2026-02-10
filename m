Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2396813D638;
	Tue, 10 Feb 2026 05:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770699632; cv=none; b=AUUq3CYzgNO9D+nvLHoc8GFJeiAmHkctypmpUQCXPrPDoeRm/hYlIY+AE8VTqKVvFKvObGD2eSZ/VZx65RMHPRqUZ+GzcrymrdtTmOvA8gv7vwrtTBvSSjNf4ntm8ktaelAk1fFcB4G1Xsihlg/z48+s/8KUzkJmLBVdPasGyGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770699632; c=relaxed/simple;
	bh=K92GriUYHVp+OLNZi8rq9kJFAmorRHepfWl9W4TtgAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Es7U/VEJilh5qN5LEGMuP8mgeAqG6nSwSWqejLlismP/u7OBBFfKpQdwRz6VmXfD16mtwEosC8IN9BfQbmrG31i5Pc/CmC36dIOV2RQ7Fn/GVD1BbxqaG1sUEJ6rKDZ1ej5FeHHcF+hTTFsbrCQ6UFD6CLmYUy9buNN1wtjU8nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FKUvI4Qh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FKUvI4Qh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C157C116C6;
	Tue, 10 Feb 2026 05:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770699631;
	bh=K92GriUYHVp+OLNZi8rq9kJFAmorRHepfWl9W4TtgAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKUvI4QhVUfIwRrr6Le9fykl44Ykm7NUwBoq5SR7yV2glcGlOuYQ7Ijvn+PrZoYx3
	 ZFXa6rtBJKfKY3ag/oYu4MpMxv58aoOQfhPW4Q2puCYoP+OlJkonlSpiFqLmcVYw2j
	 lYfFxdluPx/PbUtwPiDQhv1r5dg2UMMcvvkapKOc=
Date: Tue, 10 Feb 2026 06:00:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Siwanan Bungtong <horstaufmental@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] staging: rtl8723bs: rtw_ap: remove unnecessary void
 * casts
Message-ID: <2026021059-overflow-quilt-e0a3@gregkh>
References: <20260209235133.1292161-1-horstaufmental@gmail.com>
 <20260209235133.1292161-2-horstaufmental@gmail.com>
 <DGAXL0XT4SHU.2S7DS74PUMEKD@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGAXL0XT4SHU.2S7DS74PUMEKD@gmail.com>

On Mon, Feb 09, 2026 at 08:37:08PM -0600, Ethan Tidmore wrote:
> On Mon Feb 9, 2026 at 5:51 PM CST, Siwanan Bungtong wrote:
> > Remove redundant (void *) casts when calling memcpy/memset and
> > other helpers. These casts are unnecessary since C implicitly
> > converts to void * and they only add noise.
> >
> > No functional change.
> >
> > Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
> 
> Hi,
> 
> You don't have to write the file name in your subject line, "staging:
> rtl8723bs: ..." is preferred. Please resend this patch series with the
> correct formatting.

No, for this type of series, the filename makes sense.  The subjects
would not be unique otherwise.

So the subjects are fine here.

thanks,

greg k-h
