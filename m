Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504794;
	b=0dQvDkb5lzaA80AshGLC8MxvSJaN1gVtOv4NDsq+KPkGSDD6TrI7pq3jtFoYZOq1cVCa
	 owSE8h+EtF9b9r+oFLkkRCH/ubjDOMjruC6nBJr41BeJAnK1n2EWbnRPDxcQJ6M6oFhvy
	 xJ5nM3yHqrNptqYFDafgEtEfIqb79FxeAOb0bmizqp2SW0ciUuu5GNw+5yhnhcnJ+UHJ6
	 QFUsQruC65Hoz5V4i7VRLlqSidDSjIz27QAzfej4GoVlj5EzJ24UTfE0+1yhUs/7AWEqo
	 38Imewlq/Gv59O5fLwP+529zhXcjZ1mVqI+ZIe9T7EvuSBOigXiyRKIzdYobBY7TSVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504794;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HBciqeiEDpGXgx5oj3DK4Q37rJwjJ46h+dAsy8Z8Pi4=;
	b=gGGIMMCsDajCDEwZ8LexSa59X2FXdL4oHrCN1NM4kfMdT6TxgmSvkdlM+DptBE7maU69
	 L4t2iHli9+WIsVH54KvlSU+qmnkKzAhdtCfoC7hipEspBZHrl8uFWyvkJ1IGTDEyG9da0
	 VPs8JiZ70084cUfOhNNG/EMo2H8l/YoHYkVIaJn/PQVLqWMPQGFjMkYXa2KziopPfjTMb
	 EvHJcERwq7AQSD0e3dIxCEVYqAlcH/ifTcHWms5gpr2oUqdttz12ZMb82Ofg2fRAn6trm
	 NfVWP+MLA0Mzsf/N1WiAWP/QeA7GazxUOmbybjl2sug2lTcjrAR2x5g8f2VF+DZG7VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tO9uUkVa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C64C606A322;
	Tue, 24 Nov 2026 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tO9uUkVa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253891F000C4;
	Tue, 24 Nov 2026 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795504793;
	bh=HBciqeiEDpGXgx5oj3DK4Q37rJwjJ46h+dAsy8Z8Pi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tO9uUkVat37/g8hixM7hw/Z30tFeJVBhcs1G+VUDs3ec/MrqyQj/IuWRbX5dRY0jo
	 4Vm7moda4NGeKi982SIv8Qt7aUkcP4kGt2qtFmXY2xtkpFSFAFe5SD7L88UKiJpDbA
	 QDD/POULwjCt9/dQ6CsmZ2/LKY2CjeHJbaB3tqRM=
Date: Tue, 24 Nov 2026 08:19:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: replace IDR with XArray
Message-ID: <2026112436-doorman-husked-5921@gregkh>
References: <20261123144556.72471-1-yogeshdangal66@gmail.com>
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
In-Reply-To: <20261123144556.72471-1-yogeshdangal66@gmail.com>

On Mon, Nov 23, 2026 at 08:30:56PM +0545, Chhabilal Dangal wrote:
> The IDR API is deprecated.  Use an XArray to track tty minors.  The
> XA_LIMIT range covers the same 0..GB_NUM_MINORS-1 minors as the old
> idr_alloc() call, and -EBUSY from a full array is mapped back to the
> -ENOSPC that callers used to get.
> 
> No change to the tty interface or to which minors are assigned.

Please read the mailing list archives for why this patch keeps getting
rejected.

thanks,

greg k-h
