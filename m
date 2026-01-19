Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916603090DD;
	Mon, 19 Jan 2026 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818318; cv=none; b=qe7IZPW84HNoArX4QtgMbtlEUDRQDZJ4XfsgUaZDAx2kSgqEsWReXDJzSRqBkvpTxweztPvbiWAZqeck0nZhFA5e8XZ2IhM0heB5PjUS1knsFDeQT+p7O+/C4E9qCc95tVwx0l8c2hWnJ2f7KkgGBsP4YDPUJZdrOKLX/QHHj5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818318; c=relaxed/simple;
	bh=XwUFOlmPTX8t/w/823hNtlsLv0UTd8nRYhCdV/EQ1sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Th20VXqBSzzBUuPFGxau+HnLjvPgmQyN39UKQ6G3UMsPm4grRQU9nHIdiQ07N0q2nKepp9DCV+sVU8iSx0x+e8IL4fVY0nPeP7jbiDXGVtpI3UaX3qAm1x60wk4CW9zm8CQV6SKKpG2Cs+0tW4Tc01sdNiTfvImjxkTHsnCe4qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROMsEPb5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROMsEPb5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CFFC116C6;
	Mon, 19 Jan 2026 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768818318;
	bh=XwUFOlmPTX8t/w/823hNtlsLv0UTd8nRYhCdV/EQ1sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROMsEPb5XFkmHpB5o/wZHKEMppwUnkvkiIaf5EwJL2q9aMTqUD9c3D6VEHLyugRjJ
	 +m3G3BWSLCRyhEG+BW/7dOCdJ3IybiqyAfoE44vI4OOy0A0uHqvD/DcIlt0ed2ldFs
	 +vIfaArg7tkTk1gkyoaq/wsNUS6YFFTUoIPndMo4Ozcvvc0Sm/jU8R+A7+esl/+1Ej
	 B07L8kep+xeGK7dTqQ53lC0jHHK4tTC/6fIuu/mgG2boqOSbAtaqtq5lDYl6aW6MU7
	 3VaKWTgoIf0KawzBdRkbK/tDdKBAtX605w4qwUTRidF7hnv0ySMLcdgMYJFsH8FoSk
	 m2tm36ICOUBtQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vhmRb-000000000Q1-0gwX;
	Mon, 19 Jan 2026 11:25:11 +0100
Date: Mon, 19 Jan 2026 11:25:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Archit Anant <architanant5@gmail.com>
Cc: vireshk@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH 1/1] staging: greybus: fw-core: use %pe for error printing
Message-ID: <aW4Ghy94jAGSPml3@hovoldconsulting.com>
References: <20260118060548.24548-1-architanant5@gmail.com>
 <20260118060548.24548-2-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118060548.24548-2-architanant5@gmail.com>

[ +CC: Julia ]

On Sun, Jan 18, 2026 at 11:35:48AM +0530, Archit Anant wrote:
> Use the %pe printk format specifier to print error codes as symbolic
> names (e.g., -ENOMEM) instead of numeric values. This improves
> readability of error logs.

Greybus and this driver uses numerical errnos in its error messages so
this will introduce a needless inconsistency for no good reason.

> Issue identified by coccicheck using the ptr_err_to_pe.cocci script.

Also see:

	https://lore.kernel.org/all/20251029132922.17329-1-johan@kernel.org/

Johan
