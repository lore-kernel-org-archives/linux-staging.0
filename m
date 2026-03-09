Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2DE3E9F7C;
	Mon,  9 Mar 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075439; cv=none; b=M4soY2LqhaewGGf7dWkBXvBjFIvYl1tYuZBFDREWbNEA8aHv/cbmEs+W/hHjKVUoGo90HeUCJ7iNn722WYrvaZxDpo9FNsTtpuw7WASSNlBIadCSMXMsu4xDmzFtP8S1O3aF+Z6j5Jjy5yCIFoglKkABtvX1b/u+Ibw1CyXnims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075439; c=relaxed/simple;
	bh=1apN4a5cObWAe3EjgWqAH2uxez5TlfuWxWjRPze8NBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uP+MCbCo8akHSaChtoacgcWT2d7sWMktBG9owk1Lg9h6uGnI9T94wHHwudWaxGUsYrVjH+Pma6nhKq1IE85E+q5zMjqcomKaPPuhPdrL+VNSskK+NG+Zr8rpXow+Qtf7bWbh0YeOHHJErwFJxC5rQzS//2KZOZsi2fiUwswhwIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cTslSmcq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cTslSmcq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988AEC2BC86;
	Mon,  9 Mar 2026 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075438;
	bh=1apN4a5cObWAe3EjgWqAH2uxez5TlfuWxWjRPze8NBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTslSmcq96PmqGBHQML1My2Z92+sQdCkJ1XDdZIqPUqfpMGxwfFoPipOkDuPKaeCN
	 Kt6DB8ctueCvah5fEPHIa/aCGmYDQh7m00SPJ2DCWf8ga0/Y1lp4R8CEGl1WCX3WdL
	 KDVg9wYkEZ5/ZfRTliKGtpTrsEfpVGk3DqPBilRM=
Date: Mon, 9 Mar 2026 17:57:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Message-ID: <2026030952-petroleum-osmosis-50df@gregkh>
References: <20260301005019.2510157-1-objecting@objecting.org>
 <2026030908-destitute-rely-9997@gregkh>
 <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com>
 <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com>

On Mon, Mar 09, 2026 at 04:14:47PM +0000, Josh Law wrote:
> 9 Mar 2026 16:12:17 Josh Law <hlcj1234567@gmail.com>:
> 
> > 9 Mar 2026 16:09:27 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
> >
> >> On Sun, Mar 01, 2026 at 12:50:19AM +0000, Josh Law wrote:
> >>> Signed-off-by: Josh Law <objecting@objecting.org>
> >>
> >> No changelog and your From: line does not match your signed-off-by:
> >> line, as others have pointed out :(
> >>
> >> thanks,
> >>
> >> greg k-h
> >
> > I think I made V2s.
> 
> Oh and also I made 10 V2 patches, come on.. atleast ONE is useful for you

I have processed all pending staging patches now.

thanks,

greg k-h
