Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED973B71BA
	for <linux-staging@lists.linux.dev>; Mon,  8 Jun 2026 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907917; cv=none; b=jL6mZ4HgFa3ybH8icvVy8bSUdGyzvwmpBtK/V14s7g42b0kXqUIJ24OCSbGiMrkJORmeQJ09WudwOcaX/hbYDEaZt1WmoZl7WGaJoFUGJAemWZEwLb3dzybC/F/zkE8BR+tv3hFLQIiGziuQ8Nq+5rHJ28d9EAsWkM0DqzLfg68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907917; c=relaxed/simple;
	bh=p3WyaW/McooesC8HpQvG3yzAwgUk99nHm0k9Y0inxG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3ObyFHk7BJ7mn1tagw6AUweUOd6K/stfb7bby5rOY97xQ+yoZXisM/qqqoRYhM5GL4sEAEfmEMtpFTPI41L2gxwOI6sF0uV3lgmlqcgLjUNnZNOEzBtLYucAlrf++fxMKaK2NPvTueKNj+oLn5PM3aa/3IKd76oSkena68gUVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkl0d/FL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZCIBqdV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkl0d/FL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZCIBqdV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586RWkN2833471
	for <linux-staging@lists.linux.dev>; Mon, 8 Jun 2026 08:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gqI3+snHdQMiEGmkjgaNFJ1BkilYs+V0SMwydlenRvo=; b=jkl0d/FLD7wrA6jN
	G4uDNBfwcxdLFvYXr/MwUk3QlErHRo8TtK8LtT3Y6FB0bJANRBlY7+PnKlBP2wzc
	lQUv5tkf+ISsbcF7f1AANDNEAp7s7ORz/3yvIKmQBiLYvyA4SbHkp/XPxLOTEX34
	qNFWhHhETOviR94y9kERig8e8bgWJDajpCSLgxuie7ucY72bV2EaUsPO6Tltlb3h
	QvhKbfv1DI3OvRO5wiQ1DItuDK7ebhIwGeTBSOaFoebZGoO1yVSuOe02hNhL7hkS
	a8wJ1rh9ivthOOEMEAVvG9j2T+CXnySlu3rXOnVHNqiO+51Fq1uxUrZBfye/2V2y
	BtRCrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4y4tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Mon, 08 Jun 2026 08:38:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157c8eb597so574412585a.2
        for <linux-staging@lists.linux.dev>; Mon, 08 Jun 2026 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907912; x=1781512712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqI3+snHdQMiEGmkjgaNFJ1BkilYs+V0SMwydlenRvo=;
        b=bZCIBqdVdaABlKjVl8kZwqumADz4c/dIj9Hlay2lvjICgqQqloRjTlxb60Kbvf0x8c
         bYwN96mUYUoCPrqwyDY15tdkQrGGBzd5XdbKU+phUSgAoGdvd3f3VDpYmuA4UMF6+Ggw
         rlm9kjt8ilLRmalFeou/NRk4pGg+9CR2KpiU7yPuQODy+JUouSVBZ2zHzpWG7WqREE6m
         DOEq6IWC6V/Pfom6eman/Nx8yU/6diVT3ieimPdfFdpsef2WeZ4NCklRTL7kmMDgYfVl
         8XHrMqrUQGzWLDEbysD5d/KBLUO1yFNsAuYUQAXivTIzk8/wwZyUTzGk8AsgxGG06x1L
         lGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907912; x=1781512712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqI3+snHdQMiEGmkjgaNFJ1BkilYs+V0SMwydlenRvo=;
        b=UE3hI0WAPvUva04AMJ/RbFmDYkiSuCz/Pwg80U91b68Q9O+pz3+xxAkG00uHyGlZNh
         wNgkcfvJzzOwoMrCAv2lUZTRI3nLf/c9/Wb0worPXuhNLU0bftc1NXhx0Fm6XLYahg3q
         lQ+Q0DSgFReW4P7PzqZVVWMsWjm5QS1eJcNWGlLKhFRl/JX0GLaiAnBxwIo7AbCk/3SD
         bG4VRxdH8huCEP8/7/cplgS+yYg8hkCNQigaAQpfdZlmZleQ10MuQELca50F6fknwEbv
         r8cJr8L+sNK+M8JqAlPr2DbTh6cfm8ATv34hchzsWqpP2cgsn+wAoG7rVaCu9Iusz6M3
         N22A==
X-Forwarded-Encrypted: i=1; AFNElJ8LC8qI7BI6n+kq2KM/NsOjLLZRkcI6Suj9ya82Vdlhgd3Ub5EHNXttYfR8NE1LixYDTRhGuUq344ftb/0f@lists.linux.dev
X-Gm-Message-State: AOJu0YzwDX8ra6ffEI+g+8Wv1kDD8YobOapr+0Gl3P1MChp+5D8ec+gv
	LO23YTbebXGdTO9BFZMh74i365OUqMMEUlvxvQ6T+ep4orAjyGhtcIBNha/PvfeZHiOMmgpRW5b
	tA0Qqa6JjAO6me6FuJfGv+GtGnUmehQQAc2XiBMcIr86pTKBaCWZkuKwHgzBEWBtITdMI
X-Gm-Gg: Acq92OFK+v7SgQrOJg/Jp+1RAsLol8/Jq+9tmS89XMtLU9BxgmaH6xTvXgRBpvMERrW
	CxoZpjAjZBABoba/J7oH3+xu/jpT+FswK6kalomXqtppZOIuNA8j+Ku3Z1bWvelVqRjAyyRcmp3
	A86htzvkdnHXP/Kwh/BpTjwXOwsy9QY8UVO4Zz+vK7YYutsh37apLLpJuKrikwWJU1YeT6r+HLc
	jXMxyKSh8HL7CrG5GNaa4v2JkCHZz+bkl8VfsfRUjvXcOJAiwf1Z3Ldr0tBTXnv2z9AzSxndS9U
	89V8Wq7pfeZvEap9LUulYz0j3hWJnd3Ey/AiYvn0Ez8ri6D/gzpwhUeYx22j1CME4FhodFujqd8
	wf4vz3gkiwN9T4ILrHZ1cJ46Wb8Asbss58PTPW3AjXwYrqY0VIccvhhwQP24=
X-Received: by 2002:ac8:7f01:0:b0:517:82a1:351f with SMTP id d75a77b69052e-51795ad2ae6mr205703481cf.16.1780907912202;
        Mon, 08 Jun 2026 01:38:32 -0700 (PDT)
X-Received: by 2002:ac8:7f01:0:b0:517:82a1:351f with SMTP id d75a77b69052e-51795ad2ae6mr205703321cf.16.1780907911807;
        Mon, 08 Jun 2026 01:38:31 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm383420465e9.7.2026.06.08.01.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:38:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: max96712: drop unneeded dependency on OF_GPIO
Date: Mon,  8 Jun 2026 10:38:24 +0200
Message-ID: <178090789590.45152.18367074599789636516.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2b71yMUsAW3fUwDpJ1B7gSSM2iuARLse
X-Proofpoint-GUID: 2b71yMUsAW3fUwDpJ1B7gSSM2iuARLse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MCBTYWx0ZWRfX3SgEvNz50QVx
 IOyFdF/2obN9gWL4hTMu6YTJuEW4ovsH/NREGLhRUAu8d+PRxKw1YglpIqcmQICkQuo5LLmW7vF
 69tR3jDhzOnxhxKyU6FvHWtJW2VGjxQH8Qla8WYn/VogrJSf/8iIBnMkNTdRXQ1bea0QvBEwzNg
 FdYXsEPIlJvW9grzMrqC8Ehz5urBE7VznTgZrGPOMqAdkXC0Xu6VRmRivqLk4K59C6/4xMLLObt
 J/t5jJHtwBt05TgOmn1cm0YaO+LWWQZ4wkiZpuaM6yqiI/Hmji1QaZpMhC+FcG8sMcezinL4lgD
 BJJU3NpVxN4MGJmMIBmc7PLSSs30CAunrfFHjmp2ijS87BljXnEcbyD5E4Jpt655O4nZautPU0j
 YZ/SzODqSox8ZHOTE0u1rJ70CJFKCmKS1gN8m0420145v+wmaGjdgBP1z9Orac26pE2lDWYG9bb
 gTttFPtvRL78yX5VogA==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a267f88 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ktJ3iEGJLOSoepKj1K4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080080


On Wed, 06 May 2026 10:22:11 +0200, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs and are private to GPIOLIB anyway so there's
> really no reason to select it explicitly.
> 
> 

Applied, thanks!

[1/1] staging: media: max96712: drop unneeded dependency on OF_GPIO
      https://git.kernel.org/brgl/c/b8840c4f640e07562f15e5fc477ddaf1b2efb241

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
