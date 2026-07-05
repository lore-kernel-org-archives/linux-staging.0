Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0A62FFF8D
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280488; cv=none; b=W7IMCqM/pte6ijgfPH8HBht2awzK5ZTYTwNZDHwruQYreOt9/Ntvskp9Tw0Q0xS5S6ZBg9u75OCJt1Y1EyHl91wvzSr9nEzF9CoksPW1dPxhx+04FS2ZAqlnWzfN1NMaTqZYy+bu+Q2RVH/MlI41DevvIjq9WFqNUlE0iEi8sLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280488; c=relaxed/simple;
	bh=GVKkJosfWbaAfOvliUHFeY44e0c1PSKKGH2GQjW/JNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzoexCSu5gezKOtkTjO6Fm7PvZ0vtCkKRjW2yUBBrI8mApGhtLs1PxNYSvFCQJYMBrdta/WPIJVpPexMjk2jz/n74K5nTM6WMB8AYzR2lcBPCV3uBn5S07m6jrHXQs7VufQJWlFKR9xLyIOs55vd65ULdGyPI1kKO33HNBkQHME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLn6zhut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8nDKIyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLn6zhut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8nDKIyu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiMn12326036
	for <linux-staging@lists.linux.dev>; Sun, 5 Jul 2026 19:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=TLn6zhutzCtePBXP
	eApN5L/sdm3XfMAHOZhP82YsbqE0e2xRcEAFk/+OzouZNGNfc26qhw5knDcbPcel
	BP5iZZDUvJOH4Kdt2QhgKPJOeoScqNJcXRyWCHIYBBbsIEBD0ZiVVQvHgMHBpB06
	KDdBLLvkRr12JNjMqEtNLmZCzmB3HEASAP+zwk9LWIkse6JF6XJ5aE2oTFOlREXB
	HWsjh1ZGAPgsRx3a1N+Une0Zk6nBS+M8q7Nzxb/+beCfZqlUhL0J/8be0mCDgioR
	WDJzt0GGrulk/kLFg2I0CGVxAo6WNnObMHMMKTDfE+fIZHUMdON7dtl7vgqPIl6I
	fMEfTw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgum7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 19:41:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8894570b58so1575774a12.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280485; x=1783885285; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=i8nDKIyuZYf60uVQ4Y5GhgX5qu6utyqKGTuOmwXcP9Lh8rhXpelQ5u001Pzgxa9h1+
         QNSb2z31uHv7FHDk3aPn7LqEjoZocy0G3eLkVFWoj2Lc5/7Jlc1B+81zbwIMduhw0n7F
         lS+gzt1FvHIsKv8i2ezDG9AUeCcOA36l2gKq7wlwP+H/fB8eZFfEIITMlijgnRia6npj
         cSpKMb72uWb4QzSZQ1mPJBd0LA8AkRqwdaXr8fASxpD5g1L0NZH/cdfG4OvEAMDdKc1g
         ngnZgZG+lToy/Hcl27qcR2V/chPO7lh4omZXrq5hdNowbTnUdedyTD5G4+IvzfOzxzSQ
         copQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280485; x=1783885285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=MxkEWurKcMK3PkvvEepytzE7TZkbi7yKn17/SfeIDzGKsCNMM/gK0NXdvo6Ud5dO54
         fs4+KiKRMdLDX/7V8Pz86W0XBu13/pH2YYeQ7wQfUbhk8w3uEz367cWXTxo67WM6Vk+i
         YM/GIG7evPsJooruMI/AzpQKaLFSmivij/N5K0WtpH+GqHwnEivZRU0nGzVTFy5QKErz
         peVaQXEUeCn8Byz+PL8eVf2SbD8GL6AUNLBu9eWQkVdi8v89rbtn8BZjFql8ZDNXVCRQ
         a8oJChym9N+R0uP7hgIE8zuLqCQ+newvQq7Jfat5WemhgdXzLJPeR8JUNSLBDdYbqcfh
         jmFw==
X-Forwarded-Encrypted: i=1; AHgh+Rof9+bFZ/i74FRNQIDqU8DjwwybfGnUvozMPeG7M48IzSzpcD14qo0TEVsk6AC17PeFSVY+1PWBOpAuwtp3@lists.linux.dev
X-Gm-Message-State: AOJu0YzMgnyyT7mVbPEMEwq1YYARblW2zraR00Jl8Prg7024LvEpAIlz
	p+hnEvgfWdVnBcsyHEuEycEUFy3UywXUYJs+R/hDXSEMKbtk2l/l9Ul5L05brKAYpX2irJJlE7G
	KErfTAd1qN1MgX9L7dMmJvsFJVMNC3HzmWRQ9PLo3ezUHTc09Ni2dwkn/c0OJRLvNhw38
X-Gm-Gg: AfdE7cn7VvcVcTlHVTP887FkQ8JETFCFD/DPdZK3oDmU2Hfxrw1SVJNmfdUiQEywrHg
	YZegxSwzxQTKT/ozmo5IDquxm72nPyY/+0kM6yoCqFsMH/wfmtcDsp/YawtYCPlFrvPVIJCGmdx
	qLJM50qNH47q4HsTY2ghDyAERjHEOg76VTRwB7OIc2vqV8RYcS1gmtUcblrAl2zVEDMvFxX01R8
	QWtHFQNI6D9oLXcGuQ+NT7RqCqvvQsRyEjVP23BjMcaOzjjJnjPJrx6MIyfv86sVMQce91G4ViZ
	a32a7DbA4P1hIEC79Vi9nJdoRTvFJqUCy9fpn3IvIKyneB88RNCjza1Z8q7f6LUjwhIDSyOiSpm
	ZqbuJQ8V+HDNXDn6MpDTdyrz5d3XfYo34pKJ+Mw==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745242637.15.1783280484471;
        Sun, 05 Jul 2026 12:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745209637.15.1783280483924;
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
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
Subject: [PATCH 41/42] ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
Date: Mon,  6 Jul 2026 01:10:17 +0530
Message-ID: <20260705194019.2565498-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4ab365 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dtkDxOtodmQ1SLiiO2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: SKx9Ib_EHFcnzAveP3gnb0lQ__7D-uxS
X-Proofpoint-GUID: SKx9Ib_EHFcnzAveP3gnb0lQ__7D-uxS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXy2LcfobrN5z8
 x6HaQfH26A8engD8EvtRcAJTZ9ZLwPs5+E4czejg3v33aDrpVClvN34XA4r0bXXe2gYV9PLSFIH
 WaZNvTZJGxukkTIeUQJSi1JIdLnVMH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/9GWMjenA1SX
 MoJrbLkBQ0BUfYnznfSnH62vXygxzsrznHvSsH15TjQPWpNi8OvZJ5OXhAyxKoUZ5ItF9gotvAx
 BhPwN+VJwdaTmxB49WtAUvJelcvziW87wWaM44IkvV1aeeYXo8Ke2O6ZOwLKn0rTfWDduP+nlDR
 UdqDJtpQCO6GPXWWd6MbtVS76VwOwBHVTvDkjq/piK7hH9z8PYXLEyv9mUkK0IhmFQL0LeIiIO8
 QZxQYP/in+2OP7L1X1mjLIcGQorwlIAt+Zwrcbi3fBjicu6t/+TvZcvDhr7UfnxIGW8FTQfXk6n
 6pct4bNVhjfiEq23hB1NXhAzuRMjJFZNguZuo6SM1JWCaAY8i81EDgIGfTkpwIoA5zcWI8QBHW6
 EXPT33dOpZDcjWWk7Xhobo9Cz9Y7N97LnLExQDm1PO8jDzVwjVf11ZGiv0WB6BGgwj9GeBZuwdj
 edY4qqM4ALF6hmw0zQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() to
ensure the reserved memory region is released on device removal, fixing
a missing cleanup — the driver has no remove function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 5f1af258caf2..f504d94c4f68 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -199,7 +199,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
 
-- 
2.53.0

