Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB41D5CF2
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 03:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768101728; cv=none; b=KpNeC79okmvvyF2/WyLlrN97cIWtwuEQkV9IgZo2YOPIvl2m37YVB/184ch9NgRl3Hetgl0FGlwfVfLSZKBjwOx8uFxqNcFD8Y3qQ/cQEMHSWtove6V0nurkY5O2SB0MBJCA2c0fT1eApWg6wuEZPCcTXFm0QkI1tF5UXxWKZkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768101728; c=relaxed/simple;
	bh=bMKmznDyPRT8rIoFC4MVH6Pp/9f6r6gMf/r3Vk9zYG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sd3cc35W1pS0aFDVlNXvgTP+5HM3SE/gFi15V1bdXUB6gLgflCTKlejvJ1nFxO5aCECzTluexDMFWmmj+W3CW7WmVENSKQByME+TKGkACymby/Blv2aWFc0hxUaYGPqEUXfYbZgOcTzh6nED1n5EwHv92Eny0Ea231I8VmsIBzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: esmtpgz13t1768101712tc8b7f162
X-QQ-Originating-IP: fUF+w4xvJNtYBNYZtx8BoSkmxlG0zkcMosxmFEEKO0k=
Received: from cjz-VMware-Virtual-Platform.loc ( [110.176.3.74])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 11 Jan 2026 11:21:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17199893543574909320
EX-QQ-RecipientCnt: 5
From: 2023060904@ycu.edu.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com
Subject: [PATCH v5 2/3] rtl8723bs: sdio: Use local error_count instead of global variable
Date: Sun, 11 Jan 2026 11:21:35 +0800
Message-ID: <E398528C2D670C1B+20260111032136.7078-3-2023060904@ycu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260111032136.7078-1-2023060904@ycu.edu.cn>
References: <20260111032136.7078-1-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: OKkKo7I1HxIe1/l8gmbmtSA8aQYR5zNgG7E8d6ImTSh/EY92IFHyoYWS
	Seakdo6mRPHIVko5QYxTCiIfxT93o0lCwp8CxnAyz35GjBj5icMGD5xnlX94JUMJtW333zg
	J73GKT6DiW3diECMJHQjj5sFUmVveXpwKpB6JUOcYJYp1TwYFXAYDY65SUIJgZsFpBGQfsY
	LlvHknmYepNpAmqTOxv4/HydKvXTDU7v3T2ivnBa+t/na1tz4OZ2aQm3wssIdQ0KcN89QNL
	g/M3k/pgkTu0helNtuAMHB6XhsSOYCEOb+OIGEJTc5mCU5wtfahCGP7vTmsyv6dpJAJdrv6
	nj5IlAr51/gptRfTKKhU1S+N9suXrA+UCo+uwVnxXX5dHcthz7cmiHBgXV0dL0re6k/WbNZ
	JGF6Ko0xPBpEkUMhrx20tOJAuGU2cTB6u/abeTZa+Cs9+ABy9filaJeu2Mhw/dwPexsKibh
	vJAw4+BRgbJzYseWyEZ5paCL75ZJ4uDjWSC1LOstUyXhS23rLNlyQeGYLyPl7KTyOmwvhys
	mtUUZnWSwL7w/asI1RvoDuLjtPa5l5Z6/XVjdqhRFG88b6VCDn7IlrihwbSbsSXFRW8eHWs
	72OyVGGl+YQNO3/3hFCG5Uw7kJd5hemRXbTYHwzO/6HqUYQ48AI3GbCuPYSokCOFqGIlzma
	/fWWZoBb35SYO4E7BPEwzA8z5OpV0S9moJnGRU0D/2U+qD2FzMk9Ireh5t6fGjJRcTNJemd
	yPLcvohRriw94LjMIzKoUgPWjg6Jis3IhfjlJzrsSFwrUgTruuTTWmMaoYeCO0ORE8PM6hD
	TSnzTw61ChXjvTpFW9oXaNYy8ivsr/1pT4ITCLdqEGvHyac/Nk1ZaJIzydXzq2g3LyOZbNv
	t9eE+M9kH8Gs2lsounZw4vccNv1n5KGmV9Q4d5GtHsd6In2UWV7rhHimjJ3XwTVHXp/63/s
	XnKxm2s9JwwJ/pPFI6K6JwKn+TLSa6yb9ZrFTIFZ47NabeK87ovnjoKkwFXq9lbiDc8q9xa
	CVK8EVWmWEV1b2aYYu
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

From: Changjun Zheng <2023060904@ycu.edu.cn>

Replace the global continual_io_error variable with a local error_count in
sd_read32 and sd_write32 functions. This eliminates cross-function dependency
on the global variable and keeps the error counting logic isolated to each
IO operation.

Signed-off-by: Changjun Zheng <2023060904@ycu.edu.cn>
---
Changelog from v1 to v2:
- Initial draft: Implemented basic local error count logic, fixed compilation errors.

Changelog from v2 to v3:
- Merged small patches into one, optimized function logic to remove redundant code.

Changelog from v3 to v4:
- Split monolithic patch into single-purpose patches (per Greg's comment), fixed coding style.

Changelog from v4 to v5:
- Fixed format errors (spaces around '=', trailing whitespace) per checkpatch.pl;
- Standardized author name format (split "changjunzheng" to "Changjun Zheng");
- Moved changelog to below the --- separator (kernel format rule).

.../staging/rtl8723bs/os_dep/sdio_ops_linux.c    | 16 +++++++++-------
1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 5dc00e9117ae..571a2c6fc37a 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -207,7 +207,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 
 	if (err && *err) {
 		int i;
-
+		int error_count = 0;
 		*err = 0;
 		for (i = 0; i < SD_IO_TRY_CNT; i++) {
 			if (claim_needed)
@@ -217,13 +217,13 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 				sdio_release_host(func);
 
 			if (*err == 0) {
-				rtw_reset_continual_io_error(psdiodev);
+				error_count = 0;
 				break;
 			} else {
 				if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 					padapter->bSurpriseRemoved = true;
-
-				if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+				error_count++;
+				if (rtw_check_continual_io_error(error_count) == true) {
 					padapter->bSurpriseRemoved = true;
 					break;
 				}
@@ -284,7 +284,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 
 	if (err && *err) {
 		int i;
-
+		int error_count = 0;
 		*err = 0;
 		for (i = 0; i < SD_IO_TRY_CNT; i++) {
 			if (claim_needed)
@@ -292,14 +292,16 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			sdio_writel(func, v, addr, err);
 			if (claim_needed)
 				sdio_release_host(func);
+
 			if (*err == 0) {
-				rtw_reset_continual_io_error(psdiodev);
+				error_count = 0;
 				break;
 			} else {
 				if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 					padapter->bSurpriseRemoved = true;
 
-				if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+				error_count++;
+				if (rtw_check_continual_io_error(error_count) == true) {
 					padapter->bSurpriseRemoved = true;
 					break;
 				}
-- 
2.43.0

