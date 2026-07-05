Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44773A1A23
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280443; cv=none; b=kuL1KaGZ0ScD7HYewPhZL8BIffebl4iX5rOyIKN+cqCJ5vf67WRVB5tUlRvCApdDxd7FtA7/dztfRvV17COErxB7KHvIl131iT9WFDrzfueplDgdp9JoD4SG7NGISpkVOOkSsSO/A8kXqYJ6nE5Qtz1qajZ5EMqMVxU59y9qpWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280443; c=relaxed/simple;
	bh=gFgKgEu5qajbHpLEFwwgM/A3QPsBxXRqQi+CF+ZFu9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ru7X8nwNVg7ATlJPMnY2RUXwyU8VaifJyGw/0VFxu9S3NufS5gKATz1D5UJ+lcPpKKZrCAOF0+ZNOEO2h1ZuNkMKzOkm7rB9sSdZr+UM8tSi+Q8RZnnfDNjxHpYsxQFHH6+uc+W4lJU1gliZmzR5KNCIqxTZlyK1esZT/xaltn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbBSGLsA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGFta8vd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbBSGLsA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGFta8vd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiqUu2344115
	for <linux-staging@lists.linux.dev>; Sun, 5 Jul 2026 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WZiFjnWLtnN
	smK5dA/42zGQp+sVNdR8iWt1Gg293cw0=; b=BbBSGLsAqnWOATGTpRNCO1gHtgn
	+/zw/8wXZTNlV0J3BkwSreM5wcmTjEIf/OTa3q53G3k+GmVKk2WvAcGb1Ew8Q+8E
	QrpYExNDDivaknI9UzYxo3JTDkbOWqzrVRq+0pWix+SzBwl+OC9alMamMCk86nPx
	bmTcN5MVq2c1dhjwDSCMvlPP+5gNlCOpgfXdThV6SMKQM+0ZTQPkQ4Udmvt+mimB
	/CiyDPPnOPppMy7keT4n98UkPZmn2g6GcpUmf3hrAlfVAqeyUVB9oeO42PhzzgZB
	p0LNoVgtCvusL9jOPJlKPYe4pVrl4XUBs3oqCO5q6awivbcuGKDA559+r1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvkbuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 19:40:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cac01e89e3so27436445ad.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280440; x=1783885240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=FGFta8vd/asWjX/DKIIkkoWrpijQEQ0c/ouymq83I3IwzNsJ23xWwLRg2oR/ZC/of2
         xtUfH75SowTjkGkyBivmnQogSTlx+otYB2mkWdX5Zw3X0CSrCBmhCtB+KUhwzIR/gDkd
         o4WRHoMbdTWq1rEYjgDWu0yJVFt3r1EvqiZMZFhvaEyl9d+cazwEVrl0j4YqQcJJYhGS
         P9wtIEZ+5nKTJZHlrKGp7NPhjdJCMXqbQVN5KIwy3H80ZLqulIhcNR7oWIg6HE1IGtgm
         bOcHm9fPeU1eMtEyBkEhc3oF9uPtXX9bqyznIGeoxvjce28lEs3LPXxk3Vvq+FPbJ8wL
         onyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280440; x=1783885240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=GpA8aQhKh+z9f9yzki6TVYSvMQ5/TMsRwvhaK/AiiKvzF4PbJ/emb+J+rtK6fYnUlB
         EyOFAJ99RfZY4GaLkHAkmlkbUNMO6pw94qjyBamSaYjisT/eP5g1pCWLPaPrIjDKGzc3
         /GZsuXtPDx3q02RPf5xsXfZLRJ18qkldjXz0tvx1Swe+mjpg9XfXaKNxR7jpRYseEYAV
         3/AJH9ZssOa3yhd0Pe43F6Azt/xbYNUr+VyActJLQTNauTNRAzNx+CsSuE7k7Dpb4FjX
         BKZtIvqhZrKpKg/+0Z2juy761HRVuS8p14K+fZdpN5stg8THyoDG5eorfRW67/1W4+gQ
         qM/A==
X-Forwarded-Encrypted: i=1; AHgh+RrslUOrglHS+6Fgg/YLsecPot2xRytA4PyWwaJ6RGf0IkJMoDtC338LGSZoi4ijppPzKAiQhAl8szz7gCAH@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+FPwswdck/+DQixjekt6P455F5QA1MeJYo1lmDRplTiIoe5BO
	Q6D3cl7QJt1XS6pK0p6WkFjLszNE+D+ku4FwTpv64NJstLN0qUlHv+Gj70pKtQxNIVs1EmHdjQG
	Ce3MaL03hR58f5M4zEqLO5iavsZqFJ3ecBtuDVwxoxRkCHWrKKXZdL1OMUl+/Vc01dkcv
X-Gm-Gg: AfdE7cn5KsGd/rjM5cG7ks+6uQgYP7YKOBx0Gpjr2YTGOwJv0WVRIDAJ1EEMhRYbDk4
	n6WjOA/ic+lygTcW1/U4bXGM1OaQ2b9fOY8FSFxEjcCj4JbF2KcUEudLfL5jd25TnkdITHAFj9e
	SHyPioUY45V6sWyJCbt6YettLxL63rVyHY+ehq2YtCPnyDPjDi+3QSICCOLpsppCzCehHSwyx0H
	1mwX/Mny+WbGCeMVhdfyemcCLGh4sZI7llXecMLQuKSxZuemw+iyKj4/zr5Ot3REnWkiee/6NCN
	/KXkPPIamVoB46k7g9MAjUqLPH0kPHQL/aG+UkU3/sPXYnoARSLKuBBubTgDtQVmlMum+2J+vcy
	4Amb3dsWGBVqS09cHdWfEvApDH8vu76y0Niq6EA==
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116872235ad.17.1783280439588;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116871975ad.17.1783280439045;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:38 -0700 (PDT)
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
Subject: [PATCH 34/42] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:10 +0530
Message-ID: <20260705194019.2565498-2-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4ab338 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: uq6kO3MfM6raffmS9-iZpgz5Frp29M0y
X-Proofpoint-GUID: uq6kO3MfM6raffmS9-iZpgz5Frp29M0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXxFNZf18IMNiV
 FaPGfkcxQdwNXaUEHdRpx+Ih6VpF+UwrGmh11YIcdry+p4E/4DMyxOvW8COHu2Y3h6LuIYCr7zQ
 oap9BALlTnVU3DrUJP1ATVYqwYdZ7Av8nlTJ/c0buGFUw9HWIC/zKbIxgosjXRm6UzmmMSB/+hd
 kqXCVN77/zL3ZEnEqHtmO74cPfTT+8TnkUJZ7TxD4QKE1P4ciW2udZl2skI1kDbgyN1ucQwhBZp
 69eyO4jWXMIqIkRcS4pLRhVqaCa17JzhQdPNP3iMVUJ/2fOkeYrdxtjJ1gCQ9SDYN7nuz96v3Zh
 QVsQnl6NCPLRoi2vFu7w6iy9dV+ll+2rYqFgsSDZ0iVH5y2wFXHlaOtwVDPAF4pQXuJZjQnIILG
 vYCR2Qvm3m+2/BEOAIcOvlGNyD1QwDouDefo5Hk439t8sqA/Zlmfc7cuFPFnEMJICk27Yp4AnmC
 xFCy12SavJ5jpTvD/AQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/1SvGXX0tQJV
 iayt6Lt0eRT0c2dvXHz+YBYFrdVy5IP0ak5x6IUSsrHnnvmVY96GW3s1cDvBTCGZyYqAcfvKSNk
 /jLikNjOznufjPOURZ2i7cWsctx2OiM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0

