Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13505D269
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SRAKAYNQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3664EC433C8;
	Sat, 21 Oct 2023 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697873502;
	bh=4aCY97D7gtFSBIsEYv9Z4lDXkkXAFhhDXDhjPDd2rDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRAKAYNQFm06+a9XsQMxjCug6MRGysuYpzMk/7+FSh3OwvODg72Nn5XuregA9+cSW
	 SyRERx7RqllOuJwOmuPOcglhFLl60zfHtEcAP90MAYeYfVlD1BaRDeD+Nd7lhn/5Pc
	 Mec1kd3YySmkNBVx/leNYWKGipZVzrIlF6MLJpjg=
Date: Sat, 21 Oct 2023 09:31:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: octeon: Fix remaining instances affected by
 removal of typedefs
Message-ID: <2023102105-islamist-nursery-9ebd@gregkh>
References: <20231021000340.56889-1-bergh.jonathan@gmail.com>
 <20231021000340.56889-3-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021000340.56889-3-bergh.jonathan@gmail.com>

On Sat, Oct 21, 2023 at 02:03:40AM +0200, Jonathan Bergh wrote:
> Update the remaining instances in ethernet.c file affected by removal 
> of the typedefs from octeon-stubs.h

You can not break the build in one patch, and then fix it up in a second
one, sorry, that's not how kernel development works.  Each patch needs
to work properly on its own.

thanks,

greg k-h
