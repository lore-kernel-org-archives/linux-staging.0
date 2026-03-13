Received: from sonic307-54.consmr.mail.ir2.yahoo.com (sonic307-54.consmr.mail.ir2.yahoo.com [87.248.110.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B233612F8
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 15:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417499; cv=none; b=fsTv79tNpp5U3cEGlixtH9dYzyOfHVv1ud0tuQaVoK1ndgan2MJdyjF5RyOP44YejQiNuo0MKLn+IJgfTy/0oEOu42MpV77PrfzWh0gWIfbqkb4YaEWQWYD5vAbGPnD7bBSa/pnD17V4yJfiuuBYTrrh+Wgvb9Loa6trfIMx1C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417499; c=relaxed/simple;
	bh=43iHeHcqLmWDLlWsITqoi4SJ2eUkzhJoF5R7wUzzA9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=IPW/abu0FJg6JaweZQwfLxKfjL6IO1TWOha7DMn/hlL0wJfKzN4i4FmcgxCP+8KafFkx/bqeQG/9Sa5xdyhbgnrAXd/tqYSnEE2D+2kR49aJWYGEhf1GrUPHrGFZDuyUCH48cOl46jGIM06Lt5Lds+PgwQ65LOQzev/8NPNxEoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=h2v1Z82p; arc=none smtp.client-ip=87.248.110.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="h2v1Z82p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773417490; bh=7VJNKyt1jpaZ5THYtvZIgtVZYfR2eVsvgGL2cla3lqY=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=h2v1Z82pn5z413ypO/0mpk2CaQSSl7lOBU6rs/7wfbnxwaZFDVcGoZLQkZBHJhgoJNTQLgSdXo7pqwhNcZSfftCn02xjAZJwz34R5uI+g9Zf67PpRYxiA5WqnXj7jJ2I4AV9eUPmS8JJxltJjPqi7uM9xjX04onKRk1lOBItbfRNrOpokMD/pqx5eo1KYG+mAu5QrW9yZkPRpr8tdMNYOVyOH+rdG+RQju5PJOXigepgCVCNhNxDucHgizsEJh/BtqSakB08kfmwc/3197Nqi9rSIkhvIrMjEQ7JCswcGVptcOudNCXKNDjbqiBVfjlFiwmMHJ42cnhHIRBVhZ9uZA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773417490; bh=6+e/HrVU0gvzcDsvBqafBbts1eYtSFEv+JSfd8q3DIp=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=flfhk4fUWCajnGKu/RmEtKXamUVT7yZ1yjbMVeJ6iRm1sb3wWO9Noh9beb0IoQ+gekMa/s64Az2hKc8oTq5z5wYbriNoS5Id4kj5H6W9sfqubPkz0+7Er6VkHWLUX94tBxzr5VK1XsM93lJvpoHYl6OX/X2xtf75mE1LnqBZgpOLAdmPN5l2baf8c/x893VVp7GRFsjM1R6YHpn3lRPYnRz2Jlozwpe+znwEDlDNIFvUofkuqjxtc3NVpIrCY5T+unheHQFtlkl1+/FVI0OUvnaVxfRjL0N2PtTY7BfyQIVheiFkRz10bC/lFTKDVc7jsDO2CK8EeCRVG6hZAQqP5Q==
X-YMail-OSG: goqabTgVM1mj2lLXzr7D7oid87xLNZ9ot8EkVl4YQ7x36B1bzitvevj_aDl6V8r
 4wcvzZwyaNX.X9C3DqyEr3L5kY4rQU8v7kJDmpD2hTsCfmCBDjtJP6UBP4k32GARFlLIBllvlLLB
 776cz6VlFrt_b4rTl_42Isa6yMlS8dyKGedjbwmkgmwEjbneqIHfNAFxBObt5sVKy7dHYdRwSz.7
 Ju5e69N..tiRs3GTVwM1q.Suv20kiyWCSXs3ywlPRp01fV_6Wdthao0kg3sAGHaS6rYZqvtGQqoZ
 hO.UMEkuJMrn.vovXA6cqeeLeKxEw1vYB29uYViVAGjHBUVYX5cUUa_3YPxkfGPxJSHLTJrOHUyP
 BuMVKmRqYXR3Yzqd18JO1C8XCjikz73TBFzZhSlvPS3vnQwlOe.JTFnw..DDzOo29iF4DuUIwMrJ
 nXvc01KvCzl8GmsLTfus1FJBeZt.zF0q0I2.7t5FePkMO16j69LXJoUaWrW8enEIfQqH0R8K0iQD
 hlPFmPSB1ePVbckMMPJobpU3bCW8XebRRdtnxNu1F3qbliShp0fl8uwfUyuRfKEl_rACHinB5LlD
 wLXd294K3DSsMB.huhrln5HrzxCkMiV6wswD85l5VS8J6lK2H7SjJKAgWfa8jsBNTbDmcjohKyu_
 PDcB8IGMeKzZyt5C9T9dsRtjsgB7bxLtkaF4yVoxNreCf_8sAVXfsqVV0V6V34itKMZNJEzjZVNB
 gpq5r7pvrLA7y7S6KvumStwifiA9j0hSFVyp9xX552L4oRbhtAlF8YEkv39H0hkmtf1T_jm6eavp
 em1GveL3g7Tgi9MxVXDT48fAj2Ndy1n9_SvF3VMUCSbnYGmFvTLqgR61DN6IeR5T52vmIZdEd60B
 Lq4Hs.rjwdNSXh_9BVsNR3zwxpypRc9lCuIZuU1X42YGe4Dy8X_Aw7lNMe1PgcI6uPosmJlCB7Tk
 vCUcqITKG0OimGNHhQ8tZBoc0yIewBOg25EF3dgv7d8AEkAQPQAq1BBTnb7aflqiF69uoLwnjudY
 YTvgUg92zKvxoWx4oUROtZ9hf7G.JWzOA0omAsPnSKyRAl2BpxJMKcJmTegH2pIf97_dR1ghzmdV
 334p91V1Hilh2o3KA4gNHagjBRLtgA5Bq82exsnGqALsRY5Kwz1uvI0V.LN9LH7A2_Q5Hajljljf
 G7xeYH0Q_0SP65Lcuq1P2IByKSs3olqXdjcpEt9ppVzSybwsn_8GfCS6TwnioOvQLHA6WdPAWpWw
 uJj5P5_cg6wTfyr9FcZqEhLitCh0mJklI.O6ntBAI05hl1Vm5fHsvdxu_8sRLlIq8u_h9At1YRJJ
 cZ7_CZryM.SLsGsKWhUe4Zhx_qUUw7NMfzotXGZmmrUfbe6OSiDCcevBZffiDD_erS_N3SY3a2fG
 B_yAoudGJDmSFsC2Cxg5GzvbL2MWphPKF2MacnmaS365hEiRqfnPe8Rd9pr6Zxa72sVkT3NqwNcw
 p3mA_lcNXK0xwS4M4YHUnYt.dyAuORn_exGODk_ChwMT4FW8BeNhfKJCltiVtXKK7ZgcW4YYNrCz
 CTvSLGmq3JFd4htO3YL6uN_LziW1sAIEMAo.KfZfcakc9BLgU8xEuq6_z7Mb9t0bWlJDckay_Uk6
 L9wKwjGQh7Fy1CU10YSc3oMEHNqqEso8o_Ofe5BEGUrl3QZtkm9_vumVGq8_l4Dx8k0qmMv6YrvR
 TDuEmI7PIIItVngD_S_sKPIAe3QPfTxTf5M7b1FvZXP.8QY13XGUagjbu3aLFsSYjCAC5jRUwu39
 0qgOI.O_x.DpBB1UQO_K01fBf8ouTY29IDvAI7kek7oA9YYknpcfn0ZFdXp9zxSGUJ1AENtHqUxH
 AxW9tgAOH7QvHRdq6csLunP96wf5LDFaqpTmW.r7VlNJsQq5NKbPrdQ3AeFtYPoNaRekQGPZ1HXa
 uAWdivp02l5LuSyA.sjsRkVoi1HL4zorqtj2Hdg9pYduVtdZmmx2q5qNHC4F1RKm9U.laRN642w7
 XAgi65RedEWAyWxyoausCqQQmNfVg397EhFgLw.dlgQ4ceG_eFottbTIdVcm2Q0FhPTl090xt.kP
 KQ5g6vx5fo3FuGBj20slHONP0wB6qPQP71XgbiOoAWfUFc2kmc_.aeMC5_wUmi6up1uudk2dvfFw
 Hci.GCsngoMV00330xlSt63oL1jj9_j9Aa1hH63iDJN0H7owPqOdMoT1OCuFHzK0fGunMrqnKx2I
 EMOE5heEsrjfCZYR.YbcpodKcT5F974eQT.sRfwh07izAyk3vIHEyABTfCGOAd_TqRCrb64lDcz1
 AT4BD2Wv_5U9_oy7Jdg--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 7f8f46a3-9abf-42c9-b107-d8b63d4c6b35
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Fri, 13 Mar 2026 15:58:10 +0000
Received: by hermes--production-ir2-bbcfb4457-p7tzh (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d939675e202b65f50bac81e278ddbc12;
          Fri, 13 Mar 2026 15:47:57 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 13 Mar 2026 16:47:54 +0100
Subject: [PATCH] staging: media: av7110: replace C++ comments with C style
 comments in sp8870.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-sp8870-cleanup-v1-1-2d5069c4eec5@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBP8Lesq0UJsqoEwUYpAunvS8
 lu8VyBjIswwNgUS3pTpDBWibcDvLmzIaKkGyWXHlVAsR2t7zvyBLlyR+c4YyQeN2g9Qo5hwpec
 fTvP7fk3oydZgAAAA
X-Change-ID: 20260313-sp8870-cleanup-c6552094e4c9
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773416876; l=6043;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=43iHeHcqLmWDLlWsITqoi4SJ2eUkzhJoF5R7wUzzA9U=;
 b=hLjl1htnBMXe0WYg9oHmubJ3HfghxcsC//Q29+/xH84rtIgZVrJsOPomLymy5P+4mfu7jOa0R
 ot2bdM9qLrxBaacl8srbHmczVxEKQfhn2GCod1ewbu7FsGCxpO/mJ4y
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260313-sp8870-cleanup-v1-1-2d5069c4eec5.ref@yahoo.pl>

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/av7110/sp8870.c | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c039..47a1eb22ef49 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -109,21 +109,21 @@ static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmw
 	if (fw->size < SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET)
 		return -EINVAL;
 
-	// system controller stop
+	/* system controller stop */
 	sp8870_writereg(state, 0x0F00, 0x0000);
 
-	// instruction RAM register hiword
+	/* instruction RAM register hiword */
 	sp8870_writereg(state, 0x8F08, ((SP8870_FIRMWARE_SIZE / 2) & 0xFFFF));
 
-	// instruction RAM MWR
+	/* instruction RAM MWR */
 	sp8870_writereg(state, 0x8F0A, ((SP8870_FIRMWARE_SIZE / 2) >> 16));
 
-	// do firmware upload
+	/* do firmware upload */
 	fw_pos = SP8870_FIRMWARE_OFFSET;
 	while (fw_pos < SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET) {
 		tx_len = (fw_pos <= SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET - 252) ? 252 :
 			 SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET - fw_pos;
-		// write register 0xCF0A
+		/* write register 0xCF0A */
 		tx_buf[0] = 0xCF;
 		tx_buf[1] = 0x0A;
 		memcpy(&tx_buf[2], fw_buf + fw_pos, tx_len);
@@ -149,7 +149,7 @@ static void sp8870_microcontroller_stop(struct sp8870_state *state)
 	sp8870_writereg(state, 0x0F08, 0x000);
 	sp8870_writereg(state, 0x0F09, 0x000);
 
-	// microcontroller STOP
+	/* microcontroller STOP */
 	sp8870_writereg(state, 0x0F00, 0x000);
 }
 
@@ -158,10 +158,10 @@ static void sp8870_microcontroller_start(struct sp8870_state *state)
 	sp8870_writereg(state, 0x0F08, 0x000);
 	sp8870_writereg(state, 0x0F09, 0x000);
 
-	// microcontroller START
+	/* microcontroller START */
 	sp8870_writereg(state, 0x0F00, 0x001);
-	// not documented but if we don't read 0x0D01 out here
-	// we don't get a correct data valid signal
+	/* not documented but if we don't read 0x0D01 out here */
+	/* we don't get a correct data valid signal */
 	sp8870_readreg(state, 0x0D01);
 }
 
@@ -243,7 +243,7 @@ static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg0xc05)
 
 static int sp8870_wake_up(struct sp8870_state *state)
 {
-	// enable TS output and interface pins
+	/* enable TS output and interface pins */
 	return sp8870_writereg(state, 0xC18, 0x00D);
 }
 
@@ -258,29 +258,29 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
 	if (err)
 		return err;
 
-	// system controller stop
+	/* system controller stop */
 	sp8870_microcontroller_stop(state);
 
-	// set tuner parameters
+	/* set tuner parameters */
 	if (fe->ops.tuner_ops.set_params) {
 		fe->ops.tuner_ops.set_params(fe);
 		if (fe->ops.i2c_gate_ctrl)
 			fe->ops.i2c_gate_ctrl(fe, 0);
 	}
 
-	// sample rate correction bit [23..17]
+	/* sample rate correction bit [23..17] */
 	sp8870_writereg(state, 0x0319, 0x000A);
 
-	// sample rate correction bit [16..0]
+	/* sample rate correction bit [16..0] */
 	sp8870_writereg(state, 0x031A, 0x0AAB);
 
-	// integer carrier offset
+	/* integer carrier offset */
 	sp8870_writereg(state, 0x0309, 0x0400);
 
-	// fractional carrier offset
+	/* fractional carrier offset */
 	sp8870_writereg(state, 0x030A, 0x0000);
 
-	// filter for 6/7/8 Mhz channel
+	/* filter for 6/7/8 Mhz channel */
 	if (p->bandwidth_hz == 6000000)
 		sp8870_writereg(state, 0x0311, 0x0002);
 	else if (p->bandwidth_hz == 7000000)
@@ -288,7 +288,7 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
 	else
 		sp8870_writereg(state, 0x0311, 0x0000);
 
-	// scan order: 2k first = 0x0000, 8k first = 0x0001
+	/* scan order: 2k first = 0x0000, 8k first = 0x0001 */
 	if (p->transmission_mode == TRANSMISSION_MODE_2K)
 		sp8870_writereg(state, 0x0338, 0x0000);
 	else
@@ -296,12 +296,12 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
 
 	sp8870_writereg(state, 0xc05, reg0xc05);
 
-	// read status reg in order to clear pending irqs
+	/* read status reg in order to clear pending irqs */
 	err = sp8870_readreg(state, 0x200);
 	if (err < 0)
 		return err;
 
-	// system controller start
+	/* system controller start */
 	sp8870_microcontroller_start(state);
 
 	return 0;
@@ -337,16 +337,16 @@ static int sp8870_init(struct dvb_frontend *fe)
 	/* enable TS output and interface pins */
 	sp8870_writereg(state, 0xc18, 0x00d);
 
-	// system controller stop
+	/* system controller stop */
 	sp8870_microcontroller_stop(state);
 
-	// ADC mode
+	/* ADC mode */
 	sp8870_writereg(state, 0x0301, 0x0003);
 
-	// Reed Solomon parity bytes passed to output
+	/* Reed Solomon parity bytes passed to output */
 	sp8870_writereg(state, 0x0C13, 0x0001);
 
-	// MPEG clock is suppressed if no valid data
+	/* MPEG clock is suppressed if no valid data */
 	sp8870_writereg(state, 0x0C14, 0x0001);
 
 	/* bit 0x010: enable data valid signal */
@@ -490,7 +490,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 			return err;
 
 		for (check_count = 0; check_count < MAXCHECKS; check_count++) {
-//			valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0);
+			/* valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0); */
 			valid = sp8870_read_data_valid_signal(state);
 			if (valid) {
 				dprintk("delay = %i usec\n", check_count * 10);
@@ -526,7 +526,7 @@ static int sp8870_sleep(struct dvb_frontend *fe)
 {
 	struct sp8870_state *state = fe->demodulator_priv;
 
-	// tristate TS output and disable interface pins
+	/* tristate TS output and disable interface pins */
 	return sp8870_writereg(state, 0xC18, 0x000);
 }
 

---
base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
change-id: 20260313-sp8870-cleanup-c6552094e4c9

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

