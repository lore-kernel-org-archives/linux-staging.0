Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64742E03E4
	for <linux-staging@lists.linux.dev>; Sat, 10 Jan 2026 10:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768039626; cv=none; b=asxhoyYYCVdEP8DFyJGzPdyYfxU+KfvVjZGsPRgg/76AILkEMI3QYYlGiSVt8hKIBUdJulgjNXi2vUMiAaWi6MqT4vp+MAQlLpBuhtq8mSaOaJSoCUTClU7N1vuhzatRP26Wyd3jtwPHe6rx04HRP2mBSOovyhYwz0wnxkIB2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768039626; c=relaxed/simple;
	bh=0iOqbzOduto5NiMZ5l2rGf5yARJwldMzDxOkErC7MKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D01+tqahSHGUA2hnswvCoG6LSIJnpBzR425zaa+MEMalstzKQsqP6ypiayYe3A797GsBDtS5YsJnq5bB/j7gJbDchqH/ydKB1xeQoMw3WniJmrOQdugDXuw8ZebQ+BoATg8hsl4zHMibD5M0pyx91zDqpkODLsFxLgrk/Mt5p4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: zesmtpsz4t1768039604t2e21c200
X-QQ-Originating-IP: deETf6F4DPxx7J8B9qQ0EOhTGFrBJofTXKCGvLr//5U=
Received: from cjz-VMware-Virtual-Platform.loc ( [110.176.75.164])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 10 Jan 2026 18:06:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8908952477453981888
EX-QQ-RecipientCnt: 3
From: 2023060904@ycu.edu.cn
To: linux-staging@lists.linux.dev
Cc: 2023060904@ycu.edu.cn,
	guagua210311@qq.com
Subject: [TEST] YCU school mailbox connectivity test (rtl8723bs patch)
Date: Sat, 10 Jan 2026 18:06:40 +0800
Message-ID: <C35E2644D73AB008+20260110100641.5681-1-2023060904@ycu.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: N17Koc4oSm0p5G+34lC413rghK/h+NW22wqj5kNItFA0gvx2isBf48jM
	PXrMKpuZbaixws96UzqN1iddkgIms3SV8VTzKhbu7vT/FC5CjiivnB8YEWjrvTXeIAAVIUl
	ifwt21cPLOan/1OKx2CHzdCgYUmr9nGZwZk8ZuPUeGrEIIyaMCFc5DIPpOY0HNw5rHANuc4
	6VbR52kWMc7aBGZ8tO7HAEbWSjaqKe5odZNZ+/ElcfvFRj3BOCdtfUvDFe37MUFhDhA7dNz
	GmEzQxDdqifUaVN4CVn23vn8kPzbapGizfm7Ixf4+JuiLaZ6VCul93EAt6sJIytEQXT8zKr
	8lOvKY8UDyScVy/LMH5f2BC1U4+Ty4Ygwvt23oyyiatpF0roV6dw+Bm5gFvkpq/PZcYQO6j
	I40LeE5R4pvc4XFA+ANBU5Mmu+EXXeh/MKtYmLGaB2uhzx2t2UNj+kxQgO2NU9RF3GebixD
	8ouQDQnxxDezGppfaHqz/eN6KMTQnYke0EOFK8GphxdWymFShy78xUbDlpRDb8Si5C/+8Q3
	BMI0U8pQZyB+Ssxc9WyQYk07K5/pMzIo+IwwDKBp/9sdgyu5pK8ON1/9xoOoGfRUZVoDCil
	Do4LQcP6yYnXmcyi4TBDhPASrDcOn3OfDObJouAvjcAtc2nu3jFREZUaD2XNTHHzKBUiXk1
	RHIJN0sxcsC8RtwEwNBO7Giw2MyK5Mi9DNxgLwTrQqMyhA9vhI8y+co8BnbmyCZEvkPyNYM
	7poTImnSW+0ph8mjq6IsjeorGrSObzJ+8O3QxaMLI2UXJVmFjmYuAy8MWyiIQQo4IWFGc1h
	aVYNQrm8ytwLUGB43ACK+MdWxE78QdY8jnf2QDejEg3VNprOYeYNrRPtm9gwtXAq+D7Qf3n
	ZessdCBxZaowLoJ4Z6orrtX2YLN1qwIc5Ne3LXkXGR9YKYz9McoU/vtXKtKizur/u6VrdPc
	iN7nsnWT+5cv4b85KrCz30U8ZmakN503+vMYPjCn+s65PuiZMajMeQ2ktg4NFm5vF81M=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Hi Staging subsystem maintainers,

This is a connectivity test email from my school mailbox (2023060904@ycu.edu.cn) to verify delivery to linux-staging@lists.linux.dev.
I will submit the rtl8723bs patch series (PATCH v4 RESEND) to this list if the test is successful.

Thanks,
changjunzheng
Signed-off-by: changjunzheng <2023060904@ycu.edu.cn>

