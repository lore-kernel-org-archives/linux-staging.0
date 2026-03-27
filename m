Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFB3876D6
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643826; cv=pass; b=iZ7bhGHYjdVxZ536H8poU3AIsSZpBJgW5noNmfKkY+1+c553c8AvpjdoLQhTLrXvm2wuXOxjOKOkgcFfZ5LYAokqre1qgZqNFEncS06icOfvmyGRyjMEElp2YHnmpNaDyqZygGBh1YCLWmZKKqF/ekxiB/36mXicUa14tvV0IUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643826; c=relaxed/simple;
	bh=WP2Z/8rOiq4D0PTpLTEzWPJTts1QUENUeFvmm+Ik7vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ckNd5lqbZcafiOgYt3jAniq7b3BBeb6hdswCr5g0jI9XL74n59RcPtDyZfIdsZ9iCKfN4jmqkib5B4dZqWngwV1sLDxp2dJcH+bdOzHz0cCygy9yKRsN+FVfwcJDJ4ohS7cyNQUA6+XqL7jfewl4gkYLQcYm2RV3tMuUPJfQMPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cardinalsystem.net; spf=pass smtp.mailfrom=cardinalsystem.net; dkim=pass (1024-bit key) header.d=cardinalsystem.net header.i=david@cardinalsystem.net header.b=BEM5eRtj; arc=pass smtp.client-ip=136.143.188.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cardinalsystem.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cardinalsystem.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cardinalsystem.net header.i=david@cardinalsystem.net header.b="BEM5eRtj"
ARC-Seal: i=1; a=rsa-sha256; t=1774643816; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Nw6sMvev+VM33/9trYQZG3sXONxfP25iLOKpSY5a0Mxc43GHqmFnTDLSNXwx8FmNAaNfOXA90y+Eu8Ys4MeKFLNUN35gmnmqVorGeq26snrtH32491N06V2ffFH6kbRXxl170CsFt/QTe1FT07O5Ms5Lx3/Lu/+PhJl8K1kglWE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774643816; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7U0+DZVGCU8tY2Z6/TQTrDddnnmIFFua49CNx7zBDhA=; 
	b=b/4WNL/eJxVK5quOtcgN4WyDFvWEETioYnY2tAxcEYSXCnlTReql662H9d3e12y69lzVHnXAOvi4QXutXVVtVibquWsnp2ZMGMb13QVqzMj7X5FbbvH4t/EVDK2D2pHyIwSmx+DVXtQxvh2ODga+nStrcv8aqnRAEhP1nzH/m1g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=cardinalsystem.net;
	spf=pass  smtp.mailfrom=david@cardinalsystem.net;
	dmarc=pass header.from=<david@cardinalsystem.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774643816;
	s=david; d=cardinalsystem.net; i=david@cardinalsystem.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7U0+DZVGCU8tY2Z6/TQTrDddnnmIFFua49CNx7zBDhA=;
	b=BEM5eRtjuaZm3To/8JSlNmqD6qZtUHwwh0fHCbJHhAmYO6wGXRcf/06TG7sq2DNy
	0XNzBg3yH1UQ5iw2taYBTKOAGepMyRnqmPMKx63jJ8LAPLooY1JT2fUajD/O/7gIYcj
	2LW5/9JWiHtGMTDWX1oX8ifhsMYIE528xHZsHa4M=
Received: by mx.zohomail.com with SMTPS id 1774643814333757.2610045670604;
	Fri, 27 Mar 2026 13:36:54 -0700 (PDT)
From: david@cardinalsystem.net
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Holland <david@cardinalsystem.net>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: rename variables to snake_case
Date: Fri, 27 Mar 2026 16:36:36 -0400
Message-ID: <20260327203636.24891-1-david@cardinalsystem.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Holland <david@cardinalsystem.net>

The Linux kernel coding style guidelines prohibit the use of CamelCase
variable names. All variables should be snakecase.

Rename the 'ChipVersion' parameter to 'chip_version' and the
'AutoLoadFail' parameter to 'auto_load_fail' in hal_com.c to adhere to
the standard snakecase naming convention.

Signed-off-by: David Holland <david@cardinalsystem.net>
---

Hey everyone,

This is my first attempt at submitting a patch into the Linux kernel. I always wanted to try to get my own patch submitted into the kernel so I was scrolling through the codebase and found some incorrect naming styles. I corrected the variables name that were using camelCase to use the traditional snakecase.

Thanks for reviewing,
David
 drivers/staging/rtl8723bs/hal/hal_com.c | 38 ++++++++++++-------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 31b3e880ae6a..4bee338073c4 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -31,44 +31,44 @@ void rtw_hal_data_deinit(struct adapter *padapter)
 }
 
 
-void dump_chip_info(struct hal_version	ChipVersion)
+void dump_chip_info(struct hal_version	chip_version)
 {
 	char buf[128];
 	size_t cnt = 0;
 
 	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "Chip Version Info: CHIP_8723B_%s_",
-			IS_NORMAL_CHIP(ChipVersion) ? "Normal_Chip" : "Test_Chip");
+			IS_NORMAL_CHIP(chip_version) ? "Normal_Chip" : "Test_Chip");
 
-	if (IS_CHIP_VENDOR_TSMC(ChipVersion))
+	if (IS_CHIP_VENDOR_TSMC(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "TSMC_");
-	else if (IS_CHIP_VENDOR_UMC(ChipVersion))
+	else if (IS_CHIP_VENDOR_UMC(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "UMC_");
-	else if (IS_CHIP_VENDOR_SMIC(ChipVersion))
+	else if (IS_CHIP_VENDOR_SMIC(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "SMIC_");
 
-	if (IS_A_CUT(ChipVersion))
+	if (IS_A_CUT(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "A_CUT_");
-	else if (IS_B_CUT(ChipVersion))
+	else if (IS_B_CUT(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "B_CUT_");
-	else if (IS_C_CUT(ChipVersion))
+	else if (IS_C_CUT(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "C_CUT_");
-	else if (IS_D_CUT(ChipVersion))
+	else if (IS_D_CUT(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "D_CUT_");
-	else if (IS_E_CUT(ChipVersion))
+	else if (IS_E_CUT(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "E_CUT_");
-	else if (IS_I_CUT(ChipVersion))
+	else if (IS_I_CUT(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "I_CUT_");
-	else if (IS_J_CUT(ChipVersion))
+	else if (IS_J_CUT(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "J_CUT_");
-	else if (IS_K_CUT(ChipVersion))
+	else if (IS_K_CUT(chip_version))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "K_CUT_");
 	else
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt,
-				"UNKNOWN_CUT(%d)_", ChipVersion.CUTVersion);
+				"UNKNOWN_CUT(%d)_", chip_version.CUTVersion);
 
 	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "1T1R_");
 
-	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", ChipVersion.ROMVer);
+	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", chip_version.ROMVer);
 }
 
 
@@ -86,7 +86,7 @@ void dump_chip_info(struct hal_version	ChipVersion)
  *					BIT[6:0] Channel Plan
  *sw_channel_plan		channel plan from SW (registry/module param)
  *def_channel_plan	channel plan used when HW/SW both invalid
- *AutoLoadFail		efuse autoload fail or not
+ *auto_load_fail		efuse autoload fail or not
  *
  * Return:
  *Final channel plan decision
@@ -97,7 +97,7 @@ u8 hal_com_config_channel_plan(
 	u8 hw_channel_plan,
 	u8 sw_channel_plan,
 	u8 def_channel_plan,
-	bool AutoLoadFail
+	bool auto_load_fail
 )
 {
 	struct hal_com_data *pHalData;
@@ -108,9 +108,9 @@ u8 hal_com_config_channel_plan(
 	chnlPlan = def_channel_plan;
 
 	if (0xFF == hw_channel_plan)
-		AutoLoadFail = true;
+		auto_load_fail = true;
 
-	if (!AutoLoadFail) {
+	if (!auto_load_fail) {
 		u8 hw_chnlPlan;
 
 		hw_chnlPlan = hw_channel_plan & (~EEPROM_CHANNEL_PLAN_BY_HW_MASK);
-- 
2.53.0


[EXTERNAL EMAIL]
