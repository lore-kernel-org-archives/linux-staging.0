Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C6D3A5459
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 19:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280483; cv=none; b=EPb0Ee+DkMpZPSrnAXF+86oTqkhxPv7K9fPvvxeVBmzKMxwu0SX6efvljVtwkmjb5rzNiBQtyP4IAjXftbu4OM5FrKs5hNwgC5/YO4i3AEa0OOtgX3ZfAVDZf5OTrlqetYev5m8vDT9qlXJWb4TEYkogopc5rYeba6MJQhuzAjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280483; c=relaxed/simple;
	bh=OCsNVf+w7PW5jkH9T0VzU3MYi5Wxwjk0gfKFHah6WG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlGdOGLgBwgudrIifEm63ZxNEObwmHciePDuJM/EMZZOYagJx6ahHcMHSUcXylEYtAcje8LDa8YVMsosAkD6lclODR/vS69ipPNoRp36Goxjwi8G0EswrMGGQzXszAuaPWTJ1aJ7Rsu9u+y5AuA2rg8NqhyYOTKMB5CifxFZ3Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVhvB4ar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1DyePdV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVhvB4ar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1DyePdV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi3kI2343623
	for <linux-staging@lists.linux.dev>; Sun, 5 Jul 2026 19:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVldA6NTRnp
	wPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=PVhvB4arTRaJVhF2SofLv+u1aVD
	jK8zIqELdsOTMECr0irbXF13Py7AAvUWwCcgloBqNe5sydVgobN3ykdNbR62SDhl
	xSdi8gXykZAYDggG/l29V+pDv8vxNl/8bfs3RsFDtihqoBwh9TvV8ccwG6jurLqz
	hXyA3tzVzG/9j/LFOunKeib03MEp2rrcHiuWykXLV2BW7biJwWZULRxuE/380H/W
	jxvEJrmSgF/oSVLpQz6WOjtRFsfVbrSe0a7iY0325hYiJ5tqlT9bhtEQhpDaeG/2
	q5Zdnz1hGEN80AyPY0gPhol8PR+yZE2CguSboTpYR821bg4icMzfKXPz3+g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ba31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 19:41:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2caf4173b1cso41674605ad.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280478; x=1783885278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=Y1DyePdVF0fk5Lu95SHcDL+4eqDWlreRjOEH1E38OQ0Fmyyz9DLGluV9t70ELSxV8E
         bkRvrcTd41MvX+i7N8OH1saBAISRSSaipO0ogD7zqzQlCnOJ09U11/yzht9bO3DbCW9U
         GOnq3cDAZIAXB1M6ZnZJLue48+Py9vsuKUcudABiD0+togFkNUVqZQv89YsXH8F4fuUT
         pAq5WRmLgQv0Cwi0W5rGchQfq8tAR8dcZX1tZ4MxUsDVCqvetj0Q2PVe/LurzxUid+xe
         GYmFfkm80sm4EqPXft1QBgQ/+zZAfXNiJmSeWLHo7lNWjgQZAwlFh6U38xLfA8SQSfn6
         2THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280478; x=1783885278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=N8ahpeTFwX7kgxfbp/IOBes2rKQubeSrMj2ka1SE2MbPg4eEukCkJMJqSkKuK0kJHK
         puAsiWNdOnQyyOy+etvnzq7gXqrn7ro5rmcjwSNQAUTy/LTtZaPdEmyHoZt6hFObKJRt
         twxTTlVeXVMlkrdTArZUYeHS7HJ7Y4HGaaf/qpmYGcnOtEDWRB0Yakne9L8/etBMZh6G
         gwGCTRHewppPN4eSQ6EGrDFZHl66Zqv0N8k5r6YJ9/vJX7sJbhS8LRDj/qJiRYsF5nvc
         pHS23j5H6XQkZsFzj7RBfXQ0QWOohPPIJbaFNjkGWQJ+3R8f2eqt9nr9vjSNh/aSqoPz
         Hp9A==
X-Forwarded-Encrypted: i=1; AHgh+RoOI67K8RBupkTvkgA+K23MtAzLCb5ofIpjdWpVT5AeiAj/Ppe5tAq+mmTnpk94Z3PGse/05G4BfTbXiQF+@lists.linux.dev
X-Gm-Message-State: AOJu0YwBPdAIraNw9HluElaAecxfvozm2M4EE8Dv9VTaZiUz2NoAdsjK
	UcIMoXK+liyijBA3qBZSE+pYFlZBcE0AWrF7ySuiApN36fNVVqXMrMlb/vhU8gp12BAX4FG/tHj
	IUtr2ciontqKDFfuytRVcjcxsUaSCMDJSc4CKxG1CoDhDVHuxGxiu3viVnMfMeBnjFXaE
X-Gm-Gg: AfdE7cm5IgT/HnitPyY/LsVdLZsV0FLfenlj6a4+7t5i8So+h4BnkUV+4YmaKlnc4kh
	3Zhso79goyVER59uNTtSbjdFa0vBmMzKCaJ3QZFQJzjtuPpSaFPZz0KBtv3EeRYyi+/4Kt0faIf
	Ynvn+j6KLwkO15nDPFJ//MCJdMW9SkF7Vn1wYB0tEqk4Aabr3EI0xiCOvvCAaGQn6UiOIe1DcsP
	DWWADwpHQKc4dP1wE/+/tWJGpJBikdkb34nazSa+1Gf7KDYT7a2IQ4f55yaq9gl4QqDk8vENqBU
	X7JIYXdWFryxvmSG3sAzFMEEMwQMf7J1pweWMX3dDYYK5CcqLqmsjr7sqUJkVWcCfz9z1Hi8W7f
	RKhNjfngX9SRsV6GbBzFwf+L9w8ExpC/ze6ay0g==
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79826135ad.34.1783280478038;
        Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79825855ad.34.1783280477546;
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 40/42] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:16 +0530
Message-ID: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzY7OUeDAXzTe
 4Zc/j5eU5VYTgAQhjVh344p7Pt8sk3SUnJU3L4MUVqI1tHC9I+QJGg3mu5dcnX021+Ekutqd5j0
 dYbWXUxKTNO0Z5Cy14VgMZsxleBuz60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX7YfFQMti3Uen
 /dMW2HgSOb6mnVsst5PTl8AbDZ/2yA8dOremQZPhmHtg/8KrX1rac+RgVLZzdXmUIhi7qgScBL6
 jkNXOJWyciPxbriEeQDgGQqdvkmFL5hIy9rMo4DJ0F0NJhGO2EMQ6is+1Ncus3MesBqWouIUZU+
 GY5qxUJEqRGO/EjTiTagkZ4/5TAH1dfKtgjgJij0F8ROaOekqD08wWYhjtEHlWCoIQDzleNqIj4
 LgeAEiQN8RjEtq/GqcDNGFjL6fc6VkPUX2M6ezxlQhVJauYost6tfpq27U+fHpe/tKynVruZNwW
 C9UzqM3J/BbqtwD/IlFXmcAEOCmRRJQDBbYzNHVgaPG/38nOThdHA/i3pijyr4VG6Hfc/gQQ+FR
 QyWt09vDQjaovAZReHYEM2NhaTPYYKKfBc84s67Y+q22TTnw9yqX9rHtYcpdP9CQhmWoghfzG0T
 SfQ3mELQiqLPSmICXwg==
X-Proofpoint-GUID: LO5oeeKxQ6geIRIy_JFb7shTpuYOIOut
X-Proofpoint-ORIG-GUID: LO5oeeKxQ6geIRIy_JFb7shTpuYOIOut
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4ab35e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2vM2yDDFhuSsTauGYd8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..c4e05b0db527 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.53.0

