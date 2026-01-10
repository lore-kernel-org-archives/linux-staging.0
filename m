Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9923D7CF
	for <linux-staging@lists.linux.dev>; Sat, 10 Jan 2026 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768040325; cv=none; b=U4H8yU2FSmUpWpa1ttg6VR1TCNjHrY3sv9IawLy8WFpLqidAY7bs6KJbtDhVCh2DcoEAF/xkJD9JSuieP9yB86fu5+ETZrqIQvAKBkfIAn1m8B5FfFAtChDIRrJRGPyFIVdY6MlHUMPmlpYq/isGrYQ44cdjPqyVsT0f6bWNSVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768040325; c=relaxed/simple;
	bh=9rDQB0nxDxaU+nA1mbawwGQRMTa474RxgG3ilQUvODE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9LXu3eKHtyaDiaD8J1NAZQLxU5aqm9e7eziDHzJ//5swUDcwFJu4BtbzPCbiawFaiQi2vI+PfScgLllyHwCi9GdFCsSs9/22sgWIreL4cmGsg1AG5cLKXdC7yy2DoSSRoPLt9fFk9PTxMcmBm3x/9GiIvwrWJGXgVTyxC0brNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: zesmtpgz4t1768040302t093cf747
X-QQ-Originating-IP: pZBuQhYbNIP9Z6zS99PNcWCrusRq4vxtSRJMrbY0sy4=
Received: from cjz-VMware-Virtual-Platform.loc ( [110.176.75.164])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 10 Jan 2026 18:18:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13876480715115260017
EX-QQ-RecipientCnt: 5
From: 2023060904@ycu.edu.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com
Subject: [PATCH 3/3] rtl8723bs: io: Remove redundant global continual_io_error variable
Date: Sat, 10 Jan 2026 18:18:00 +0800
Message-ID: <160F2F024540E53F+20260110101801.5820-4-2023060904@ycu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110101801.5820-1-2023060904@ycu.edu.cn>
References: <20260110101801.5820-1-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: MSHuecu5THA/SX7V0I78QTX2bEcNc41ojOF9xpnVaJ98AdHibqm0c76u
	V/3yGQ6i2lmr3tK2nKgx4kEB3VOorsAxDd6P84lKjgqYqvZW91m+whgA6dAqBDDY9raTuzc
	JtnM+G5Vg+Kk21Cwt/YwY2Bf1QxWrZ2WPbWh7ZrLeJD+ekRlPtwwiDOEVpWPkVOrydNbsWO
	wVquhjOGT5niVmmrDSgqIByZ0e6UDJITGCRind9xV/a7uhHeGR/YcfbpnjSh16t00a56yWf
	0oKdYdzBHdt9dH0yV7PR8jcUGuqTxdGAg22bTn9EyhVqs/yonipfDuJPgBpkXLQI17E9/49
	ESLOWegmkmxwwQH3DbLg4ti7LvfHRWm708IhTfOWsJ0ROtWFowfqibdVQ/f2wCaoct/Pyo1
	bxPm5j0hWaBy9tYk8I2ZFlWBKXceD1XZSbzU05slGTjqem2Sg3OxzKR9gyKpHMdItqF4w/I
	grN7Tq/Oh9d4wSe8kBJLlVdtHNnRHBPqkiNXcqoJiytrtU/2iPvtMKH0CLQMrAKJ3+orvOy
	Gijegj78UuaYPZqb3pwV6IIF4MofnaqU+EFyIKRghKnS3IHIE0EKr28zvOzxyWP5CV2O3lw
	jrmHNl3IIPnmJ5CH00vMrRgqa3/564P9T/mez2ARaArpwAR3GITYkZxTh3ckahl2ixqekjy
	pffPeoxOzeknenXrwnJaMmz3OgO8GwdmCzlNVrYRWx+FHUjIb5ok4/TeN6iqtILtxzpXlgX
	Sb/r/zMyEC+vgpz4TsLm/HkepFIfnCMRaSKY8eTKa72Al9woyIPA57Y7Qog4YxymWLtUvGS
	ofjfM/UuJ1E+MLs+qOSs+/SOvVIb+ubvxcHV0fGgAgjf/q0rsmveG4MMOPqltOtXhUumqAb
	uVKa8Ec9Obi0zPjOpZboq/VRtZn2hh/H8UGUeuEq7MUVfREeU/3t4EGGGhphURgmDZRcGDJ
	SLveJ68oJlbf5NwOWVLG3gguzKAxmzoDYr4v5Umv0rZIPRH+MsrspHujLUk8iVd9Nmu8Wpp
	zC9pLrixuWGo7KSk7k6gsC1b5SpvWKi0aldwBqGA==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

From: changjunzheng <guagua210311@qq.com>

Remove the global continual_io_error member from struct dvobj_priv, as it is
no longer used after the local error_count logic is adopted in sdio functions.
This reduces unnecessary memory usage and simplifies the dvobj_priv structure.

Changelog v3 -> v4:
1. Split the single v3 patch into 4 logical patches (per Greg KH's request)
2. Fix all coding style errors (trailing spaces, missing assignment spaces, indentation)
3. Add clear, purpose-driven commit messages for each patch
4. Add version changelog as required by kernel documentation

Signed-off-by: changjunzheng <guagua210311@qq.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index bd7bb5828d56..de4bec961671 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -279,7 +279,6 @@ struct dvobj_priv {
 	u8 Queue2Pipe[HW_QUEUE_ENTRY];/* for out pipe mapping */
 
 	u8 irq_alloc;
-	int continual_io_error;
 
 	atomic_t disable_func;
 
-- 
2.43.0

