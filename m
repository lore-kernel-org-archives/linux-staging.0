Received: from outbound.pv.icloud.com (pv-2002l-snip4-11.eps.apple.com [57.103.64.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC82A12CD8B
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 06:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951456; cv=none; b=VfG78+FpKni4Hu1Erkl6vSZQTHFEp+2kQG9nxoK1NGUEt4mLXVcQi/wzHV/Wh2jd98/gnfXEuL5uneWTBnIuyuhMspWn75oEF2WERJRH0DKzbKx9Zqap6PUJaXw5gMUQntHdmyNG2zDYnydfDsyVWjIUptDhLwg7dyUreixXl7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951456; c=relaxed/simple;
	bh=RbIbcoHSt4z5jZAKw3yRyn06+ke/eWcn5vDBLG9841o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eh4JEZpMwnj7ywhXooM7XQnAO9w2CUllVDgFcEn4kky4fIZYfifRBtMTn44tNUYEYC8Cb3/RuRqQs4ZOLPQ3RwxCgnKejO7Do09bbPgSCr2rQdudZtW45IsULJk3dzIqyj8RGb0Q0MQOdyhUkZ+n+FIJEa3Yr46nMb6G2pSNLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=0P30zqBS; arc=none smtp.client-ip=57.103.64.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="0P30zqBS"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-9 (Postfix) with ESMTPS id 37CD01800C88;
	Thu, 28 May 2026 06:57:31 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQtMHV8HWxxDClYBXQ5LVxQEGlIeQwJXHloXQB5SH0YVC0FzBFQHXQVdVlACWktUFAQRUAFYHlZeWhdeTUUID0MZEFYBWFZdBU0aXBhZDxwAT1ZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwdeAEgJTgZaBVgcQwBBBVUaWh8SWAtHBFIFUR9KC1YZQw4ASXkRUAFYHlZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1779951455; x=1782543455; bh=hv5sKoJ180r8nI+Gq5efLCjODLZPjekyry9VEBj6hU8=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=0P30zqBS/0ho2op65y7m0dYKH6SUBn72lDwM+SiFPAT3Pu8hRDnMbHyKcdYJ/ZxyWNos73Yp1pxauYD6MO1kwrqLTp1j04tyloDkIPyaqWdiDr4g9XzOjEFBV7Z38WKj8yCJbGko2s9EOO/Xxz6or7AoaHnAQNQe1/gjNlAazo14NW6fhMfXFEEqF7GypRFwWhRrGoJ6kZHJKeKtG268rw3medkgK/WAZkS38iVKeFtb1PUFNQi0mZkhSjsCN/4AEQdrBo36EwjRcYp613N5iVoLJkBbXFUJDWHdCql27rn1B9X+a2bkDh1MehTxBfCG+1tV3HFU9e3kswPF7tKtIg==
Received: from BastienPC.localdomain (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-9 (Postfix) with ESMTPSA id C72351800091;
	Thu, 28 May 2026 06:57:30 +0000 (UTC)
From: Bastien Cossette <bastiencossette29@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Bastien Cossette <bastiencossette29@icloud.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary NULL check before vfree
Date: Thu, 28 May 2026 02:57:23 -0400
Message-ID: <20260528065723.39968-1-bastiencossette29@icloud.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o4hP5L36zDQvHEEHFuiK5rMUT1fsftI8
X-Proofpoint-GUID: o4hP5L36zDQvHEEHFuiK5rMUT1fsftI8
X-Authority-Info-Out: v=2.4 cv=Zubg6t7G c=1 sm=1 tr=0 ts=6a17e75c
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=KAl3_diT9EkA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=plp6AU9oHt37rUNYP1cA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA2NyBTYWx0ZWRfX/zjpnmPetW3C
 Tb66WhiMLaFAfcideBAR+R8c6fh5VuxlFVCyFLLcOtqR826Yk51BEWFSMLlHwH0wlrBN+f/wB92
 MYo9o326VPHKyNFN+iuLKI1GtPZz5WQIMe7z1iA22l+aVc+sw0jWDWY7xNURHrnMNasWx/L1tTo
 KMlfP9Eqcw8dtCaWGLkJOfTFpysslzO5mDTJ40YNVz34cNbQ3lL7eOTgYLz3cGL4AeNcLnxvM1D
 AnF+NjCYmN3dKyI6KkFEZzfcqMYi+nTfJreQVxpfnacP8rRif7eM/TEQQvQmrAepjNT9hxJi9Lc
 uuUbgeAEKMcH1UVg+2Q1uPnS8+OvU1Ws3dR/R2HlrGyAn/FRW1nOEx8RzrLbzc=
X-Apple-Category-Label: MjI3NzMzNjI2Njg6JGNhdGVnb3J5JF9QZXJzb25hbCw=

The vfree() function handles NULL pointers natively. Cleaning up the
redundant if check simplifies the code and adheres to core kernel
coding styles.

Signed-off-by: Bastien Cossette <bastiencossette29@icloud.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171fbcb..24dfae2dd759 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -23,14 +23,10 @@ u8 rtw_hal_data_init(struct adapter *padapter)
 
 void rtw_hal_data_deinit(struct adapter *padapter)
 {
-	if (padapter->HalData) {
-		vfree(padapter->HalData);
-		padapter->HalData = NULL;
-		padapter->hal_data_sz = 0;
-	}
+	vfree(padapter->HalData);
+	padapter->hal_data_sz = 0;
 }
 
-
 void dump_chip_info(struct hal_version	chip_version)
 {
 	char buf[128];
-- 
2.53.0

