Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B831AA3D8
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722413770; cv=none; b=Ji0MgQesboyU856AMfME4t7+OTgnpOo2mm9cjTmqSzV3NRgSDGYsC5XZze7erM3u59Cclf8HQbcBtrdHzx2eof3E7l4bI99rKZKAS5nN4Nyla6FzjP3KHaXwG5+mGhTfaE3XjgO/hC8kb7hHCbtxQ6KGS/6nn+f+AEoWIa8OO9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722413770; c=relaxed/simple;
	bh=n74A2QCt6NYHPNKBme5Uq3aA6jZEiN/62h6ft887Pcs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=K4xpPjZTYqYWZn6a04JgsZTjkiXs2b8JT3wSkHfMUAWO/aUdVnwsZPez63jXG4kiJpGav7ohsc8WnHZH7mjMfGpuKaMiKM9/LA4M0LFN653R9klHoXPsFAnQbo281kY1loFIRFcbGoJsVlybRIQDjmtMBLiyFEsSUgno8yihe8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=h4tHc0fK; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="h4tHc0fK"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240731081605epoutp01d62ddf66c8003996a8bef59a6be3e4c3~nPjHDBQcw2968329683epoutp01B
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 08:16:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240731081605epoutp01d62ddf66c8003996a8bef59a6be3e4c3~nPjHDBQcw2968329683epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722413765;
	bh=bXpilxkHJLtKSLHM44wQ/oGvotV8k4D7bFY8DlBfYLo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=h4tHc0fK3la3/AcsvXMb8/MA2dwIc2dFH5F+vQ96Vce/ksvnqXwumKKLMFPn3dO1G
	 GeKnWRZFHqq9/IzR7Jwli3caD6YqWHoQTndTpseYll5Gow8fATTshFiFLVMuZj2chE
	 Oc0uwAxNE4JAU23ynrEIhQfr7zLVr1s77xAptN5E=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240731081605epcas1p19d324d099c3b9b2a0fa64ed15eb314fe~nPjG2YoGC2011920119epcas1p1V;
	Wed, 31 Jul 2024 08:16:05 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.227]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WYlKd0gqXz4x9Q1; Wed, 31 Jul
	2024 08:16:05 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	4E.62.09623.3C2F9A66; Wed, 31 Jul 2024 17:16:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240731081603epcas1p1d140964329ddaf9146bacb6bd1111506~nPjEUBMPF2011920119epcas1p1I;
	Wed, 31 Jul 2024 08:16:03 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240731081602epsmtrp2e4b3a52d27dc70b109744ccb0ab100e8~nPjETGUko2759527595epsmtrp2N;
	Wed, 31 Jul 2024 08:16:02 +0000 (GMT)
X-AuditID: b6c32a36-ef9ff70000002597-17-66a9f2c3971b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	B4.52.19367.2C2F9A66; Wed, 31 Jul 2024 17:16:02 +0900 (KST)
Received: from VDBS1327.vd.sec.samsung.net (unknown [168.219.243.39]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240731081602epsmtip10dbb44e153d7c36e97c97edaf33456fa~nPjEH7ACS0305503055epsmtip1Y;
	Wed, 31 Jul 2024 08:16:02 +0000 (GMT)
From: Manjae Cho <manjae.cho@samsung.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Manjae Cho
	<manjae.cho@samsung.com>
Subject: [PATCH v2] staging: rtl8723bs: Improve clarity of MAR usage
Date: Wed, 31 Jul 2024 17:15:42 +0900
Message-Id: <20240731081540.912533-1-manjae.cho@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDKsWRmVeSWpSXmKPExsWy7bCmvu7hTyvTDFreSFo0L17PZnF51xw2
	iyOfUy1eH7/B5sDisX/uGnaPF5tnMnr0bVnF6PF5k1wAS1S2TUZqYkpqkUJqXnJ+SmZeuq2S
	d3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QRiWFssScUqBQQGJxsZK+nU1RfmlJqkJG
	fnGJrVJqQUpOgVmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsaOrn3sBTc5K7oefGVuYJzP0cXI
	ySEhYCLRtWUnexcjF4eQwA5GiQmvNjBDOJ8YJR7/fsgO57T0nWGBaXlzcTcjiC0ksJNR4tgU
	XoiiX4wSC5qeARVxcLAJaEpMX+sHUiMiICfx5PYfZhCbWSBNYtXV12wgtrCAi8S8Ax1gcRYB
	VYlnz2+xgti8AjYSnU8/Qe2Sl5h56Ts7RFxQ4uTMJywQc+QlmrfOBrtUQmAdu8TGC2cYIRpc
	JM6u2skEYQtLvDq+hR3ClpL4/G4vG4RdLLH0zyaoBTUST1tnQNnGEj/PfWIGuZ8Z6P71u/Qh
	dvFJvPvawwoSlhDglehoE4KoVpE4v2oDE0RYSqLhoCFE2EPiTPMmZkjoxErs63zMPIFRbhaS
	B2YheWAWwq4FjMyrGMVSC4pz01OLDQuM4NGYnJ+7iRGczLTMdjBOevtB7xAjEwfjIUYJDmYl
	EV6hkyvThHhTEiurUovy44tKc1KLDzGaAoN0IrOUaHI+MJ3mlcQbmlgamJgZmVgYWxqbKYnz
	nrlSliokkJ5YkpqdmlqQWgTTx8TBKdXAZCxTnWddF564WHhxuXG85I7SE21yzx1qF707cq+Q
	d2bcQu6yNwartGY2feFqmV2WfV+cnWdRYRnnmu8Lg7Wibp6QZr16fXNf0oWvphOPslv63Or+
	FFt+4ZTMuaQ1eY9bTi3ZuLT6omL1Pe7gp8E6nJebI35f8Og6LZzz7VTJg38NazQcPPW+7pfn
	fPfYRkOzblLqNzHvDWsTzGXY5i2TtJ13Of7s7O2ueWeEgw0ic55FLsnQOvbYbGl5ue7ZFwWi
	uemJ0oZqb4KkYmSq+MI9VkydrPhtetmE97efP2l74OCsETBL90xtQ9ntypK09ECXa9z1OrOv
	3jt34lL9gZycxRtiDA5k8k0yv/mlSW6PEktxRqKhFnNRcSIA1h0H7e8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMLMWRmVeSWpSXmKPExsWy7bCSnO6hTyvTDGa2WVg0L17PZnF51xw2
	iyOfUy1eH7/B5sDisX/uGnaPF5tnMnr0bVnF6PF5k1wASxSXTUpqTmZZapG+XQJXxo6ufewF
	Nzkruh58ZW5gnM/RxcjJISFgIvHm4m7GLkYuDiGB7YwSp0/+Z4JISEncb2ti7mLkALKFJQ4f
	LgYJCwn8YJQ4+zcIJMwmoCkxfa0fSFhEQE7iye0/zCA2s0CGxLcvZ9hAbGEBF4l5BzrA4iwC
	qhLPnt9iBbF5BWwkOp9+YoHYJC8x89J3doi4oMTJmU9YIObISzRvnc08gZFvFpLULCSpBYxM
	qxhFUwuKc9NzkwsM9YoTc4tL89L1kvNzNzGCw00raAfjsvV/9Q4xMnEwHmKU4GBWEuEVOrky
	TYg3JbGyKrUoP76oNCe1+BCjNAeLkjivck5nipBAemJJanZqakFqEUyWiYNTqoHJcsalzfbT
	o1Jd/3L+/e6V/fTmZbP4Wxw+yR/5Ck853TG1u1Wj/DrKcfeiJ3aT3a031DyXYD17epJBOZPf
	qpMMXU/+m7Ua7eL+fZrn3eSTkzpqy0ruNs0oOPXhudfL5ewlr6IYGA6KeDbOjk560qx9+eJX
	r1rn6+9YdrBqtfdZcH2zXnvl8k326eG/tpbdlBSIn+ISVPjvpLmdeauSgh+zsfBx/VnxERPe
	XA42vvHr3O/1s8ITjMWb3kX+ePzN/dJ8iR/zCl41vO3eXvwr8uKs/s3/Tlx+0FTAYrXO5JT1
	9oNK9xRmzRK13f3Q7YZElI7K+8WBdsev9Yg+4volJTC5ZP6B7cf+J29UX8B0cc29IiWW4oxE
	Qy3mouJEANlmQl6mAgAA
X-CMS-MailID: 20240731081603epcas1p1d140964329ddaf9146bacb6bd1111506
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240731081603epcas1p1d140964329ddaf9146bacb6bd1111506
References: <CGME20240731081603epcas1p1d140964329ddaf9146bacb6bd1111506@epcas1p1.samsung.com>

This patch improves the readability of the code related to the Multicast
Address Register (REG_MAR) in the rtl8723bs driver. It adds comments to
clarify the purpose and offset of the register, making the code more
self-documenting without introducing new macros.

Signed-off-by: Manjae Cho <manjae.cho@samsung.com>
---

v2: Add comments for clarity instead of new macros

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index c9cd6578f7f8..535cd439121d 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -380,8 +380,8 @@ static void _InitWMACSetting(struct adapter *padapter)
 	rtw_write32(padapter, REG_RCR, pHalData->ReceiveConfig);
 
 	/*  Accept all multicast address */
-	rtw_write32(padapter, REG_MAR, 0xFFFFFFFF);
-	rtw_write32(padapter, REG_MAR + 4, 0xFFFFFFFF);
+	rtw_write32(padapter, REG_MAR, 0xFFFFFFFF);	/* Offset 0x0620-0x0623 */
+	rtw_write32(padapter, REG_MAR + 4, 0xFFFFFFFF);	/* Offset 0x0624-0x0627 */
 
 	/*  Accept all data frames */
 	value16 = 0xFFFF;
-- 
2.25.1

