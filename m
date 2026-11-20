Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158394;
	b=zY4NDitdTLi7qngFMispiIXUFKChULp5zjpPmJAGBLVJ03GeR2NUWLew1npN6KKs677l
	 OPII8FkqFf8OP+RJvwSsMP0o5Z1ZT1sICg2eWbMQJx4iIFivo3QzsEumVrvsTfTimEc9n
	 YrvzkMEAFECy91Hdvd2nHhHAMMrwnd9heA6ibyhUzL+1LvRnVz9aQkKHAiIQsQ5kRbOh6
	 xeb34vr/JhpxHhW5ylENEoIUvbGN0XCkypbEUMHYdkDjQHkk6sbH9btecZfWfvndocUIs
	 0XZKoILH2C0TFd1K04jOPT+z4NMq7LI0zk6XKN/pG/rBMt7LmQ+qEtDXjBDDtnbOleA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158394;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oV1Pn+UyEYAjWVp6Jw0+ZimfdfpRcoHTlKx9ztXa/r8=;
	b=IOPynwEOsscT7XsPx3O+siPG/pF35ozFFBk38teRW8Vnt5fs1j4l+35IztJfH0CW7KiP
	 r3H/4fW0S9ocggws6Tk1OPU6exidPh/5ERS6BPok9upXFHZk1bF87GEXIngaO2vuO4Yta
	 mhUnviL5YGIV/hTkrBUScugzjcQX8QIgwLy8bBpTnqmKlcsaydcMm0a0T9yCb1LIP9pvz
	 qCF7Nb/V691TZyzNNQEF0Ax/Ncmm+dRXcyG/qz+Uwu4vcPBp7o5gdcUBzEtB9m895lR4y
	 9oeQeKUcdNBYfH4Zwl/m8kVqLm1prdAM5geALzKhTxgn9I7zRAsfWNgA4l83lMFLSQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=atq0+doQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD31606A325;
	Fri, 20 Nov 2026 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=atq0+doQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF761F000D1;
	Fri, 20 Nov 2026 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795158394;
	bh=oV1Pn+UyEYAjWVp6Jw0+ZimfdfpRcoHTlKx9ztXa/r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=atq0+doQ4SqKbHUGakdBonP/v52ZCS7q+ZM5b4p9FW7uE8RV+wnBWTbT+ANsQvRmF
	 S+b0bk6bs3ldspqRLdUDry9BB1Dvm+AZbUVB7dB1Zx8EM0VIKM1OemFIvimmre7GBD
	 wTAUx7J0tCeMf/5EHSUxCfgsC01n/X2Y0JN9zWaA=
Date: Fri, 20 Nov 2026 08:06:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jacopo Di Lauro <jacopo.dilauro04@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: light: use sysfs_emit() instead of
 sprintf()
Message-ID: <2026112024-fastness-pacify-ffb7@gregkh>
References: <20261105011845.130704-1-jacopo.dilauro04@gmail.com>
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
In-Reply-To: <20261105011845.130704-1-jacopo.dilauro04@gmail.com>

On Thu, Nov 05, 2026 at 02:18:45AM +0100, Jacopo Di Lauro wrote:
> Replace sprintf() with sysfs_emit() in sysfs attribute show functions.
> sysfs_emit() is preferred in sysfs show methods as it is aware of
> the PAGE_SIZE buffer limit and prevents potential buffer overflow.
> 
> Signed-off-by: Jacopo Di Lauro <jacopo.dilauro04@gmail.com>

Check the archives (lore.kernel.org) for why we aren't merging this.

