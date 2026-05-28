Received: from outbound.ms.icloud.com (ms-2003h-snip4-3.eps.apple.com [57.103.72.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A91346ADA
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951963; cv=none; b=ZFqJuSogCEF8XXIq+hQCyjbrUF3kl414NKqAOJIQIyfh+TahPOmm6JUOHlepr9dIHNulMU+70gkCPNkRjcRewb/hIg0Z8UvDHz7DEfPPsB7rZYtb88qJ3zP/ksmE8IhVeuos4JgnhR77b+Gxat4+yEx3ZiBvHo3uGcCBC9IdFKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951963; c=relaxed/simple;
	bh=PzSrbbjO3Nj698zgaa9i5Vx1J44ryNyr71HN4T2s39A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e20cVngue7hpugx1lNCObxsASBf20nWqreP5igQWTk0Kk4eE9mVcG3Z8xBWxH0a0YaHBVeEHTteAe5znCf5aqpv545QFauYxoFVquTdHP7mfQ0LovsUa2mp3LN1y6+5HcS6mJqQxXtDt0hJfW0ALtK9+P27lD7sXyierDcKb+R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=x7LBVdsf; arc=none smtp.client-ip=57.103.72.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="x7LBVdsf"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-11 (Postfix) with ESMTPS id 84BB518000B4;
	Thu, 28 May 2026 07:05:59 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQtMHV8HWxxDClYBXQ5LVxQEGlIeQwJXHloXQB5SH0YVC0FzBFQHXQVdVlACWktUFAQRUAFYHlZeWhdeTUUID0QZEFYBWFZdBU0aXBhZDxwdSlZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwdeAEgJTwNYAl8cRAlLAlgaWh8SWAtHBFIFUR9KC1YZQw4ASXkRUAFYHlZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1779951961; x=1782543961; bh=77W6e9ChAhisA1c7CykcZFicTCcJh1EbUpOJn0ib/Z8=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=x7LBVdsfiB5D+hqc/Q7Mbs7oe1I9859+OWRjPscCSOUJ3Oy7wVoiLeCCPNyW42N2TTMDae3BwW5+MLjqC/TFrdUiRwiPIHczkchoBOQhdzAbxRXwbC/oNxR2HYbesKBIDhPE5BEKFygSBPHB18znyWCWym2RF27w+Opq+p9UH05o3jmjKZUF/XSfQMAPSgU1HssXrHUNlRa/vJy4MKrYrTqoyDRDxLoAILhk6vkO5niRgjz7onlATjGl76kUZOJgg83hQryo4STPNv0nfSvNYXHdy4BmRlTg3FIpcBYSiZTcuG+cKlfWj5iNA02xUvgq+r3HigSKBInqDZ3m6Dr5VA==
Received: from BastienPC.localdomain (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-11 (Postfix) with ESMTPSA id 8B53F1800104;
	Thu, 28 May 2026 07:05:58 +0000 (UTC)
From: Bastien Cossette <bastiencossette29@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	Bastien Cossette <bastiencossette29@icloud.com>
Subject: [PATCH v3] staging: rtl8723bs: remove unnecessary NULL check before vfree
Date: Thu, 28 May 2026 03:05:54 -0400
Message-ID: <20260528070554.40315-1-bastiencossette29@icloud.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=FJQWBuos c=1 sm=1 tr=0 ts=6a17e957
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=KAl3_diT9EkA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=plp6AU9oHt37rUNYP1cA:9
X-Proofpoint-ORIG-GUID: LGraAl2e0UCOEnSduERnlqCXtIbLVZQt
X-Proofpoint-GUID: LGraAl2e0UCOEnSduERnlqCXtIbLVZQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA2OSBTYWx0ZWRfX1vLupWBSZzjB
 rp5r/WIlOOlc35BvVbRfsKYqsp07HrVSVutnc3+qZ39PMdC42vy2D2OiENhilUwRbU3bANFfRCa
 59QTqqJ0Dt3MSCRZ717BhWfnB0is773Ed1JyVRcKiBXiY4HBbVcTeSA0tFJjrc1K469L4RbKGaS
 kIh+Ss6xzxHTQ4gHswbH2pRNTdYdX/xwvtkw7FroRa6eY+pqYOtAACijO8ghz9/jhJOgs6ra0jD
 AC3EFlt7o2mKGAB6KDPSl2yNUT/FubRKM+zGFgR99rBV6e/JmvQHUZIC6BTlMwRGsbFsgZSGQR8
 sd1ByLFnipOynqIaC5CvsNSyCjfdWmzHrWdOHPDXSXgdSjoz2E9eK2sumVXLbY=
X-Apple-Category-Label: MjI3NzMzNjI2Njg6JGNhdGVnb3J5JF9QZXJzb25hbCw=

The vfree() function handles NULL pointers natively. Cleaning up the
redundant if check simplifies the code and adheres to core kernel
coding styles.

Signed-off-by: Bastien Cossette <bastiencossette29@icloud.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171fbcb..00c511b38595 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -23,14 +23,11 @@ u8 rtw_hal_data_init(struct adapter *padapter)
 
 void rtw_hal_data_deinit(struct adapter *padapter)
 {
-	if (padapter->HalData) {
-		vfree(padapter->HalData);
-		padapter->HalData = NULL;
-		padapter->hal_data_sz = 0;
-	}
+	vfree(padapter->HalData);
+	padapter->HalData = NULL;
+	padapter->hal_data_sz = 0;
 }
 
-
 void dump_chip_info(struct hal_version	chip_version)
 {
 	char buf[128];
-- 
2.53.0

