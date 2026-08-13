Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C0B3B9937;
	Thu, 13 Aug 2026 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623987; cv=none; b=a/2ucSFSMQJid2AzsMlNONm74dJgp7ktpDI7Tb8LqJQoEYFFHdr+PSRqhDhga/UYZKlcw3Oi21wy1YDu+ERAnHJYXnEuvCawn+fU/bnHvyLv+wb0v9iF7PpJ+c7/h6mkjJRUsZahrPYgcRpR+UOCfpuChBV4NAkIBh3w0MztYVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623987; c=relaxed/simple;
	bh=O4sQiLTi/t67m4mBkrphS8iVaNPILFC0v5C1CF2jOwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ov9QeU9bEQeBVNqn44R4vJ642sLdwcJ5Jvg9kFqo6kBGy5IR9bQo3+D10bLOLxswTvOJm2KZFP7V0MPEiDRjYG+8Z3m6zWwDOd0gk1hgitZ5qg8vUofHA2U8+0FpzhFimufVAEzuHsFB8lYGev1yPEnVtm8+MmqRJEtuXDzlBRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PfFeO/Ww; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PfFeO/Ww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BD51F000E9;
	Thu, 13 Aug 2026 12:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786623986;
	bh=+75IPsnE2woCyCn62J0LXY9mRkHpYt72ZrIqebuhgik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PfFeO/WwgT4p5QwIHZ2Yhz51f9xEsdgkZj4g6KeYsJoL1ZtGFT8vWMvvFBZitlKZV
	 iQqHjeY98aCrikfq2xIXxTTSOjXck9sDo6+F2HSLzsKKtNDPHe6qLUOi6mvg38l8q1
	 UQUevlbG8FRdgJ7GHmMyMKGtHkeUTAPjPQYvPv8E=
Date: Thu, 13 Aug 2026 21:16:23 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Martyn Welch <martyn.welch@gefanuc.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vme_user: fix flush_image leak in tsi148
 bridge
Message-ID: <2026081359-gloss-brownnose-9846@gregkh>
References: <20260813121057.2590433-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813121057.2590433-1-congnt264@gmail.com>

On Thu, Aug 13, 2026 at 07:10:57PM +0700, Cong Nguyen wrote:
> When error checking is enabled (err_chk=1), tsi148_probe() allocates an
> extra master window resource, tsi148_device->flush_image, which is used
> to flush posted writes by reading back over the VME bus. Unlike the
> regular master windows, this resource is not linked into
> tsi148_bridge->master_resources.
> 
> Because it is not on any resource list, it is freed neither by the probe
> error path (which only walks the master_resources list) nor by
> tsi148_remove(), so it is leaked whenever err_chk is set and either
> probe fails after the allocation or the device is unbound / the module
> is unloaded.
> 
> Free flush_image in both the probe error path and tsi148_remove(). This
> is safe when err_chk is disabled: tsi148_device is allocated with
> kzalloc() so flush_image is NULL and kfree(NULL) is a no-op.
> 
> Fixes: d22b8ed9a3b0 ("Staging: vme: add Tundra TSI148 VME-PCI Bridge driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
> Changes in v2:
> - Add Assisted-by: tag (Greg Kroah-Hartman). No code changes.

You have read this:
	https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh/T/#u
right?

If not, please do so.

thanks,

greg k-h
