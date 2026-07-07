Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF13332918;
	Tue,  7 Jul 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416053; cv=none; b=QVZEY6G2P/3y6oPMr2EJj+k/hh3D7VC6CUuM+sc0grudSnV+vLC4F157v0ViLPk3CwsPSWywnYf71fZpnVZu+LyPdxC1Pd+pys+cDOHueSy1XRgKt8rNG96Zg/Jn06hNAjhbHilDA6Ws190gbeSMHvn3yKDpsjdlXE57PvSeb28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416053; c=relaxed/simple;
	bh=qLjw7PeUEZQ4ymPNO2IZAatFAb8M2XEjOezkfIyMVSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suB6UheQIqnKyODGQpmlC8AIhPY86ta3Uqj8JsRTArKqRa7OUPzxZdQw8zP7XwSGFnbGMWYKOtOYLQuHHaM8sx/IEPYC0nqF2xgN/51ICzVdFGCLJEQD13eyPZKV/cklWIMFzqnPYlDFKWsdjhrb20FiZnF1XgtNgO3Xu0slSnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=osbaFt4D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="osbaFt4D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7042C1F000E9;
	Tue,  7 Jul 2026 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783416051;
	bh=B9lMLDHj6XcWua4XX1+0Cqa7Q6BbD5VdSnsxI49pPks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=osbaFt4DTKIMqdlaG5Sb4NQOQs3qdbWIztl8drPHfIiZV+0vjI/UbI6eXUhIZIJ/w
	 Q3luspMH3qMJDpYNyJ27GNhQC0vZASLgaI26jZI8BOFNfvekz2hKYO1xFd/lzHaI9j
	 BlkjbHx503jDPkTeZupbH5MPdc8PRccgKZ61sa0E=
Date: Tue, 7 Jul 2026 11:20:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: adi25charis@gmail.com
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, error27@gmail.com, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: audio: split topology get into size
 and data calls
Message-ID: <2026070742-marathon-facsimile-648c@gregkh>
References: <20260629144941.33818-1-adi25charis@gmail.com>
 <20260630204908.40206-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630204908.40206-1-adi25charis@gmail.com>

On Wed, Jul 01, 2026 at 02:19:08AM +0530, adi25charis@gmail.com wrote:
> From: Aditya Chari S <adi25charis@gmail.com>
> 
> gb_audio_gb_get_topology() combined three separate responsibilities
> into a single call: querying the topology size, allocating a buffer
> for it, and fetching the topology data into that buffer. This left
> callers with no way to perform any of these steps independently, and
> forced the kzalloc() allocation to live inside the protocol-layer
> driver rather than the caller, as already flagged by a FIXME comment
> at the call site in audio_module.c.
> 
> Split the function into two:
> 
>   gb_audio_gb_get_topology_size() - queries only the topology size
>   gb_audio_gb_get_topology()      - fetches topology data into a
>                                      caller-supplied buffer of a
>                                      given size
> 
> Update the only caller, gb_audio_probe() in audio_module.c, to query
> the size first, allocate the topology buffer itself, then fetch the
> data into it, freeing the buffer via the existing free_topology error
> path on failure.
> 
> This resolves both the "TODO: Split into separate calls" comment
> above the original function in audio_gb.c and the FIXME comment at
> the call site in audio_module.c, both of which are removed as part
> of this change.
> 
> No functional change in behavior for the existing probe path.
> 
> Compile-tested with W=1, sparse (C=2), and checkpatch.pl; all clean
> on the three changed files (audio_gb.c, audio_module.c, audio_codec.h).
> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>

Does not apply to my tree :(
