Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B517D3E0241;
	Mon,  4 May 2026 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906575; cv=none; b=l7sjfUTpi0PCjZeuPoLZev9KkhcOBH84RvTbBBMxUjMYWGjisRLgtE3gqHEhvZ/e9eiKnx7BJTXgg/zwagWWu0josx8Oy2jEJ8x63hvMrFY47OHfPilXkqxb5bCQKKNWr2MMZocst1xuhvkJRiq6JSteznDZN7yy8TldboWev40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906575; c=relaxed/simple;
	bh=TGrMC8wMZ0IU+PhUdAMUD3VAxI0ZiiLqV3dxncd3KhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9PSz7mpeXb43aAWkpIAH+fPwH/LpAEhxQNz6pJULYIJfvcIQGy/QdbbyeQ0DdtRd/uDbsZR/ffTsYILvPvt9EGYMkS2yA4dekjnJ5+L0xLms9f8AoIEhkz+MvKTqgr0UeUPY/OSUi4JP6LaTkyIoUVH4YArxm0itYwKiCVHqqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kENsYOdB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kENsYOdB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1358C2BCB8;
	Mon,  4 May 2026 14:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906575;
	bh=TGrMC8wMZ0IU+PhUdAMUD3VAxI0ZiiLqV3dxncd3KhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kENsYOdBIp7VfaaaQIAXBkohSyIHWxxz+7bsPVLXwncgybTK4FrkRrzOkiHacuWir
	 KA+F+RbmLwkPYW1UI9LJVir3Xl+rg7SAt7CNOjbD2VSgYrqSrw5N2hdjx3n4EzfUc9
	 vEOX+4NhrpDpc5qssLqCZN9BRqZ7F9ibRrk4lqrU=
Date: Mon, 4 May 2026 16:13:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, luka.gejak@linux.dev
Subject: Re: [PATCH v3 0/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler and OOB read in OnAssocRsp
Message-ID: <2026050402-ranch-imprint-1c7c@gregkh>
References: <20260428091621.739680-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428091621.739680-1-hossu.alexandru@gmail.com>

On Tue, Apr 28, 2026 at 11:16:19AM +0200, Alexandru Hossu wrote:
> v3, addressing Dan Carpenter's and Luka Gejak's feedback on v2.
> 
> Greg, please drop your patch and take this one instead.

What patch should I drop?  What is the git id of it?

And what about these review comments:
	https://sashiko.dev/#/patchset/20260428091621.739680-1-hossu.alexandru@gmail.com

And have you tested this on real hardware?

thanks,

greg k-h
