Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5ED3DEACC;
	Tue, 16 Jun 2026 06:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591558; cv=none; b=oKekfjqQ1/jUbxrvibhiTSJlaUoavR+r1lUZ+7C9ifQ8jgrpZzIIx04ngXxgxmVPHG6lh66EMo+JZsI1vnrcqDMM3mWn1iBzcnGXcA8qZYcQYh+OLF+C+Heqfc2TgT/NBkgFT8g/V2GXUchSysVp1ablj1sa1msb63sXj4FEftQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591558; c=relaxed/simple;
	bh=OXFtxzlSI3F2YpQ7wYGaFOGaZgbEeNSHjfiydqYLWRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKYWyXPK3JpGWVRMfuOkxw3vyU0SJ3OrQY6AiEMqx6ge0CLGJxAAFcMbvYezRcGIABiZ/nL9t3PzZ8F3r+/mjuUbr6C7jhNiTOBz5qsSzjhwWVdJ5Sslx6AloNjHWQCgC0dDmVt8j+wPcfpdSur8GJaPwQobLP7hwzV5taeDeiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oJ3WDhXa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oJ3WDhXa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65EF1F000E9;
	Tue, 16 Jun 2026 06:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781591554;
	bh=Mj1E3rBJ/+iFIagn9/wPFCB1+CPI0wixVL3RGiecfNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oJ3WDhXaKeRqT2pL1CjV7sBKhB2LXDN14jH+9daf6p9M4oFkumhLnUeBWUyTLSlzz
	 SPZ7EaxUlC7UUzRfyw9ZPCwWz1JNBfwM2bHeCA0RTpwtbVgB+TS+wBXFAw4AmGwhNY
	 rgGhZ98rwKHdrEyAqVE5d0Vn0HnfNcEFZfpbe14Q=
Date: Tue, 16 Jun 2026 12:01:30 +0530
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: hexlabsecurity@proton.me
Cc: Mark Greer <mgreer@animalcreek.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org,
	Alex Elder <elder@kernel.org>
Subject: Re: [PATCH] greybus: audio: bound the topology section sizes against
 the fetched size
Message-ID: <2026061643-crowbar-handgrip-620d@gregkh>
References: <20260616-b4-disp-4352e8b0-v1-1-3e09f62e0ad5@proton.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616-b4-disp-4352e8b0-v1-1-3e09f62e0ad5@proton.me>

On Tue, Jun 16, 2026 at 01:06:12AM -0500, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
> 
> gb_audio_gb_get_topology() fetches a topology blob of a module-supplied
> size, and gbaudio_tplg_parse_data() then walks it by adding the
> module-supplied size_dais, size_controls and size_widgets fields to
> form the control, widget and route section offsets. Those le32 sizes
> are never checked against the fetched blob, so a module reporting a
> small topology size but large section sizes makes the offsets point
> past the allocation, and parsing reads out of bounds.

But we trust the hardware to send us proper data, right?  If we don't
trust modules, then there are lots of other places stuff like this needs
to be fixed, how many data paths did you audit?

> 
> Reject a topology whose section sizes do not fit within the fetched
> size before it is parsed.
> 
> Fixes: 184992e305f1 ("greybus: audio: Add Greybus Audio Device Class Protocol helper routines")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
> ---
> I reproduced the out-of-bounds read both in-kernel under KASAN and with
> a userspace AddressSanitizer model of the gbaudio_tplg_process_header()
> offset walk. The topology blob is kzalloc(size) where size is
> module-supplied (a u16), and process_header() forms control_offset =
> &data + size_dais, widget_offset = control_offset + size_controls, etc.;
> the consumers then read structs at those offsets.
> 
>   - In-kernel (7.1.0-rc5 + KASAN): a 64-byte blob (header 24, so 40 bytes
>     available) with size_dais = 44 makes control_offset point 4 bytes
>     past the allocation, and reading the first control byte there trips:
> 
>       BUG: KASAN: slab-out-of-bounds in ...parse_topology...
>       Read of size 1 at addr ...
>       ... which belongs to the cache kmalloc-64 of size 64
>       The buggy address is located 4 bytes to the right of
>        allocated 64-byte region
> 
>     The patched arm (sections rejected, -EINVAL) and an in-bounds control
>     arm (size_dais = 8) read cleanly with no KASAN report.
>   - ASan model (-m32 and -m64): size_dais = 4096 makes control_offset
>     point ~4 KB past the 64-byte blob - heap-buffer-overflow READ located
>     4056 bytes after the region, both ABIs; patched and in-bounds clean.
> 
> The source is a greybus audio module trust boundary (an attacker-supplied
> or compromised module reporting a malformed topology); the access is a
> read, and a large size_dais sends the offset far enough to fault. The
> reproducer (kernel module + ASan model) is available on request.


How did you find/fix this?  You need to list what tools helped you...

> ---
>  drivers/staging/greybus/audio_gb.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index 9d8994fdb41a..144591f1a512 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -37,6 +37,19 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
>  		return ret;
>  	}
>  
> +	/*
> +	 * The size_* fields are supplied by the module and are used by
> +	 * gbaudio_tplg_parse_data() to compute offsets into the blob; make
> +	 * sure the sections fit within the fetched topology, so walking it
> +	 * cannot read out of bounds.
> +	 */
> +	if ((u64)le32_to_cpu(topo->size_dais) + le32_to_cpu(topo->size_controls) +
> +	    le32_to_cpu(topo->size_widgets) + le32_to_cpu(topo->size_routes) >
> +	    size - sizeof(*topo)) {

Are you sure these checks will not overflow?

thanks,

greg k-h
