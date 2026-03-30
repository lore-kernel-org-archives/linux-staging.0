Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CB344DB5;
	Mon, 30 Mar 2026 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885970; cv=none; b=QvJFo4efCPGLQKkquUl9Ruge9CI5cnF4d6miVCh2rL6z/HAnb/oVpCiNftT7sHs9lI1BqFWIMOYkFC+spgEdhjTfYAa46+i9+WFE5LmFscrsfZKwOQxlPTY/5o11E4z7KfTt6iCpldDVPLWwE3nOhQIKwlAy3cEOuumDYp5XZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885970; c=relaxed/simple;
	bh=a+mtuDHcfnOXR92uL4GgtH9aVt6u1WDieJrCnO8VYag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIPvUwGwg68klOgFylh/4dFzsccO99VXhFjVO2nCONIhowOoNxzpO6uvqRUCRZ4KHr6hHCegSvNkdILCvZKKUi1P8aKV9c5/tLkN+X+VKsAKg0ZoVGAfOpmwIICuam7fUAgr1Rk7js3iSoEAh9bJAP8cqtc4UZUN0o6Vn2mPxMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IZa4yD+5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IZa4yD+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D7DC4CEF7;
	Mon, 30 Mar 2026 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774885970;
	bh=a+mtuDHcfnOXR92uL4GgtH9aVt6u1WDieJrCnO8VYag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZa4yD+5bVi/2dFxVRhqIr2p6PK2nrofD4EvOq500owwC3cQxgiiNsWby/PuU/lfb
	 xo1z6fdfBtO6UwJovpmEdVe/2xq5ZrVg4FSHNC8HviYeaDhN8npisQXcZxTLndP3AD
	 wnQpw2hdhJTY1QUB1V52k4XMZede9iy+2UjBQpzk=
Date: Mon, 30 Mar 2026 17:52:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kosugi Souta <k.souta0926@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: authenticate: fix alignment and type
 warning
Message-ID: <2026033032-rethink-jogging-f3b0@gregkh>
References: <20260323031017.3650-1-k.souta0926@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323031017.3650-1-k.souta0926@gmail.com>

On Mon, Mar 23, 2026 at 03:10:17AM +0000, Kosugi Souta wrote:
> Fix the following checkpatch.pl warning and check:
> - Warning: Prefer 'unsigned long long' over 'unsigned long long int'
> - Check: Alignment should match open parenthesis

That is two different things, so this should be two different patches,
right?

thanks,

greg k-h
