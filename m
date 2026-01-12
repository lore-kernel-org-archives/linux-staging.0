Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4C17B418;
	Mon, 12 Jan 2026 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210391; cv=none; b=ZjRI3ajtTDQluPYGg8gG2sfXpyJ9gW/McQB6hL1arWEFBJmiUDG6G2L1uub7bU3yiH0h405LGGDU18mUEkuE2n4uaDtK6xTMSV1FhMYGXNADUnnetHVBwJvCq8lljEaOG5IowSxslrBYz2rG4a3sl9MvOOODptdpNuIKs90YBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210391; c=relaxed/simple;
	bh=t4Hf5hYiXoyt1q949Hm4XzVh7XTAsKuqO6dygPNlc9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBNVbTZ6xb4sNyugPTFL3KZwss3p+5kF5Dl/kEsRI9yTeGTiavHPAKVbXlse4u6jMysjaGpvyEAQH51t0GHfJUgHm0bH7QJkKeFBh35Q02yUjKIrwHYH3UTY+G6aG6jW9Yb6e+/8P0XEqjIRgG2uVVrGrJ/JE1cB6i2R7fSeS9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pay6Au+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pay6Au+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C11C116D0;
	Mon, 12 Jan 2026 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768210391;
	bh=t4Hf5hYiXoyt1q949Hm4XzVh7XTAsKuqO6dygPNlc9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pay6Au+BWxhr+foRvTOHbjIPHMk6THVxsNCrmp2OF3qrj8DcfV/uJsQD/oI6kFtyy
	 YCaw3fb0zw7CSXApB061HwyTuZK0lTqOBga8hlcUpqOqBXO8nkl+Omjy+ZULF6qj0j
	 POpRnEZ4+N1xiWIoLpLt5C7eOLvOAunwnLuXvcPM=
Date: Mon, 12 Jan 2026 10:33:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nayana Mariyappa <nayana.mariyappa@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] staging: rtl8723bs: coding style fixes
Message-ID: <2026011224-purging-dismiss-3a99@gregkh>
References: <20260109110417.16359-1-nayana.mariyappa@gmail.com>
 <2026011142-stability-coping-e3bc@gregkh>
 <CAN1kxfyz5K9kUVY3yFCKYdaQHuED-oNCBWCcLL+bT7YQ_VVXRQ@mail.gmail.com>
 <2026011236-drank-monopoly-916a@gregkh>
 <CAN1kxfyv7MBC4yWs1X6cO549pu2MisPqudyC0Cx7NzJFmrDUXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN1kxfyv7MBC4yWs1X6cO549pu2MisPqudyC0Cx7NzJFmrDUXA@mail.gmail.com>

On Mon, Jan 12, 2026 at 02:56:11PM +0530, Nayana Mariyappa wrote:
> On Mon, Jan 12, 2026 at 12:19 PM Greg Kroah-Hartman <
> gregkh@linuxfoundation.org> wrote:
> > For some reason you sent this only to me, which is a bit rude to
> > everyone else on the mailing list.  I'll be glad to respond if you
> > resend it to everyone.
> >
> > Also, do not top-post.
> 
> 
> Apologies for that -- this was unintentional.
> 
> I realized the issue was that the cover letter and patches were sent
> in multiple git send-email invocations. I have now resent the full
> series (0000–0004) in a single git send-email command, and it is visible
> on LKML/lore with proper threading.
> Sorry for the noise, and thanks for the guidance.

Great, but note, html emails are rejected by the lists :)

I've responded to one of your patches already, you'll need a new series.
And the one you just sent should have been v3, not v2, right?  So the
new one will be v4?

thanks,

greg k-h
