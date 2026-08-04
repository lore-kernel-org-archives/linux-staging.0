Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750DF3947B5;
	Tue,  4 Aug 2026 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845463; cv=none; b=ZvRsXdngcuUVdVcQcdRq2BZclm4ZeEugVT4HmSN3HViUJzw+nd41i+LCNCCNJkxawNY0x/nOhhmbpIEUyYd7ughFWA46uCr8G89W3fwStPMIXXdSV6BWz9OebJqh1NSSv7XAdvfHpkG32Bd0i3PiMXMH4tRWYbBpu6wF8S21U6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845463; c=relaxed/simple;
	bh=5vPvJZEex37/f5YHQ29mXd3J1CrSQKFw3Qyst+8YkAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCGwIHRoaBC6SkNGqVoEfzQiwYRmvvTUAjm59Uq1TM7muyG9+Z8qcJzD3Kf0k9pd4E32IGAJfrZdQP9gezXcWrUeqaeIKaQ8TTh/ecX86+Bo11fQ1g2Ekj4j9flBJA2eQtGaH4QsUvjZ+y9oGjAxaOQ5z8czWYPeShVd3KTkMMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EIcPKuwb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EIcPKuwb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70D71F00ACA;
	Tue,  4 Aug 2026 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785845461;
	bh=22LDVGvs2ppFgJ0HTC+4DnUrRcTrM7M+tuP0mJZZ13A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EIcPKuwbIVK+8f11DGC/AUgnJ+4LnptCsIk0q8B+z9nB0MGvR0SsWeITUup5qSvKe
	 EdCeprk+nV5BK5kSdKv9wI3I8bIolg3TCCYtfdjgSymr5TZYONuaQZi3yAhZk06ZGf
	 bHVbe9fIoqsRlggtOQS2DmU+uBT+UAJsubMDgsh8=
Date: Tue, 4 Aug 2026 14:09:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: remove unnecessary parentheses
 from return
Message-ID: <2026080408-nanny-identity-d285@gregkh>
References: <20260804111417.21503-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804111417.21503-1-work.ashmitkumar@gmail.com>

On Tue, Aug 04, 2026 at 11:14:17AM +0000, Ashmit Kumar wrote:
> The Linux kernel coding style specifies that return is not a function
> and therefore parentheses are not required.
> 
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
> Changes in v4:
> - Removed accidental modification of axis-fifo.c which was incorrectly bundled in v2.

Again, slow down, and you forgot the version info for the older
submissions.
