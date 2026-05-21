Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D520E39E194;
	Thu, 21 May 2026 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352802; cv=none; b=LJx1GE02Tqs/ngu2qAdVcBUM2sBFMR/wKiDhQ/Akf6rdGK7vubsiup+v5WdwrA083xmCZVpaYSD2ZQ3sIKDlkfza+ZDaRlOf7ADQ8d5riZgjokG0rZk8lm25JHI34H6T76J06Tmar7PSeJ+f0dBaO5AiuqaU7IuEWgSQWAba6Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352802; c=relaxed/simple;
	bh=uRDRrbAw3gGoh02+/l85dyv5a3nrCdO1AhWDZ131m6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtGuyadYsplVk7bKzofKGNSKRBm9cQKC7fJoAVA6yk2NfpWktC5WLz7UMqZj39oDsT5UtGzm5m+ZBUxjTmZwnV8bFFXGrShEAOHldUdZKh190malOphACCbzTqB1z0/Nwe5rrx9O6dGu+fYJtGKgU6olxSUgHYmBCDLM5/qPHGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uhGQP3hp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uhGQP3hp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4791F00A3B;
	Thu, 21 May 2026 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779352797;
	bh=uRDRrbAw3gGoh02+/l85dyv5a3nrCdO1AhWDZ131m6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uhGQP3hpWo2oDPosN0y3jqBSWWXEWIJQDpsEUPeeldYfKdlRtwtLUyMrclWe4LvJh
	 7+rphzcv5XEaNncqV4YrPSY4J69EtrKQT1uP+TuAH1jkFytyq2Zv5HEIfEBseIQD70
	 XV7YYlbMV6AtDOQto0MQNYPtOSDkIiJqIplzNtj0=
Date: Thu, 21 May 2026 10:40:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 0/3] staging: rtl8723bs: fix OOB reads and heap
 overflow in IE parsing
Message-ID: <2026052139-illicitly-corset-8711@gregkh>
References: <20260511165743.1588637-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511165743.1588637-1-hossu.alexandru@gmail.com>

On Mon, May 11, 2026 at 06:57:40PM +0200, Alexandru Hossu wrote:
> v5, addressing the sashiko review comments on v4.

Still more comments:

https://sashiko.dev/#/patchset/20260511165743.1588637-1-hossu.alexandru@gmail.com
