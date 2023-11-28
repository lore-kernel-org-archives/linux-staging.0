Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE9B44369
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="q4v1h73Y"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231128205135euoutp028aa462808f1e5aa9c9d19f17c4277fe8~b5KgrsT8B1438614386euoutp02X
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:51:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231128205135euoutp028aa462808f1e5aa9c9d19f17c4277fe8~b5KgrsT8B1438614386euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1701204695;
	bh=diGGB8M3QKr4xmIq3ZefcP17bCL3vrVLXybtHrc6cCQ=;
	h=Subject:Reply-To:From:To:Date:References:From;
	b=q4v1h73YXs7vE1q5HzWGoDI4Y463C023XWb+iEqnhxlyhYTGyxpLwybbg2hDduRqO
	 IIX3/Vu8ypHB8sDH0766C3Q2CNZ/q+IVrOSkWXQKK3Z+aVgrtMV2FXrpknU/3DfD2+
	 H6kw4tHd4kDpGMnrq6lPf5PrZOXpmTIIxWv4bAAA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20231128205134eucas1p1aece59e8a252e0007f8a675afb2a01d0~b5KgWQLkX2517325173eucas1p1G
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:51:34 +0000 (GMT)
X-AuditID: cbfec7f5-83dff70000002550-a5-656652d6ae68
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id CE.01.09552.6D256656; Tue, 28
	Nov 2023 20:51:34 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: unsubscribe linux-staging
Reply-To: sungchun.kang@samsung.com
Sender: SungChun Kang <sungchun.kang@samsung.com>
From: SungChun Kang <sungchun.kang@samsung.com>
To: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20231128205134eucms1p4611e41d1bcf43e6ba281c04e779c3d4a@eucms1p4>
Date: Tue, 28 Nov 2023 21:51:34 +0100
X-CMS-MailID: 20231128205134eucms1p4611e41d1bcf43e6ba281c04e779c3d4a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231125155712epcms2p6b4f5710f594fd1704f85424754f7c61d
X-EPHeader: Mail
X-ConfirmMail: N,general
CMS-TYPE: 201P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsWy7djPc7rXgtJSDWZP0LU48jnVgdHjxeaZ
	jAGMUVw2Kak5mWWpRfp2CVwZz9q5Ciwq9rwPamA062Lk5JAQMJF48mYRSxcjF4eQwApGiU1n
	e4EcDg5eAUGJvzuEQWqEBZQkpl++zwwSFhJQlrjzNQAibCjRf3slE4jNJqAv8fLSZTBbRMBZ
	YtGrWYwQ43klZrQ/ZYGwpSW2L98KFReVuLn6LTuM/f7YfKi4iETrvbPMELagxIOfuxlhej9c
	XssKYWdLXF54gQnCrpA4NucGVI25xM5js8F6eQV8Jb4vmwxWwyKgKrHxyTSoXS4Sqxd/BruH
	WUBbYtnC12BvMQtoSqzfpQ9R4igx6fsnqHIBiTUn5kCdIyGxteUJK0Qrn8SkbdOZYV7cMe8J
	E8gYCQF1id71hhBhWYkXV9ZAXekhMWXic7ArhQQCJdZunMY8gVFhFiKYZyG5ZxbCPQsYmVcx
	iqeWFuempxYb56WW6xUn5haX5qXrJefnbmIERvzpf8e/7mBc8eqj3iFGJg7GQ4wSHMxKIrx6
	H5NThXhTEiurUovy44tKc1KLDzFKc7AoifOqpsinCgmkJ5akZqemFqQWwWSZODilGpiEE5Z+
	YbBve7DxyGqJW6UMGcx+/7ljlvW+8Fnue3n1Bheec0fub5hr2PWiS27bEpXK45e3nTmS455X
	dSlCssqwe9Hy5OIFc9ctvJaoMWmD6q6ortutOx6YnNv/Y/mUL5d3ahnnWBhWrxYWTa1YNyku
	WoX5083U+9XWHxivL922ouJyq4xmc+ltdQGPyXuv886/nB5VJKzw108lmOH0RYlFVz1vndmw
	onNpWOpNKcHZRXW6u9V+epjx9a9gFuo4dkSoTP/qmu3XdqzZIW/TYiDz4Gj0pIkT1qplHGp0
	sBQ+suDWu1+PWvp+BanVSRgJNtR3Oa3r5Lm4bMUikcA3/yYbSux5dOazaWR7f7K89E0nJZbi
	jERDLeai4kQAO/x4DWcDAAA=
X-CMS-RootMailID: 20231125155712epcms2p6b4f5710f594fd1704f85424754f7c61d
References: <CGME20231125155712epcms2p6b4f5710f594fd1704f85424754f7c61d@eucms1p4>

unsubscribe=C2=A0linux-staging=C2=A0=0D=0A=0D=0A=0D=0A
