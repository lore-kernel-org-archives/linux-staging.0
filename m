Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471A23E0C4A
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227936; cv=none; b=IMKM2DQdYrYe+Ry58BDgL16N+xgaq2br3Di3e3sHVRiy5rT/QfIXwStt7HzOSRvaOr5pzUJ9BCXQSBO/RZ5YG3lRZylTlRKZZzFIaC8+6YPAeXIf7lWZ/8MoIJD9YOJBvnYUvLBozw5n9Iu5kNvEcIJ/w4Cd721o4QsJ5vVdL9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227936; c=relaxed/simple;
	bh=3R72J+B0B8iKHQA8z0/YhyM4MxHmoFrZJ8a9EngGtXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ab47MmQZi4VJ4Q+nOrfdVMAWDgx+qY9HFHflthdVouLLXPlBXblYlz3cQgQs13290JlUim5PFzDVmCLhjh591OFTJF0jz0W/YKfpEEFJENuCe3yvNMeRm+4Y1AWB67kAzbC4h/+jaGwcl9X73nFKQEnJGL8xYsWXEzp6gJpkxUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qxTtuIyQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qxTtuIyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A96F1F000E9;
	Tue, 28 Jul 2026 08:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785227934;
	bh=3R72J+B0B8iKHQA8z0/YhyM4MxHmoFrZJ8a9EngGtXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qxTtuIyQttVSnXnd4+bbWk1fXn2oZyR8vOHw7Db1AdF1DUcP5wELYVFRAEAjUUHFV
	 rq5AUM4qT8w3jUGSQU/+fS29viuCwtNTIVrBhkvtBdZeceuBaIzFpLZNk4QyJma6gN
	 8GmXOxMq5W1g0TEne8AV5e3yGvlAWsi2VYd+1GWk=
Date: Tue, 28 Jul 2026 10:38:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?0JDRhdC80LDQtCDQl9GD0LHQsNC50YDRg9Cz0LDQtNC20LjQtdCy?= <akhmad100913@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace magic numbers with named
 constants
Message-ID: <2026072804-sandbag-diabolic-bec8@gregkh>
References: <20260725125314.39313-1-Akhmad100913@gmail.com>
 <2026072833-scoundrel-deodorize-2dda@gregkh>
 <CACCSLCopDTUV2G9JG8yCuRnUYaOvCeNY-SHEC+xzv3kOJ3S2eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACCSLCopDTUV2G9JG8yCuRnUYaOvCeNY-SHEC+xzv3kOJ3S2eg@mail.gmail.com>

On Tue, Jul 28, 2026 at 11:25:53AM +0300, Ахмад Зубайругаджиев wrote:
> Hi Greg,

For some reason you top-posted, and sent html email which is rejected by
the lists :(

Please read the kernel documentation for how to configure your email
client properly and resend.

thanks,

greg k-h
