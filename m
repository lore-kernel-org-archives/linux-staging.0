Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F835888
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="DCkoP2Dv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eSZG9q8r"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id 2170C5C01DC;
	Tue, 28 Nov 2023 09:20:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 28 Nov 2023 09:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1701181222; x=1701267622; bh=8tICVnFXKv
	HLhSCxFGb6EpkYCbKpG66jOH4xd4mEY5M=; b=DCkoP2Dv8FAGgooxR5KbD9e8Iy
	DBUfixphzl1z52/fbH5Urjh27ohnub8KrfUph4mE9deT0e+AV+LoNC0LkOf0QLgr
	wcVrY1YbhkBrjpXHvRaFSjsFzdo5HMWo8GR1AmUJLkTwvcBDQYBI8f/kjK290oiw
	cKM0h5BjfWET9fN+2sIgFU9fKFKedUO8A5AZThFuBWyVmkavP1mmwwwJLyMf+JjQ
	GUy0d61n4ESlXPj8JFNwjjgvO83Ni9dC8lH3R9GNMxV3yI55VYsvWzcIZ2j1w7Cr
	ycOAAPDBLsa34mLj0ekp+98oa32YTnlCD+5c46gpV02GdBgxE+oUuBwnDdBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701181222; x=1701267622; bh=8tICVnFXKvHLh
	SCxFGb6EpkYCbKpG66jOH4xd4mEY5M=; b=eSZG9q8rp2GCTvMALfwgtR1i3sSLA
	sW2OZt0vhBkTYvtlJCyJSDBHKRIm4mtU6lAklFF29WfsRxhX1/fsr9yIEvsJZ4ol
	FVBL1HZyqwSankKXU9M+dXwf6zSCW2oKmH8hwmhhPDZ276OzITPei0KFvl9ZhGTT
	zdWXAGbZ+49RaZ1aEWHFFAMUpsMfK+p4P4tRSDAVrw0yiSar4i7Izz0TOiOo/sjg
	xlgB7wCHk+l4NPPehx9i6FGpZWvkAYvFcTZZcuZGXEfY7n/s6esbM5qLSNC6cTxt
	u/mnICb+tOd299wTBKp1WiGzUVtHNpgyLb2NDE+lGPWs9LQJ2gVvLD78w==
X-ME-Sender: <xms:JfdlZeunTyNB9o1Wx-EWgGHSkYNMSacvZ3bKTUV_GbDkjo5qlsWcgQ>
    <xme:JfdlZTe9YXg43DYpNrPAgLcVPo8nIuFtwODxkhcASVpkRP0BSVkcobhKobbf-QEvL
    1Rsz9Zrkh1pXSazSyg>
X-ME-Received: <xmr:JfdlZZxSsSkcRANnw2LOXth7XKBspWg53tod29zv7TXQpbDu-T6zhvyKEqoZAwJUdTIaNZfWjZx2nv-aEig1qKYcdc27sj29e71LV7vkNIsb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeifedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgrrhgu
    sehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepleegffffgfehhfejge
    ejheeivdfgleefheeuueetkedtffeihfevlefhgeevvdevnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfhgrsh
    htmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:JfdlZZPAa8W0ONiWro5fjDGkZ66XPi8-VeYwDUY752WJtdQQUZPMMQ>
    <xmx:JfdlZe_UrBt61Fh_kt2nDN9w6FqR9lFe0mHi_SnIygn06iZdtvhN8g>
    <xmx:JfdlZRUAIB_AjdVF8skYK5GnyYGnFdg0mBEnfd8DT_mmNtaXd9ga1w>
    <xmx:JvdlZVZz3tZ8sRKpf3gRK6Q2cbVyTJB5HZAnMmzMKI0MkoucclCqaA>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Nov 2023 09:20:21 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH v2 0/3] staging: rtl8192e: patch series renames (3) different variables
Date: Tue, 28 Nov 2023 09:20:24 -0500
Message-ID: <20231128142027.15617-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This [v2]  patch series renames 3 different variables:

Patch 1/3) nMcsRate, from CamelCase to Snake case, also removes
Hungarian notation. nMcsRate -> mcs_rate

Patch 2/3) bCurBW40MHz, from CamelCase to Snake case, also removes
Hungarian notation. bCurBW40MHz -> cur_bw_40mhz

Patch 3/3) nDataRate, from CamelCase to Snake case, also removes
Hungarian notation. nDataRate -> data_rate

Regards,
Gary

Gary Rookard (3):
  staging: rtl8192e: renamed variable nMcsRate
  staging: rtl8192e: renamed variable bCurBW40MHz
  staging: rtl8192e: renamed variable nDataRate

 drivers/staging/rtl8192e/rtl819x_HT.h        |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c    | 36 ++++++++++----------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  4 +--
 drivers/staging/rtl8192e/rtllib_tx.c         | 10 +++---
 4 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.41.0

