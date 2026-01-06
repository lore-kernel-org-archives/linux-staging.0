Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483D31B815
	for <linux-staging@lists.linux.dev>; Tue,  6 Jan 2026 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767694877; cv=none; b=LfBCd54wes9j+apWBry+GSucpb6GVyUoJ4Lm2YXoxPZ65l+a2K8jOuK6AA5TZOx9xyURewyG47At+iAb+celbD/+nAW5dBEN0YM28zIy4pR9K5Rnfcp61cfj7yIr7tSA1+gqIABC3N8TUGJpWVLFEvUpMMhyA+aPwk0VGOfcKqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767694877; c=relaxed/simple;
	bh=0J+UgXZTikSBMW62O+s2IRVJ4mrDfq3LVhgtE3ROVEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFBl5jv5lQwq/NEMfHINpq8lZkAkZ61X2tsIQ8veWCKnYoWrfx3esCIwXiRv4z3MW/3j+Kv06J+hgJWrmD+nI6h87ZikuVKynny011kSSOmR5KCy5zBtENDnAJSPFFOCY46LsISdVeDwgh70W7Ev0NDn+KUqv/K1Up+AynSbRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VzfddEb3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VzfddEb3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5CFC19422;
	Tue,  6 Jan 2026 10:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767694876;
	bh=0J+UgXZTikSBMW62O+s2IRVJ4mrDfq3LVhgtE3ROVEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VzfddEb3wr3J14mUFk28AryBqH97MD/PCa7zE4RePpdBSPk5AgrJ+gZImsAn/qgs5
	 EzE9xQRF9isByLfGKtoh8J25DsYLdBaiHSli62aHCh+rCPrqB9KHGvNHEpk9a2ROa5
	 qr0krmJrE5u2eNAKwUBr0RvFUogP+PKpVVyS+EYY=
Date: Tue, 6 Jan 2026 11:21:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: MottiKumar <mottikumarbabu@gmail.com>
Cc: linux-staging@lists.linux.dev, lkp@intel.com
Subject: Re: [PATCH v2] staging: sm750fb: fix const array warning for fix_id
Message-ID: <2026010630-exterior-body-2f46@gregkh>
References: <202512311146.XB8ZVrTY-lkp@intel.com>
 <20251231084130.364502-1-mottikumarbabu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231084130.364502-1-mottikumarbabu@gmail.com>

On Wed, Dec 31, 2025 at 02:11:30PM +0530, MottiKumar wrote:
> This is version 2 of the patch. The previous version incorrectly
> modified the g_fbmode array, which caused a build failure because
> that array is modified at runtime.
> 
> This version leaves g_fbmode alone and instead applies the const
> fix to the fix_id array, which is a read-only lookup table.
> 
> Reported-by: kernel test robot <lkp@intel.com>

The kernel test robot did not report the original issue, only that your
first patch would not actually build, which implies you did not even do
that in your testing?

How was this version tested?

thanks,

greg k-h
