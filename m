Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA91632E7;
	Sun, 11 Jan 2026 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768136388; cv=none; b=NNvsICJYaR0Br6NYwwqucJSOTeWtRUuXhpSEBxBMD9kJMrFw6nnDLQRstQdAoNiO72ZiUHsq3SIY/VSXwswfLZkvCqX+FoIC+75Qg8j5f0I1EPoaRu8ha6cGYH57Fm1fwNAm5yfQr5JeqfdzSU/h7LCxVHJWk7qiLmq4Xx63uos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768136388; c=relaxed/simple;
	bh=0GaHWdgQqgiDZ3stDVWuuaO7kv0UEYCfikoQ48+IiW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDkl4abZ1hK+CjE9qIr4Em9nOL+D9yvxSJcXhOuIsiOEK+/P93iRXGmAaoVCeKrZ3OreEUlnRPHpR4YYYutS7+fzm2CGlv0nP1+fsUpoSgU/+g9tCQLEFRWS3CvvWh0YBn0lmqoMapxBqAbjqil6femvFmUOIDJotvcjDyuPi1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1VegQz5x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1VegQz5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20650C4CEF7;
	Sun, 11 Jan 2026 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768136387;
	bh=0GaHWdgQqgiDZ3stDVWuuaO7kv0UEYCfikoQ48+IiW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1VegQz5xSuveHu8JJ+sWycZelOet8oGNQZHmAGSNcxfOQahFjXg1C1gpMCnlUbuv8
	 jdAtK5UsnPZcMuNkwd9P4VGQZStKHtE/2rnlKUWhGlhMm86NDt008PYxUYQ1zxXEPB
	 Xg0YwsoSy/+JzjTBrIpEFb95/TeUa0OAjfv7f9/w=
Date: Sun, 11 Jan 2026 13:59:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode a fixed-size mutable
 array
Message-ID: <2026011114-mocker-triceps-be58@gregkh>
References: <20260109164140.11350-1-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109164140.11350-1-ahmet@sezginduran.net>

On Fri, Jan 09, 2026 at 04:41:40PM +0000, Ahmet Sezgin Duran wrote:
> g_fbmode is modified at runtime. Use an explicit fixed-size array to
> avoid a misleading checkpatch warning.

Nah, checkpatch is wrong here.  And it is a great test to see if people
actually build the changes they want us to accept, so I'll leave the
code as-is for now, thanks.

greg k-h
