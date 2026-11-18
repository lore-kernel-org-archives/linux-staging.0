Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.69.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022709;
	b=WhIugwhLM1oN99qqVvGBVe5LyYZwx6TmwuXLZwKEZdyicS+x1JgSoTWok82Zgo05iq4D
	 WDoYY9oDWncjq5WCumAqfbo0V16fvXtKlVmqd+xCOCqZZ4VceEpE86+VEJra6pe+qRsLj
	 Y+pYfZyeS5baFrcfROdG+rpPTiZeuhlw4uyZGLB2VNWJHq1lNWHWDdHhrqx3ZfPNSMhtU
	 zETq3O1DGYbaoQXvutt57Tpf6wcaSYIGkvH+FHeiN5Y9IYwwRO4XIdAGCWjsaLxBNbzBD
	 6jIOgcIQIslLeURKvEDWuBONn4ClnstCyVEadTZFicT24XZaRFNDsN8qxNDf3cxYCqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022709;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Info-Out:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=ArPbgmSBvAMgkh9YxNrXFY4USeq1tN9NzTuavtgJjYo=;
	b=eregIO89stGPkH1sddYOkmksS3l0Q35c4Yo5wBxzZwMBexVB5/Ut43togdbjs+3GyLkA
	 yXWEqp4qEbtqZFspRph6JjeF1m+XAU7f/ZcO75kIqZ4V6emAOgN+pUuT/NFZPkcc6X8rd
	 e53ixytxBPk/45boAh+gIKNge7/sslnHopwh9dYsPFSTkWgkUACqQoR/eMyILkc/qcaDX
	 VAHyZ0AzFvb4+bVdh77p7BUEUxHvf9sjRkWTGaw7PgHCPencHuCMCQ3FTjjEW1rI6WkCi
	 7t3sSLe09F2JMg9zOs+fXMq1pQkrpD9lTFtGeSvmVMQ7JTgyM77l0ZrCvbNuBvOmT6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=Udq56yJn;
	arc=none smtp.remote-ip=57.103.69.113
Received: from outbound.mr.icloud.com (mr-2003a-snip4-11.eps.apple.com [57.103.69.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C59A606A325
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 17:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C59A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=Udq56yJn
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-4 (Postfix) with ESMTPS id ACB0218009A3;
	Wed, 18 Nov 2026 17:25:02 +0000 (UTC)
X-ICL-RepId: 01a1efb0-c852-7af4-8972-fb2d86cbded9
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1795022703; x=1826558703; bh=ArPbgmSBvAMgkh9YxNrXFY4USeq1tN9NzTuavtgJjYo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Udq56yJnngJVpvu3y/t7jxsOqQeSeI/yR1au9oYGOQBGVK2ffqH4ToXJyiaBI8gzzlNJ4nAYKsvqPwiAfHwAYr1MlayGkehUBq9HqkkuafeSe+fan1CHU2KuhqMe7sYfNdnmXdvgYe1E9KhSKzq848a8wlbeiDQz+JPb1Vb/9ZWuqWczVOldb9+WDQiPiVaTcRn2EX9ZDRh6iHwZFiT8yHu0U32gmIfezjbibgNQeqpPaCqSZ6B8HfRkxJ2xkDA02nAYW2u7LITtOFrwwlJhjtgk5UEYXXMSZ9y/uO5kI1RR1esyNckfQ3Lc6sTSNYEuOh8yXRTbjriZjcYSrdz7Sw==
Received: from archlinux (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-4 (Postfix) with ESMTPSA id CECB4180043E;
	Wed, 18 Nov 2026 17:25:00 +0000 (UTC)
From: Philipp Prell <philipp.prell@icloud.com>
To: philipp.prell@icloud.com
Cc: dtwlin@gmail.com,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: convert from IDR to XArray
Date: Wed, 18 Nov 2026 18:24:57 +0100
Message-ID: <20261118172457.388898-1-philipp.prell@icloud.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118160141.341572-1-philipp.prell@icloud.com>
References: <20261118160141.341572-1-philipp.prell@icloud.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2OSBTYWx0ZWRfX5SENPW4Mf99b
 vsKjYvIr3xc38/UToL0d2G8xq8XsS+VD5YERX5n9iNwvnDcdfzLnyyIHc+MbyaSTRQgsJJux2qz
 BIohzLCrPXuCqdzqLKThw5EQFCAD4Yk=
X-Proofpoint-GUID: subBA8ByJE2sD4cRqPLlKd8XKXbnwZ_t
X-Authority-Info-Out: v=2.4 cv=Maj5KJ/f c=1 sm=1 tr=0 ts=6afddf6f
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=BXpT7KiN_MIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Lz8lNifEoAKVmCoaIBl5:22
 a=RFeMYaZ6Aqw0RB263Fta:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=hEDNuPLRspzfzEIEyA0A:9 a=Mi6j4gOevsgA:10 a=QYH75iMubAgA:10
X-Proofpoint-ORIG-GUID: subBA8ByJE2sD4cRqPLlKd8XKXbnwZ_t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2OSBTYWx0ZWRfX0bBrY80P2HQh
 AIGZ+60WHhmwTzlKLlHBFdFFVhGaR/QNRD7L7Pp5qTWn6CrgqAhg/pzLyZyIScRUcKcA3pB4O/k
 StIiuqdUOsMPVn8twUQX80b41JQfhRAzGOfxKmJF5OzuXoWCL3GlaMifOE2pgkdTGHsNRBNndxu
 Ld1EMulc2KF1eWhflBN48kPIk9WDeapUDU7sKinBL9LFK2/cdWWEQD2DRgrE2GFrQWAx6FkTwrs
 xs95VjElkUcmzktr+UA1p6n1v/O/zz+JNH8KfmgTQs+cHHwoAWg6X8Nr6nVxFaCpND97ekVIyOE
 +/Mj8i9spAZDN+SVwZEdjpLCpaO11XZHqKgFlDL+pV57VTNs8SmLGHkvgrzAzg=
X-JNJ: AAAAAAAB1kZkHKltQ7ylZ/LbKPMLnA7TSwniZS0T+z9EEv6Xm50LR0iNwXVqOpo3wUMwic
 pVUdPgMowCV/Kayg7qdOQ7CX/PK33YuvorhzPoRT2yHG8a9rwTnqHyrE+Rg/fp3MvkJWQj
 85bho2XiRDcthVHpVhr9C4E3ehlvDdgyBDXhF1TwbtNN1yX6O90Vgkg0k2ZAup0sBbyh0O
 oDJ3FL9JFoSuj4lE9czTWdgXTyKCkLK5lhMTQfM7rjZNQDLMqVHTGqB5T6pHtWHCefnpmP
 MLkOTDFSr5NkwvLLL6BhJWJKMPu9rJ7PzFRahBgNpb8eF3jSxQ760t3DAI/9Rc/3DuHT7I
 IjSd3bRYX7uJPHY/CsoVkFI7wrUAGBXObt9qOcli9G98jd19HYVo1Jc9FBHVZJ6TxcAhPj
 6nYEfb1GjMyJCNMP0Xi2ncNj/SzAxETJEI1EJ5N1xBwoexNjGpZjnXPQ83tPuSCOwoE/kI
 yQcEid2Ra1d7bI5iclDL5KU0qdeO710H8jNN43bnwzy4ae4leFPr2YUP1Z3Ju+JGfO4MER
 xFkQtMh1dz/oiteaZlh5SnX0aD5Mk1vVb+r6HIHvdCDocGyfcn0YUKWAtZANX3xCr/ZGSh
 TGFdbcUnatO307LIe+wY+UWfbw4yM91BGntg7cQJRlZCpUsJYRLzZNNLwtCtpf4cFTgg4Q
 4D8uqVR7jw9p6Z96UizU/GyBK/OZmIIANRD4owMr07Zgi9lymGeuy0yM+5vDCmN9iFeW4G
 lXnGxEGS6hvipjDC+dGgvhrSueO7JnknnBrLZSbgsiz731fao+AtnjRoJ+aXM0a2hi8YrG
 fE/5BDJESiNk4FqkeTYgVxma4XsGOSdWU+9ofMdCnXtfb20LeviooSKO61jevHL/WrQTT8
 rIhgDEISKAjTRX8H/3XGBaIJsop3yRLhQZPwtgFIzEsgq1oJ8iWvQmypzHY5YDXUwNgKxu
 xxKXmKqj32JCasTpv9xkwwyFwLArEYAkWvl0tKBYsMtUOL4DXUpDIjZaphuALayQMq8WtX
 /Hq3i0mQSrRPEYvzGy0L2midIqsSep04XHfZwt1FRKIr6dq+zfKpLr5wkRF7+vgcK7Lr/t
 kaQ9Gp/SRzm/719mtySSZnGxJKwNQ5xTJbY2Df6O0inI4fogfTZa82MsNo3qhrFs3xDxwf
 4nabZPVX1mRBQTm7SlqlZ1Q6LD7aIkrOQMsk1q/Hi3Q16HGG1Qsgt2hOfpeRetc6ziHhyK
 oTXsYmDb0inAluJNAP90RF3/H9c4qi+0vn7yuerWMW+2ROldMXBrPFqQ5mPc6K4h3ZOOVi
 k=

Hi,

please drop this patch. I only found out after sending it that the
same conversion was already posted and rejected in 
https://lore.kernel.org/linux-staging/20260810141043.76948-1-dimahtms@gmail.com/

Sorry for the noise.

Philipp 
