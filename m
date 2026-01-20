Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69A942E01F
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916423; cv=none; b=HhuvrtdxciA4RBOC7pjeePttbkHUtCQwO/cxQTNYqwB3jmKmRGjycHfQSR0RIe3jIIy0aGP+61j+LuaycC/npblWj/Ow6Cop0YfpoSQEWqQrXpWltpMOtez88YpqRv0clgwL3MNPi6nj49e2smyLUhoY8QSgueU5nem/cempwt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916423; c=relaxed/simple;
	bh=9kiJHoaEqE4XndJZhz+O9ATf5H4aTA2DagGFCxWUong=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SS8/FTo/5iLnIu8ll3IFaferTn/CZd8vYOZhoAeNc8YwDMNEZaAylDUl2IPWf2EF/vvChgMEME8HJIi3q8ijHUPh6DGa86LlY5BFT8ILxHQolbLemElpn+yHaOZpgn0lBDxWmkQYtLoZAzciPQL8R3/0VIG2/P5f9v7iA2w765M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: zesmtpgz8t1768916384t2dac5914
X-QQ-Originating-IP: D9fqdQ6djsyPG9rnMdbEsM2S+3NM2RoJoe4HNfwbWOY=
Received: from cjz-VMware-Virtual-Platform.loc ( [36.143.144.25])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Jan 2026 21:39:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11292375355274299365
EX-QQ-RecipientCnt: 6
From: 2023060904@ycu.edu.cn
To: dan.carpenter@linaro.org
Cc: 2023060904@ycu.edu.cn,
	gregkh@linuxfoundation.org,
	guagua210311@qq.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] [rtl8723bs] Remove unnecessary atomic operations for continual_io_error
Date: Tue, 20 Jan 2026 21:39:37 +0800
Message-ID: <641DA44821579DC7+20260120133939.7347-1-2023060904@ycu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aW3qZahKi7UVQI7A@stanley.mountain>
References: <aW3qZahKi7UVQI7A@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: MI1GwnU3KoAH0BRCw4kl+zFF1Pka9hFpPqZaD7VO3PwTOMtXMt9kQRRb
	aASTPY/VGxhlM9TWIU03+4nxxIbkGn3Ik3+gPalhv3GhqJ80qFfWm82xinm6jLOYazd/YPl
	mEOe+0x2YF0eSYHiUyeaWFMFkVmniw84phK64WPvKP0lMS9IOvknJfP885vbxXJqKstfIHf
	y2qBzzRpASC225j6Z3MoIuuSbtV7zEZ8gcZLw9IR02D7tTf1xqtXJkGSnRrrF+uvo0yeJXw
	RMPDNRsBqF/Fq8neR66ysy1XLwGgyf/5WtC11I0KIf1EOpc3VUjW+aLnRkfKspazUGsjbZX
	a1fR4+Hg4pmXFhKyU0uw8Cub4CY6sjK7O3JBDy4UNcObmo/90gUBbZcFutcnkS/GcN32ugy
	VkM/oDa7KtX8Pq5HYeiWNyLK+RhAac1Z1ZC+G4MzEGII6aAWluJSdRmavLaOK72mky+I9/2
	YUYM5JQHz6GBEEpOAS5ZVv4kDzjcXcElImXzwtVZLbUHJXdU4W0FX/CZHwpeCyjacMlbB+Z
	mINMFSkjQsUYttokgJDLcPeeaFGJdQuGwgGta5douHfR8aCjPvygMF/WGxOninCo3Td7QP5
	aB51mHq9YzeYXFjuTkXgxbPCO/4xLF94tHYohUfyBAWJUyNwBohg5A+XQW6Uq/0/Dn2Ldfz
	FZorYnBDmKas0YO41VzSVygLL2GsZqGtMz+tZpGQ/JYItSVaW9dgNWEnLEnPpopyUm2XINQ
	fzYinReOiB/nj/0jxGJvae3ZABkJwjO+/O3ZYCtlqVq1GUc77lphp9IbgzwMIx57S1ZTHBb
	5kTg7UPsuNjoUKkf7QF73JL1mIC709zRPyVfFX6IY98Vy7FzKiX66IyUmtzf2/gbSLAjnY6
	Y17+C0U7jTmkhtHa95CPjMi/06vw8ieHmvBfzPMN5LfBOr5trRUaKAYkQJH30yLeR4lHxQU
	IUd8=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Hi Dan,

Thank you for the detailed feedback! I'll address each point below:


> So you're saying that sd_read32() can only be called by one thread at a
> time.  What sort of locking enforces this?  I don't see any at first
> glance, but I also don't want to invest a lot of time into looking for
> it.  Please explain it clearly in the commit message so reviewers can
> easily check.

The single-thread guarantee for SDIO IO functions (sd_read32/sd_write8) comes from two key aspects:
1. **Linux kernel driver isolation mechanism**: In the Linux kernel, each SDIO device (e.g., the rtl8723bs wireless card) corresponds to an independent driver instance, and the kernel's device model inherently isolates IO requests for different devices. For a single SDIO device, the kernel serializes all IO requests to it — meaning only one IO operation can be processed for the rtl8723bs card at any time, no concurrent requests exist.
2. **Driver code logic**: Within the rtl8723bs driver, the sd_read32()/sd_write8() functions are only invoked by the driver's dedicated "IO processing thread". The entire IO execution flow is linear: the driver receives an IO request → processes it via sd_read32()/sd_write8() → completes the request before handling the next one. There is no multi-threaded branching that could call these functions concurrently, so race conditions are impossible.

I will add this detailed explanation to the v2 patch's commit message (instead of code comments) as you suggested, so reviewers can quickly verify the single-thread guarantee.


> What's the motivation for this change?

The motivation is to follow the kernel's principle of **minimizing unnecessary atomic operations**:
- Atomic operations introduce small overhead (memory barriers) that's redundant here (no concurrent access).
- Removing redundant atomic ops aligns the code with kernel best practices (only use atomic types when race conditions exist).


> The history goes in the commit message not the comments.

You're absolutely right — I'll remove the "Note: Original implementation..." block from the code comments, and move this history context into the v2 patch's commit message.


I'll incorporate all these fixes into the v2 patch series and send it shortly. Thanks again for helping improve this patch!

Regards,
Changjun Zheng
Signed-off-by: Changjun Zheng <guagua210311@qq.com>

