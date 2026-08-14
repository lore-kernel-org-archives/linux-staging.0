Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A7410D1A
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692379; cv=none; b=N1lI+HTDHSWK4N/xWdF3QBu4701ACwdqZsxD1wvdV2F7bHOnx933A+kXcH9sSGxiCjBAKiE/MSLFxWoXEVCyJqBC8xQtqGVndZ/AKvledifMWSEgwahw9pQAuXA+nHAOzePG6cina/Aq4RGUP8CJkoo25JRIM6Dwy2s1ztRx408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692379; c=relaxed/simple;
	bh=MZFya9JBs8QA/prZPxUj2RL7W+DoNkBpO04flR6/v4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=c+wX7HwqhFOUb7Gv3WayKdnHST1oPjCn3rlnYIJb/0FJq4sUd4HbIsVW/W1m9ZSqoQDyikbCDpt6Umg4vh+I62XoNWQTZqSOa98Df+yjeqFEO/cJ7wxIxC39N6hVtj4Nk7St501MPH/srvPE5JEP1rjhHqhdFgBKjG01F7kSnqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=EVh0ULBw; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="EVh0ULBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786692372; bh=kaYuEMmCA+WJjP2PPiADtCWKTjsT1NLQGyDAjzTAvgc=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=EVh0ULBwoGCeNxkUv7IeqauA5Weg1/R81V3/RRMR+rdFcVKvBzzQt4u1p+sNqBorZiccM6LM2IfI80rQopTdGPGkoddg05PE9ckM8RJ4Bnj1siTlJ1jn+pJly2TwGOEJficLLAJ4lpTjTCWjlmFnpiWANThEDnkNQD28sB8RW/zxBWocRyRHNbPpUNKrEEUqPQaZLBVIMlYkXRIigKPmSGlIFUWJxJ7y4+ACBQmFTqIGuy6HFwLsrtvZ5pdi7Qo1tDBfD8U2RhkQ6s0ca2vVGBsCoSPcrx4NZ8EyTGEa+HwQllU6TY5VvcI3KOSIauW6pOxWDDamDE3WPWZ+zKUA3A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786692372; bh=prjaL6EmjVKCXElzkF78//EyWCgTrpg0rRTpM/QFS9o=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=rfG2pYs1KiiFk2lvFCUbuV7VTlNoTrBlEOG8cRtMJeMaXVlhfoPZASq296ukZ/Qne1rZT1lRl5Mk338ZrjxKlAxu4hGleKvxS8n8WzS76uDaooG/0eI70NIySu9TMjP3KUtZ8J1PPZ5X/daqI1c/O7l3p4bqXY06AFcmmCQ54mFNLP+R77nfSsZDomOBfH2bIomohfQZ1L4RxWPuy6Xfch9ECZKIBN5rMLtqSKBPOlsJR2RHPzS+Yo4QO8iTZ5sMssa8NxWt0itn9H/TJuklztvORRdTr3Mb0x0Rzm+tbmH6Aty3SHwZOEWQ5V+BvPxb249b3gdzGBsDgTvfzpqd9Q==
X-YMail-OSG: mNNTmk0VM1nCo_IcIGSwdJchvirs_jJ6uqa7PWZctDSuw978tnQJW.Kr9YXCVNz
 R7jIGYYAUpTVtTeM00ZEC_BGv1deJQyCkj3PxVBGmE5nzCvOrZN2aMRv.Iu3Rg1vY8NhsrMjQ3MM
 WWbXWH.0EMQn.Rqzt2DCHd9qYTEXUOg.WJcT1gnldmiecwGm09QnM3EYup5edyKGvhkPHyDPXjvy
 D982a0P3E..mfduixF4vG75wD4075dt2flaybB2XP1tpiG7daXcBkmD6cNUir2aNpnxt0a8Sd10z
 yG9QLoCF6ak3GpqwVOfhgYyZeQa_9KRWZ.rASTMUxz7rBsCK.7fbstWs..7lDm4XBDTwiQViOqGa
 iqlg1ms8CyqCGcusJ51rvooQMHOrRKSZbYtHM8WEwQWlL7gdCbZfjqdW9UI5S.oMOiWiTimJBkNy
 uO8X283h9RtJZ43cM4FZhcaxCdaj2pyaeEnBRzu0t59m3Q0ZEllL_nMz0oBCBXEahe3fHK4qYEUS
 3lKeUSekZM658Y2Ap4zZw9jrOKOkmyusEmAlL3wpFEWaSsPIwDrY9uQvaN5ind7wqqyLsQ1KFw8k
 jft5waAGYVR2DkesePrRK2A8XAPufb0CQ6vLAcjoQvzmhNDyyhmO0d4LxwvwxVyBQI6wm5ta6swi
 a0ynH65OCgG1ykl1lbBz8ka32.Qjqo.GQoq8mx0qWnXXfwUVh7ZEf_gnCaqKwEHEB9gxjymMuixG
 aNgsh9BW_H.j21u1IuD5iWSVRmCA9y0ud0AwIKVxhohOfGXdhIr2XnM9CPhKYcM40mkjb_c.WmSj
 Hj0IcQhPShLwn6uUPZj.WU93kfM_40sffTHT1Qc2sxRLi.ZkBVRwGNErfq5KkZ2Xruwi.zjT8dSW
 dbkq4VhubTX6G3DBJAh0uLk7SVc5wVrOcmoqk1lXhSn0iiXxnYBCoSD1Mfss37ia6fSebhXzzJ0f
 G__inMGIL96fPojWnPkjTzq9W13rpaT9.5DrcssPyHy8w7eH9817_Ia8jBFCgs7GM4i4C1fOkCvt
 qhZb7vWEqRLHfnfXB8ZwwkjWnBQVmuio.SMvhxlljvtHRh6rqpa8fdsknA9.wu3Ph77cp5Or2kjl
 BnPDG9yWVRiyZB5sEtIGl26B50Jvhp2Sm8cRh8KQHAD4f_9lMmi1lheVAsI0um14fn.u4OuNbsMW
 h89KHptWvdqKnMdyRRBnDChm2kK3l34czAaFR2PJtWumnDCUwPhFIMIpMzzE1crk4pA9Ei5rEZgH
 82Iy7RNxjeNEEoF6bd9rjAfJY8WYLmLZCXwZ5Iwna6HmRm7mFkj2rTyJF_dsHKpMwFqRDSln5oPi
 8rZGazpDTuE.kx_nYwFxmLd5KTQowOrWzoNPEwhFycgL2Vx7XZ.2ID8luaDrbSUWyzMnouXKSrQh
 kf2UUEAyBd6YI9eOzT5UrIHm2OiCIjtCT29bBrpDQwsnxj3PBS9DfSKMNWQLHf3B_gSr6oMGNKCI
 DkWX0wRnBBtOYxpx7GNNBWUXv5CREZPKYueuYDyBSW99RySnuhXjd7ATx.xbKOZ.LcBwJJHNSzZ_
 aGtCkZmAXATROIJuhX96oKbWa6uIM07y42NpfsOLAhZ.YskSvxs19vvfk1iPGUcScpx6ST8nwNlu
 DCsbzLugn6UWxZvKFAEOTp71MY6sw4BCCc7igOMX78uTy4DPqUXkhhXKVcrzR8G8dTECxJiekdi1
 zq_jLrtI.nvHx5mkNua0l1HZUr8lMAfrwXgM8IF41nEOQub6cVNHqS1cf3Gg2IYcqS0iESn40h5l
 0zZ6ePaPp3V5XC.dZvkq452IhXDMzoRqnVqinNeXrgQtOSxKLjEaUoRHNm1J3wzELyp2RyoFurqo
 ARnbj.1REQEMdZKs2sIWGDDrpeOSgXWdF112PHaVU0yO2GVzfMIKwzSdx.F2ek9JeFLD6Vd6fmGV
 Hnk0QEdvOiddgr9PVsD8z6rpncuJFTl9gCCU_i6lsSnzzv7EhJde_hHvjc.CjM2ZQC6cjX1GRg41
 AMvzI7BMUlYAS0UtLe0h7w8gPp7O0BG9FuY9LMrRTlCIvxnDJVg--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 8d41ffa2-e417-446d-a334-c0d04cd1d495
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Fri, 14 Aug 2026 07:26:12 +0000
Received: from dip67.lsn.ir2.yahoo.com ([87.248.99.76])
          by hello (SMTP) with SMTP ID c517ea445b08c3ce84b6018c1bea12c9;
          Fri, 14 Aug 2026 07:26:09 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 14 Aug 2026 09:26:06 +0200
Subject: [PATCH v2] staging: rtl8723bs: remove stale comment and dead code
 in os_intfs.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-v2-attempt-final-v2-1-cd3a27834b7f@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03NTQ7CIBCG4as0rB1DKf3RlfcwLigdBIOFADaYp
 neX6sblm3zzzEoiBoORnKuVBFxMNG4uwQ4VkVrMdwQzlSaMso4ONYeFgUgJnz6BMrOwwFvOmeq
 asUdKypkPqEz+ktfbr+NrfKBMu7MvVHBPSDqg+KcbCMkOPWvGWOQMOWfwVkjUzk4Y9sdLDTWI0
 4gDbYWk2F7eQjt39JZs2weiArZ5ywAAAA==
X-Change-ID: 20260814-v2-attempt-final-45442f63b7e0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Dan Carpenter <error27@gmail.com>, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692369; l=1363;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=MZFya9JBs8QA/prZPxUj2RL7W+DoNkBpO04flR6/v4E=;
 b=ATkaBJ/qJ4tYsjWgW+Y9ATlfveutMkusdGThKFKnZ8LCbcinlhLx+wQ2zd72N1k9o2vg0/vCY
 JH+b4w14tu0AdYxL1yapeuV+lqssPG6RuNIWhhl57s8NhAkJ4BU5BcE
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260814-v2-attempt-final-v2-1-cd3a27834b7f.ref@yahoo.pl>

Remove the comment referencing an unresolved 'XXX' placeholder
and the commented-out memset() call it describes, rather than
fixing the placeholder in place.

Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- Removed the stale comment and dead commented-out memset() call, per Dan Carpenter review suggestion.
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..e3f0b9c8123a 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -664,9 +664,6 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	spin_lock_init(&padapter->security_key_mutex);
 
-	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
-	/* memset((unsigned char *)&padapter->securitypriv, 0, sizeof (struct security_priv)); */
-
 	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL)
 		goto free_recv_priv;
 

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260814-v2-attempt-final-45442f63b7e0

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

