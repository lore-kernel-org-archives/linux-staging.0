Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536CE342537;
	Wed, 17 Dec 2025 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765986552; cv=none; b=hP8TjubHcBF4tiCwzSZ7eij1ndzdg1sHApzW3Yo1LJN9lb99e1aptHgoQeFnl1ymfFQiOmvvKaK6JItmSMv8RLDJ2hXQUVyirUvm7GJjgKDj/Jqa0LZBmWrdQEBy8+Laa7v3/zIbe+HZKPv/seSFPxZHWpUEc5jqkc5dGOkxeHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765986552; c=relaxed/simple;
	bh=VhpL/lTbBIEkciQzK3tS9UQ+870IGTRrwM3kXMFrE5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kabt4Ty1dLdq+eI0Qb2gZmuNDy81FK3aIcufGmor+VKFvHU9Wbmbw0dJRsFHQfnE0HtUL2ledi75EzC6lamROu/eaOaQzh590yrDASRB8BAf9riyUSVbxn7nILmiC4+Y8QHgeydfpImpCRLTjKxLQ8d6FcjsKcxUGXSN0HmD3a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NVd9zc8b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NVd9zc8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E05EC4CEF5;
	Wed, 17 Dec 2025 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765986551;
	bh=VhpL/lTbBIEkciQzK3tS9UQ+870IGTRrwM3kXMFrE5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVd9zc8byFLXz6z99qnS9WcWwU9DpdC6hUqiaAIM5BNZzYBPMr4UyMTdBjwF0nF6G
	 lv0wtVMx+a/ySkK2kA59J955hxV5GIJc4SCMcGoo8ZthNuJBtdQYxqZJYGjVRKoTE9
	 ccuaFB409ry458zcGB5Dd4+h7Wqbbh9pRI/rNziQ=
Date: Wed, 17 Dec 2025 16:49:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sanghyeon Lee <sanghae778@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	karanja99erick@gmail.com
Subject: Re: [PATCH v3 0/2] staging: rtl8723bs: coding style cleanup
Message-ID: <2025121752-oxidizing-garnet-599b@gregkh>
References: <20251217154216.8921-1-sanghae778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217154216.8921-1-sanghae778@gmail.com>

On Wed, Dec 17, 2025 at 03:42:14PM +0000, Sanghyeon Lee wrote:
> Remove unnecessary braces and else block in odm_CfoTracking.c
> 
> Changes in v3:
>   - Clean up commit messages

Shouldn't you list the changes from previous versions as well?  Like v2?

thanks,

greg k-h
