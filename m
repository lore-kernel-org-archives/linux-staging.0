Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A748875F
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634655; cv=none; b=TZPyabLzpFj8kuYY1WRQHbDmCuZ6FNwHw9sBbSQl5qymETGPgirynlBTwhAXOmx6kqxu7HUAMz6wQBGYoTHdB0130XuWj04zF2r7Sr+7g7NNlessK5Xm2yPikaKENY08UMii+PjyNPwyMIsONbtNKckNc3GzSM2EVv+BUvge8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634655; c=relaxed/simple;
	bh=BiktwtMZ7S81hrjoglMA4+1/B+0ndpBWmuqZpXz/oDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=ORJOR6zpn3GO85wsMrTRPAe+O3cAWgtIovnp19tEumPb7PKIDbhKnH1AfVbsiJ6T7ANxmx+qZ+c5LKOujaB30tBVbAlS9DRFYBxp8Lss0EMeKMjjGZz7x+bQIH6Wfm9cBfXkhqGsedv3SN7uvjw6UTv2Nx7UCS/DGilRCkg46xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=AH202Wwz; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="AH202Wwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786634651; bh=SRbeR2iZfIvnTAihvXlmENQ1qL5BH79U8fFfKYxxYGc=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=AH202WwznNjfVLGYk+bFwL1rxw/p3fw4kVP2+8C6t3fCmYjQONvOhxSWBv68LAlH9cQhx2uekG9eCbruGBeMI3QR7SAZM2Fnp5NdIZ7Mtq+dZMXMxJkxuyNpxxbq19jl7SZp5ZFbHyuEOlFTrNVaLtKhuIiIJ8/rGGORlITnRdOSw33q6+kmkES4s4kJhtoh7IFk9iN1ZD9b6ErvXkbtY4V2xjMSOKJiIS4yxdspGXB8trH/QseV/1U0iGVk3XQnCAjIkAg3l7uA2BC9MCt9htlrH33RgQ76LYh1i0VOP4sl47Ev3wbVZTMh5x0UAytnliC6QVODvrLToc+zzaZdoQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786634651; bh=YtkCtUZEDojyK0hk2yvsKy08BDl74y/37xmu6EDVuWk=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=D3lBd+kkdOwE56MTNQHtEQ7wvrurLrfJRu8RE8uXp+DznSdBFrkOiDc3dtNNkyL9MwPOfx6UfzRz8UTtKHnfKM2AIvDw3nvHTnE7TNO7ia3BhHGGTojYxt0NBVIwMVBFSm2SAUknGZYenW27a2bFfYPZKIsTTBsHi0I2KE7BmDZbCucwoASj8fdp/DXI0zHx7sKwhUJAzehGZGxApuhm8Gij//WFXUL+Dseo9vA45uYN+xfmT2vjv2cHprvjoOf/K0CKcmhGVOYb+MYF1kwtSWtdxDt+oaDM0n3oI3H15d9TY4UtkzLy81zIrTrj3EW2wyl2FUfYG3BLillzfexj5w==
X-YMail-OSG: 5OhCmb0VM1n48MhtVx4UjCqRl2Y4a74h.GKodbzY3P55xei8eYDLnPAPyEz7IlS
 ph21c9RLBDOCMzCkiEWNm1hh_Y0HA4DDR2c4ZIB3AxLC.DQFDS1SijCUgqpVmzMExc.S10yfgpTG
 oK.ZhTOhfyNZsDRKU_Pox9jxw03zGhkToQ33WYpWXMfHa6hK5TEi6eXVe_jNlgUL.uIbnAjMikTH
 zSCevcDGItCb_02fBCIZscobdaWGga637CMvCcXk16glk1h.ZTE8xjbHWWR0k7VAZw62wYHJ3maU
 nOsPAq_vi0bdyTv1ZrnfkBnqArJQ05vmmPj7AFYaBjNZwpEEyZnlMPY4gesNANN.E0K7WcbdmdDM
 AL1IC_DNINRC3QeH.DbQNRvoWmUSWkRdCkCldeEc7yeYnDBcT2zBbvbfvAe8EaT9khda3VD5grvB
 MmHJiu1onXFV4g_VOqDjyxZMCRtUKv8FC8C0cNlsemYgX.LwN1t.L0wact7qBJdLXbyCUYV0RB9R
 KCoE1iNKwkI11ipNFuRLOojH8kTRSSAGzawu7sUj4aw7gIrIe02XXqG_b1ZbhGGz9ZXzjtThZubP
 EOb7fdFPwqWs0zYGBnPFMZ.lfRGcxHygXXRDMP5dOyTtBaK4TfMFl.MKKXvoKieH2r9XBYu6nBN5
 90kjPGNLy8kygAe0LnQkLkFqYAa03PtokDH0Nr2LRA4IHFd6pe6fBnMA7vIZ5UJWJAGpWBNBDrDP
 vRO_YZBagoh7hk7VJLvWC6Wyqmr6DXEN4FPJoK5JVpaEAluaKFrxEMJYtf79mZQ5Xe2NMgRaIzZi
 yOmKvI3efOB0gafqsnHkYo836aSK9Bokf8gTVwmO.8oAkZeK1Lhr7oWsl7GxCalmruj9Fy54ild6
 nYTlpfTk1Vt0uVG0FFYalpBypMsNEL1B2TcdvJam8TSH8ec5qpPipBsG6MZZs5_II06jPRdOjEzr
 nHJLpOjXhSwWfekOjKPZCKQ2Q5WRRRQ7JGVoZpEQv37uME0NmWPyyxq06s0cIidVchiP2ocJSMrm
 X5l6TZr.U3D5fHGI8p3rKjetVXc1ryQHrNnVPYmiCKS9CC4LwHADLO7UOipUa.WzICH2WfDeAR83
 NCNceQSZyot3m57XpffuF3x7JZZUVKGezWawO3AHdAN3_ckTADHrwfdGiSK9J.XfkYvjvWRs9JCO
 _FFxYVWPSkFk8ZoWkpPCPJtT8RgqKSF5shn6il6B5ORgDOvWRLBvn9QXtkJSZ78st7Ff9sclVjk0
 fD464FuRNi40v0iTmbV2PZGxHRHto_zR0Gy6XXm1BZ8o.e5cIKTY3n7E6w7qWj_fsBkMhqFedvTG
 4ZUDUVAH5qUuZGdPRJZkF8WPNqEspAynAEc.s2ksfljqSEPywemvkRfGdSIZcMoM7zGS1KWwwIHg
 IyNXdhNbRUDbtiBbDg.id8skwmAbRlLkQ2WB5WlzZgnr4EydmSuER5nSQ.ClYFWQ64GRG3T0.YA9
 KqqXYDgXGQwNhZCjKtwAJK5jFcrNmrXTRq_9r3h_Yku.kIL26Uq2j4YZPnkvGDYa3rKhvq11wv9g
 x01s2AZ.L.2FXlgJuZmXe0wQ3FJKnSdVMkFzoRaarZsJkAvXg3nwqzVmYCNqi2hFgYWWFLlMbIKF
 Gu6dIlEejzvFEgOiZw3okUihYSNtnhpjdumh.Zu9OU748Um5.J5R04m6WnOLiQhLZ2NB2PZUADVx
 EJV4LBQ4sB1y78AkClRZNYZ4K6ZldRc3iyPWVONbxF1JvMudh9woTTDs1QbuFv.uYub9zF4sibo9
 dp.cgZXswdnSt5oIF5rXvHCBFy6Xz30pwscWBRJOSDxvS4VFMlBxK7p8g3WJ0LXNQs.dc9WxtLnu
 xX0JeHU2f7pB2wFnrW9mFCXD1AeVLWoD4YannH287MCcxiThVHVPQd99pwAhyvV84kn86SdPrhwZ
 icfZ9EyoX5WTCk_kxVA1BR16wPzDIwGgQ4fQG6zoRtCjh_aCuoJW50et_Jna3H0AZ_0FXUhzPutp
 dqMwMc9_HU52xuqiM8sFp.4Eyh_WhCcpk4lrnkIM4vpyJktWaLqI-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: eadf3a55-dc28-42f3-853d-be6d110d990a
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Thu, 13 Aug 2026 15:24:11 +0000
Received: from dip164.lsn.ir2.yahoo.com ([87.248.99.173])
          by hello (SMTP) with SMTP ID 5d242b080e65245db2eed06819640cca;
          Thu, 13 Aug 2026 15:24:06 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 13 Aug 2026 17:24:03 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in
 HalBtc8723b2Ant.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rtl8723bs-space-before-tab-btc2ant-v1-1-4968949785d5@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBBA0auUWTuQJrRWryJdZJKJRiQtmVGE0
 rsbdfk2/28gXDMLnLsNKr+y5KU09IcOws2XK2OOzWCNHc3UO6z6mI7WkaCsPjASp6UyqickDdY
 XxTSYkR2dYhwIWmitnPL7N7nMf8uT7hz0W4Z9/wB8qTpNhgAAAA==
X-Change-ID: 20260813-rtl8723bs-space-before-tab-btc2ant-f506e3b9dd5b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786634646; l=3194;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=BiktwtMZ7S81hrjoglMA4+1/B+0ndpBWmuqZpXz/oDM=;
 b=Ln2PTUlEMBxWbhoIhsihkj8B4Pq8mIf5qNHQWoh1uO5wfCcW6XnguPzMrK369Cj9KPYWYn9rF
 vBrlY94mBm0DCBrM3G2hU6czPOWWu8oQi3Byh4AAUXrSkXQ94ShnkPA
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260813-rtl8723bs-space-before-tab-btc2ant-v1-1-4968949785d5.ref@yahoo.pl>

Replace space-then-tab with a single tab between variable type
and name for the local H2C_Parameter array declarations across
several functions, and for btInfo and rspSource in
EXhalbtc8723b2ant_BtInfoNotify().

Verified with checkpatch.pl that the 'please, no space before
tabs' warnings were present before this change and are no
longer reported for these lines after it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 6da6940c9043..7c4a050b32e5 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -181,7 +181,7 @@ static void halbtc8723b2ant_LimitedRx(
 
 static void halbtc8723b2ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	pCoexSta->bC2hBtInfoReqSent = true;
 
@@ -417,7 +417,7 @@ static void halbtc8723b2ant_SetFwDacSwingLevel(
 	struct btc_coexist *pBtCoexist, u8 dacSwingLvl
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	/*  There are several type of dacswing */
 	/*  0x18/ 0x10/ 0xc/ 0x8/ 0x4/ 0x6 */
@@ -430,7 +430,7 @@ static void halbtc8723b2ant_SetFwDecBtPwr(
 	struct btc_coexist *pBtCoexist, u8 decBtPwrLvl
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	H2C_Parameter[0] = decBtPwrLvl;
 
@@ -504,7 +504,7 @@ static void halbtc8723b2ant_SetSwPenaltyTxRateAdaptive(
 	struct btc_coexist *pBtCoexist, bool bLowPenaltyRa
 )
 {
-	u8 	H2C_Parameter[6] = {0};
+	u8	H2C_Parameter[6] = {0};
 
 	H2C_Parameter[0] = 0x6;	/*  opCode, 0x6 = Retry_Penalty */
 
@@ -743,7 +743,7 @@ static void halbtc8723b2ant_SetFwIgnoreWlanAct(
 	struct btc_coexist *pBtCoexist, bool bEnable
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	if (bEnable)
 		H2C_Parameter[0] |= BIT(0);		/*  function enable */
@@ -775,7 +775,7 @@ static void halbtc8723b2ant_SetFwPstdma(
 	u8 byte5
 )
 {
-	u8 	H2C_Parameter[5] = {0};
+	u8	H2C_Parameter[5] = {0};
 
 	H2C_Parameter[0] = byte1;
 	H2C_Parameter[1] = byte2;
@@ -824,7 +824,7 @@ static void halbtc8723b2ant_SetAntPath(
 	u32 fwVer = 0, u4Tmp = 0;
 	bool bPgExtSwitch = false;
 	bool bUseExtSwitch = false;
-	u8 	H2C_Parameter[2] = {0};
+	u8	H2C_Parameter[2] = {0};
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);	/*  [31:16]=fw ver, [15:0]=fw sub ver */
@@ -2460,8 +2460,8 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 	struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length
 )
 {
-	u8 	btInfo = 0;
-	u8 	i, rspSource = 0;
+	u8	btInfo = 0;
+	u8	i, rspSource = 0;
 	bool bBtBusy = false, bLimitedDig = false;
 	bool bWifiConnected = false;
 

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260813-rtl8723bs-space-before-tab-btc2ant-f506e3b9dd5b

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

