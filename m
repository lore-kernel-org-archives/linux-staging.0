Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA4518C31
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010957; cv=none; b=lz+1CB6+1XR9hqrwSH44v4yaqHihkFE/hRVM+oT1mZuL/jvMSkO/NSi6wy7hkC3EPZFTKVs0U/UGGL/sgEYCJasZhi1VKGTutHDYQiESJRABK6Tr3MbWPGWqYTxOWJSdHuRjAoZlBMEkrRi9EFIamxk3/BEAUqstNiVLsLncX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010957; c=relaxed/simple;
	bh=9qDXILn/dnc0mO6Rx2kHDibMPgsOLENf46XBHVBMVWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZXFlvEK0fwT7+cTBD4Xl1STaQPel/UDX9kRyXz1QLihPwUW8b9CjCIIJip7XRadc4CKHK5TrqG9EHTFrfW1dxhJZmTvB9jN2XnsRXTQVIpJpWBoaaaRa6qOr5LtIoVP8j2kId0uyw4KOrG8ctHOCFh+qGQEcdvSVw6opyXHeUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rIaWSsm4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rIaWSsm4"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2072439F;
	Mon, 10 Jun 2024 11:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718010942;
	bh=9qDXILn/dnc0mO6Rx2kHDibMPgsOLENf46XBHVBMVWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIaWSsm4HL9spam862ZvMFS+1CFyqoNP2QRFYbj6jbyle0iJ9XbhFmu9fasB5C22P
	 k2KmnOx8vTUF5Bb9Fc9ijF90cUwlRvQCrg+6o0DdaMrIU2an7qXKIMGaCZf/4TVr8M
	 LMq9acJ9DO//RAD2W5RjjQNqHQBGLmM7NIMCQ/VI=
Date: Mon, 10 Jun 2024 12:15:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-staging@lists.linux.dev
Subject: Re: WARNING:
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
Message-ID: <20240610091534.GO18479@pendragon.ideasonboard.com>
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
 <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
 <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
 <72a414e4-4cd0-4b12-a662-cb73d1e3515e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <72a414e4-4cd0-4b12-a662-cb73d1e3515e@app.fastmail.com>

On Mon, Jun 10, 2024 at 11:00:12AM +0200, Arnd Bergmann wrote:
> On Mon, Jun 10, 2024, at 10:26, Phil Elwell wrote:
> > On Mon, 10 Jun 2024 at 07:00, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > Why is swiotlb involved at all? The DMA controller on BCM2837 can
> > access all RAM that is visible to the ARM cores.
> 
> When a device is not cache-coherent and the buffer is not
> cache aligned, we now use swiotlb to avoid clobbering data
> in the same cache line during DMA synchronization.
> 
> We used to rely on kmalloc() returning buffers that are
> cacheline aligned, but that was very expensive.

Could we reject buffers provided by userspace that are not cache-aligned
?

-- 
Regards,

Laurent Pinchart
