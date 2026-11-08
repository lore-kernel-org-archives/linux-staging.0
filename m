Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117268;
	b=P7zUoJkJYIB1waP7GrYC7wcSEIQ/PJw6T9RQGUgnabw1+VeR9dQ6A/SyGbckl/rs/3d+
	 Xe9q2TtAD95qRfNIGLzMSbL64LadySoPTnNsCP7xmTCi9ae5/djmebpeYl12hfDheeivf
	 owLtGRvxk1XwkVpDlyFgwHVFN6jAsYpCMF1ZW2HD0moMVoO1s5F8Kietpf6CxT8r6Cg5E
	 k65iDzjXgF2sV/5Q3RftzSMbqwUuNA2B9xMPVVZMGjlRzZJ0914+AVE/3Bx9jRzR4Ye2z
	 i8uS1/KGKv3LIZDeQxHLecHdtDd9ECNEYaSJO+x0ox0f32QqmBHeLw/fMP6xv6gk6jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117268;
	h=DMARC-Filter:DKIM-Signature:From:X-Mailin-EID:Date:Subject:Cc:
	 Feedback-ID:List-Unsubscribe:X-CSA-Complaints:To:X-sib-id:Message-Id:
	 Origin-messageId:List-Unsubscribe-Post:In-Reply-To:Mime-Version:
	 Content-Transfer-Encoding:X-Mailer;
	bh=68qAN3cxENFwAIBUF/JxoATn8PZjXEsg2lXjyDXyT2c=;
	b=AkLoGkP2IquMnjwgWuXmSB374WK8gsXwbJyqxVHgX5gKvvFVthZrYQlEh7za1KHKDNkK
	 TZE9exmOMagvAJPqsmKm/Beu8S0ZlcpeUOBV+YPNwKqNQwZ9IRrrW5lfxUgW2jMAW4Gau
	 C8+do/+E89yxHepDFz2mEkzU9o+N+Ruq9PT0+BFX2NIr8O4UmBwbQ7aQXje+0aNhSAvek
	 1+OeJrowra5J4LsnEyCcpqJNL2AE12nor2h1SKZK18x0jkHVQPysAQo5s80bgh/RHGaOu
	 HmN1TJTOldpDGc4Vi0c2q6z/kHHPQvhCsSHr123DB6chXhLJ1lXu1vyzSmh5zDWuVtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tubot.lat;
	spf=pass smtp.mailfrom=gx.d.sender-sib.com;
	dkim=pass header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=fx91EUiN;
	arc=none smtp.remote-ip=77.32.148.24
Received: from gx.d.sender-sib.com (gx.d.sender-sib.com [77.32.148.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA14606A31C
	for <linux-staging@lists.linux.dev>; Sun,  8 Nov 2026 05:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA14606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tubot.lat
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gx.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=fx91EUiN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tubot.lat;
 q=dns/txt; s=brevo1; bh=68qAN3cxENFwAIBUF/JxoATn8PZjXEsg2lXjyDXyT2c=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=fx91EUiN7QIKV1hwZ4RoBElqEVijryETqOGyYuGQxBTe8IWKwK3XUtNkXdlacBrjwQiHaD3yzeyJ
        sPcb3Al+Z9H48rIFNRKfDXdDjIKimg2OBErw0uHtnmrXPTV35xrx0qWXB38FBXKPad8BMuM9KH8g
        tqgA+MZgk2XZwYJZrdIDSI/FberyjZS5+T1OnIY7arYtgxAPM845iRGGe9ef4choKAu1A5yIM75R
        IAht7FqVR3lx5lYOVQkX5zEOCH6Xt0aWFyM2B//zRBQJcuqFbDKXAcauR7hcTAExEn1AI65VvIP6
        GskWMtSN3SKSpj5yV2tTZVX/xTAB0WQBKMjQlw==
From: "DelaySystem" <DelaySystem@tubot.lat>
X-Mailin-EID: NDczOTMwODc4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MTEwODA1NTQyMS4zMDE3NjItMS1EZWxheVN5c3RlbUB0dWJvdC5sYXQ%2Bfmd4LmQuc2VuZGVyLXNpYi5jb20%3D
Date: Sat,  7 Nov 2026 21:54:21 -0800
Subject: Re: [PATCH] staging: media: imx: ic-prp: add FORMAT_TRY frame interval support
Cc: "DelaySystem" <delaysystem@tubot.lat>,  <linux-kernel@vger.kernel.org>,  <gregkh@linuxfoundation.org>,  <vickramk.207@gmail.com>,  <linux-staging@lists.linux.dev>,  <linux-media@vger.kernel.org>,  <mchehab@kernel.org>,  <imx@lists.linux.dev>,  <p.zabel@pengutronix.de>
Feedback-ID: 77.32.148.24:11287567_-1:11287567:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
To: <slongerbeam@gmail.com>
X-sib-id: iOmz6AtmfpzKY0wigpo7kjZg0tRMOFBrPYyrbSBZ7R2z6yRjZ8M7Qh4JIGOulqFkTM6isklhaufXkBYZbS0mohP1X2OptdqF_qnur7lBW3Xv_e7acXxnxS_CU-3_UcKJV3SqAFpoYpKrFr5UFIxGVXscaVLH8-RbE0dxj3yn9bjgvVgRW5_JJ2GqulI
Message-Id: <20261108055421.301762-1-DelaySystem@tubot.lat>
Origin-messageId: <20261108055421.301762-1-DelaySystem@tubot.lat>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
In-Reply-To: <20261107-batch1-m1-prp-try-v1-1-56a08f54791b@tubot.lat>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.34.1


Please disregard this patch.

It was sent from my relay by accident: it copies a patch I did not
write, review, or authorize, so my Signed-off-by on it is not valid,
and I have no connection to the listed author, so I cannot vouch for
this submission in any form.

Apologies for the noise. If the actual author wishes to pursue this,
it should come from them.

DelaySystem

