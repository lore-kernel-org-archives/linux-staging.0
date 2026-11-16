Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839325;
	b=Px9P3x2/hfPlrP2tlC22JKealmVG927aBrGRXYBD8JkxTWwvzgwB5IYsWtgJLcqpM1bn
	 tyIBEdftLHwU+KFg5uPkWtgPd3Gr+Em+QGbTlGxXrXaK7IftKAsZXbidIETsmrbPeedNT
	 Vc2ZEhtcb3l7yU7LZfqdbctgmqOPMwuWAuWB7bX6J3EgSVgXRp73XEY1CuGa+GNfxwZwL
	 m8pyIYzN7lnO/dS3Xrd5V2LqGhksxOc9+/EoKOkVcN7JzmGjfTEw985COxbxT5Q4RldId
	 wRPf0I9pTrW8QIFxs30JHJwnmSuSPnTolxO/Cseyoh6qOH7A4PdDzK43lPmJZ429OIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839325;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FjyD5uAdZPuyAMbvI8qy2cWq08OnffKRzBHpwunG8PA=;
	b=niHB1NvQp28Yd7Q1NVKGnoxiJnMdsWpwDYlhOVM9GWnhEfChtxvG7dU0HOf+YF1CvWBb
	 zo8jR3aRKKxXqcjDYNB+lJ9wO3ks3NldhvkgHqk2AHIIG+9RZxpvVGxpR8miG0U54/kB7
	 d5OUH+R1lwmvA5ZVMEulLX3FMsJk7CvzuPHscjgpbM0xZYzZ6Za4HKXyMSOXMpT/NQzIg
	 GY1FzCYeKZ44rq5bQQeZhjbxnHgT1JiY8Jc464+/Wf5EWFxrccC1QfIwNMSU50aHHU5QO
	 Ed5nscM0vnzU6g9LfTntuw+46zC+OH7A8EHS6vrsJ8N0YilP04NYNI9UdKDfEMCfmNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YRihMANb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8C8606A883
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YRihMANb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7601A1F000C6;
	Mon, 16 Nov 2026 14:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794839325;
	bh=FjyD5uAdZPuyAMbvI8qy2cWq08OnffKRzBHpwunG8PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YRihMANbFRrp2u/rJ+WgYyoKOlfXlDcbjMtYQkM9CgG9rAxT1mSTmi2gZmpBqo0Fm
	 9C63pg/h+C6vZEgfYduEAJqfJmk9pZvUgJfF3q2062kFepR81/PapWJSU9vKzt8gsk
	 Ud9a+ToD2yymGsWJHqaAvSoL1Ct6WKaq+xf1c1LI=
Date: Mon, 16 Nov 2026 15:28:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan =?utf-8?B?QW5kcmXImWFu?= <danyer@gmail.com>
Cc: federico.franceschi@proton.me, linux-staging@lists.linux.dev
Subject: Re: r8723bs: NULL pointer dereference in GetDeltaSwingTable_8723B
 (RTW_CMD_THREAD) on kernel-7.3.3-300.fc45; 7.2.15-300.fc45 works
Message-ID: <2026111607-decimeter-encrypt-cba5@gregkh>
References: <CANOneGnzbBQ1WuMdgGBQ30+GqV09O1TwQ2C+RasmTJfhcWth4A@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANOneGnzbBQ1WuMdgGBQ30+GqV09O1TwQ2C+RasmTJfhcWth4A@mail.gmail.com>

On Mon, Nov 16, 2026 at 12:06:03PM +0100, Dan Andreșan wrote:
> Indeed, the driver is deleted from staging as the module is supported in
> rtw88 [1], but only from 7.4 forward.

What driver?  There is no context here at all :(

confused,

greg k-h
