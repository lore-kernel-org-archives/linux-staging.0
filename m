Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEF4352C4F;
	Thu, 21 May 2026 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779359911; cv=none; b=FateReZ5kiIf8Tv0wxflBnOq3MVTYHGcwSIFvbVLfknemhMBrT9ZNnp7n5F1Px/ex6XfLIvIkHqNJwwpEbaKJC9zuqj9RslK8xlOiaOyN0mDgb7dVLhbQLtjJa5LK2fMWf7ShknoQ1ImbZWBRWzEcHPF3WXMfx5i/bRm1u06EWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779359911; c=relaxed/simple;
	bh=FLkjO35oIdskOIVKTITCcQYLEmPHmEDS8NISjDXQek0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtQwk8YXo+FIZqAJZzO21+RS7v3ERMfgzITtCD5I7rJ5LCGq1UhI3nBH2Kzyx9LurtGhhtaSj37BAwmh+UCmP++cRiVAZRlfE2fexDaZyzD0jY6GLIX/uai/H/h3fCRzBmpTbpCr51EuaO2q52hh+zj+QWP2ni1YWUBdHe0tYac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CshWy1hu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CshWy1hu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1651F000E9;
	Thu, 21 May 2026 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779359910;
	bh=D6wK/ls3D1RPOJO9NFNIyc+UMozR+dFTCZw/ZuFigfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CshWy1husfbn6MOR+oIXFcu5uwutesA3xGKhor5cpR6foNivBjTrS3z+jy865fztg
	 mTTWI2OBauK50YrcGm/y6VAr19eRxbqbIc0thrakHrSjJCx3TL97Bk3X5I8j0No4Ld
	 UbT7gRDCUcwZITzQcvKVlzLJ4SKWRo2F90ZOjRn8=
Date: Thu, 21 May 2026 12:38:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Salman Alghamdi <me@cipherat.com>
Cc: straube.linux@gmail.com, error27@gmail.com, luka.gejak@linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/6] staging: rtl8723bs: rtw_mlme: line length cleanup
Message-ID: <2026052112-shortwave-imperial-c31b@gregkh>
References: <20260513203611.31872-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513203611.31872-1-me@cipherat.com>

On Wed, May 13, 2026 at 11:34:58PM +0300, Salman Alghamdi wrote:
> This series cleans up lines exceeding 100 columns in rtw_mlme.c,
> along with minor readability improvements.
> 
> The two bug fix patches previously included in this series have been
> split out and sent separately as standalone patches at Greg's request.
> 
> Changes since v7:
> - Split bounds check fix into a separate standalone patch per Greg KH's
>   review

Not all of these applied to my tree, can you rebase against the latest
staging-next branch and resend the remaining ones?

thanks,

greg k-h
