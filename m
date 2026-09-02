Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFC13B42C7
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379677; cv=none; b=o4wyJulOKuHTGPVPbma1RT8yrFk/jR/jLsNR0i0zBqeFOwBh+jJGk263BsaYqw61Zfnot+r7VhabuBSz/3Uv2+y3CvbkORI0GxrqEbNDBPbxf9GvH49Ad2BKTkXG5Z0gsheA9V3nxWGEWA7yJqCzbusvoKRGvZ3b6QGmO83X2N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379677; c=relaxed/simple;
	bh=QGQ6whxqf+OX3FYh6lKdjsPxftUzslebmpalWNd/V/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcClFmikwDGyhViXcC2eclEiA8FJ0Nyye4do/QOfxMvmyj1HZSS4OOemwtFjVzKm8tLgR77Xjip+qczFQoIoxiKKPOwEFjWNAQKljdENXYbm6JYw2iAsBBRP1SXKOBkVei7Uq1bsHjTT1KvKN8MVoI0n7evUoQTevYrr7yTC354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkLi7WnJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSYTWB+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkLi7WnJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSYTWB+r"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtMm1071900
	for <linux-staging@lists.linux.dev>; Wed, 2 Sep 2026 20:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nNFPGVLFvx/
	AoejV7EuP46spvaHGIWdJXEE92/o9lnU=; b=RkLi7WnJT32eVWIHPuqGyOBqrKx
	lRcdCPBgHIjmgPf3yvBqtGbaQixnj6ftcYW0RJFHwL1GxlPgt8fDs7l5XahvDSXv
	GBzLzbnu6xQhFr9WEDKDxSv5ov5rp0a2WbO3TpWzXL2SluF/ACdKwDJ//vR0sczS
	dlp7itw01lxD0F0CYFvVxThG3wBhuSnbxhVD3HCV9DzZZwH9kFX9l0w2JiCQUvOh
	9B5OowQg2lXl+5sIheMW/+4e3m8E4zXF/O5piBworS15amrwo81Cl99TqwmFfXPT
	UxdW7ISqBefM7BMGUp2qga0M4hsnsK05gBLNm3AWfehEX8FVad/Q6GKSY9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja1s0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 20:07:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so25688925ad.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379674; x=1788984474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=bSYTWB+rblEuLKsmmWV+GaX1eHfoUb6cyZJXArqsGk9C66+T94BQ94RnYGOqLPiHfd
         6fhmAdWAHzguJspOIxU+eos9Kq/d2XHMLQ1S6RVH1uJhL1hk6UR3T3IsjihhoS6KeK1w
         2KujLOdiyL1PoQKFm8ad/G20CmB1YFMhg8cmdBMWYj1WxiMsdFFDsN5KFR5CCylZu9IK
         fRIKsYEaQy9hiivjRRBLd+Al0/I0MJfiMniJ0f+BRgh6C0EKvRUEKW4yO974HaOBZ1LK
         npRgtyzG3dUoiEC7XLxqvWwAcq5cCYlp5eHqJz3oPNNkirf2rgDg2odaOBEDN1vcSuCI
         2GRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379674; x=1788984474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=q46WsmMtfT9kqRGO01+4UBAHO4P7vPJyXHZgzRspYAl53lManoDaE+Jk+YnF1TBMkQ
         cRWU/RXLCcwxoNHaRuMW/w3iE+KanS6JTTiyQGCpPvJ0TXxgWPXJxH22crupxH6vmx/0
         fNeYjy7qiyh//z1tSKzb3xe9sUhWAUP8C5qacimQL9mAKjllN8gYM+eZOlQbEJ+Fz3pS
         VFfi6NTWvElZnwf62E7tB9sLr7vnNBJ63Vz9wDOhwPRRclldtMiueo51bFiMpl5v30X5
         Taiuk2p6Gavd8/iDwU3R+r/iPdgZqLCyORZG0Ly7/c2ISAENoUEqRYNfNfrVoWkAbfdd
         HaBA==
X-Forwarded-Encrypted: i=1; AKwUvBxI5v60IbTlUhfavPpiUu7TbRW8wKCDPMUrk54kBKCBotf7ux+ivRjUQ42oCd7NHJP7DeXyWMwBldimPCpf@lists.linux.dev
X-Gm-Message-State: AFuF++lFTzBQZFWdw24ww+Se3Ji+cwhEMDdqPsfe8jsB1NOR5qbd9bTa
	m0pB4O2Aay68cvZOTJOcUKJN02c6U7syFa905ie4iQpRqjk+N7LDRywH0OGOGG3CV0O7GtubboA
	NqugAdP0AKRoCoJ01JaDx80oa5t26ltC9hjsocYnYcK+fhJFhXRFYRZ4Y8mLbi/wlxyCP
X-Gm-Gg: AYBFou1/m6xkfwP86+eXcnf2X5nT6aYgvwsII8RZDiAK4A35QiLXj0SsUwxvHhV3ss1
	dm9nClljwc0nniDkp06oU4n5vvWo/3uKcZPN6WGFriCGtdlKYs2mSpG26/RndeoduBPvHv4fBTN
	YwGNmBak6b3HHZNJPKIoAnb/RnUqSqoqlFGHk0CldrOOr3bVzPEp56ND8ma1xg0pHHCanP4a0ZZ
	62w/81wtr3QOFHCoWEKMPCBkhs5cBkHnF3uFFxkKmy+TfhE356nCNEgqCIdvoZf43ISIqoN4WbW
	6CbpsIUS+WtkeBvDALN+4Nd8Dmwk2CMinVxZd7ucHzznm9sIO1RKG7IBGNcCd+Q6QhhxyGpaswJ
	9Ea1rMYXZg33gKksoVOgpJfzp3HQ=
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99505715ad.19.1788379673743;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99504475ad.19.1788379673206;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:52 -0700 (PDT)
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
Subject: [PATCH v2 3/6] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:00 +0530
Message-ID: <20260902200703.2016410-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZznNjxb-B_JxsvTZK6eHIdNXdDmL0SJs
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a98821a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXyTQZUxe2nYhx
 g7/hYmOeam75prrsjnQckAmNpDlk/HLpXWnTLaIwjbno+oqfYktI2lfESodiF5hRrX7/yx68WE9
 CmXPqyo66vFsgvPfWOQxEyVRUJf+pyY=
X-Proofpoint-ORIG-GUID: ZznNjxb-B_JxsvTZK6eHIdNXdDmL0SJs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX9mTgazzrcKB+
 XKPh678aOMrEEHTVDdJOdxayVmjVqskPqchk7xVnuWEEzViMKJNNamyr8UpREzW8XoqCg7g7PXQ
 7s3npOgSBdWRg6gaSZHmehMV5d5L1quTj4oTgj7W9knYcShnH1a94kAiIS3cw/kIelWicBqk96k
 xXOryhOSqr+9+fzWUxXM2UtThr2V6rSuaOjZfZGDh+3bSYtQon9kGrAB06KzevHIp7jGTdJHi3I
 Dr+6FmQ/PLGqKYrxUutZOjvm6LV8RzeQbwXEUnQlbVlEp0NU58bMx8CNc4rKrpsHDpBoZGVLF7E
 6ZC4j1P6idstHc+UR4soLK+PqfKuVUfDQKMm4lGeCktNLLuZsuNAoXfMc7uPRYizudqFBKZjp7y
 Y/nNBZv/IVPH10O7EIxGOA33cdeQ3ORjlY88M3jKBL26CzaaKZBh1u5VuDLuZyzWNdLrAO/dE/V
 iNLaPj5aBaryE+RWmsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.55.0

