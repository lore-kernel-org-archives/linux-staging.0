Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF8E332913;
	Thu, 21 May 2026 05:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342692; cv=none; b=u9lsKo8Y9fruooenYPtq+7IeaYIz8UogjcnZUVAa/u+6rtf+SNPAQx3/BQM5VntA52RyPKgWgczTOUMrY6+jLutHRpWZEtsyXg9sTzp0aER2iVvcXX02C0KtJSS9KBjayano8S62nfuHdhZk0x2zryhBzjRfu+z15xO1/ccszb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342692; c=relaxed/simple;
	bh=ijRLgzVYeRWjMBcJDy0eFYVtwJgW2F/CCuXlZBrttBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZpVJio3b2j9TiTvdQXhZvrM/JcHdAhcrxIfs3Mh1IqRksLYNJrEH10Nz8+1zQjjqSewCdBi7yAT3cicCdp1ICINHkLWK9h5O4EUoIBYp/F9JJ2GW9tL2ISyXqR7KJ6JqW0SB77rUCfmrPycrmJXZDdrpP5XrRLUslYWXfi73y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MD5ZXYgj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MD5ZXYgj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EE31F000E9;
	Thu, 21 May 2026 05:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779342691;
	bh=8Ib6FC/ph7BTCv4H2ZRqsfZES+l7O+n+0xcderVxhMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MD5ZXYgjaPgOxEAo9nlXThNO8ZAF/+rKliYIHJDAw/GpNyw3sxLX9nnUgHnw0hxlN
	 v9kP9n/ws9cVYEZw9/ltldksASjnMCBK+jbI8glkhEXmkbyHw+uTohxKvcZXJ+x7nL
	 xRYX8xbWrmdkzp6q328n8q0/geZqdeF/jmQTHpnM=
Date: Thu, 21 May 2026 07:40:19 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v10] staging: rtl8723bs: remove unnecessary braces in
 rtw_mlme.c
Message-ID: <2026052155-tall-take-f249@gregkh>
References: <19e490038be.2220747069631.5983756933086873911@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e490038be.2220747069631.5983756933086873911@zohomail.in>

On Thu, May 21, 2026 at 10:56:51AM +0530, Ashwin Gundarapu wrote:
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Tue, 12 May 2026 17:54:37 +0530
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c

This shouldn't be in the body of the email. Are you using git send-email
to send this?

> 
> Remove braces around single statement blocks. Also remove an extra
> blank line to maintain one blank line between statements.

That is not what your change did :(

