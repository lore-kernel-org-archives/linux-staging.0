Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8BA372EF5;
	Thu, 12 Mar 2026 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336027; cv=none; b=Cl/AHUmHbycJc7I2gYfh4Mk8EpJC+23kiTj88eT6hdXLJ1Fog3k8ffXGaqpC3EYMc356y1+TlLLWo2m4N8KGEVdNxYoO+GtrVpysugq16z+NTz4Dxg3h6+H+TiprwGKSAp99Y5WO42BZUO85UywY3sQMcZZU6EaCXRniuGEYd70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336027; c=relaxed/simple;
	bh=ny7K/jBZhXDEq6jx91H6HCXPMfC4Gb+tqyvxOMi3/ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrIPS2tWlkJvFUG1K7Ug46Q6dcCH4M4h4N52Ji1EeyAUvahFyHqXm3Ds9S4eZbckM7G4Rzcorup0Dr0Kelyst8xXrf6oMAO2UotTffEAfW3rE75+dusJkrZdaLakEboa4FqULWEgkrd1hXkLOJ3J7lvM7VZdbl/9vIFVPCKQb6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H4ETubCR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H4ETubCR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED92CC2BC86;
	Thu, 12 Mar 2026 17:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773336027;
	bh=ny7K/jBZhXDEq6jx91H6HCXPMfC4Gb+tqyvxOMi3/ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4ETubCRiRf8b+1X9QLb6uCT+J8rxZqsNc0zB6Hp3RLW2D9kQJZGHPJZ/S/r0yy9Q
	 jPchUGL7whKnR1xIGoiDku1xRhWETIGWVd6KgCDC4eryJeTZJL1pB0OqhXEBafy71/
	 q/o+rRfFaX9QqgHJ/8eXL8KN2cSbuiJ0KgO/XsRU=
Date: Thu, 12 Mar 2026 18:20:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: ethantidmore06@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: Simplify error handling
Message-ID: <2026031231-engorge-widen-42f8@gregkh>
References: <2026031232-mushy-demeanor-299c@gregkh>
 <20260312164351.2295-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312164351.2295-2-b9788213@gmail.com>

On Thu, Mar 12, 2026 at 07:43:52PM +0300, Bera Yüzlü wrote:
> Ok, i will try to fix it in v2. Is it better to use a different subject 
> like 'Improve error handling' rather than 'Simplify'?

I have no context here, sorry :(

Remember, some of us get 1000+ emails a day to handle.

If you really are improving the error handling, great, that's an
improvement.  If you are only simplifying it, well...

thanks,

greg k-h
