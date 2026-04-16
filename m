Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757D338F623
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327239; cv=pass; b=NS+VtQl3AQvl28HTf1/vygNErVTnKOCOgJHmqOOqe6wBFwJn9H7Ht3Q8r49zPYgxgSHseE5O0CO85mmiHcdUvCS1NoI/JgKTtUTkk1Ld+CBXv8lkPzgX77WaGitZWIp1tsMF7rdZokgUph0wSZJGVU6xfmQPq+0Uo25hzQWXsx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327239; c=relaxed/simple;
	bh=Kbs4cctNnJiY1NH1WFUvdq16RCRPvBHjAPKm9RETvu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmduCR6JO9/SjfgL6uyG03Ik0rVBxNEGbgRXJ6U7ev0ThZAgs0MCO7lZC8D1yUOPJjEPpUpWwdgygta18wT/FDnV/uI8p8mqjATVKmN4AOmRDC4HunAubLuQKu/Q16K+gvp5e8x902S1v8OoLE86djUlHAeDFusofyb7lDLTMcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=I0MA2fWg; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="I0MA2fWg"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fx9l11fYZzySY;
	Thu, 16 Apr 2026 11:13:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776327230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nXZBiavgYukJbdw192nXkh14gYevuADt0n/I/UwWC6c=;
	b=I0MA2fWgX6zlLrCjuI2TkRIK00iMwSNUQNkE6HcHry209YX/Dyz/kBjA+6ZOiRAphcW3Ox
	BFrqch+5R1oMFiwGmurAdrYNkLJ/5shXzYjDWsaRvTv8qMfxpaew/5pFc2UAv/iWUo76Uv
	5ZIGmWlifTMxw8TvV2Bd0xuYqGvqf5s=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776327230;
	b=xmHZ+fI/lh9vcMtzji7BN0/rtodO8Gcx00ru3cwGVD4SXwtWy2fbQKzVQ3xpE/Bl6bj93M
	gjXHAC5PQf8es/RtmTQOkYrnindtC56KrEhOE3l8yV9XXQT7QolVPylbjm61iXQaTS4URK
	K8k3rb1u9C+Hzd7ud5x/hxzPvJiyn+E=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776327230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nXZBiavgYukJbdw192nXkh14gYevuADt0n/I/UwWC6c=;
	b=bh4qFGC08oYYvWRLTklyhoasHe/fgKDWYPzruC2vQrnGdIlxiIk+x0FH9Pnj39eLdZEsAW
	ygLQe2+eBt1odhoVbSNQeWbNA0trVin2qtmjJgQucbodXYKFCNlVO3PkkcC5JWva1wYd30
	xY8M8N2Y32kHb0ydg8e9bOtqDUz67M8=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B7435634C4E;
	Thu, 16 Apr 2026 11:13:48 +0300 (EEST)
Date: Thu, 16 Apr 2026 11:13:48 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix memory leak of
 raw_black_frame
Message-ID: <aeCaPExt-sUiY-B9@valkosipuli.retiisi.eu>
References: <20260416063058.2479566-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416063058.2479566-1-hhhuang@smu.edu.sg>

Hi Huihui,

On Thu, Apr 16, 2026 at 02:30:58PM +0800, Huihui Huang wrote:
> Our code analyzer reported a memory leak in
> drivers/staging/media/atomisp/pci/atomisp_cmd.c.
> 
> In atomisp_fixed_pattern_table(), raw_black_frame is allocated by
> atomisp_v4l2_framebuffer_to_css_frame(). If sh_css_set_black_frame()
> fails, the function returns -ENOMEM directly without freeing
> raw_black_frame. The allocated memory is only freed on the success
> path.
> 
> My patch adds the missing ia_css_frame_free() call before the error
> return, to free raw_black_frame when sh_css_set_black_frame() fails.
> 
> Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>

Thanks for the patch.

I believe the problem has been already addressed by
<20260203163134.3901110-1-zilin@seu.edu.cn>. It's in my atomisp branch.

-- 
Kind regards,

Sakari Ailus
