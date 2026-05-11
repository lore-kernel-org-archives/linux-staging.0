Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9EE3B635E;
	Mon, 11 May 2026 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486926; cv=none; b=DMMarFjYHUYknGQcvO6iaEKUoFQbf7VNq6Rmbeokli1/S4AJlvfWpna70GyrgrPZTW8mQxlia+/QmizQvGGv7Pxfz/ZdocKmOUd+yONFiiKNmTEKyd+3Bid1SXkn1Q7zrmFTY+DK5PTdVxsW754KXA2oG7QTLOCis4qmn2ysMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486926; c=relaxed/simple;
	bh=BAJHRvNVUlOFnFVyxXOk5CRU2R+WwW6N00PVRnkEzjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZdaNNtzMi8aAqTNxSpV9eXb8n7ImJFdr6tL9FhUL1oefiVTH4YH81mfW5KZbmwgsjWdFLIWQXacWcjyqiNZtaMXaV3VJoVgZCh60mosN2k7G6sZo7UBv1Aai5kWtH0E1lnuJvMb1aQ2WO29la3GqbMvb24kAu9LMFoWAcRxHxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V+8LGzGh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V+8LGzGh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86F0C2BCB0;
	Mon, 11 May 2026 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486925;
	bh=BAJHRvNVUlOFnFVyxXOk5CRU2R+WwW6N00PVRnkEzjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+8LGzGhUWs7db4i+Jjc4QUN8R9Pbg8wNI5pFk/yoUIED/dEtNI1luV3vqZuJtKqL
	 t/oPWNfofylJY44YeQyHeYSTwP/cZFZ4m+6pD2+mvGeTM431iEJkvpSG5xO/4hDFQf
	 5FX4LYF2rBME3Er0JigDkRbhFqytnsW36yfap/U4=
Date: Mon, 11 May 2026 10:08:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Salman Alghamdi <me@cipherat.com>
Cc: straube.linux@gmail.com, error27@gmail.com, luka.gejak@linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/7] staging: rtl8723bs: rtw_mlme: line length cleanup
Message-ID: <2026051131-parchment-mouse-2136@gregkh>
References: <20260508222725.24075-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508222725.24075-1-me@cipherat.com>

On Sat, May 09, 2026 at 01:26:56AM +0300, Salman Alghamdi wrote:
> This series cleans up lines exceeding 100 columns in rtw_mlme.c,
> along with minor readability improvements.
> 
> The buffer over-read fix previously included in this series has been
> split out and sent separately as a standalone patch at Greg's request.
> 
> Changes since v6:
> - Split fix patch into a separate series per Greg KH's review

Always show the changes from previous versions as well.

thanks,

greg k-h
