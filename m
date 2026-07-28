Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B7257854
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227978; cv=none; b=sUtvM0qveywyYczFj0Dl1WjvFqjyye9yg3oY2NXqnP6nVnkgLhjheR5CuTANlCiOVcOzNlk/qbtBqeWyB9pV8BG2UShYs5uME9Yl7wT+LTpJJyG87Yv6/dEzx34EZNuZ8yzb9zVeKQEsnowexNUNoVRKcvvPK5oPDhyyIfW+Fc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227978; c=relaxed/simple;
	bh=n5K1oUWHGEMk9bFSV4hcnliW3wjO6Feh7p1kmTBHmjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odMoxTOUcNhZiof6il/buZ6FLA6ieTOnYpuZ+Szw0xK5llcQJSVBcv8yzpzLxdJnr4+x63zBr1MkaUqy6aFEgDCvprUPArcWw0hDXfUqF0Ayz5+iVXLzlIJgFkuvvWF0m7QGFedb45F48MmP1ZeENSvxHva0VLWO/ua0Bqme7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ddCqKZc4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ddCqKZc4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8AD1F000E9;
	Tue, 28 Jul 2026 08:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785227977;
	bh=n5K1oUWHGEMk9bFSV4hcnliW3wjO6Feh7p1kmTBHmjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ddCqKZc4jgNazrEPnpV5td4DKLO5ybWSC1vTafh1++Ag0B6N4bqQhBKsarswUmbDc
	 wjKDfjxeseXuY0Xyydi0+DtCNAC9sVa1MeLt/HJl952WwdFiuW4dZfsMVIKTZVrTEG
	 SNMDtzkrZJbDwO7zg/nlY+YFKdT1UpGOsQeqCoYU=
Date: Tue, 28 Jul 2026 10:39:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?0JDRhdC80LDQtCDQl9GD0LHQsNC50YDRg9Cz0LDQtNC20LjQtdCy?= <akhmad100913@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace yield() with cond_resched()
Message-ID: <2026072813-depravity-preoccupy-855f@gregkh>
References: <20260725181837.39951-1-Akhmad100913@gmail.com>
 <2026072802-cherisher-broadband-342c@gregkh>
 <CACCSLCqsJM81O1=zq-GrQEd625JBFOAoPHvqeYRJ35u4YD=mAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACCSLCqsJM81O1=zq-GrQEd625JBFOAoPHvqeYRJ35u4YD=mAw@mail.gmail.com>

On Tue, Jul 28, 2026 at 11:22:55AM +0300, Ахмад Зубайругаджиев wrote:
> Hi Greg,

Oops, again you top-posted and sent html email :(
