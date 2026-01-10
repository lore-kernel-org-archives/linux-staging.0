Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1743D6F
	for <linux-staging@lists.linux.dev>; Sat, 10 Jan 2026 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768040311; cv=none; b=QoaHBKk3aUIowLAciaq40HabRCT1R3LVp93eTPKNdU4cfquL16XJPUW9IeRBf/40fSiHzc16R41PFne9CEOviIfOjIWN/nVfBg8zJBJALP947KjwYnoVdVknnSWQIeMpL9OjOZx6C4pNN1FCOO2R2QdyfcvfyUpFyLEl+c6JHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768040311; c=relaxed/simple;
	bh=lkP/hsF8KwmFOtI4tB3cKelmZH4Ai7XTEDfQNqAc9sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KD5z/w8I42I4s9Q9VabnRS+6iiopD/7tcFBuuKw4V+mD6x49g8a+/f2KO/gL/7STYCr6/teGABYTqbawxOI+rfYK5N9aCcMAcTSivG9yN+a6MGqf+RtKnBGkjsMCcMCef1MoNVCl4LmJTphjPbMzGvB4YZaUSs8ejGPvva6a/50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: zesmtpgz4t1768040298t0410ca2d
X-QQ-Originating-IP: 2U6tLZhDlQWTSrw2fcuB90rpxKDGBLSkWQg4ZzLXQPQ=
Received: from cjz-VMware-Virtual-Platform.loc ( [110.176.75.164])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 10 Jan 2026 18:18:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11736844751896709906
EX-QQ-RecipientCnt: 5
From: 2023060904@ycu.edu.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com
Subject: [PATCH 2/3] rtl8723bs: sdio: Use local error_count instead of global variable
Date: Sat, 10 Jan 2026 18:17:59 +0800
Message-ID: <A23D22DD90AB07AE+20260110101801.5820-3-2023060904@ycu.edu.cn>
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
X-QQ-XMAILINFO: MN7J+qOXnZ1LUFD2Fu8rrTYGeIam6V6LaZ7HBtSCzZ7k6q9+pzrJMRIv
	CQ1Gae0J8j+Ggq21hF2I8HFy7ZzZO4uou5ENSPapH8z9acZ9LXWAqfV22qzlrcE/XKaKZNS
	B3PA3WlUeTlmHV5pXMCzdiKUXee5BQoACT/YA0sXxVnGyvi1OLvvyC2shgo4uRpY1Vf5xXi
	1KvcRq78N8b2DZ8laoscDY6nSrgcsH6QGOPQRVS3skodLNwCn73nU425pgU6nW70Su2HvvU
	ULN+6qMHDUSvVzE7XWB69hrl33UtcF2HggD1j7oFBFlwYSbOQErrYUWmqDewvmzakQ4wcHr
	cCqmniJMTmM5vS3nw/l5/jcW7On7TcnGmfY1lYKyt/WHlhDzGPG+sd2PBxUqZbhZsuicqnY
	hH8IsqytRaNRZfpSSDmT6tJiyWaf5LsFR1epoN5lhRHI7s+0jYeXlWA3aa6aCq4V4CLhcj7
	8h6u3kJtBtgvjiYzHizwrtv8dyqtp3VRe6ssa85d/fE5ZfFyEt3ZHiCqacK/7yz2mqUXFlF
	TPtDRWRCuruLF4sBAOsXU2JlOqhREQ8jS7RbZOXU5cLHEqAqTnQCY+T9JExHmtJDg6KIo3l
	+QZ0m7DZ0cFC9YYmnWyRQXLowcQcUZfoJCQivn8iX/POyPUea4xwGJvgwB7mclmd2VlzlF2
	o8K1lzXhQmjdW8y1ObNpSekA+ScgDfT6JZ6gBEuA3ugT/UgcaSUuFnzzLhcsRUvjIvU/KhK
	pj5LJKHg24g3aWQFp43UcLX8C3vJ78RprrWHPhvqMVr1D1J/hOALG4Jv3ye/Gn/vs/mhRbI
	X5PuiAF3WQsu8DFoyBVfR0yDbpXroX/h9YLECyM3Nm+ErsPbnhHbP3yl0nJ2c32ArwUbhug
	c4W6Xi9sCl5aMPG832xzujwRK8VFT7FrwgCP9tAUKnweoweU/peg28yGA1k0F9whM11CXv0
	dU0rC9bxmHLne6Voku+spBgL/1KguteeKdVNf8q8l7HkBeYu5ZO8gBozYYjjFFzpaCc5nC6
	e8gpEI3Q==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

From: changjunzheng <guagua210311@qq.com>

Replace the global continual_io_error variable with a local error_count in
sd_read32 and sd_write32 functions. This eliminates cross-function dependency
on the global variable and keeps the error counting logic isolated to each
IO operation.

Changelog v3 -> v4:
1. Split the single v3 patch into 4 logical patches (per Greg KH's request)
2. Fix all coding style errors (trailing spaces, missing assignment spaces, indentation)
3. Add clear, purpose-driven commit messages for each patch
4. Add version changelog as required by kernel documentation

Signed-off-by: changjunzheng <guagua210311@qq.com>
---
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
+				error_count=0;
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

