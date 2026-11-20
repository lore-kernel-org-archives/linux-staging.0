Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158354;
	b=fVojTBlwMU37JioKzrjR1zqA/WKZclLFQwbf07w7oKi4sFMCGcLS+yQgbRqNW5PnDQpL
	 SABjs2AT8qU1R+s7TRldzDRV1P6xiePgZ8DtUOfJWRHu8NPp9mcHdzQvAZYZX326+NqW7
	 ymtONm81Nfwnm42LTlam4LW+MPb6g8GoFgv0dm9KDEI7QGnioWlzm8ztXl5ve65+vUla3
	 KMgC9EbFGISlzg1UpHTZBVsK4xjEqQCARm5cEd7B1iPaJeOLUpURXyfuhQDtidHJ8K85U
	 gYC73JCdvq/8F1g5nMazD4xezbgES1ql1IQEJMQ2dyf/iaEthXjjm9LlvR/RPHssujQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158354;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YNTFrfen+uwX48gcvEOyMr5cCZJkLiYpOkB+74cvEnc=;
	b=sQ1GNtRXt4JjZeycJXkswrdBPrQBN2+6D8Mjd7IjZZzhyzyVxMRXvsVTr95i5WX+VGB5
	 cy6hLy/lCa92QC2aEQINEurpb989oK0olNEpYYFhNGNt45rlYwxTlqk+2/pwlmoRW2OOp
	 wRocShoqnWwWX9B1jbMOd1dj4P0CG/64eZXeekp6F6h9JgG1u5ndeSpsvAYaX4QhTtT1w
	 w8Wtj7tNmiumTJRaGS7ixOYqhQadzUt3W5Pupa4LEXWbVhZ2WMi8C/rtmrio+EYOrs39I
	 65cnldN2o9Q6O5EcEQs5ExSD0hSeW9PHVPbgo8iXV33r8ya9PD1O1vrrOgweAmAuhaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="LUgnl/dk";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DAD606A320;
	Fri, 20 Nov 2026 07:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LUgnl/dk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237BD1F000C6;
	Fri, 20 Nov 2026 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795158354;
	bh=YNTFrfen+uwX48gcvEOyMr5cCZJkLiYpOkB+74cvEnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LUgnl/dkZwAT3ckyeqLYXOOpLhVKhKP0e9brKHk4UbnEZFNZmUc5GOT8c1v6Tyms3
	 YY7yMPpcOa/84asM6U0fUEfuvpBKkqNd/hLOcHaSEuUNhdu4rAD3gTGWgDhpyR6J8S
	 mz1BSieg0jv2b1lmC5TMO93RtPGXkNIPuWOP6jZU=
Date: Fri, 20 Nov 2026 08:05:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Aviv Levinson <levinson.aviv@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: uart: convert idr to xarray
Message-ID: <2026112027-demotion-nature-db29@gregkh>
References: <2026111219-guacamole-quality-2ecf@gregkh>
 <20261112160546.27094-1-levinson.aviv@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112160546.27094-1-levinson.aviv@gmail.com>

On Thu, Nov 12, 2026 at 06:05:46PM +0200, Aviv Levinson wrote:
> The legacy IDR API is deprecated in favor of the modern XArray API.
> Convert the tty_minors IDR to an XArray.
> 
> To prevent locking the entire gb_tty object while loading the minor,
> switch IDR to XArray and use the internal XArray's spinlock (xa_lock).
> To respect TTY encapsulation, use tty_port_get()
> instead of direct kref_get_unless_zero().
> 
> Signed-off-by: Aviv Levinson <levinson.aviv@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)

Again, this is not a needed change, and odds are one you didn't actually
test with the hardware, so I can't take it for now, sorry.

greg k-h
