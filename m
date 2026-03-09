Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC823ACF17;
	Mon,  9 Mar 2026 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072567; cv=none; b=Z0Pj+knYkCHzNbrl6ZQgANbIEJac2nDjtoBGwJqj6loA7/P2YQqete/2wwtSRGaPt+NzExCkHUdfHcXGvSpjq4JxuTfVPO3iq4QYcJZAojBeXwwUqgpZN9Vrtk89wp1vA7jTpyomSlcPWrpw4XMxgAkJOGM9a6PNyakGz2495B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072567; c=relaxed/simple;
	bh=unvpDBOsS8dFzCq+ytrCtztTGRbYtgcqQOiz8jBAaeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOsxXXImnuXfEQNi4Xe3I6ObwCXHPOjb0R6ayde+NP+H1ZmJ7DP4XTuAk2x2aG4la5MP0A8uB9TGL4dvAIVslq/bz1tefOM0ugJ278HA4BYaEO9q5APG1UhhWw/5vtri/bzpwZWQZY5ZaACWdO/R3LBrU0JffQeg1l8S1vgCWYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IKbIHTpF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IKbIHTpF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05A9C4CEF7;
	Mon,  9 Mar 2026 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773072567;
	bh=unvpDBOsS8dFzCq+ytrCtztTGRbYtgcqQOiz8jBAaeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKbIHTpFnTbe9jsXoALAftJjgVPZ0HLepRNPglCS0L63F5bulNdeYGpGZnpS0ymSg
	 51TeYsmHwaNIWnya96rDKV48oTMB9gZJZ3CH0hVgdZP6JPZpIhzJxuQ37HdITe576c
	 6LDauwkQ+KuPEsvXh8mpxQWg0DS9YF+sJrX+RQlY=
Date: Mon, 9 Mar 2026 17:09:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Message-ID: <2026030908-destitute-rely-9997@gregkh>
References: <20260301005019.2510157-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301005019.2510157-1-objecting@objecting.org>

On Sun, Mar 01, 2026 at 12:50:19AM +0000, Josh Law wrote:
> Signed-off-by: Josh Law <objecting@objecting.org>

No changelog and your From: line does not match your signed-off-by:
line, as others have pointed out :(

thanks,

greg k-h
