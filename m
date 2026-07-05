Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DEC3A2544
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280474; cv=none; b=MO/5KcqWM8cBi99ziZNZ33UIArtbMNkml7Vp69IKrEn8lIItjfYNTAAnqjRqF0Suoj4rhUzr3eRcmVroZS76zYQV5MEOivER66zvs3D/Y2mE3mGKUfqYksE+TqfkmNvOtiV8WEzI37bRwoHD1jDS0IqSidg/J7M2/b9Xg+FHH28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280474; c=relaxed/simple;
	bh=c84j3cN4itWiI6muK0J93G40mdQrPz9ghprJZVQe+x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOp86KWa8yiu46Z4r2QzgQtnDqyA63ZbyYBgBhQtyObM3nABn0FE65JxhQD1GBMsl6GdmGvxXZt8BjUO85SimD6Xn0F8HLbZwV1CFqkvwDGgSSNulJlR7RX1QPAdVmGVoj/sx7SX8x4fv/KnDpn0VHNmO0oYIH0nAeYs3NTnPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ct1DBvNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFNcA2lD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ct1DBvNs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFNcA2lD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhZC22351641
	for <linux-staging@lists.linux.dev>; Sun, 5 Jul 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SRfBxbqW9Wo
	vwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=Ct1DBvNsXtjXHhkOELxVhlpg6H2
	368Ld+75DkSj9KAbDdr+dccgJj5ELmVwXoWTwLRHuHRoMLG38NZA0i/dYf4N1Wwc
	GWDVGhaX3gkzJ/KUCjenkhf61SCvn7auxPGY1ifqGqoeJGMpHLM7TwdqAnd1zKxe
	XDmUTqO6867KN13WAC/hp1ycv49MufxZfENMTnh8m78LYIQT7d23L1S4XHIN449b
	smnhxYrxjaGQqsh6wd2AOVf/dnd9Fv/6+cSQqRdhbmEolxNJN1SJpi8Ey2Pa0lIw
	zunl7f6VOFaCAF/wwQuLKChNn1SjxkzDZMRnVULom/ITViFNtbylQf31vYA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sudvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 19:41:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso3610601a12.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280472; x=1783885272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=WFNcA2lDZ9+PcA4RoSB0MbPItSKx4EFPamzoYIslji59gGvCgJF8JfcS9A1ONQfb1w
         ZLWb1rO2a5cNyyiTT/k0F24tou+concXBGXYbs1GJAXJVu4q5FVJdPYjnz2EgUx3k/Pm
         jXqMBWDf0zRsgHdu75vSJhjdPCG2upadfqSCYcGq5vKXV0cKp3k9NQtjnxffnhkNgXKp
         R8dpnUO+i1PdDyZiEAd/xQVBohbotXUZpGYGOyI0UwPnF7c9ZFnoUnvKxV2vJO/YxcUE
         atAbH2rMVwwiN2zcaw9JbJwQbP9Sce+UxsDhINoYAdv7GvfviIEH6qnzy6r7f3a5Ojoa
         rP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280472; x=1783885272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=U5wK1fvl7ZpzJweQ07T3PSeRFw5xIw4jqKugFTHtcXyI0rc6bZWurywrTi1EsGhqcx
         PosOfhkNwsgi6zWQDe1o7lzMCxbUNVpTJPyCJ/tDFn5n57pyGYr121WMuixTJr03anIE
         Rb2YDRreMI1POmokfJ284wPAAoaybRxeCjLgy6jZ/rpQNR0r41JxLbWwNUUDm9EUDPk1
         CQiUB93DY2SHR76V8RjlKdJorzZik4QsWxJfRjnqIOK3x3OfuWLTBZ1aREIQkyJHMtXg
         awzGRyzJCks+Ets77EE3PbVzvY44YF7x4I9/jlKbCZlka2hD/5J9kdrb6regcfwaB983
         Nszw==
X-Forwarded-Encrypted: i=1; AHgh+RokaGQd+wu5TuwJIqPvOs2Th9oeF/zCAxMnKqlvTxs7n/BILXRLB80yjHeRDQMyrqS2fdJIq9EA80M/gXOc@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8JRux/I67GeAfQtablV1xGQRaab1DxEY4DAblfXM9tXBpuHIW
	ywufJmLmCP9NQC9tOFVyCqdHSQZpVJgGAJ1zq28w+cJri2/V0cy8dFpYEDhZy+yVec9wc6CJAoO
	20EfgBxrdJxMbQ4sAkQ5y2xZbRiGz7+Oe1JVU/i+dLYivfAgN7xSVQ7bfd2s8BLaHp1RE
X-Gm-Gg: AfdE7cnZQmZCaRlX4gfuqkr7yzu5/CdhXb74TavpGCPI1CqhKhi/sI52kUV/TOgB27Z
	LG3Jbg38DqPDswGOOC8gD9cWywKHvC2YQ+UeueyaBkMvYRGqwTFdA83tHfi7eSlbBICF4Ef10iv
	8wyvHzOZX/laOMcReWjhg7QT5Q+xWT92LKMdJenntMlntSVkrbjTodmnfysu0orUioBlOjfvGzO
	0Po/ZxNhphm+HjzLrmBvDZC2QOcufJsToLtIm1d37bsiYniLZHOfkP0maTQy14S8J/Seg5ecW/6
	7LsuQwvQh+JGqpqQlqm5g1YcIzZYNLkQw0IlVKe9FIdw8j/8FbzTnYUtAcI/fsOwVmEc3bBk8Ol
	VrrzrvUJRbcdBlN85sExsHJuzNdhhE/MKM6hhTg==
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605452637.10.1783280471651;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605425637.10.1783280471121;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:10 -0700 (PDT)
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
Subject: [PATCH 39/42] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:15 +0530
Message-ID: <20260705194019.2565498-7-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/5Zb714c2NmF
 QXkP62+5bGt6DoBvrZKaV6zMGbe5L41fPnOBjjZ/l0P8r8hfHo7Ac4AM4CZIn3bREn/sRhzZNgg
 Fgb5mV9WxGaYq5JD7w47j2AmRiFRV58=
X-Proofpoint-ORIG-GUID: AVZwnPKnS1H1ZyJg11Uu5ntfz3_xAlTf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6OuJQTfxBlwb
 owL6ktOiEGCIOlt+cZtMh6CUBSpMP3j7Rf2qP95B4HNU42/EZ7QEbOZmqO9oERKLdw+puWRI/F3
 pZzSYn5JqWnTLvykcovK49htdR5fvC/qW1ivdy4T6lUyJaZenSSIVmNjRAD399XoLtolgYVIR6m
 bAMSei+XjcXQWiiuwEfZCLX/vgdM0VQNbPR5kNEIfIgcN1+y9PR06nTpG7MM1dvBQKYTa/IjnlN
 E2t1g1ZcoK5lLXRHMtuaxzBzVpinah5X7B8LlWmrwkvG4cy9T7YRa3E4OZwmpk/xgpWAifN2YDA
 xQH6Rba934W/Ku4G6IzI4CjxbUQlvK+EmbNuxrJ3UpSnEg/4rRA4koTsPwkYcVifGvXKxdJnIku
 YFHE6SHG8g2YjX1+kCWTWIOn8VSfGGu75psfq4g5VwJmsXYX5h6/McFvGwZLnL13SdL+e/d+rFK
 B5VjqxBlTK3P1WvshQQ==
X-Proofpoint-GUID: AVZwnPKnS1H1ZyJg11Uu5ntfz3_xAlTf
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4ab358 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0

