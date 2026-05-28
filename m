Received: from outbound.pv.icloud.com (pv-2003k-snip4-1.eps.apple.com [57.103.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E3B19E96D
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951654; cv=none; b=ZVf2vgtf8ogYOc3UGhHP8qrENK1VdOmCU6qu+oz+wh6q/1zalVziQPU6DYXkORs5RlmtkjKUgdgIHrErV+Er8HqgliWGajUJCjp178hTuQoEGgKY9zokRhOs/syL7L6QhkcQO/YKjdGiwAGuNb77YmJx0pQ9T5rDj7oOvDSKVIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951654; c=relaxed/simple;
	bh=PzSrbbjO3Nj698zgaa9i5Vx1J44ryNyr71HN4T2s39A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYMyRXFRdPd7S4ZjKvl3seYvRw4ThlFC9qilu3lgR9Vt0voNq8xp+OMEgmOPbOMLcvAHidVmSH4Nz8u1bKYFqwOkFCRHj4UCoWhN/38Doo0KHJqgrXeN0gO97iSzAxiufxxvMTvXySqj/fTCCgVuhmes8DpMHbExq0XGNH7JDws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=KGFZGdVc; arc=none smtp.client-ip=57.103.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="KGFZGdVc"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-0 (Postfix) with ESMTPS id 5AA351800178;
	Thu, 28 May 2026 07:00:51 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQtMHV8HWxxDClYBXQ5LVxQEGlIeQwJXHloXQB5SH0YVC0FzBFQHXQVdVlACWktUFAQRUAFYHlZeWhdeTUUID0MZEFYBWFZdBU0aXBhZDxwAT1ZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwdeAEgJTwNdA14cRAlJAFgaWh8SWAtHBFIFUR9KC1YZQw4ASXkRUAFYHlZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1779951653; x=1782543653; bh=77W6e9ChAhisA1c7CykcZFicTCcJh1EbUpOJn0ib/Z8=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=KGFZGdVcpGX8GnjCI8+2duzvAjLESnjGSTGUxBhBbFGXgg1TlM7iRXgNMx6kaOsRJjm6nn3kuCkZ5tQ63QRXe6IWKsg1fgle8NkS/U/0NBGqhm7YkX59HrdgVU+D0FjZvM0YWHIJ5XFRXty5itg8cliiMrVsXS0ytTg7xJPIsWAfPEKMU6wryQtMbjYS8L0anPRWnR1m7Vv6doOqmrt8BC4aVTbC+YdUwUlnszV1D0+fR+hyPoQp0BwRy62ZcUuiGTL70jPtmU+g3m7A50XGFSlmqEUYKoWLu1EFqJh1KrhowN4g49RMuhV91rjASa8WoD9NpKdmVI+lgJL+FuHJRA==
Received: from BastienPC.localdomain (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-0 (Postfix) with ESMTPSA id 4C8FA1800173;
	Thu, 28 May 2026 07:00:50 +0000 (UTC)
From: Bastien Cossette <bastiencossette29@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Bastien Cossette <bastiencossette29@icloud.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary NULL check before vfree
Date: Thu, 28 May 2026 03:00:45 -0400
Message-ID: <20260528070045.40135-1-bastiencossette29@icloud.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=NPbYOk6g c=1 sm=1 tr=0 ts=6a17e823
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=KAl3_diT9EkA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=plp6AU9oHt37rUNYP1cA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA2OCBTYWx0ZWRfX9zD5+mlJKH+P
 lSMawW9DS2iHdmiJJP/61TczIw4wY3wB3oc6CmPq7SSS194gKjNBqIZ3F2b0+YnszrPC7uZ6QUO
 Z62jRCypm/yzlWdJP1kvOURIhyntfkCRWGhH/JkJRlyJW7RADlu3f89tgmC/30b5sP0vDjPW3BV
 Oq8Oi2T5IX4uL+cBCV9n03YfR/b+8OFpUm5hAFsa6Fw+DkK3MsH6fFIGgjPvKI8WT0F+t3d2qrp
 AMJ8zg2qrdoVFQxoJ8rsLL/i/2DNOwHmNESRHhxWTzQdZh5FOqtzmA5vZsM+MqK+Qt5hc1Mb0++
 VqMffpWija1FRJ4hkI8dlyONrwQZ+GHKqaO2JerhbbRJY0l6gDaOdchkQIlfj4=
X-Proofpoint-GUID: aDEi66PXGX9g8IHM5SooX69BHF0FTjcu
X-Proofpoint-ORIG-GUID: aDEi66PXGX9g8IHM5SooX69BHF0FTjcu
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

