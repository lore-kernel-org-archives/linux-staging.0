Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D3733064F;
	Mon, 12 Jan 2026 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205646; cv=none; b=BxBvmt/CEamZ2FYz/dov1pRNZV2XkpDspXeaQXsWOq5KTBkbOOIyl4T7XtcXL28an6cZsPh+LvAyNKdW6isGOvV0xz6yhmtLhgMXs78KXWwMYiF2n/dOmplMWr8/yXbbx7TiwtHLEHVoOLF93dCjo6XrPDguyA7NtgSSXAo9omw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205646; c=relaxed/simple;
	bh=JzzSwdHSFl3EqRlqkiKJ7KRzuG9dHqQ5GqnfdxLD8Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5qbVKgIAH+rmfOyLd1SzV5mX/ykzMTSUj7Objf4p0hVRH6Qza0MXIBxlyBGnAMxBJ/LjtQOfawWeStzPIpSSP3oaemgIzWoNhOX7EM7hf7Mcq5cP5uj5/RilQogaJe7NvzUdX7LOZgAu6QvqpSamIu2OAzJQSZVX5nrCGODw84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h5TdBi18; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h5TdBi18"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0CEC116D0;
	Mon, 12 Jan 2026 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768205645;
	bh=JzzSwdHSFl3EqRlqkiKJ7KRzuG9dHqQ5GqnfdxLD8Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h5TdBi18MDDo1Rmufj4D8MSOgrWwuDCPYzhjCcbFFIRauyKCoHmNR8pKGvG74jy4g
	 6C+IkMtFhi9UETuPRNeUksjmVc19DcPet4KVA1jjduAwViq++6vdS+tPM+s1hma4PH
	 RnVYro1PqzfRawxsDLPIwxlsURY4DY4PpqniDZTQ=
Date: Mon, 12 Jan 2026 09:14:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] staging: rtl8723bs: style cleanups in rtw_mlme.c
Message-ID: <2026011233-puppet-gore-6a9e@gregkh>
References: <20260112090546.367502-1-lorenzosimonelli02@gmail.com>
 <20260112090546.367502-2-lorenzosimonelli02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112090546.367502-2-lorenzosimonelli02@gmail.com>

On Mon, Jan 12, 2026 at 10:05:46AM +0100, Lorenzo Simonelli wrote:
> This patch performs style cleanups in rtw_mlme.c, specifically
> removing unnecessary boolean comparisons and trailing whitespaces.
> These changes improve adherence to the kernel coding style.
> 
> Signed-off-by: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
> 
> ---
> v2:
> - Dropped the patch for sm750fb due to build regression.
> - Consolidated remaining style cleanups into this single patch.

As my bot said, you need to do only one-logical-thing per patch.  That
is not what is happening here :(

Please break this up into multiple patches.

thanks,

greg k-h
