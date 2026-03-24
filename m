Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225C43DB649
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343075; cv=none; b=GSt9ydHHory3vRsMwBesjWrv+kEjEYV2eLRaMe+6xr/dRc+LszjEutERKfWeoBASuIBGq1yEfxSbKBuTdk9DXOGjttzF19lBlNFk5RtJ9N4rd++SiuIJMqtLYMk62RgXu4/V4zIrFSlpXqV6Q0Z9Z+F0R/bPqEgJckqpStJJD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343075; c=relaxed/simple;
	bh=jsWgh1Ti4adaFW3/HADaqw2MCIKnBpjGviAHd/Q/Jb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjSnZvp/J05cUi1b7Js5wDfD8lxf8JnKJ4/1R2V7OzCKnJDupuXZ7+PldgpPFVSMLY+7hvWNhr0tnJHbqc+giT+jPvRHj2fNdzBq3FR7ZP4TCkmIxx8okzwv8v6rCCliLU2wC2MbTiqzeKllOEQomRXa1JflVT2DJ3VjY9tFu0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eobWxcRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXyOlOhC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eobWxcRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXyOlOhC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O6XXLN409069
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 09:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=; b=eobWxcRqzLnx6L7E
	Sf1sa9GOx1ymukjiv7nmvyorMZyFEEEIWs5RIwb9MhQ6f2z/otzZBsq8jJkDb1uN
	rVybLrcZFmWgBaVQEKfGaGdmCjqIkTL/rfzcAy60xjCyyad/DpMXyVq6ZdoG+0Ia
	wEQMp0mCSpTNigow6FiwQ4SnRpux5RaoBsg3nhVrZjRIxswYoMCF30A9N/gR2UrV
	nNnicvThy2P2BYx3zvbu6YRcY63WHOOlQBb48RRhCsPT5JbQaRR0lW1OF6ZzCZE5
	rnqUWAbSs+lrAlApu0Io40IGtc6+u0BehQY9LiRi21gOw2zrXLE0Ym/0KUY5enIi
	Bxz+2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexrh2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 09:04:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so221520731cf.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774343068; x=1774947868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=;
        b=BXyOlOhCjECJ//kDSEEDE6r8SvXkJ8MlVtPP6ZbobUvNCpj3m7hGHQvdQJQCfjC1Rj
         96Knic6cvyDt06iI03rrY9XkhWyxqAQ6Cp5/sLmJVfWPa2mfnPT9L/AEaRYclGx22gfW
         v2n+j1eU5zj5KlkTqciIsIEtQ2eqnyp7020jk9HfSAnqjbhDDBD8Zuwe4sIaIWDPA22I
         7n9EC2X/12DuBRt9FH0kK6siUiHAM/nIh+4PbF7CdExIVj3wHHHy7/ak61iqOALLbaTX
         n5rbauod3P2LgNJBMfJto0MNvJ4AcdAQISAvEeTQFNIRjHKounWa2aa3hB9khTwb4Efo
         U1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343068; x=1774947868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=;
        b=HioB7teXiOw0mU5k9Wx8gcb7hIz/g5ZfvA+l0Xcm0CZTLQzrC1iucVsli8XsDUlcFw
         veRmQiZNByvSQnidYsDnqdhktXs+iN+WGma8Wp40LlaKR1xc/ykglwNQ2amihO8ppcY8
         Kia/xSS35GyZoFrx96czNtKgRrPae1q1Un/L8ZrSbWzKpSF9Sz0nVIn7QSXDjBx6lKeK
         NjvKAUDtCTAJhDI32ZroxxDSDHZ86tadxZH/11CXCXG9zDR0Xi1fpATPXhpVWGSPumSb
         D57rEE3enignd/Kjd69D/bA2vLLiPipV3ED3C/IHsMs1nja9MDWl+T1W30QLfTrV10Zl
         QMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0VTu5adIWH9Z5lxVcK7MWKVXXU9fO7PKiA5cnTvoLMy2YulNbN0i3xclFQ/NwrLzS+3p+TSUYH3Un0gBB@lists.linux.dev
X-Gm-Message-State: AOJu0YyCYMZoXIupIeHwL1MdxUGJGkkaUGVuDVSh+xhQB31C79crGpdU
	fOZzZW16zi3CA4GhQrFJgDBF+/0A+Qn3kunBeA4F6jf6SP8TwO0/XSlC3AkUEoL25UmThEXvg4V
	OrlwVNQRXwka73MzVRtvZDknCmWn91gBnIL4WjmodU94g15xQHZG5xmxLrqOi+UoFalC4
X-Gm-Gg: ATEYQzySA6jdpXGnkxcjOEiJLGvdTOs9T0zxZ7Kf27g3MpukCUF3WNrAMnjTjLPbHJz
	AiTS2lTSkjDEoz3qudkpE2eC4wAdnSNrQ708izW7wyFeEKZ0DKFiSUiKFOlWpQ3UXr3pAQNQF2U
	VpJ5bYN4URk0QZwjZmn9tj+iElfRgPGHZmlMW5li70dVHIBaFST0IFNvwzgVlvLHwqVVKCGIeRR
	HyzCJ4QkR6WRGj/sutcYr/qoXi5v/rSJ9+ewGDNJv7WWm63AOTbw3GRu5x6cUBnU2OLULV/J+Gw
	DtDJBuJR8Kr6RYJ4Y3fA7WZbbHl9mtMTr+eybzb8IQE0Givxecci8DTJ1LFSl2xY3wxeKZ3QztE
	K+op5saWPT+lYdBqBspegD49xabmr1JjXArF4jjIkzYVOJkF0c6c=
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr133853111cf.11.1774343067817;
        Tue, 24 Mar 2026 02:04:27 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr133852721cf.11.1774343067138;
        Tue, 24 Mar 2026 02:04:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:99ae:5c2c:ddf7:d77a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c086dsm40007565e9.8.2026.03.24.02.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:04:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Tue, 24 Mar 2026 10:04:24 +0100
Message-ID: <177434305814.8385.4412622204610388581.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3MSBTYWx0ZWRfX3A6myhmxOHDu
 LeX1xKNnjZQ/+65+698f2SZAN/L1Kbl5AIIxv4qzb8jpLbIpO8U9Ox1AQkRKO5/TAoO649H32M+
 19Sv32URrCaNfJ5AKVZ6atimjquqY/tgVgwuJnxgIqFb1BJauWo502c1RGqSxUEBKR55DmacA/T
 kPb+SuP5CRjxCgwbjOv+EKTpdXdrfvQPx3CN0JW8hdGo+wy34CCT6CplBlvlbYrYZ1Tx25G/zY6
 sA62hKvx+a/p2wk2AqpYcdEVskiLmEFJqdsf9g2qMN0XuvZEzNHp0DPXNUREy+CSuBSxi5hAt+T
 ClRSuBxRQaxJH1tNyBzPTCLpppWNwFHkPnJ2KNo9QNaK5zg5UU3NTQfu5iCJ5EyTOQ9a9KJLqcy
 nbet1GRaDAcjpfmJyR3WHILqZbt9X4ERAGfla0zLO0c+BeY73xjRBWjWGVHSDZv1J4geMpbv0Ei
 voNCkGSJ9/advkrghEQ==
X-Proofpoint-GUID: 5VU8jU8YQ--ZOPQ1MRjWB7-dHlUOVymM
X-Proofpoint-ORIG-GUID: 5VU8jU8YQ--ZOPQ1MRjWB7-dHlUOVymM
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c2539c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_HlkyUIfcI8kue4dcD0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240071


On Mon, 16 Mar 2026 10:45:20 +0100, Bartosz Golaszewski wrote:
> NOTE: Each patch in this series can be picked up independently into
> maintainer trees.
> 
> CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
> module. The module itself handles GPIO lookup via the OF-node tree and
> is automatically enabled on all OF systems. It does not export any
> public symbols to drivers. There is no reason for them to select or
> depend on it in Kconfig.
> 
> [...]

Applied, thanks!

[3/9] gpio: drop unneeded Kconfig dependencies on OF_GPIO
      https://git.kernel.org/brgl/c/7803501e5754dc4b295ab22b20562e2b965358ba

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
