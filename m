Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79DF3C3BFE
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478469; cv=none; b=CCiVsTLE5fSO5ktqoZ6Zpyfon3/Yng6Woc7jAx1nkleEXqA41z6lOYSUpfStkXreIfOa1BnYQV6O14lKE7oF7675/4+hRo8KqAjARRWFYmoSEVS1OWYpu23NiX18RU/smTH97kuJw/NL/3Y6/Mwacun5/NqJo79mQz7lryuB8Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478469; c=relaxed/simple;
	bh=J5cjlmIhmApL5oXstbrQjH8uBAQgeiyQrYDR6jGDqxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3rm2fJOSCAhhzMHdMHcKBE6geWZmAa4O7S+t9ZBbvZtCSptzFAHTChN9owMINIOO1rz0BxeJkTRlobgloj76YeqbXA+OuPijPhWbIop+aQkwuMcPxh2y/O7+612EbZLNl1mwdX326i93onlF+QirT6bTAJm4JIv+pw71N6xNUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fao+moKf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5AQQKxW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fao+moKf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5AQQKxW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD02Oo3112001
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZL7N2UR4Bwh
	9Qvv6N097nupKNcXd85noQladH64uxlM=; b=Fao+moKfW3O46B4McB+4zoF61OL
	R9QdINz75MusYRMX0l7rdDHxYZNc3qajoXMp83COPhR9ZY3yD3K1ebpaw+kvF+Qq
	AxXG4NgQVPd/gHGtAVtShnUQFGKuPrj9QRwT5WpddyoAqTfAO0m/w6Re1bkAJgPq
	JCHjE7j4OzVaZjpodV/6N23AJZGdeK9g0wyw3HSrR/Z4TLrlKQnVOauU1hCTPtwZ
	v9xX26gxEvue9NOadOjwuYRoN5/L8rvnvJJN2lokn9XGDBO/GTbnqoi0iqK2Gjn3
	zZYC19VVP9NGuGO8vg0AsB2+54uITAhi2QLULPWzAeB1v3e9Y9BMy7OIQLQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye721rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:21:06 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98308354abbso440399241.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478466; x=1790083266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZL7N2UR4Bwh9Qvv6N097nupKNcXd85noQladH64uxlM=;
        b=W5AQQKxWI5xkwGGxwHdq+HMVs0PggJJ8oYCQwRB3RuaevaGJ65SpHLMH/7w8q380ze
         wqfRVAsKaXTl4UigFuB+4HkX+tywGG7mjZyGTqO5Apsj5EqjGBOraMqGA/w5QjWpFXJk
         N2+9HVExyn+ynmSK6o6nDT0q6mAcus1Kuke1AIaLv1AURgPf/Hfh0BiZ6tsDBjVbgYSX
         WXCttQJYFRNplqalyMaT14FhnPit9zPXTgBrZHmP19Kyv2T3/wPnA2sVCkdXeZ6m7xir
         p6JVlJSSyg85kwkpGKySF1tuWsNV4ki1UG0uJKCKXOww3EBZ2mJUlRJcTgNUiDmzM2y/
         Mzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478466; x=1790083266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZL7N2UR4Bwh9Qvv6N097nupKNcXd85noQladH64uxlM=;
        b=IyNc12yt6W9aSTQG5iVlo/FJjSw84s0nfJD+NiV5b8mdLE6kh93YBILPZatHOSob7b
         V6+ehdZvH/LupKxvh28NpuFRnkutJmxjxJ5vDRfwXuybwpLrhuNSsQnaFEqTO2jnBM5f
         WGUO8UWK4U4Raxvdg0Foajld8pIHDPFrgsbbpjpAOqmy015UwWGb/bjWugDJJxtBGIS/
         UGgXwTFvPDkcmjnlIkyekA+3o+GsiucfwvOwl0foi3dnWwu9HqmqzxLQ8xusA8pcC661
         TMek/YOGTR6aPhx/i5Ad13N1cLAxpSDFrhxUBHpB0tg8Jw1zrkqXpovK1UhJosb0Mtqi
         lLyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6GXOIdofsYy0/DgsE3pufM6/VxTjhc2lez5vIco5WDKsvcZyW6048OZPWmy86JT5mafx1eAcsAidX5OVp@lists.linux.dev
X-Gm-Message-State: AFuF++nHX3mj7gvy2HChQiG4eal3M/bVBkshG+GdzLMLpGpoAeppzFUJ
	u8AMks+D2+JzJq+ROW027spWf6TU3Dhbt2uG9NV8KapcEO/VnrW0OJN1upJ5GWykoGGBiSyy/hh
	who66xUGTrer7iW9q42/qDjRQMX9t/H5q4NkH7hZNtuA/wjvp4HvwEPBjQkG/UH1J0GlS
X-Gm-Gg: AYBFou1AjT8VyH/bcot+/HpCS5HqYTcon2Th4SN3K9chsHCB4LZ8mmrhah1TQ+7UI3n
	7vqTHNH5QKimXpRiakRRP5WKu6MotGk7qc8vh0K1ebzKIMeI6kR89CFvtQb8HohzrHhx94NbCSl
	mw0/nGZFu6ld9znfST05iXvgtKlKz39BKc6/c9K5aBJ5Zpa8pGk6hts3tkfg743J5AGmaG5xE99
	F2Av5d0/LBzqs4k68efoj66HG58CVWjaM+2akGfHyviqe2/j+oQsYmjL6opkTOv5dgl/KoBx9Q/
	g1mEy4Up1u2ZKSRti13TgRU6H6nVPi0yvFkf+7s0v79vedciNHy06TpXQpAmKxoK+tEs1gZATjc
	EXri6iTezGH0lyWxsXvHbndDRHBazGrNL2bd/Cp49dCJ5Z483sdHm0bC/sw==
X-Received: by 2002:a05:6102:3708:b0:79e:df6b:d2b6 with SMTP id ada2fe7eead31-79edf7b4044mr445195137.2.1789478465984;
        Tue, 15 Sep 2026 06:21:05 -0700 (PDT)
X-Received: by 2002:a05:6102:3708:b0:79e:df6b:d2b6 with SMTP id ada2fe7eead31-79edf7b4044mr445140137.2.1789478465519;
        Tue, 15 Sep 2026 06:21:05 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296613c3ebsm582885466b.57.2026.09.15.06.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:21:04 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [PATCH 1/2] staging: greybus: sdio: Convert to devm_mmc_alloc_host()
Date: Tue, 15 Sep 2026 15:20:45 +0200
Message-ID: <20260915132052.273212-2-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
References: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfX7SBREkNoKfPO
 9IXmz1cdTkcjKYWZ5BYT1nIFpQomqxZxver+xVxLuZFDJddkBOCNYLwByIx1nq9GlzFdvdP9DUC
 v9rRZ8mckPAFfGlSJy7fq992iTYbSAcO9b32KDcl/od96sK7aAV9scov/ZgqPX15T2JUo80Yk/b
 zdkRtU8+6qLu45rlnSqVc5nRlSWrFWoPJQJAFgceIHNX1F951MqzatxH6Gb00mrI5EP6EamtyoY
 15y/pY/FgRxTAi9PuC35ddxVOcrBdGC/XiL89r0zfpEbhcb3wvUnJIjfwh6xZSAx6iWKzcfUwHt
 avvQInaQ6eVgFAzSZJB3/vS9lw43BzYYkWz+1GZtQ9lgM2OR8O80Ce7XoKvWLOZ8+4AEiPN7Qxy
 vngaS5rLAFmM2uzL4B8LTrlIaRMjGJou/h7D3rckSzG1D7SLqtzxvLiZ+mWwucMQ693IX/AFdwx
 7wmd10oAat5IklUDTtA==
X-Proofpoint-GUID: lJnKLvc0oVUHMVelF7CAUGqz7bOHN22C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfX2qcq61sR/yT+
 QlZNWDCJGAFLPU1Bd0XrHt/tcDgRGIEdxMW9aI2qJATlMDZUbAFkHasj3IGfK1SXihgvi/dMLsz
 Lf+tBKHpMdz3PqnwIHzxfDcxnQJmkB8=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa94642 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=n9U4IdJ6Fa_2eTZyVNgA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: lJnKLvc0oVUHMVelF7CAUGqz7bOHN22C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150194

From: Ulf Hansson <ulfh@kernel.org>

Simplify the code by converting from mmc_alloc_host() to the resource
managed devm_mmc_alloc_host().

Signed-off-by: Ulf Hansson <ulfh@kernel.org>
---
 drivers/staging/greybus/sdio.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
index 3952f3d225db..642d785fe918 100644
--- a/drivers/staging/greybus/sdio.c
+++ b/drivers/staging/greybus/sdio.c
@@ -767,17 +767,15 @@ static int gb_sdio_probe(struct gbphy_device *gbphy_dev,
 	struct gb_sdio_host *host;
 	int ret = 0;
 
-	mmc = mmc_alloc_host(sizeof(*host), &gbphy_dev->dev);
+	mmc = devm_mmc_alloc_host(&gbphy_dev->dev, sizeof(*host));
 	if (!mmc)
 		return -ENOMEM;
 
 	connection = gb_connection_create(gbphy_dev->bundle,
 					  le16_to_cpu(gbphy_dev->cport_desc->id),
 					  gb_sdio_request_handler);
-	if (IS_ERR(connection)) {
-		ret = PTR_ERR(connection);
-		goto exit_mmc_free;
-	}
+	if (IS_ERR(connection))
+		return PTR_ERR(connection);
 
 	host = mmc_priv(mmc);
 	host->mmc = mmc;
@@ -835,8 +833,6 @@ static int gb_sdio_probe(struct gbphy_device *gbphy_dev,
 	gb_connection_disable(connection);
 exit_connection_destroy:
 	gb_connection_destroy(connection);
-exit_mmc_free:
-	mmc_free_host(mmc);
 
 	return ret;
 }
@@ -863,7 +859,6 @@ static void gb_sdio_remove(struct gbphy_device *gbphy_dev)
 	mmc_remove_host(mmc);
 	gb_connection_disable(connection);
 	gb_connection_destroy(connection);
-	mmc_free_host(mmc);
 }
 
 static const struct gbphy_device_id gb_sdio_id_table[] = {
-- 
2.43.0

