Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CA13A9DA9;
	Mon,  9 Mar 2026 16:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075132; cv=none; b=NSneOfXlTDwkrRMvP3bWJu0/DYIHhuWXwt9Zx8J2fm73t5oS7+BaTpu+lSoiOp9NwrGcapMp4ZzsTD8vUa2c/i0s40CX3kJP7VqJ1eN5/lX9vAHrLXW9HfXUT/lh0EaErxKuzz5O3LKwgXTiNCtxlSWL28Je9vi3mXkOt1DduIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075132; c=relaxed/simple;
	bh=7ZjL9Npnoaxb6RQKEsaxir+UZG1VR1H8EvrYevHtduI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVvJ4ejytissuVMJ7t7B1zs4ozCngt34Bj0w+63L/c2naznlKcbdtnvU1pmhY5OeheQ49GZoQ0oZ803+okeNWNuYL1gJTFp3xlmIX9SL1TKMWFsHpxdg6Cs/1WS7yQ9ChTHmJt9eFcGQtp4fvQKlxqC5Iwt2phP7t9jEuVUWxb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s007PoIB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s007PoIB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0CAC4CEF7;
	Mon,  9 Mar 2026 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075132;
	bh=7ZjL9Npnoaxb6RQKEsaxir+UZG1VR1H8EvrYevHtduI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s007PoIBv5qV/sM/44gcRl69c/diB1gIFHq29jjl8AdmWjUy8Sp183ojedYVFmaAk
	 Du3iMtgA2HzwIIRPQK13ArAXdA/nTRGASboR3iNK/zKGewNNv690b/EDUaYm06yj/L
	 Ec0DHvsKIWUf2XEObGMr+d5JIjsu54CobKTa86ok=
Date: Mon, 9 Mar 2026 17:52:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: dipesh chaudhary <me@dipeshchaudhary.in>
Cc: trohan2000@gmail.com, s9430939@naver.com, dan.carpenter@linaro.org,
	ethantidmore06@gmail.com, davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace comparison to false with
 logical NOT
Message-ID: <2026030951-rundown-headsman-0a16@gregkh>
References: <ea785b73-b972-4bac-b666-b6dce56fb393@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea785b73-b972-4bac-b666-b6dce56fb393@smtp-relay.sendinblue.com>

On Mon, Mar 09, 2026 at 10:48:23AM +0000, dipesh chaudhary wrote:
> 
> Fix checkpatch warning "Using comparison to false is error prone". Replace "== false" with the logical NOT operator "!" to align with the standard Linux kernel coding style and improve readability.

Please wrap your changelog lines properly

> Signed-off-by: dipesh chaudhary <me@dipeshchaudhary.in>

And use Upper Case letters for your name :)

thanks,

greg k-h
