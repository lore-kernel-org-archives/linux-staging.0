Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07632E8B9B;
	Sun, 12 Apr 2026 18:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776019998; cv=none; b=jQWUYufMAgFZZssyjPX/q8Rpih6wzs0yxcGcK6ovLaKNY9JNbouGBQtzNbna4Dbv5cvpUrtIJA6TY7n7TyQn1JZ51Sa9eWptmpJK0CccP+Z1ihas/s66Nw6d760HPbwTRsFB9lviw2wOn4TkOL6kCEuS5QooIQwTEpnST8QaRY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776019998; c=relaxed/simple;
	bh=B4MzpOh+TXxRz4vQmTXbV2onBjXMTRtPm8ABtDrGbuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P79yj82947xTrrkvXcObeVEWJCWQEr/Rjgw/9T06V31OOkNYkbUFtTGWA2h/mlx/Kh8NOPZz6J1/xuU+T/NEIQ27McQ1prdXS9y4cb2V0VR4ion3qFXVv+o3yHuX02cEDvvEQk8rDsbKUc7ISYYLlXvQOeBl3Qpeo+6G0zCpgrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xlcpbi3g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xlcpbi3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09934C19424;
	Sun, 12 Apr 2026 18:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776019998;
	bh=B4MzpOh+TXxRz4vQmTXbV2onBjXMTRtPm8ABtDrGbuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xlcpbi3gSDeKpvOyQbbNPVg/ryFsjA7VLad/nuQHbw3YzHblwlp5CiFPTOKe+3wFe
	 6FTMKlkkMVtTLg2c6MzHQunxnbMsQxgMZzt8Kz/BC5KlVDTqGMsO3uadyeSpN6aza9
	 PIugNjjdWsqnko3qdYFAJB3d5vf2TFLSFurlMpQI=
Date: Sun, 12 Apr 2026 20:52:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Gabriel Rondon <grondon@gmail.com>
Subject: Re: [PATCH v3 1/2] staging: most: dim2: replace BUG_ON() in enqueue()
Message-ID: <2026041232-kitchen-quill-add6@gregkh>
References: <20260412130012.5832-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412130012.5832-1-ducthinh100812@gmail.com>

On Sun, Apr 12, 2026 at 08:00:10PM +0700, Nguyen Duc Thinh wrote:
> From: Gabriel Rondon <grondon@gmail.com>
> 
> Replace BUG_ON() range check on ch_idx with a return of -EINVAL.
> 
> BUG_ON() is deprecated as it crashes the entire kernel on assertion
> failure (see Documentation/process/deprecated.rst).
> 
> Signed-off-by: Gabriel Rondon <grondon@gmail.com>
> Link: https://patch.msgid.link/20260330182255.75241-5-grondon@gmail.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

You did not sign off on this, and did I?  Where did this come from?

confused,

greg k-h
