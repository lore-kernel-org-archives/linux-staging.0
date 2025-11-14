Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CDA27EFF7
	for <linux-staging@lists.linux.dev>; Fri, 14 Nov 2025 04:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763093558; cv=none; b=VSGlh7stw5C85s4V4ZJDHQrDj/e5jfp0saTW223lWYd8ZgYkCyIWJKInstmN0IpW21GcDOLAGh3xt7XXPQZRGdA3ldF7QllUQR1bwA1RBX8CVBi89uLQk2pWKxZcD4gtJw35VF5aO+WiTnbYAtlHqww0zwq9gMT1yIcnNjU2Y2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763093558; c=relaxed/simple;
	bh=vqxQ3dK7VdFS3PT/6Q6WjwlGkrU2MdtNuweZl3H6mBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uitd+bevdv4jIGaKM3RK8zlPe7UYoaSyLikLMN77ttv0ZPKG8UGJKimx7OyerDJPCagQF7X1o3RNaVq7J9APFnenEiEtnTt1pr1/wJZZktgXnWF1In9/H07OZqdP28nPltIF4/etghjfxefwCBDqvmIdh2biV1CgCAPUuKNOwsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcdvIvc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2GjMpha; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcdvIvc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2GjMpha"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMasOw1582991
	for <linux-staging@lists.linux.dev>; Fri, 14 Nov 2025 04:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l9FUBbeUidxIV00pdQyQahKH
	PpoxkuEk9fyNczKyhZ4=; b=WcdvIvc3sMDYJHBly1X7GlPj50GGKCEK4vrDj8k0
	5eaZ80++Ws3b6M4a/w2eVgp5fBZPqpReXJ6xcZvCuGqlyHQVAUPNMJplXDtRkmjR
	y6847o+zGxT2XJUEtVt8QOs1dNpy77MXiVZuOJgYMs0BamIgUtjw2hTVBYrDWjPI
	ByZ746JdSL8Gv5MgaoTNMk2yzeUNW4jCf/D2j643Vd/vNt+46rBlvy+jz4Ihw0Z+
	fTd/SLbn6SPCPWVriGZp93nSNSFJRad1vxT6ksE51c5WW0OqhiOxjWbi0pFY79Eh
	201wVoknTjIeNpA4GWGoZTCf94s18YBclqS5YUrFYMV7Vg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9frs5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 14 Nov 2025 04:12:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b26bc4984bso784570685a.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 20:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763093552; x=1763698352; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9FUBbeUidxIV00pdQyQahKHPpoxkuEk9fyNczKyhZ4=;
        b=f2GjMphaD13e2xrYndNvAPxTfHCrLkw5zbERLiApxiUcry8/+WrEWrHxdefq9RYSCa
         KeL3ZzyG9FoyZr5DBg3JSJjkEHUaGT/7ZFWTujeZcC31DCaCkbnkm2Nd5eMmleVmEulz
         sQU5XmlFB5A+h2zBJPham5G+EuKJHwmz48SaS2ciKxpKp3tbpwxYcn+fG7zzqJGcSQOn
         eJkwadkh+zLIzKfRQKiyvUzSEjItpZGB/HYCE3GQt0Oy8KFy+foaHMOKiAEAYCCWV9E0
         4FKEEdxZMwfxFk691dRMHxbBB71TDVTOyZU0NdFsEvm5M3JNc0rw5GLLqgaOwMl026ZE
         9GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763093552; x=1763698352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9FUBbeUidxIV00pdQyQahKHPpoxkuEk9fyNczKyhZ4=;
        b=JfNv7wcD+mNE4rfBvMzGEHH3RFllep0iDIdxFdH8dK7bKnFAJYqGlSdA+QKU9+k8RV
         h/0sU6kabdG6qu8AVwPWahVM3GkUWVCoxsgg2nHA0viDNasLYv+SoDeKH09QFw5v5aOM
         luNyMZRvvCPSx7hNikq4gMzMVVN37ukefdm3gvPRR9WC2ByPOOswYuGpxMKtbsAL9aCn
         4xdcX2JXJPRbO62BHuv2kvVYjgrqJaQpG6JleTh3BI4T8060P/CacaCLlCVB4W/nbfFg
         2pI+OESlXhbcTu+KNOuBXSeSZGOyL3mGH6qPr2Kvd7q0qeKg+rlxeM1LPy/9iTfUsNZq
         VvHw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4abwVYXzSHqrKt8rw8UfNB2MahN0lxa5VVfJFCa7+volc9P4HN5lq5oqckXvUQkN98tStFWo1uTIAEdw@lists.linux.dev
X-Gm-Message-State: AOJu0YxO1//o7NHDgQnrXe/psbT+TGFjWhoyY4oxlS7xuLET/zUqWJPh
	kESQvixtneGfY0uwVpwdERW5J0LOTOvuy8wmZt7ipfk3psmxVYGuLgfEcJI2t/a8i3HgkbPvZ05
	V/weHhPDfQXzsMFIISV858U4WOwvHMTpTpnPpKJRIxI82T5GbMLQLWZiFNzr6lDc5eS2S
X-Gm-Gg: ASbGncu+JfA2EUae9zL2E3HEEU7nNOyTyTqg7+jbbmX72t0bPOWPTYavwhpvlD4Gz0l
	0lZbHF7iq14uSVKwMNdfHN5xtR0yC8T4VsXZC8/utvGLhSmqdoL3Yrr1I63ZheF8Yh+NUt0KFpq
	5SaLNUPfbMMx5/sDrFaV7qqxTOT+d9+8jtJ4uk9O/fNzTVQ2jBjnt/lLwJmW5OsK45fLXC1aheE
	U1HPu79nEC7NAFQ8xSQuYvSxMJN6eZNMilp/E9SnTEB9+E+ZuuOgiGD3Ed6RtWlnqCyC5574q5D
	n0DXej2J/aPHrnHoGbYeGv50LAj4f36lGVmwI/2+d1ZO2sTO5CwS7kGNouYz6h9onebMu3Wi1Yp
	qzhggeBZE1gGRDg6Lsb03kWobMAAJY0eYJniq1sSTKZQByXzUFCXKyhqJHsU+uanAd1NYY2bTea
	OcDZQZD2J2pgKc
X-Received: by 2002:a05:620a:4628:b0:8b1:ed55:e4f1 with SMTP id af79cd13be357-8b2c3175d59mr235434585a.39.1763093551978;
        Thu, 13 Nov 2025 20:12:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRBRFxxiAD30mEJm55HBtKCBqJwVeb/nqEO1wa7PZ+U+vRFrL3SI4k/Rw4EJ92OxtkmKQ+nw==
X-Received: by 2002:a05:620a:4628:b0:8b1:ed55:e4f1 with SMTP id af79cd13be357-8b2c3175d59mr235424485a.39.1763093551352;
        Thu, 13 Nov 2025 20:12:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405a4esm784867e87.95.2025.11.13.20.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 20:12:30 -0800 (PST)
Date: Fri, 14 Nov 2025 06:12:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
        Vitaly Lifshits <vitaly.lifshits@intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Sagi Maimon <maimon.sagi@gmail.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Karan Tilak Kumar <kartilak@cisco.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
        Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
        Max Kellermann <max.kellermann@ionos.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
        ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Przemek Kitszel <przemyslaw.kitszel@intel.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rodolfo Giometti <giometti@enneenne.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Stefan Haberland <sth@linux.ibm.com>,
        Jan Hoeppner <hoeppner@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Satish Kharat <satishkh@cisco.com>,
        Sesidhar Baddela <sebaddel@cisco.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 06/21] drm/msm: Switch to use %ptSp
Message-ID: <ngzyqzrjg2msv6odahkirdipjizbpaecfscfgnic3su5fl6hs7@qgdb53svq64p>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113150217.3030010-7-andriy.shevchenko@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=6916ac31 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=JNz3O4sEs4oywJvo4n4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ukk6y6YvNCjSHPaH2Z0nYFriHCvWOe88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyOSBTYWx0ZWRfX2eOVzsdbpl0e
 WgUUWPOoA965MrgattQbzrR95tlRkPvApaqnyPBgkz++aD/2s6758tuotX62VuWCZLOelVj7BxE
 rZEcwMpwdTUJBi9T/7xznln4rRXX9THfMD8CiK8Vv8Cj6FdcI6c+SC8hWJInViVHJEnJMagzmoj
 QS1soVwGPJrP5gYaZh3SiBv2jqLV6DkxTUGrqdTYsUeTSIcZHecJmFJRGazBEXbZXBQQpicXgeb
 fl0W5DGAbR9r/t8kn/r7Nt+LARUKjaWYL54nbHQIDvERub4wUSyjT+XbO6rZ0/pAiJTqRaMlA3w
 JKB68fLR88zW/GkO8oDFgi9OtYpcraqUhuzug5whahBykXrDZAASwOiNDxEGtBLMomsZf+HNXvF
 uwS0fkaisFxYk35GqwBRK5oOpVTw/A==
X-Proofpoint-ORIG-GUID: ukk6y6YvNCjSHPaH2Z0nYFriHCvWOe88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140029

On Thu, Nov 13, 2025 at 03:32:20PM +0100, Andy Shevchenko wrote:
> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 3 +--
>  drivers/gpu/drm/msm/msm_gpu.c                     | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
