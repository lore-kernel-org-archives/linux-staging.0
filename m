Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358813CD8AD
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160743; cv=none; b=mo/FEqP+OmeZ88f0Ry8VAh1rR8Xv3DwvTxF2qwWBwv/bvggIRkNrS8V5i8LpPb8Q+Czw4iMP7pzN+LCMHWqu1MZmkVeY76xeZBLUun8uTXCgVt1kdTwzRGRGYkMlssDTRgN9ZW0PowSXdJfvUKGz2sy/R8xvUb9af8twpMcbocU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160743; c=relaxed/simple;
	bh=7RsPONIQnY98+2OqD6btZjmZP/j+SspqK5MMkW5lqfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNkrI+q6xWdzVq8iSdTst2QNM84V8M48LTH9GfRo1I1bZYfn8s9rdXF4yYVWnIB5BnMuSx4sLEAM3ZK3dqjZnQ6VWnSA0G/QymRtybFa0jbNmnhZyRCVls8j9tCcF7nmsQeCtpmKwdk/Qk8+jhPtu18IrHNABMfjg2XKaMw7zCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzCja4qE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzCja4qE"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso4406144e87.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160740; x=1776765540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkvWGV+eYa7ezu8hkwgEcsEbAUCRA8jsvk7paZPGHo8=;
        b=JzCja4qEh5ljCos9Z3OAWlTm+0w/l2cnOr6nvb3JvNrXyGjsJzt9BlO86iBBxWtDB4
         TGCGPUCtNFGyzDSTrCSc5qhCY7+OpbCLAq1IzKg+ViE6devv6U9gwoUkmuKYAatPPVwr
         1UrMmVMl+OyYC/1ZinRi9wZbPNf4j87HLAaGBSKGSbT00ouR5qMCjJZRDAc7ZXMKkJXE
         aZSkS5H4sHozRkrEegGfKkph+IIini56mlBux3DRCCYdPrH74nyia+vguaWi7GFXO500
         GlNRtX+/k7vYoS+LusHL1FKEQ1pjHRpm6jDF1bX/wRznssJgAyfmq/fTKplns+Xhh+Pf
         KVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160740; x=1776765540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JkvWGV+eYa7ezu8hkwgEcsEbAUCRA8jsvk7paZPGHo8=;
        b=IU1s+K+Pu8Q99Ssu4R+bjerfFLTFd3zDUdm0UsJTfv6LU5hYQaGcGQlF+/lx3tn7lV
         yR0sMzhA6hOgyUavf3i167Oj0RwbdPOsau3EJ7OFj4sDL17jMOWwglub+hE7vn1cvRGw
         TZoGPguC3uHsWHsiGM47H6vPSk5f+0RwmgSI6TKeOcJ6y4DBamDsJ7r0SX4Io3YQ3H+m
         IDFE+T9qZRJ8jHeCJfk+jSj/7R+3FR2DgPNbJuLxT2+Ab7s7z6+X1FGz8qjuK5uR/tlg
         oDNe4sg6yIcMS4YbIiyPFceUAB1gcPGqMYbioJS+C9oomn5M2p3FDmMKbx0GxGyssHGm
         6Hog==
X-Forwarded-Encrypted: i=1; AFNElJ90oWfw+qJNwYovKIqxEOFtmNNln1mvfOrB8bFpVF/24p8qdy4ZmaFuhELRKKZ+KctBU9WNQFAhOnAl4mM2@lists.linux.dev
X-Gm-Message-State: AOJu0YxizDdKD/52GN5ARXUK1X4kHXVgVG6gUYxWpaA81VmEPudLZcjK
	mjJPjjJPQd1aZ840L/hehmHQr3Go7OlfLHi7hsu1bTlHBMngfSTudG4o
X-Gm-Gg: AeBDieurvgmvr4ikmRQoicJIB75hB3AqhsoFMoD2y5UIEwmCS91EwnpgrzdBAtVWPCJ
	5nK4F7zLROr2V01CdZvHkPSvFCOfuJ2SQ/zoGCvBXQlowgw57Qk5+t1fJH70mdoPtSVhYmEqgA3
	ZPd4ZNOp939qRGmOcl99J+UYEbiEBkfEM4f6QSmUFI4SiI+j3cf8BRe/usiqk+iGYguBaSZ+MhY
	T/4UNN6g6Xdouf7i7QFmqmAl3voNl+/3AHBwrJIiLuJOWaFNyG2/YWYRcjDvDJwERJPaFzUQTTm
	0OIZpvOx0GaFmwmJqo0/yWRD42EyHTjuZTTCNSBnhlL6cBU+RilWaboecYx9M4hD8cF3rfRBAyE
	txfB/716XSip3X2P7zqNIzGnB3sCopC1r/lDzZtRgwRYKfOHLIeLiJCUzZlHnGj9BFTKmIj8j3f
	wV0w6DbxReeVfBFw==
X-Received: by 2002:a05:6512:1591:b0:5a4:558:33ae with SMTP id 2adb3069b0e04-5a4055834b3mr609264e87.10.1776160740214;
        Tue, 14 Apr 2026 02:59:00 -0700 (PDT)
Received: from arbuzik ([213.79.119.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm3208359e87.80.2026.04.14.02.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:58:59 -0700 (PDT)
From: Marc Finkelbaum <regpacy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Finkelbaum <regpacy@gmail.com>
Subject: [PATCH 7/9] staging: rtl8723bs: reformat multi-line function signatures
Date: Tue, 14 Apr 2026 12:58:31 +0300
Message-ID: <20260414095833.76480-8-regpacy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414095833.76480-1-regpacy@gmail.com>
References: <20260414095833.76480-1-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert one-parameter-per-line function signatures to standard kernel
style with parameters aligned to the opening parenthesis and wrapped at
80 columns. Affected functions: hal_com_config_channel_plan,
GetHalDefVar, SetHalODMVar, and rtw_hal_update_sta_rate_mask.

No functional change.

Signed-off-by: Marc Finkelbaum <regpacy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 26 +++++++++----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index dc5e6a58fd9d..44bef1400947 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -90,13 +90,9 @@ void dump_chip_info(struct hal_version ChipVersion)
  *Final channel plan decision
  *
  */
-u8 hal_com_config_channel_plan(
-	struct adapter *padapter,
-	u8 hw_channel_plan,
-	u8 sw_channel_plan,
-	u8 def_channel_plan,
-	bool AutoLoadFail
-)
+u8 hal_com_config_channel_plan(struct adapter *padapter, u8 hw_channel_plan,
+			       u8 sw_channel_plan, u8 def_channel_plan,
+			       bool AutoLoadFail)
 {
 	struct hal_com_data *pHalData;
 	u8 chnlPlan;
@@ -525,7 +521,8 @@ u8 rtw_get_mgntframe_raid(struct adapter *adapter, unsigned char network_type)
 	return (network_type & WIRELESS_11B) ? RATEID_IDX_B : RATEID_IDX_G;
 }
 
-void rtw_hal_update_sta_rate_mask(struct adapter *padapter, struct sta_info *psta)
+void rtw_hal_update_sta_rate_mask(struct adapter *padapter,
+				  struct sta_info *psta)
 {
 	u8 i, limit;
 	u32 tx_ra_bitmap;
@@ -649,9 +646,8 @@ void GetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 	}
 }
 
-u8 GetHalDefVar(
-	struct adapter *adapter, enum hal_def_variable variable, void *value
-)
+u8 GetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
+		void *value)
 {
 	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
 	u8 bResult = _SUCCESS;
@@ -699,12 +695,8 @@ u8 GetHalDefVar(
 	return bResult;
 }
 
-void SetHalODMVar(
-	struct adapter *Adapter,
-	enum hal_odm_variable eVariable,
-	void *pValue1,
-	bool bSet
-)
+void SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable,
+		  void *pValue1, bool bSet)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 	struct dm_odm_t *podmpriv = &pHalData->odmpriv;
-- 
2.53.0

