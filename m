Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F284531AF3B;
	Thu, 28 May 2026 05:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946490; cv=none; b=UiclCek74IC7bjD7q1WVkylcl82z8e3v/nM6EWxWrC2drZfH36KtfpYxeRaxYh5tJP1TxEBmuqtV48zh/jr4LpH1K6phGn6a2tjSZNUIp7xg8ASK5OJhda18dArv64Yxr5+2bz+ygOwo6Remk4cZp+e/rrgMhX/zpCM33m2Sq+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946490; c=relaxed/simple;
	bh=63RydxLRriQE1QolYkTHsXqBuTPQYI+YQmJO7dIFskY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADgh4IY9k8pEjAwt4pr7hImTYow6dZH1v4UjnfoyhY8ShLHz1kjoYn86ykECwWH4FKWb/PwfwVDp3oyKerOMjveRpqirDUvd7yk16jLsMHABXj8JWq4Mxm3nAutcVjabizTLnkIBQp6hZYsvVbRrivXQzLVdpISA810QTNKD7gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PXEGkpl5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PXEGkpl5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2811F000E9;
	Thu, 28 May 2026 05:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779946488;
	bh=acGBzFCTzt2lFSszMYYiGbXtREQUcy0+32LwZNlmgFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PXEGkpl5entqYaFaLBu3HXs77jD4W2KDlKe3M/geTdzY09mEnuoj75xelTwRR3vHE
	 BKll2ZiDQ4b6JGMYD935XBl4N0RlfuRPDYq1ZsU6l6FUEQs41x3ro5updqRSAVXvVj
	 FGG3oc2mOmeLkbcfRuFdV4w0w9Sc+Hr19QiGKrBI=
Date: Thu, 28 May 2026 07:33:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] vme_user: tighten slave window bounds and validate
 offsets
Message-ID: <2026052810-gracious-timid-b936@gregkh>
References: <20260527211425.569038-1-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527211425.569038-1-lucas.fariamo08@gmail.com>

On Wed, May 27, 2026 at 06:14:24PM -0300, Lucas Faria Mendes wrote:
> Limit slave read/write operations to the allocated buffer size to
> prevent out-of-bounds access when a slave window is
> configured larger than its buffer.
> Treat zero-sized windows and invalid file positions as errors,
> and reject VME_SET_SLAVE requests that exceed the slave buffer.
> This makes the user access driver more robust and avoids
> silent EOF on invalid offsets.

Odd line-wrapping :(

How did you find this issue?  How was it tested?

thanks,

greg k-h
