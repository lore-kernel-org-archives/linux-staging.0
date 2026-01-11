Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A64A824BD
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 03:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768101728; cv=none; b=e4IoCJLEtFM7Te8PfFT+6KCWg+z27Q3c+XBQ9M7YY++Xo2Qel7j7P9FzMneYWS8i5i76YCnUD6nJEoXC0NMv2m1ZKAJwg4AMYViM9vRbw+Y/zZVsQRuVnB0PBratkq1eButHUhbhPju00/E6t6znwo6hkIw+degmcqR8qgJKkzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768101728; c=relaxed/simple;
	bh=510BS1xyOXZZqMazRP4qJItxHsD6Zquk+xl82pjn+MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xb/4v4DcaznSFLClGwczI8SSGE3Oc0a/ikFftv+4GAoIMLPf6Evf/UOv2uuW44wW21LGdv7WS9s7Z1XvPeYv6/cCG9PDpNYPp8x5p+d9xp/hvWV6QfbnNRM5TtX+CWC12MlT/71C7W7+8hia8V9xL5CcHv2c4S2z6RCpMO0MnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: esmtpgz13t1768101701t82227f6a
X-QQ-Originating-IP: zncPcNqe6itA4x4qSGrhiFWsIAX4EydG4uV2rKZ3u5o=
Received: from cjz-VMware-Virtual-Platform.loc ( [110.176.3.74])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 11 Jan 2026 11:21:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5460821534235210255
EX-QQ-RecipientCnt: 5
From: 2023060904@ycu.edu.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com
Subject: [PATCH v5 0/3] rtl8723bs: Remove redundant atomic op and replace global io error var
Date: Sun, 11 Jan 2026 11:21:33 +0800
Message-ID: <12B32ED3FD2801A5+20260111032136.7078-1-2023060904@ycu.edu.cn>
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
Feedback-ID: esmtpgz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: M182XWJxg1fq2sLKhzVEjBrymX/00KnPTYGHFyyPOQIQHT04AODsCHKw
	gxpt12eM1T29RRI7G7CwQA9Ka1lM6VaITagX/Y32z9wQRlAgM55ihT/FffnhcYqCiUwa1+K
	N7SqDEIoKsT9xRRw1Kwo5sfH+LIV9S4iXdwilhy69utoX0WYNQt8yyvnOBGgbJFbelN+H2E
	HPvCfoedImn3X9MFdIyEDeMiHuFA5jwFPbNrkPW4LTTqCZJhX2rQPCZadthHUBuzNgILbD3
	nKm1KrEQp0sqfkxqrlfq4K46mUlXvSz3R9Kw4WSVfxAiCEnqe/9weZ1oLdqe4Ktsli9/IGU
	9Ll/NRd5oUx1WgqWtIoBADT93sOV7tGVSox2mlDsBDkp5fqRj5ETpwPLpBVhNb43zM7YqiT
	YeaG9sjcDuiGINZ+9qj2oOwGkFNQ63S4TFDB+lW8v5oU96MUNgTNtuwDp0cqh9xIrSW61Ge
	Fd3EXiDMMp9TNNryHDIW8unVMgCKxnoSvT6r8ChTLFusz54BH820dYYqJJgL1TuP0MNIRe/
	J4Di4rSKYLaCElDvieqhPloZHO6OsGKugXMoMJSlilb+PxsArr02QC+bLFffPsr0fP1EB24
	ffqvv0qRraBXr5usm1PjXx/3wSE1BxIpNR/eCY0yMsrlT4L+2rhh+cgVVeI8SGyS2MMuExh
	srkc0yBmrrwk8IXRM+kXX0RKmC9gc0MR5IspG+y+Ye6NysklBHtKwoW0uKDscMQqawGorOb
	5yDotJR7D5UZaRcqHsQFjVAAKXFcnZ3Bx5t440irVpXAeqeCvCebP9U6wf9dW51LYrcnXPT
	fYHUdXViToCdudLAeid7KpQLCllE/4PTpxfxVjYTRRTcv++UtFqtn7Jy95fHakHrV1Bb4gC
	p0r4MnEsoViYeX5U5HdY70FwVZ5pLZ58IKiKP8/rfJ0lGhCzY39mu8TAdH63aEQSpQEi7xI
	5VCZEwZr0EHeVlA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

This patch series optimizes the IO error counting logic of the rtl8723bs wireless
driver by removing redundant atomic_t operations (unnecessary for non-concurrent scenarios) and replacing the global continual_io_error variable with local error counting. The series is split into logical patches (per Greg KH's review comment)
to ensure each patch fulfills a single, clear purpose, which greatly improves
reviewability and future maintainability.

Patch Breakdown:
1. 0001: Add independent rtw_check_continual_io_error function (single responsibility, includes old function cleanup)
2. 0002: Use local error_count in sd_read32/sd_write32 (eliminate global dependency, remove atomic ops)
3. 0003: Remove redundant global continual_io_error variable (clean up struct)

Thank you for your time and review!

Signed-off-by: changjun zheng <2023060904@ycu.edu.cn>
---
Changelog from v1 to v2:
Initial draft: Implemented basic local error count logic, fixed compilation errors.

Changelog from v2 to v3:
Merged small patches into one, optimized function logic to remove redundant code.

Changelog from v3 to v4:
Split monolithic patch into single-purpose patches (per Greg's comment), fixed coding style.

Changelog from v4 to v5:
Fixed format errors (spaces around '=', trailing whitespace) per checkpatch.pl;
Standardized author name format (split "changjunzheng" to "Changjun Zheng");
Moved changelog to below the --- separator (kernel format rule).

Note: This v4 RESEND patch series is sent from my school mailbox (2023060904@ycu.edu.cn) instead of the previous QQ mailbox, to resolve the email delivery rejection issue.

