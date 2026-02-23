Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E5265CD9;
	Mon, 23 Feb 2026 13:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854825; cv=none; b=UgWTxPBLxW4CTwd+PZX48tnKVDm3Jba8mhiyRRrWfxVIjWJPzElvg4S6H9RiyUAKoqxwX0eeQVIGwB2tfD0+aZ1QZrJV0qZeJrz7CwROZ1WZKl6FLaJZx1ueYwsFa/+5s8mjLYqVuSE1Z5aZq0UUvwhxnU8agSefHwag5QT8VmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854825; c=relaxed/simple;
	bh=6Ln8+Sk3x3ghopBK8ov6B/CH600e+c28R5lk5Qd8NdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzMzT2eGeleTnpqjJNygN+agm5bJYVyCyWyCA/JLJ3Wgj4O77mu1mfHLS2ysfnzaOr+i87QW9AMcCV9+2l0vxdg6y/4+M7ro66F9O31LGheUgNFgwtN2aEcuToz3uuFrXepFuSxVcvmCeUIFK2eVAgXxoicIjq3FsU7qY/ud8uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wnFxX2Sg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wnFxX2Sg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304B4C116D0;
	Mon, 23 Feb 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771854825;
	bh=6Ln8+Sk3x3ghopBK8ov6B/CH600e+c28R5lk5Qd8NdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wnFxX2SgsAVwm2aqhGGmkB60ZU3e93u9gWw0rBmHX4ABv07OPP+L6wsXAX3VirTq7
	 6yFUKsuFgNt/wZ8B0H568SOp9MIk5htorY84dbARCqCThBr1sD7m4sJEjRHoGBGNgt
	 5L0dUB8NBw8EvXApmeqv+v0CJAS4fw5qTvcHvuHs=
Date: Mon, 23 Feb 2026 14:53:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] staging: greybus: fixed styling issue in
 fw-management.c
Message-ID: <2026022313-velocity-unwieldy-dd40@gregkh>
References: <20260204183033.182747-1-rchtdhr@gmail.com>
 <2026020714-tightness-atonable-8a17@gregkh>
 <CAJH1ELAO0VXJUC5s8W6KhVO4=4BA_ir94KDte+V87Vt-Sq6Ykw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJH1ELAO0VXJUC5s8W6KhVO4=4BA_ir94KDte+V87Vt-Sq6Ykw@mail.gmail.com>

On Mon, Feb 16, 2026 at 10:33:59AM +0530, Rachit Dhar wrote:
> On Sat, Feb 7, 2026 at 7:08 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > What specific style issue was fixed?  Please be specific.
> >
> > Also, your patches were not correctly linked together.  Please use
> > something like 'git send-email' to send them all at once.  Otherwise
> > they get lost and out-of-order as you can see in the email archives on
> > lore.kernel.org.
> 
> The style issue fixed was for the following checkpatch check:
> 
> CHECK: Alignment should match open parenthesis
> #437: FILE: drivers/staging/greybus/fw-management.c:437:
> +               ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
> +                               intf_load.load_method, intf_load.firmware_tag);
> 
> Thanks for pointing out the issue of out-of-order patches.
> I did use git send-email, but did so for each patch separately,
> which might have led to this. If I should send another patch series
> to correct this, please let me know.

I can't take these as-is, so yes, please rebase and resend the remaining
ones.

thanks,

greg k-h
