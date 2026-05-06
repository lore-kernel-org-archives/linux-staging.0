Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889993932C0
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055740; cv=none; b=jlzlYoJHUTfN+e9lmZveSwqFBZLvSwpVvcfiipJ4NbRvauJ2Lnt40MZ6P4dKivpibriYsfUDenGa5RVBwy/u+aG9gmFOddAERYoogAWQZ+VmUF2lDuJtYHjnMpmy/ccE70GtTE7PSPc/ncJue0VP3CZUSp9SEvGiBs8H4QwzpCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055740; c=relaxed/simple;
	bh=aOJXbL8PdmMvAgrzQ7lX1vxnia8DMoCEMVAxkVhnrb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qH2oGXloEzy8sa+GmDOFC/Ir8eJieuEh4t84YUcj27Yi7jgI3tqUD/C9BqqGDxY6YOStj/x0hTZOHq+ZPtXTam7VYgR+QrUnJ5a2zzqGjrWBZolPIXwiKhfoBdIfzAhmHjDC4vIghhslz9jtZr6Z5/TuyrzOOul7fQiT11q4Jbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zlqa4rHs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hx7OV8PH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zlqa4rHs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hx7OV8PH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6468KIFa1435093
	for <linux-staging@lists.linux.dev>; Wed, 6 May 2026 08:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=24mfRUTMgD447Rs1aFKzyz9TYhEvs5V8rhn
	wOPUBW6g=; b=Zlqa4rHsC7B5t9FTi+ErcgOetTZcRvvqhqsd20N+wnhnVfkr4+m
	Bkik8fRfNOK1hQRzsVWeZ9RzqvRi8LOuNTU2dNhkMpRVTZwG0BfW4K7ksGmzbwNC
	4hoBnjKzb+a8Qj25U/hTxIwFA5C88RFanfqpHdyi+iNqB4uxw6S3WqwDBEsO6MI6
	h9fnHHSyhguQrIYUY7GqJGsVIDc358fXnYkFGbT8quDehk07vEzuvIovpylwONpw
	aEpMi2X/FbQXAIgvUoB3Uh4Jeuedq5pJyq1oyhGjbBH7ymf2AEQhilGGmq/hMXXg
	+xWfZFrac947oEeY9+oCF8AHEV7bWtg7EOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyuqdsec9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 08:22:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f13da9684so76541851cf.3
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 01:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778055737; x=1778660537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=24mfRUTMgD447Rs1aFKzyz9TYhEvs5V8rhnwOPUBW6g=;
        b=Hx7OV8PH3PUa1nmwF/pm+cnG2NzfDQFt0NZw04OoQViprz03arzLYmdtZz3SGbmwDq
         WuBD2AZPxAlV84cLkwgXpSsd/c6hDAvr/mYjnX6x8QY/aAEyINvjM4DEozSujjhfC76G
         /qup/ETA3lEGcrtKkD6+MfgVKdSxSLJLVrlEqaMGccGUc7sJrcHiKmPVqVe8/gPUgKda
         yF1ItjEl7zIHmQDPMpWrMH9aZElEgYIyV9bIF4Iaj5plGMlMnjRIVUFD2OmKxXUXaLAk
         4etvHMyT98RSQEfevi7L+djFq1zXoIUDaDzR317SRaoeQwEiekSLpdNE88itq1spI8Zw
         yeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778055737; x=1778660537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24mfRUTMgD447Rs1aFKzyz9TYhEvs5V8rhnwOPUBW6g=;
        b=VZZvkaCX5TnvHWWpLnbN9L5O3zwKuytzPi0ZhykVTBHGv3kNKBgu/YK47GONArRVfs
         VP9Av+tqem7KGA2IfdgtmNTcSX7ENKC7tcumLxTVJvImUH4xHKobsA+weG9QUazIFkhZ
         lMy99z+x8kC3TQrXNSMYFF/atGKDICXk6Gkq1A1TU0k80lzf6YCC22/dWAMAaJ29Ea2a
         kfgOnWh9EswgjT6LM4tGV9IqelLT0rP0lCJTXKbEMgfVv6XpK2l3xgPuD7hGFB1kccc1
         ESKiNLgwDrzPQASTNGzEtBmlDESgmm/FhNODOmxjnTgUuIul6b+1W8NFVFgxR1++b573
         HQ5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9vNX85DM/K+snhJe7xfQrotW2W8pT6+EU7MKlncSEH8GRW47Ue4rEGR8hVdRMF612r+IMtdkW+Tv+Rh7g+@lists.linux.dev
X-Gm-Message-State: AOJu0YwmJO5KjKZgoxbre4nnPYZSL+4RQyrU89oII0spl+zeIGwTCivM
	VVtejG5/QUgYp8fAMoqwd+1OkygVoBc5slctWvgDf1dt4nSBkXlx8Kt0ZloPNxRzcLhBOHTR7dF
	1syHo0OklRF21RlNVFLaQHWpYXgfWC6VXTr0phWyf8p3uiYG7Mc36o6trjzsIeS8WX1bp
X-Gm-Gg: AeBDiev59rSV/wCe2Dtjp+zzkPcG2KhSuT92pyAJdoNRhkTUAvX9Sh8Z7tij+BiEwIx
	7kBCsV9WQ2GaFuJl/mts3SHVqZSy1/i4bv4sdr+4cpl9+kubkNP7d2XfBenl5GULZTwyrXP8Nl9
	r+z1sO7BqOQb61JP0KXflw1HpCdh6yov8Bg/cf33ckqQHVO4rq6HkEhMjQl8gvbra/kcAlUnRHO
	EdRrnvkP2OhA2l3l9B4fee5PC02KLPDg7PkhqJuP0EeOWg7VuGYBNczp1EBCPCp6C5A0r5g5rSx
	KTT2S5DmAhkSj8KNDQQbyqvA7oGBCkjnZpsiQb2lAz7dxk82MblDIWUoSZalV5jKBjMf0I17UPu
	LD5I0QEoDEddsL/gjekGOLeIch1o6K1WhjlfqXbhE4Kwnpz80RzFKpbmZiLt6
X-Received: by 2002:a05:622a:4a8e:b0:50f:ade2:2da with SMTP id d75a77b69052e-51461fcdddamr33989681cf.44.1778055736943;
        Wed, 06 May 2026 01:22:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8e:b0:50f:ade2:2da with SMTP id d75a77b69052e-51461fcdddamr33989441cf.44.1778055736511;
        Wed, 06 May 2026 01:22:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1cd7:fa68:b1e1:a93e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02abbsm10220520f8f.18.2026.05.06.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:22:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: brgl@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3] staging: media: max96712: drop unneeded dependency on OF_GPIO
Date: Wed,  6 May 2026 10:22:11 +0200
Message-ID: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W4sIkxWk c=1 sm=1 tr=0 ts=69fafa39 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=anDPzXTbJAMmVASavyMA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4MSBTYWx0ZWRfX09+OWxS8fFRU
 dFpS2snkLYduKsCXbq2CgVM2ywaBzSXhm6ShgdMwJdGUVZt58jzCYpdYie/FNZdgqVqJY8J1kJX
 Q8SUZkTTwIht5rbUm4wk1k0gSzi1dyuZUo1xmbUDY3ItY3BY03zO5iwi5nwZ+5vQ1A26XDBWyqx
 JWtIsn6hIjLF+S1SFUPNYaCwFZeqIRpFo+D/q6Ds2tPM1asu4fDjHirTju4WOhdBpt+PdLKjofx
 AvnkZ3xOcQRCp9ncBrakJbVFLEsB/6c8qBC6oGBqL5agYmDQPOHxe/JTvnKyalWXOMK0JPFrAxH
 TlzuA8nw5eMGIZtm/L78fdzetXQ6vYUwVu5DmLi++811FybcyxdTlXDLmxrIlDfwdl+T2fBEOb4
 ySK0KHRCTxykBkO9hsIHhKmEtrIxD4CVYohyuTs/Aq2fH+9rDJTSJk4xr5tKHfNejWEqJOJWfDT
 IZBJRBDqHS6Cm2sxLBQ==
X-Proofpoint-ORIG-GUID: cXUvCarfZmykpfrCwmVkQTsvLuifmUIT
X-Proofpoint-GUID: cXUvCarfZmykpfrCwmVkQTsvLuifmUIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060081

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs and are private to GPIOLIB anyway so there's
really no reason to select it explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Send the staging patch separately so that it can be picked up for v7.2
- Link to v2: https://patch.msgid.link/20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com

Changes in v2:
- Make gpio-watchdog depend on OF && GPIOLIB
- Drop picked up patches
- Link to v1: https://patch.msgid.link/20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com

 drivers/staging/media/max96712/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 117fadf81bd0..93a2d583e90d 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -2,7 +2,6 @@
 config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
-	depends on OF_GPIO
 	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.47.3

