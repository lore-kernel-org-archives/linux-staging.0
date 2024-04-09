Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4788113A275
	for <linux-staging@lists.linux.dev>; Tue,  9 Apr 2024 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712677578; cv=none; b=rjLmtsR/imYKEOa8MsTjTjsRSxmOUQgM4caHUIlo5yuwJJD2VXQH3jfEPuJV+chU5CnI90ZKdZKQ6WSEXx060NdcWKAXmGcn40aDZo21AqPNpISeED3rW79hGrnUDdnesRoK1X5hXgjHh+9GAvRhnufWTHVaIONY6fCXOgFoLBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712677578; c=relaxed/simple;
	bh=4KSQvn6kHfd84M+uxGQEhDB1/BMEpZfFbTiMJ0FBNK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTQ0oxyJvDaa+ryS1ZObP2cEw+yiUNBzhhomUZ2Gg3Rx91KoVOUn1j+lIc/QU29xoAjUd0KSxVYBSHVt+OMf/zaiZ1Eg1pLCRjigRqn66mCc4PBZzWysUSw/yEg5y9p6vu1kivi5h5y91ga5io3mSZBrhLZzsCCKEPG462OrSVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=jghg46Ev; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Sbi0yKXU; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="jghg46Ev";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Sbi0yKXU"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id E87F91C0009F;
	Tue,  9 Apr 2024 11:46:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 09 Apr 2024 11:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1712677573; x=1712763973; bh=EjyrhNnxHq
	pk0sHDHco6Z2Xs+u+El/uZxeJhCWCkv3w=; b=jghg46EvEz/ZLvh+oa2Z0jgOK0
	F1HVGkK2tRMCQbUpoiDdr1vfO1wv9dSku5qmar8AXP+3kk4WdIW9jnDeJcrGp8EF
	XkgNG59FKbg4YOVR2/FRbaQdFdN5NQZrYT4mgz5qD2h+ETLrLdh6YpS3QF+1xbqd
	mgpldLObzAToN7GSsyfXOUW4oVBlJhsFZCeiO3TsHXnU8QH+Ge9oal4zTQJiB5Xz
	StFb7+SIKQSqOsht2YQn2t4ZEE1kHVL95py2WrAJpAlgFVE8wPRZRILfYCNJsY5U
	IKhm+uXKBaZOsqSEUfv5x/qXf9QJqiWgvHNZnkQgTzNDmUu3spATqcbDy96Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712677573; x=1712763973; bh=EjyrhNnxHqpk0sHDHco6Z2Xs+u+E
	l/uZxeJhCWCkv3w=; b=Sbi0yKXU62B00kfYmEutEJ8bHgOK6EO11nOkkxDeEXL9
	u/uuUcKP4hQ4p3mMl6kWpoPe65qCs+oGnhXyOa0ju9tPS/QkePJR6zGMkb/UZvf5
	db0F53xC5SFqRmnqd0wQYAoUr1D5FiCWcJ+cwxYHDcsQRUdxfiad2Xb9RV4B7Yis
	vcIc6UUro5AbQm4cfiC8lld9VOjDfGvdxjsmaOacGvt1/UyhpR6Tmm1U3H3Fnc6p
	rHhfYcsRBxLmM+mrUcY2ufnhR/FYTaONJY6OYrLTv/BkNDrPCg1w3CXc5OU0MmDN
	3vjedTzpk0Eodu1AxCOTGQ5JA2SIJEfAfLCKpc+bKg==
X-ME-Sender: <xms:xWIVZo4nyC8uAhtntHIpM1NIaj4W2L2_ZljXV_jY582H-k3470GuqQ>
    <xme:xWIVZp6HoA7jawZnvVTc3Bsjh2VEAdYQgMt5IlMgt8N1qLhZa-1dMZvfsskDHiS7P
    K9FBnW_Z5zbvQ>
X-ME-Received: <xmr:xWIVZncKOnVsW7RPckunhv9ejeoom18qsQimgoD9bNa8asIjM74IZSWHRliHg9zd163ui7-vQCcphsQ0YeS63g5sLrwDrY2KIhdajg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehfedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:xWIVZtLKtCuqUEm6oSSzP4Y73AORSS4YmeLz4SrvZI1QaQtHvRFfnw>
    <xmx:xWIVZsLLDlyUdZZlg9N5m_rkxUXuQpcfgAA53kobZlkzv6WaiOpdvQ>
    <xmx:xWIVZuypGxEvp7gwy-Avo4IUMxc6O7tDg16ciQJYW156-HHtqCiq7w>
    <xmx:xWIVZgLznuOZ8sYC3nFhC4ozMU2WfBIsQ13_pyHT3erCCWqiYK1cOA>
    <xmx:xWIVZt5h9jGqcmHiToMn_icAYd5Kx8cCzGysu_gpvKdVBjfZFPBO0FmP>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Apr 2024 11:46:12 -0400 (EDT)
Date: Tue, 9 Apr 2024 17:46:09 +0200
From: Greg KH <greg@kroah.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v4 00/11] staging: vc04_services: Drop non-essential
 global members
Message-ID: <2024040942-hastiness-conical-5151@gregkh>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328181134.1548799-1-umang.jain@ideasonboard.com>

On Thu, Mar 28, 2024 at 11:41:22PM +0530, Umang Jain wrote:
> This series aims to drop the remaining (non-essential) global members
> to address the following TODO item:
> ```
> * Get rid of all non essential global structures and create a proper per
> device structure
> ```
> 
> Mainly the global members are moved to be contained inside platform
> driver data. They can be access via platform_get_drvdata().
> 
> More re-fractoring has gone into this version now. Please look
> for individual commit for details.
> 
> ---
> NOTE: Series has been developed on top of [1]
> "[PATCH] staging: vc04_services: Stop kthreads on .remove"
> 
> The fate of that patch is still undecided, so we need to take into
> account on the direction the discussions take. That will only affect
> Patch 10/11 of this series, rest is fairly independent in that regard.

As that patch was not accepted, but the revert was this series needs to
be rebased.

thanks,

greg k-h
