Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158909;
	b=DL8WcRjjh582lmuzCD2P18FPs1Ne55qZbEYPxHuCbW4HvVH8EFki6TZYXwLZvMDmaQ/6
	 52yXlMlaeC6tkooLfCD4Oau9oH+FgIKAeaSGMnek9E71vduyCNR9sxy439KviZsvuIRkm
	 ayD5yKuRU5deQYMjpQLOuSsdiKYJlj3EE7qWBjl8+7hyI+moSYJGR6tZRRTTjeXSU8ks3
	 /fzLWDQgQuqFTx9QpKmbA4kp4/GfAwUPrb4GS69QmhY4C2Xxc8e+3mibjiJ6I4DDAyTGz
	 nMi4khEoEO6I4VBsHjy5z/r9Ys6gR5Co6jtGE2bfOQUekotlWjLH0aXfjuMDzOfN1uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158909;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M1vM1hW8MosKcywV6qIcvb/oHiAwshYCDqraUSRSHAw=;
	b=P1vLVn73vDQ30L3aLK7iNkqqjJLDUokrKu1UiBLdmCYhPR7atVmDeANAL1Yv6ARPVhG7
	 N89c7G+WJgNcgZT9Q2AQcUnoZIzlR13PhwbrMxv8aVsKxyYZGSBtSXEI9b0EpI7/MXiCK
	 2/BHJO9E/IJM/6SRGw3CUZTZ9/GB0BovrSnNv0FoSF6O5MKOGswzJKK59CIzNUtIXqfFs
	 w9NxvRhipmA70MzJZjk4SBL2rnlO9Tf6BMB7IEd57E/XfbqC5U3nYWuxPqJEP3Ec7DlER
	 BEN1x4tgpV/PaC0fCHaYG374FUWqVZlFeQ8qcmSK4m6VNm+uHXF0nyh/dG3iEnPAXtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QO8R1q6a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C55606A325;
	Fri, 20 Nov 2026 07:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QO8R1q6a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFCC1F000C4;
	Fri, 20 Nov 2026 07:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795158909;
	bh=M1vM1hW8MosKcywV6qIcvb/oHiAwshYCDqraUSRSHAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QO8R1q6a2mSnRZen9YOIipCzend/sLiz7k7VDszRfLnC89JNkLxaBxvwZ+hv6ga1Q
	 Zdf1pQRJDXhAZ6KTbO1Ne7uVlIpkCoDCQ/JvEJMqX6ndlC0OpcGwCRbKHuhol0cSBg
	 eGODOWBqNPHfPwL8g6m1iGTcJZlJvUQcAbmeKYR4=
Date: Fri, 20 Nov 2026 08:15:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: DelaySystem@tubot.lat
Cc: shyamsunderreddypadira@gmail.com, marusik.adamenko@gmail.com,
	error27@gmail.com, christian.gromm@microchip.com,
	parthiban.veerasooran@microchip.com,
	rajveer.chaudhari.linux@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: most: dim2: drop volatile from state counters
Message-ID: <2026112047-delicate-sheet-620f@gregkh>
References: <20261118-staging-dim2-atomic-v3-1-bc595e081fc8@tubot.lat>
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
In-Reply-To: <20261118-staging-dim2-atomic-v3-1-bc595e081fc8@tubot.lat>

On Wed, Nov 18, 2026 at 10:24:41AM -0800, Maximo Manriquez Lizarraga via B4 Relay wrote:
> From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
> 
> The request_counter/service_counter pair is shared between the AHB
> hard-IRQ handler and the threaded-IRQ service path, but every access
> already runs under dim_lock with local interrupts disabled:
> dim2_ahb_isr() holds it across dim_service_ahb_int_irq(),
> dim2_task_irq() across dim_service_channel(), and configure_channel()
> across the dim_init_*() calls that zero the counters. The spinlock
> provides both the mutual exclusion and the memory barriers, so the
> volatile qualifier adds nothing and wrongly suggests lockless
> cross-context sharing (see
> Documentation/process/volatile-considered-harmful.rst).
> 
> Converting to atomic_t is the wrong tool here: the service-side
> check-and-increment cannot be a single atomic step when done as
> separate atomic_read() calls, as Dan Carpenter pointed out on the
> atomic_t attempt, and a lockless scheme would still need dim_lock for
> the sibling channel state (level, indices, done-buffer count, MBO
> lists) anyway.
> 
> Drop the qualifier and document the actual protection in place. No
> functional change intended.
> 
> Compile-tested only (MOST=m, MOST_DIM2=m build clean); I don't have
> this hardware, so testing on real hardware would be appreciated.

I'll only take stuff like this if you can test it on real hardware,
sorry.

thanks,

gre gk-h
