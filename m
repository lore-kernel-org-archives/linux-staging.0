Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0B3CB2D9
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478472; cv=none; b=LduehFkY0hD5r95gNaDDolwSHD8graSnmrpCQnNLnXMXk2PuX7wEY3I6AwjzpPV8oYJTcGRJqwTB1RMTga717rrnQzRJE3Z8Irtr9jO/B+6ubFOl+kwJQ2l214TosDhIuWw1LH7GR8dEtut2I8GD++7wwTzXPvSZynhctG75DnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478472; c=relaxed/simple;
	bh=5uxg7Tq62X7t4ONo1Iw+PVq8T9wcgeIrqkC2J/jYYlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWLWCbKfsxMODyylpFWXvmA9+P4OwONDC0L8DUxYx3rszo2iA2Vx2cRreyQTa65uATOWO1nkTsgIvOECRaw1Pi98qS/jJeq6YAFRNFRr3QITU7RwTH7yHE3UPh33XPXvTKKjFvVG6UeCfnYBsQdKu/BUM9uEHExXPEVRcOV2Dgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKy2/iNC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNijw1h6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKy2/iNC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNijw1h6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxodJ3264772
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9lglF8Jy2Eg
	aqPwPCoZsJG+/E9siJbnm0STAQ8lMENc=; b=nKy2/iNCtyVNJTfFPp/v9rqUG7c
	USeoeGQqik+ltzttwSNI5Swk2T8aXhSUTe4UW+aOXlOUThgBnXbhLLSWk8IqIiCB
	vi7NrrrVgf53fQ4hUtA2FthOLJu6t6ciyELUtMZ1V9raOdaS0B2YUp/kpoXzXEbB
	qh8I6Cf0r1qXktxqrr2/zB0DlAE14NAeEyIFROBiG+ec7KfLePj+8VaiSgJuZDKo
	H083AnKrTyuHhAXg2ELGIV90vGMvhjqAeEFZvTMJfmdjVtgVqSIsptpml8Tia2jE
	nvv1zavYGj1v9YshMvu1TzPs8vbXJopBG54z7crOn79o8KwbI5bn3TqWwDg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyda1yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:21:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-785827e6073so977736137.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478469; x=1790083269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lglF8Jy2EgaqPwPCoZsJG+/E9siJbnm0STAQ8lMENc=;
        b=MNijw1h6JVYufw9rRdxAwxfJqDPOMgfmQTmhSDz9Fs1oJoAsGnjfYd7V0GvmRRLIHl
         nO9DK8ZsKlGZoSiAh6jiksP8e42VdJYzSvvboQYcFb1xB/LnPzqRkZjb3LWhlfB5GrTV
         JIYiLy5nD8QxE0nNzAhOcJBn0PrJZcGrI9aQo4mOH4TH+UDYxxWVAMphGpJ9zZ/HGthc
         ePGlg7AK2ooVLVZ2qMF7sHddQcA6FFzaOOc1yTr8JYT33cuI/vjQE2nMU4DMW7KEmwKU
         U29QKlTKj9JAWauiVA+wG2c6jGnem/uNp6lH+g9WS8qtFeqk/s4RV8G2yu8lH3jECdei
         fd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478469; x=1790083269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lglF8Jy2EgaqPwPCoZsJG+/E9siJbnm0STAQ8lMENc=;
        b=oBBf4PW5vnMwt2+DifvoY+Hu880D1+yM9w+1tVX3puAWuiomOr6/9ud9P1xRBZOZCY
         yfxu8tyioTXpo0zc2MbdQy1pM5DABASfpLunsM3eAl9OxfMSzeqfLtX3hHEBSLeo5vsT
         PDUKfW38CsPb2eFtpVkbHt96kUwrd39UTY1gQzXu7Jlqwyx5OmkGMciHpkT04HDEuvEN
         3Sa3aHyW90WMhxp65Pr1grvwqgaeNHeRnJigZkxMW9mQple+zwgRkbGcKB0X8vH2gcF7
         yQz85lIVCV3eLNXIabohGwdxeu8XobxTRHJ+IWX9Cml3kV+cBU38BK5bWyZtyzQTdrj2
         77Dg==
X-Forwarded-Encrypted: i=1; AKwUvBxvDMlvJiswc2p+MmX7VmII0wdAfoPr2rkKk19lAAqtH+jT9kgtK/RWK0RDp6r8rEK7IudG3etjvSDEsOrm@lists.linux.dev
X-Gm-Message-State: AFuF++mgDcWp1REr9pvHclHN7qJjNvdJxHszKHQ9ooQdpLI1JzC8OQ44
	tJqdVmUEw20ms63SLcJi+neLjcJ7uAfZwDIh3J3PVwqYHXUWgwOh0F2IyGMfy86DrojaE7SOXor
	76maPTM3ikiKp6htKN6X3QegVcfVtkxtrmjkYs73S21yAxr8NcsQvXSVIkzdvOsgHv6zL
X-Gm-Gg: AYBFou0d9D3vGF5xNUPe/3pTWfNeKoSpc6BluvYcVaQ9RdXVjwEK10620bV8NfVGx1W
	1u01NWn9NF0Z47KN2mpT12yTKgPX6aMtMBsMQjDIMPcEsAHmB7rIeQkITcBkFQ6bQZxHEqvolWh
	ZitUsDqRmNA+XAopoOWKdA9Z97vbT4DdYFrvi+tfpQeTeCzpO8pV9KVHNWD4FQ4FR3icuAsu7Ze
	nENBJmRw6EqYvY99OQf9Oane4I4exr5QeFit37R24kQcu/m3YnLLRDBLQBLHKAezmePoWTMCBCF
	yYAdxNdclxGphhqTyIIwnTsfOmfTwdy4fXqqzzSdm5egzZjN5wWAbUzQfuYTcsMHMjBCanW3TcQ
	TYb6ZdXShNJ1ZUkCsUAfz79wVCq/cg0TYB0Bo/t3x173smzAhsPmR/1tblQ==
X-Received: by 2002:a05:6102:510b:b0:778:5369:763d with SMTP id ada2fe7eead31-79b56aec243mr6728949137.1.1789478468732;
        Tue, 15 Sep 2026 06:21:08 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:778:5369:763d with SMTP id ada2fe7eead31-79b56aec243mr6728842137.1.1789478468218;
        Tue, 15 Sep 2026 06:21:08 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296613c3ebsm582885466b.57.2026.09.15.06.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:21:06 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [PATCH 2/2] mmc: core: Turn mmc_alloc|free_host() into static functions
Date: Tue, 15 Sep 2026 15:20:46 +0200
Message-ID: <20260915132052.273212-3-ulf.hansson@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfX+2/yw2Nb/dhm
 MEjVKmIVuRu3KFGGAbfsHx+6WEq477u5x4hNTi/QNo91vHAfL66jPxAkqJWHO9l08+e06yLw9lo
 eTrNhxAyaWR4obKcjvPt6UYN+iMRlwQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfX6oDNXghj6ycQ
 P6dS04OIB/7gOvFqkeLum+cQO6u9GYGxXGT4TgJDO3uw+5yAKjcKvP322ka6819+Z49WIfDlNPs
 qBn96NPd963xCcHr/p4N/mS1/dNxpxGdh3KEXag0W33PUn/poANJkPnGqxQL2iJO4Yd983FoaQa
 G8+qzJzFkKuCr/cz3yQNcDfNDHhoHHXz6m+OW6fdRslwWI55Jy6wopnK7jqvkhMxBm7wzUPEgul
 1rv/yDHxAqYMRqhmXMLh9O6rYGb29J0ai3TrVeDEwyfQ03FxQ9ZGiRxnwNVDaIBkbu4yheq7Mg1
 5xsl8J81j6fGDEYz/Clk7oPzCbnQxQ/OJsw7wdhJSBhnaFzIi2dHSl/VgreF9H2NJX2hf4ZFtXJ
 MOJ0lPAsvzoo5izdaf/MfyAHEOykqOOGAyQU4fEe+tzvSvSX/SpMkx8HADXeMVoEpjk9VOkYqZV
 p8KJcxXoOUUdv8G7MBw==
X-Proofpoint-ORIG-GUID: U769wr1pPhg8yaU0na-I6WPxTHwQlw-x
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa94645 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=ZspSQYoVYSdymiOi6Z0A:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: U769wr1pPhg8yaU0na-I6WPxTHwQlw-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150194

From: Ulf Hansson <ulfh@kernel.org>

As there are no longer any users of these functions, let's make them
internal to the mmc core. While at it, let's also flip the order of the
in-parameters to mmc_alloc_host() to be consistent with devm_alloc_host().

Signed-off-by: Ulf Hansson <ulfh@kernel.org>
---
 drivers/mmc/core/host.c  | 35 +++++++++--------------------------
 include/linux/mmc/host.h |  2 --
 2 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 1bcf0e917b59..8e9e61839198 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -505,14 +505,7 @@ static int mmc_first_nonreserved_index(void)
 	return max + 1;
 }
 
-/**
- *	mmc_alloc_host - initialise the per-host structure.
- *	@extra: sizeof private data structure
- *	@dev: pointer to host device model structure
- *
- *	Initialise the per-host structure.
- */
-struct mmc_host *mmc_alloc_host(int extra, struct device *dev)
+static struct mmc_host *mmc_alloc_host(struct device *dev, int extra)
 {
 	int index;
 	struct mmc_host *host;
@@ -583,7 +576,13 @@ struct mmc_host *mmc_alloc_host(int extra, struct device *dev)
 	return host;
 }
 
-EXPORT_SYMBOL(mmc_alloc_host);
+static void mmc_free_host(struct mmc_host *host)
+{
+	cancel_delayed_work_sync(&host->detect);
+	cancel_work_sync(&host->sdio_irq_work);
+	mmc_pwrseq_free(host);
+	put_device(&host->class_dev);
+}
 
 static void devm_mmc_host_release(struct device *dev, void *res)
 {
@@ -598,7 +597,7 @@ struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra)
 	if (!dr)
 		return NULL;
 
-	host = mmc_alloc_host(extra, dev);
+	host = mmc_alloc_host(dev, extra);
 	if (!host) {
 		devres_free(dr);
 		return NULL;
@@ -692,19 +691,3 @@ void mmc_remove_host(struct mmc_host *host)
 }
 
 EXPORT_SYMBOL(mmc_remove_host);
-
-/**
- *	mmc_free_host - free the host structure
- *	@host: mmc host
- *
- *	Free the host once all references to it have been dropped.
- */
-void mmc_free_host(struct mmc_host *host)
-{
-	cancel_delayed_work_sync(&host->detect);
-	cancel_work_sync(&host->sdio_irq_work);
-	mmc_pwrseq_free(host);
-	put_device(&host->class_dev);
-}
-
-EXPORT_SYMBOL(mmc_free_host);
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index ddb32bc2946f..198554e48346 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -585,11 +585,9 @@ struct mmc_host {
 
 struct device_node;
 
-struct mmc_host *mmc_alloc_host(int extra, struct device *);
 struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra);
 int mmc_add_host(struct mmc_host *);
 void mmc_remove_host(struct mmc_host *);
-void mmc_free_host(struct mmc_host *);
 void mmc_of_parse_clk_phase(struct device *dev,
 			    struct mmc_clk_phase_map *map);
 int mmc_of_parse(struct mmc_host *host);
-- 
2.43.0

