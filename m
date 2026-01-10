Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8433E1925BC
	for <linux-staging@lists.linux.dev>; Sat, 10 Jan 2026 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768040304; cv=none; b=NoKisbn3BmrKPZRPNqk4JacKn7Dzkshc5kn5ASmEX7mAUzTE4v4D9KTxjyN7ynCjRXpnS0xE722p2FmFdoFYPlW1X6RXidbwHcHYCcpwAVzAFKGDr81x86AvvghY6UZfs6CkxBzY0RqrlZ1tyzLqCu0Lf2CZs/V6vWF/1kd5lqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768040304; c=relaxed/simple;
	bh=I6jh9mh85p0G+oZWToC28R0RJw3c2yuF8H59zml+jy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ukgkfNw/tH6D5pyJWwJZlXYTb0QUWxWtgH7vBN/pvje4J3DA7kYk7OqlERsu9N67l7Ja909weBZGjTFhTTNz0lTuAhPKJod7yGDWlOfANbb3OJ1WsYnErpCrzYl4y/ek2Mu6OzAVpRFlxXyPP0XzsSbCCFIM/jrl3OyqGSvy/VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: zesmtpgz4t1768040289t43a18d1f
X-QQ-Originating-IP: 7Ywn5fx0Egw7NSkG/Wrz7rmYYzsZZ35nwcSDtEEHKag=
Received: from cjz-VMware-Virtual-Platform.loc ( [110.176.75.164])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 10 Jan 2026 18:18:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9517520701960282950
EX-QQ-RecipientCnt: 5
From: 2023060904@ycu.edu.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com
Subject: [PATCH v4 0/3] rtl8723bs: Remove redundant atomic op and replace global io error var
Date: Sat, 10 Jan 2026 18:17:57 +0800
Message-ID: <A44C699B73509335+20260110101801.5820-1-2023060904@ycu.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Note: This v4 RESEND patch series is sent from my school mailbox (2023060904@ycu.edu.cn) instead of the previous QQ mailbox, to resolve the email delivery rejection issue.
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: N6p5qtJwZog+eXi+/hdanQvconj8Sm6RVTmbVQSAAHKV052jVN0ne9Pu
	ml7hUsNsVgmEKCULkc8VDN1JPvQtH5SOR8vRgW6FhAAZaq+pwqyPXsUqQhZDDXKulZZQPFL
	1p8j9y9ckUPnXjGSadEcEEaoD20/LzVonleEaPVjuCjg0o0VuoUjQqkKz9AGIl5Ajxf7W6e
	N+8gHdYniUFO4xKtnQv+LlP5odjYIECYxeK7YYdAOtU4pMfcOg89ffXz96oQgRiWyGedLHa
	hl87lUAmSnmkplmojnHaIFLPfE49+S0Vlq8fojx6PQgzfBxONZUV+4bMatw03YCwGI5336e
	QtcybOtokNxgXQ5zShSaRMyxu/eqhYPAc1umdcCoWO0T4ABixr7UGh3cM4DOLL1Tn/ucn+P
	MgGkXYz30h4pvWu+xFN5W8tMKZYK730c2woWTtPLWTxBIU2lRwDdAsGEAe4szpIrO+4cQeV
	4gag2uGwHRT1gpxGM7i17iV85syhfJbw4xF93RcUeeNOiekX9tB7sdq52rSsGbCzm96Dxci
	W18DctB00eDsj7qX+Q9nRsnViTlzwAmD24BfRanyTgdFMtG8sPYQYVzDmdc2OUTidgKhmW2
	1VvGGcU38CXfQb0XmmK9FOSUWx5DKubsGCORtU7xjOKpiLFhWgclO7CGzghvG8NzbcaCoXZ
	L554u0sKvMkfdLeNtd0xwqCGT/mR3RZl49+vu2qo54zOFFcsTA2/ulRFyGn/CPfGEBxJpCR
	aBMCZZw9sEGPovagy1vP3FvhikfTtF74iMaPbQjDFZ/jr++4bz/bCHufpuCl5lIaiEiuCq5
	khzOL8x7P9vPYHGBCgWbdxEvt9HEDY+LZR6lpc8C4ZqUQBwX783o8En5pSBKAY0DL3VueHW
	gJlhUWDW3M/h5hqWjpr6+oB5w4ZIWMwerSxirB6iBLKsJxSPGlKVP0NsDW6AVyPo6TDwUox
	ei0GhAm1PNQ5c7rWZ3I0XTkP1SrkO2GjWvK8=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

This patch series optimizes the IO error counting logic of the rtl8723bs wireless
driver by removing redundant atomic_t operations (unnecessary for non-concurrent scenarios) and replacing the global continual_io_error variable with local error counting. The series is split into logical patches (per Greg KH's review comment)
to ensure each patch fulfills a single, clear purpose, which greatly improves
reviewability and future maintainability.

Patch Breakdown:
1. 0001: Add independent rtw_check_continual_io_error function (single responsibility, includes old function cleanup)
2. 0002: Use local error_count in sd_read32/sd_write32 (eliminate global dependency, remove atomic ops)
3. 0003: Remove redundant global continual_io_error variable (clean up struct)

Changelog from v3 to v4:
- Split the monolithic v3 patch into logical, single-purpose patches
- Fixed all coding style errors (trailing spaces, missing assignment spaces, indentation, blank line alignment)
- Added detailed, purpose-driven commit messages for each patch
- Added version changelog as required by kernel documentation
- Added this cover letter to explain the entire patch series
- Optimized the new check function to remove redundant ternary expression (more concise kernel style)

Thank you for your time and review!

Signed-off-by: changjunzheng <guagua210311@qq.com>
---
Note: This v4 RESEND patch series is sent from my school mailbox (2023060904@ycu.edu.cn) instead of the previous QQ mailbox, to resolve the email delivery rejection issue.
