Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E2D14AD20;
	Wed, 18 Mar 2026 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819960; cv=none; b=jRseCfemNo/WforNQ9wTitV4mRpUg/nqTvV7bj+p+CKGOiqdig3X9HGD4vE6GargDHFKerztSuQAbjpIahMjGDl7lv4eT1GsDFL1sFdLhp6jS0f8ozFXt2C7OGJDs31OOF6nJYzuu8Q69TU6WSrV8tx8lTdzRiZhDT6gJGVOMzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819960; c=relaxed/simple;
	bh=wQvuTHyqS56/urxeNzTnjQ3G3nxnbgixJTiXZ7b8LKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfKMGWkV7DYZLSqUWR2ARC+bDdySLbGPyMnE8Km5kw5mSo59c5EpN+cUsqOz9Xmg3sdNCN/lXLznR3cWHX7apApIDkjWh33tIEErbgIQ8zUhOvsuwVCyBkVPf+VamL18Ooqup+UZOCjNPciscRXN1bZFwwluTQAvqiYBzvNgT6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGTsFQt+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGTsFQt+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF83C19421;
	Wed, 18 Mar 2026 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773819960;
	bh=wQvuTHyqS56/urxeNzTnjQ3G3nxnbgixJTiXZ7b8LKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGTsFQt+aWXH+wCtbwzjhr8fgZi8/5RTA4VNN2mmhusR6s5RGjr3aTxI1X177SafO
	 ecywhsZJSQiQV5JvnVLT/COb8AOIx408XccG5rdEZl0fqtVdJU+C1xFVIQboQtInRD
	 6AEIq47chHYtVq+rv5yDv3zSbCpCxRVDgKIfC39TolNWdy1JmlBWrNGIXODy27eIG+
	 n0rxsmpPArPysx9U2ZaaxWXBsh/fh1ogSc40ERPiiZNtakz9T2YkCSFvefxb2l0uw2
	 +tVmlmAuMnN4ZRN8Lcy19T7TmWFaxqUdgNDlNG5l5eWtLjU1ox3sqqrPb4M5tx+DDM
	 gSen28Keej2cw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2lbJ-000000004en-2b4z;
	Wed, 18 Mar 2026 08:45:57 +0100
Date: Wed, 18 Mar 2026 08:45:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: dtwlin@gmail.com, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: replace DEFINE_IDR with
 DEFINE_XARRAY_ALLOC in uart.c
Message-ID: <abpYNRYOM_Er80HU@hovoldconsulting.com>
References: <20260317211651.8098-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317211651.8098-1-rayfraytech@gmail.com>

On Tue, Mar 17, 2026 at 10:16:51PM +0100, Oskar Ray-Frayssinet wrote:
> Replace deprecated DEFINE_IDR and idr_* functions with the modern
> DEFINE_XARRAY_ALLOC and xa_* equivalents in the greybus uart driver.
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>

The proposed change has already been rejected. For example, see:

	https://lore.kernel.org/all/2026020735-thumping-chemicals-c76e@gregkh/

Johan
