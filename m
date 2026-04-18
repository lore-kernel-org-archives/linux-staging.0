Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10033ADB0
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776506761; cv=pass; b=K839+tT7Qj0p1cNN6mE74WkPTT316ulaM8o9NmEWRs9DTTfsXwvejusjCSOAVa6+IuqAmGgRIe+mHNA8ihbF2Gv2rspO374SjP/dqqzpI8ijp+XD6sx+/NzxRcYSLUCTs7EXs7Tg8ksF/NT6bNJyToEGdp0qHD/DLcTpfEJpZMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776506761; c=relaxed/simple;
	bh=QqQh2z0bWdMLX1rWeetMZ029Q7s8UznLGFiZh2wysJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TERLFYalmPgiVs10kP1TMVWKAo+wVYdAyv2xVJOYG7c0NfhQqCkBsPaXeeWZYg6uPbu2jHSRsOhyj1ne2SrFyNETiKLQJLh7EydFsNRZyuIFIbhOFOTZBOLZfWJX/9cKkEz8+c2K26gp1uJwXZCg5jbOUo3YEjLsbxHz/unOzbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=eiW2iJ3B; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="eiW2iJ3B"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyS7T5t0CzyRb;
	Sat, 18 Apr 2026 13:05:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776506758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k75HbUPAfDwcnaGtvNJ9Ps5xMsySfbKoriw0MX0Pf6w=;
	b=eiW2iJ3BxJ/VwubivVXEv0YWFzM9yVZDFZ3txzdyzKUf5Fso1JPap+QgDLDOO6+vgRQ3zF
	6aqJKNucLCp7DpM5W3ZX/myT6T34k+BZaiAVXIDTNagqauj62oXFlCGriMcf7GKX1NvFEw
	6fasNCSLSAisA6KFAU4ZgrZW5dEe6Rs=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776506758;
	b=r9t4iM2tETpsBSVySFjXwsMCSFcLcCm5OOif+G0As28O2VevsIeplta7LUQ4QPf/y0jGjw
	zTg+caaGn/Qapi9o3QWK01fXOIkbGR41qSI8CIvskyIXpcMgdOkgezMqkVvxux2fhNzbcu
	w9z5akga/1ixX2f5GbugQQrHIEDz+kk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776506758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k75HbUPAfDwcnaGtvNJ9Ps5xMsySfbKoriw0MX0Pf6w=;
	b=bet0HK/KMqv+uzhqLKMbZO9II0QXex7ec3SdWQA92B1mfjDffOU78Koz6u5Veb4pudbUE7
	j3PQjcjRh0a4enoPh1nohRHlIOKnKDXduK1ayFZPiAT/KzNAj9uLJgrOdMGuMhcAysOmQN
	KMarOgkubfgLrU6z0MsbxUGsCeriH1o=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 610AD634C4E;
	Sat, 18 Apr 2026 13:05:57 +0300 (EEST)
Date: Sat, 18 Apr 2026 13:05:57 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	dave.hansen@linux.intel.com, tony.luck@intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: media: atomisp: Fix typos and formatting in
 headers
Message-ID: <aeNXhZQEthlSb2If@valkosipuli.retiisi.eu>
References: <20260209162026.18907-1-hamdankhan212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209162026.18907-1-hamdankhan212@gmail.com>

Hi Hamdan,

On Mon, Feb 09, 2026 at 09:20:26PM +0500, Hamdan Khan wrote:
> Update block and inline comments to follow kernel
> commenting conventions, fix typos and wording, remove
> redundant comments and reformat long comments for clarity
> and line length consistency.
> 
> Although some comments used the /** ... */ style, they are not
> kernel-doc comments and are converted to normal comment style.
> 
> No functional changes are intended.
> 
> Signed-off-by: Hamdan Khan <hamdankhan212@gmail.com>

This no longer applies to my atomisp branch.

-- 
Sakari Ailus
