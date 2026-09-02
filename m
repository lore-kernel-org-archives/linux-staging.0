Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853313B3BF5
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379647; cv=none; b=Vnxic3BWYmE7hoI16jedoo7D9rvVJko0XfWQ2kOjTF3KnpClfzF5AoQAai0jc/k7kngu/6RtxT3dSB4AbnxfnbddIl40uzgD+6o2GYCqkXiao7Wgo/eedasLcCVZMUGGNDsQBlEkMw88xhxyTSaZNDVcQTkcJxObOE60kM7fXTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379647; c=relaxed/simple;
	bh=+JRsAXUkPd/zCxfFhAsZWhnWtV5dxWny5nzrwbSSkXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZSDb9DLyB9ZFwBEbVI3cBaR1PFVuWBwW6dQ5opelKfqsFaVksJjSk0JbqThGsICImNjDoWBXN6x4Goync/eNP83SNpFZ+IOm6smsT1p+uT9pB5gPVut/WYGmL1HpzYNHwAb+UmvnCaA1SPzfhvnK3GoDg1TA8ZY/0iCcmGrnyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8qTZHJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dyg9UUqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8qTZHJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dyg9UUqa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqr9u2209135
	for <linux-staging@lists.linux.dev>; Wed, 2 Sep 2026 20:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOgl
	gLUq3iAA=; b=o8qTZHJ9wPF3L6nko83fbw4RSA3+laqGNZFT6uDbpl+YVhbI4Bh
	AiRHxzRb6pGr6xp1CtxCYePGu78jL9tipjO+GqINkNKz9aKmqQETyzIoUWGhomIb
	iHj2NQn7DXHMQGBwbiTG3w8x6S+gXIGWDSIGmvst6TY1qfC9HSx2tamypr9XuoZ4
	uxtI+2HSG/JmVkElTyVouC3zK8UcSsL79XGYNVGgsHptK9GY2nADRzhKHoajUrxa
	+OkIh/NIGe1kQa57LP0JOI/jkm6d3OdjCGYpl6KGAT0xozaNsl2RXZKAkvZlr6Op
	jeOzEpXx21MYBqscJHxbUbwqhNyliYP0sag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s3jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 20:07:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1951902a91.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379643; x=1788984443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=Dyg9UUqaaPjIUta4M9/FGNg/RSIiRE/aTC7fIne2hzpn281DLafzc8h1ADpOi+JhWx
         K9ArAue1114A5igHI1fvfQGOUGegKDXU0z9N9RmdUkdHlvQYcwrt86rWvrxpWFEz3j+2
         xCZx4KWPqnA0plLfcTEYpfr7z/oRuYXwHCciH06Vfe/80VhUcfIIFXFnaF2xBZ2arSEN
         +mMfj6GReYWeU/NDKtZU1FLEIWOr0XPix5vYF4ekWQsds/ZRFL48l7UFEOkoZdPi09VG
         VthGibORae0xNCa6/i03/j0oD69sL7RoD0lOTB20AzVaCnhFMrqMUlUTfGq+tGhJ+HXO
         /XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379643; x=1788984443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=OrlLawpFITR/0i/491S0ZX6G/d9o2PzyXVevo7KII+s/H786Zd5rcKJHdhb5hbudfW
         5xJwAJmw33o42Peuj4/GMdgFno8FYayfBsE5dKx6I9NwK9h+uVfF8GcQr1ASGG0R7MsM
         C2v9eYCDHFmc4WBYtaEtsKpsT+Whla3ndnbSRnKvFBbwXcSKuzaN5DyU8w35gJlzDuk3
         uiV9OKzLlGx6JXr0v3sQokH56kOEiHM8nKfquVUs/zRkhxKIP5cTwvj5fRx9Put0On1H
         riut39yDe78wP1M2b7SjdAFHrdZ/2AW0Afrgd8EUe4giOOU0t6bqFyz8Qw1ZxIVWvxsT
         phcw==
X-Forwarded-Encrypted: i=1; AKwUvByZ1usQyN1xJS06OOQCMNZm4DXgnzf8sZuyO1IcD606ZPOBGLwvALCyVY1igMV683aMUtxjsu+mjRYBdkJL@lists.linux.dev
X-Gm-Message-State: AFuF++kVXdUYMW24PWa9R/ZuMaHP6/Wpf0TSU6cB4dMk1PdSfMiftfpA
	9sy4IgYEHGzUDhrqsVgviLIoIOQa+gJVjSuB4EivqxIgRaGPlrUeXRfnqAjvqKfXDuePdeKkUzT
	aRC1BYNX3KlTo1n8hPzRzXf2lzHtLnQiKajcCC/kNuxBoQiRYCW9W+uq/gXNakZThiNlG
X-Gm-Gg: AYBFou3r5hjw0PVxLDKNFg0BVQTbgkuNEVJXUKYbhhy6RQ9z1gS2zIOFWvq/X1QVffS
	GiJYNBhIT5pHBhEghASF6a1tnHJZErHE6hvHfbCR2/DK0S70I2niiIEM/cVNcYb69PO3wkMMr/T
	AVB01pVT0tiOTH8BjrR79MfzS7cdb78VZbeKWMt01G9MBMQruDVjgWs5rzwkzRNtMTi6cbcfEf1
	cAIqu5Xh8kEafavylY/mUGh0eekMzeT7LJRjUJf93o2FmSSQz9ek1ofIBSM2W9gZxYqjCk4LKwx
	IpSENBJmh22/Q63cyysZJlEX8PPASQkbxDRNCbqLihI6J4PqvdOoVhwPEVJyAME0tc+jIdxhm8c
	IafwyuHghPESdsU6LpdPNH+nkoUY=
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604315a91.4.1788379643366;
        Wed, 02 Sep 2026 13:07:23 -0700 (PDT)
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604229a91.4.1788379642783;
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:57 +0530
Message-ID: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a9881fc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5ojLyFQZJBwMi_iZTBgA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ijcpzrENfy4-Uf9ahEXh_zRjY8FgqACd
X-Proofpoint-ORIG-GUID: ijcpzrENfy4-Uf9ahEXh_zRjY8FgqACd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX8u0BwiYbmzjS
 9CFAPW31AxqIGXQBK+TP6DD4CkpdfzOjn2V/XY0fOY0QzysFpAQd85XpKDG7XaWba2jTRrQetdt
 UHagFulmAAe4+mCqN4mS47h1hFNF4L1nTAdpKvp7vLro7Oc5gv06W8Aqc56ioMlHr25QRRKJ6cv
 MBCtM1RsGZFaOlro9zWRb81gxWfeuo2CS1D9c+SBTzSkzxpwddtvykcUcGwomq5Ud/2cPw/zHs1
 IPo5bwgXAmKOjyZ54wnS/SnflfONgbXpWWDbgTxWGk22KOyIN+cXYAHoyO4CkzCLnYloK8hHAKH
 Gq/VK8ItO9LGmpraVmnibehgrnx1NPbEkDil8uGNEF627n8f6MtYRQSJbidJsi22pWF13tUm5Og
 FeIACCM3vOu3Yfe7JXwospJwcANjIOuDxkapUgi07gbhOzFF0ZZIGBKeYR180aMH36Jxh8xkoEF
 DpP/zlpJ3oeKHFonwRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX9SCnOBl3ZSx1
 Gh7xUKO6LKW1+gIO96RNNCD03X0xtHIWLn0Mo6qO53pmjFRYXaRwsAAVcq4do+fCt7v1hOe9SqT
 aWqXcWuCGjoHEyzOzCItEpqb8X251Yk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Several media drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. Drivers that fail to release on every error path between the two
calls leak the reserved memory region until the driver is unloaded.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
media drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (6):
  media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
  media: aspeed: Use devm_of_reserved_mem_device_init()
  media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
  media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
  media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
  staging: media: cedrus: Use devm_of_reserved_mem_device_init()

 .../media/platform/arm/mali-c55/mali-c55-core.c  | 12 +++---------
 drivers/media/platform/aspeed/aspeed-video.c     | 12 ++++--------
 drivers/media/platform/mediatek/vpu/mtk_vpu.c    |  3 +--
 drivers/media/platform/nuvoton/npcm-video.c      |  9 ++-------
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c   |  9 ++-------
 6 files changed, 14 insertions(+), 47 deletions(-)

-- 
2.55.0

