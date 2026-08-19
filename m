Received: from mail-m21471.qiye.163.com (mail-m21471.qiye.163.com [117.135.214.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033F2D7DE9
	for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 13:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147098; cv=none; b=g8UTi1QKDZCgh6qVChqqqYDxcp7epTsFe9L6TZqWlTSasUZPl1kEw+HYqNiAol517PZPEUTabaeYyXpJ20guhUKg+16fzymTJbi89dUfiLaey8cRA7dFqhAsgIM78Dn1PisMoQl4kouuetgpuYByNTmTVwQgJozDKCfZB226Fa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147098; c=relaxed/simple;
	bh=VFsaxfa/3SXEXjaUbP2jarq6ADpVtpdcFTYwnQzJFWU=;
	h=Content-Type:Message-ID:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:From:Date; b=JKeNymWM8nVRou4tb0jlKikxsUGj0wkWHWCOAkirRsA/yaXPO3YfxhduWmzbOYGZfRyKOI4QToU/wqZpYsGmySQQ3t6KphqtbpvKgco5r5VEYG08+Z7dAEmpSZpMa5NEWOFcG4WP0Dk4KvNR9R/edyIP1b+hgDs0aMIOrFiFPkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=CUAu/fj9; arc=none smtp.client-ip=117.135.214.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="CUAu/fj9"
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AHwATgDJK7Me8K54TPtxeqq0.3.1787146779806.Hmail.220255722@seu.edu.cn>
To: Greg Kroah-Hartman  <gregkh@linuxfoundation.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, 
	Alex Elder <elder@kernel.org>, 
	Kris Huang <huang_kris@projectara.com>, 
	greybus-dev <greybus-dev@lists.linaro.org>, 
	linux-staging <linux-staging@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gc3RhZ2luZzogZ3JleWJ1czogbGlnaHQ6IGluaXRpYWxpemUgY2hhbm5lbCBsb2NrIGJlZm9yZSByZWdpc3RyYXRpb24=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com Sirius_WEB_WIN_1.66.1
In-Reply-To: <2026081944-divisible-trodden-ab4b@gregkh>
References: <20260818142020.1989539-1-runyu.xiao@seu.edu.cn> <2026081801-arguable-gosling-c590@gregkh> <ANAASQBEK9Ye2X-O4oze*arv.3.1787142765226.Hmail.220255722@seu.edu.cn> <2026081928-calzone-managing-4141@gregkh> <20260819132108.17767-1-runyu.xiao@seu.edu.cn> <2026081944-divisible-trodden-ab4b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from 220255722@seu.edu.cn( [222.191.246.242] ) by ajax-webmail ( [127.0.0.1] ) ; Wed, 19 Aug 2026 21:39:39 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
Date: Wed, 19 Aug 2026 21:39:39 +0800 (GMT+08:00)
X-HM-Tid: 0aa01a3abc6002f2kunm8fc8cd0080bc
X-HM-MType: 1
X-HM-NTES-SC: AL0_4z5B86Wr4Tz9jdMF+bhXMTUS6Y2fHkyPT6dc03QDwVaZPGiA09TnwhbhTj
	hLfuFZO94YXwX6xgvkjGVFFRKj5N5PAWIpdnz39bwj6LHyMTYY5fqHhlpqTKtW7ei57CCbwb8etZ
	+m1ibwjT5tn8cJXX9p973O57zesRA/NATSajI=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQx0aVktPTExOTEsYQkhCQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVU
	JCSU5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=CUAu/fj9krgtK6/L0kmJtsb10MZoqp4vLR3od2RrQZgKGvAk82ha7KmWVRxr7ngFxiPiacmoLVq1p0vJ3/HWqeSvGfZIlV7/EqPC2D1ipv9yIe5c+f4XAhqwt7IN+VaKwU4i9dWZVTVpI7jPYhPvq/xgQ41dpz6jYRpYbI2NR7o=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=VFsaxfa/3SXEXjaUbP2jarq6ADpVtpdcFTYwnQzJFWU=;
	h=date:mime-version:subject:message-id:from;

T24gV2VkLCBBdWcgMTksIDIwMjYgYXQgMDk6Mjk6MTFQTSArMDgwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgomZ3Q7IFBsZWFzZSByZWFkIHRoZSBhcmNoaXZlcyBmb3Igd2h5IHdlIGRvbid0
IHRha2UgTExNIHBhdGNoZXMgZm9yCiZndDsgZHJpdmVycy9zdGFnaW5nLyB1bmxlc3MgeW91IGNh
biB0ZXN0IHRoZSBjaGFuZ2Ugb24gcmVhbCBoYXJkd2FyZS4KClVuZGVyc3Rvb2Qg4oCUIEknbGwg
ZHJvcCB0aGlzIHBhdGNoLCBhbmQgb25seSBzdWJtaXQgY2hhbmdlcyBJIGNhbiBidWlsZAphbmQg
dGVzdCBhZ2FpbnN0IGN1cnJlbnQgbWFpbmxpbmUgKGFuZCBvbiByZWFsIGhhcmR3YXJlIHdoZXJl
IHBvc3NpYmxlKQpnb2luZyBmb3J3YXJkLiBUaGFua3MgZm9yIHRoZSBndWlkYW5jZS4KClRoYW5r
cywKUnVueXUgWGlhbw==
