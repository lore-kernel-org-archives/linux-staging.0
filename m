Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA92D359A6C
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 18:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777401816; cv=none; b=Dnf39qZgMAI24dFWGO2EoyjlryGlnMbckRKBWOOWuyKyPozKaWIoEl7mNKZ5D97T/vDUGZRxHhO5f7DXkoyAN6tExdGYMsBM8UhWUy4XrUW3kfU0l17xsigHQkhdIieocOQfvCbexn6HslyBVaaN5OQtpBp5zzf5t98icfhLK4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777401816; c=relaxed/simple;
	bh=HY3lHmvL85fSAcDWkjRv34C5fHkoaxTN3I38fQrReZo=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=AOACIiNNFKf+GYhHuqs/I/uGNI0n6dJ7SFH0Mb9eeZbKeBIbw6DNYSbGalbrhwjHj0D2rXEDChVWRWFlrB6LqhmJ5jePvXWbEZeeOt0HcssdqGGWSdkpZe4LziaHPtA3eHea5yjSe4iVg3K7EEDcu33vqPuw3MrLMVkdWUCfI4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=Rc6qMgtR; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="Rc6qMgtR"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 47BF984F90;
	Tue, 28 Apr 2026 21:43:31 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777401812;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HY3lHmvL85fSAcDWkjRv34C5fHkoaxTN3I38fQrReZo=;
	b=Rc6qMgtRBlZPOyEsMzFA1iRx0ZF1rQzV0VhPchiVn09KUFUMSc5u7B5Mh/JNyTNqmauO79
	49PE6JIkzzGnngutzheLBdDM7uh1+J2KaiBK7mUZv/q+lWMw0sozCTvIJBi47avq0N1s3Y
	DGUwmOMOGdICWdNDOSN7b+3L9qtH5275g1o9msiN4rTTMfDfCl92mkmXk1dZs6eHJHfpek
	i/TnVn6OCT/c3GI9Q+1xjwcexCAIts5YcfmlcdUv+MTaOpMRTR/+jrU0UYqQksgAPKOyEh
	NpEXYQvTI4M9OSAKJm11ufVOkdVQ64hU/rlxOWTViHRV4UgW2RIWKYJJfC+j1eat2MRbfR
	dcv4CubHbS82hq2VN9Lj2V6W1o2C1jhOYkAw4FrTzp4e0lVLlxEwhzTa+PaeWHQdf4tJA8
	GDo0R3XSD4d0ZhbYmVFiqKspzqad91NWjed+aWWu4ix58KZCiBSK2bqSWAF1Nw1lbMA2EM
	T90bz1ghJ5MDS+w0Mpv80Ua5ngAfhOU5ddMBOYBQ0cidZQ+oxkUYrDkHc429Jk5Jv5x7TE
	N9Us/DYtIAsuSjyGiqVCReKz79CyCf630+qtuK+Z2Zq/BuB2P29U/Oh0A0AnisO1aeL/ZR
	i403Bw8EjhTDhuK+7ff8O9MgUmr2GhCww2Jmk72N4yRVnbAnY/hnU=
From: "Salman Alghamdi" <me@cipherat.com>
In-Reply-To: <9EC2EE03-DBFE-42D0-AC1E-520D73C83C5F@linux.dev>
Content-Type: text/plain; charset="utf-8"
References: <20260428164513.763471-1-me@cipherat.com> <9EC2EE03-DBFE-42D0-AC1E-520D73C83C5F@linux.dev>
Date: Tue, 28 Apr 2026 21:43:31 +0300
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
To: "Luka Gejak" <luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <c681a3f1-fc6b-2f0f-6b17-d3fc29ec5fba@cipherat.com>
Subject: =?utf-8?q?Re=3A?= [PATCH v6 0/8] =?utf-8?q?staging=3A?=
 =?utf-8?q?_rtl8723bs=3A?==?utf-8?q?_rtw=5Fmlme=3A?= fix long lines and 
 related issues
User-Agent: SOGoMail 5.12.5
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None

> LGTM, so unless Dan has something to add, for the patch series:
>=20
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Thank you for your patience and detailed reviews throughout this proces=
s.
This is my first kernel contribution and your guidance has been invalua=
ble.
Looking forward to contributing more! -hopefully fewer silly mistakes :=
P

Kindest regards,
Salman Alghamdi

