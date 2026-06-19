Received: from v57.v51e342bd.use4.send.mailgun.net (v57.v51e342bd.use4.send.mailgun.net [69.72.42.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5EE337BAB
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 20:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.72.42.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781900203; cv=none; b=PAVM7T8I3YzPwi/6AP3YRVA1Xvb/XpWZ/2kpMqILfJSOSdFNDqpDkxr734hEHtqcdXDN9WOn99NMlMCgBp5Upzw/ynZtEBpIr7pfKo8TmqWq0raM/z2flH4VbE69pjZ/mSNYCtkwzdkA4iVkbKrx4hQHDH2LkrttAfQ+GKSaPnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781900203; c=relaxed/simple;
	bh=eOrSbza63x8riad3qQMQZWfSiWPdejumnRC8AjhofNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPhWmPHITU7xvNdfTWwLJGgkhFP7My/rl7s4/zAwUDhiW/EWjYgzD6PfKnqXCyAvoPlyRC5fbcUKFG9LOgDf0MckPznohSaq1tjbv8ArgTjTI+pPTEEzMpLJM3QE7jJC2ygY+aRL4rfnEdpOObPy0sJ3bdtuTgXNoSjOuFtSkiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kylejin.com; spf=pass smtp.mailfrom=kylejin.com; dkim=pass (1024-bit key) header.d=kylejin.com header.i=@kylejin.com header.b=EkaaeKZB; arc=none smtp.client-ip=69.72.42.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kylejin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylejin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kylejin.com header.i=@kylejin.com header.b="EkaaeKZB"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=kylejin.com; q=dns/txt; s=pic; t=1781900200; x=1781907400;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=4fPqtYYpyHoh6C2443VNIh6A9JHPjRXK6ctvmGjsirI=;
 b=EkaaeKZBwAjl2isLW1EdSUKfG0MWs0Dx3WY8qpjhK07EsDahUvpkhyvsY3uBBVVOZZiTz4h/xWhRn8Cb39bVGUvBtjsgccjtAzd+vX7QlrQc2YgH+8+18bzqvmYvx4Q7cjHPcc3Gmgvq4E/IVhNddp29iDPXkh1BJ+Yn8jFKcJs=
X-Mailgun-Sid: WyIzZGNmMCIsImxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2IiwiZmYyZGE4ZSJd
Received: from ampere-a1.vcn05022301.oraclevcn.com (unknown [147.224.12.124]) by
 e3d870b472b01418d57d40ffe2a2b89346762891e9115f87a6bcaf4a979c433f with SMTP id
 6a35a3a8fa77e0ad65f3b0dd (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 19 Jun 2026 20:16:40 GMT
X-Mailgun-Sending-Ip: 69.72.42.7
Sender: kj@kylejin.com
From: Kai Cheng Jin <kj@kylejin.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Kai Cheng Jin <kj@kylejin.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: remove extra blank lines in rtl8723b_cmd.c
Date: Fri, 19 Jun 2026 13:16:00 -0700
Message-ID: <20260619201600.973619-3-kj@kylejin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619201600.973619-1-kj@kylejin.com>
References: <ajT4n4p7CKiApCPF@stanley.mountain>
 <20260619201600.973619-1-kj@kylejin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines before closing braces,
as reported by checkpatch.pl.

Signed-off-by: Kai Cheng Jin <kj@kylejin.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index b4e43c3b7718..6589d0a20122 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -180,7 +180,6 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 		return;
 
 	*pLength = pktlen;
-
 }
 
 static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
@@ -408,12 +407,10 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 				/* reset adaptive_early_32k cnt */
 				pmlmeext->bcn_delay_cnt[i] = 0;
 				pmlmeext->bcn_delay_ratio[i] = 0;
-
 			}
 
 			pmlmeext->bcn_cnt = 0;
 			pmlmeext->adaptive_tsf_done = true;
-
 		}
 
 /* offload to FW if fw version > v15.10
@@ -423,7 +420,6 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
 			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
 */
-
 	}
 
 	hal_btcoex_RecordPwrMode(padapter, u1H2CPwrModeParm, H2C_PWRMODE_LEN);
@@ -450,7 +446,6 @@ void rtl8723b_set_FwPsTuneParam_cmd(struct adapter *padapter)
 
 void rtl8723b_set_FwPwrModeInIPS_cmd(struct adapter *padapter, u8 cmd_param)
 {
-
 	FillH2CCmd8723B(padapter, H2C_8723B_FWLPS_IN_IPS_, 1, &cmd_param);
 }
 
-- 
2.54.0

