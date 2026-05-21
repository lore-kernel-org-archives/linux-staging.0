Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FC235CBD7;
	Thu, 21 May 2026 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355212; cv=none; b=fG0X3mkAxGq862PgbpXxTisKd0Hzk70+AdX3C+9DQ4ouLFsQG8SuXG/eHxxM1w+oVRBDnJC/yv5fZXxSByjBTHFB8wZBafVLgbV0y7yLCT2DB/SVzCYeOiNx9FqZCL1LXi3WoMKSCjd36RvLoBljKn+VLZYzBcsy5URSW0I4FJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355212; c=relaxed/simple;
	bh=AhCI9D0hBGALA3OWxjm22J81EFEUo6bwCxglFUHdZ1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ctuw8W+fF/oIR+pLgDVCR5y2JdCR9nbMDcEiKOBSvQRMzY2C7hlYRV4/XVZVVLGcWJnVYc6MYXRUREYGSeIY2qCQyka/biR+J2bKrDFX6CuNSfQzjO5DOHalo77tIoXwSyTobx1XMJr/Qh48V+HjjcjOUz+yj1uPLygjlukHcfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LAwcd+Ku; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LAwcd+Ku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28941F000E9;
	Thu, 21 May 2026 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779355211;
	bh=E5QbwwCjtZT4N3eaYQHYnb9XTTN/tHFaCLYYIfmkklA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LAwcd+Ku5khHUpJlGn+lr18/rRqd6xCIARbAAH/4NjgMBzG3reo3UfJ5vfPbPAG3y
	 XiSrFakTHBnY6w7eE/VlLTzg5qgWNwW0gmOowyvLx8uiICdjLND6AxFyZram3R3Cdy
	 Ipo6H7nzPs71cI2++u+Tj92jfy+CHnlZJ0m0Kj1A=
Date: Thu, 21 May 2026 11:20:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rion Kiguchi <kiguchi.r.sec@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: vme_user: validate slave window size against
 buffer size
Message-ID: <2026052104-venture-batboy-54d2@gregkh>
References: <2026050947-easily-choosing-2f91@gregkh>
 <20260514034511.4244-1-kiguchi.r.sec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514034511.4244-1-kiguchi.r.sec@gmail.com>

On Thu, May 14, 2026 at 12:45:10PM +0900, Rion Kiguchi wrote:
> The VME_SET_SLAVE ioctl in drivers/staging/vme_user/vme_user.c accepts
> a user-controlled slave.size and forwards it to vme_slave_set() without
> comparing it against image[minor].size_buf. The slave-image kernel
> buffer is allocated at probe time with a fixed size of PCI_BUF_SIZE
> (0x20000 / 128 KiB), but the configured VME window size can be made
> much larger via the ioctl.
> 
> Additionally, a slave.size of 0 is permitted, which causes vme_get_size()
> to return 0. In vme_user_read() and vme_user_write(), the boundary check
> (*ppos > image_size - 1) suffers from an integer underflow because
> image_size is size_t. This bypasses the bounds check entirely, allowing
> offsets beyond the actual allocation.
> 
> Result: a local user with read/write access to /dev/bus/vme/s* can
> trigger out-of-bounds read and write of the kernel slab adjacent to
> the slave-image buffer.
> 
> Fix: reject slave.size == 0 and slave.size > size_buf in the VME_SET_SLAVE
> handler. With this check in place, the existing bounds checks in
> vme_user_read() / vme_user_write() against vme_get_size() are
> sufficient to prevent OOB access.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Rion Kiguchi <kiguchi.r.sec@gmail.com>
> ---
> Changes in v4:
>  - Add check for slave.size == 0 to prevent integer underflow in bounds check.
>  - Remove trailing whitespaces inadvertently added in previous versions.
>  - Remove Fixes and Cc: stable tags to resolve checkpatch warnings based on maintainer feedback.

Please see the review comments:
	https://sashiko.dev/#/patchset/20260514034511.4244-1-kiguchi.r.sec@gmail.com


