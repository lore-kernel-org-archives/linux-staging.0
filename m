Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172A3A961B;
	Tue, 24 Mar 2026 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339430; cv=none; b=WQO0Xo4YvYF734HQPhQ+zJWwNuqwcc3jbg/VRuKI2wHLShdf5YfNb7iWP8IDloe9lkxLsdWnzbTpTM/7DxpCG1n+LZneG6sKAPxQW20Eu5O9MIWfLDLET3N3QaUWjI0oAnNhAo4mquDWNR2i24R7JtYjU1/+PX2fz2MaTLRtp6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339430; c=relaxed/simple;
	bh=2RNy7XQ1l1G1mKHRnJ9KURLUqO/6eJHSqGg8eXblqaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBcTp/4qzfM6XuIILWIzenT3UQxCbHlznswq7sbRtzmfY80484wLLYngiYAnOQ6yhKYCNWdQkil+hjOsF8/d6nxTBESBKsbx0mQI/pWt53OrSG5rd3hs4g3ZzD4rBUQXdhn5dIL3RovTqnoWgtXPPi2MT1efMhT+dxplMHMtqwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UV8JkEaq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UV8JkEaq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1603C19424;
	Tue, 24 Mar 2026 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774339429;
	bh=2RNy7XQ1l1G1mKHRnJ9KURLUqO/6eJHSqGg8eXblqaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UV8JkEaqJ3ZUYC0bLISlB73ShwOgl1EbobTWgGa6wO7ddt+L8xEfwfZ+LkIc1EaBh
	 D3DxFjRYhjukxNklJ4+jbO1gmgNuMV3R8idvAYnVyPQfhJ1QCVc8CSLR8YJmd1cxow
	 n1G05YgmfhriH5UuCiWq7pMCrZxAInsIpUkDmgBYgD9idnPJkfpBZm6Dw+v0rxeBSz
	 KgtoQGdglF3nfo0JGJaWROQaJTL9+hwhG9LYkqGFRtuJYVMIUaA8yYBmhbVxWMIEms
	 enPEby87SUy9EdC/u0vPZFoRYsIjVB+5lYRuzcNFmISnoqRpSzKm+4zLlgO7mh7Jpx
	 lpBzHqPUkhXgQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4wjr-00000003iTm-0VYy;
	Tue, 24 Mar 2026 09:03:47 +0100
Date: Tue, 24 Mar 2026 09:03:47 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Cc: Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] greybus: raw: fix use-after-free if write is
 called after disconnect
Message-ID: <acJFY3-qJ4IZGe6m@hovoldconsulting.com>
References: <20260324022510.28596-1-damien.riegel@silabs.com>
 <20260324022510.28596-2-damien.riegel@silabs.com>
 <acJCrBYJS61o2ZbG@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acJCrBYJS61o2ZbG@hovoldconsulting.com>

On Tue, Mar 24, 2026 at 08:52:12AM +0100, Johan Hovold wrote:
> On Mon, Mar 23, 2026 at 10:25:10PM -0400, Damien Riégel wrote:

> > +	retval = gb_raw_send(raw, count, buf);
> > +	if (!retval)
> > +		retval = count;
> 
> I'd invert this so that we test for errors consistently:
> 
> 	if (retval)
> 		goto exit;
> 
> 	retval = count;
> 
> > +exit:
> > +	up_read(&raw->disconnect_lock);
> > +
> > +	return retval;
> >  }
> >  
> >  static ssize_t raw_read(struct file *file, char __user *buf, size_t count,

Forgot to say you can include my:

Reviewed-by: Johan Hovold <johan@kernel.org>

when respinning.

Johan
