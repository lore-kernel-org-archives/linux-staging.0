Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E733921D8
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409457; cv=none; b=npwklkGb/qnLW5PazC9TkYxxMz7bbGptknRYY7Sv5VrdJ6KxVu75CxGf0zhsqa/geeWFtyVBlxo+iffnXCLS14IX5DW2RFuJSQ+5rYV0iNcYZS5gV6TzlKcMQMXUxxXAUeXEkneGMEOxiwAD9AJ6w1QVKkbdOIDM4ctdVwydFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409457; c=relaxed/simple;
	bh=kPh4JRKsDotwPE2S/JesaTmap1N+yj7JN+2zbuQjdQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3ClhtyJZ4scfwJVPJ2V/x7MLrlfIe3bf++fQX9BHcDOTpHNZkOLqSiFURkT+0e+lr0OFCObimPnmUObiY4lG8RJPTiTgcAH+A7vU3Sko7lHug1nay50N5omnfb2ozjkgBo6ljvw4w19BjvMWPko1XnCUM1xMYJvDThbCchq/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtbSMsLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPyrClhO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtbSMsLt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPyrClhO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA7siL1749244
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 13:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=; b=KtbSMsLtNsll432M
	ZTzKQXe8T/DK/n7b9XjI6u2X8hEFxS6+vToHFGAIETMkOYmiyrVQx1Ron0HTNUGw
	L/7hqLNFcZtO+7ieK6wWqj/GrMcUMTkirbNDQOXKEyEzX++Y07x36vS4BckJkiBw
	i0e+TKFjJYkL6k4y12GD35M2kL8ToRgaS6v3aDis+sQW046oTfw6VRUKYvC55XyU
	GavC+gmfdoZZxfCSN9TNUX7z0/IKdGFuTV1BuxzhmfyaKB9OzNJ/1nmkV5iIg9BW
	H8cIWU+Z3DaF7xCU6hevUNHgxDD88Y9uGNl2srLPZ4lN68ffEs3Qj3IQtVVXyVOS
	oZVnQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6gnxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 13:44:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7ea0bb20so1203276385a.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409454; x=1774014254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=;
        b=RPyrClhOWhxmjV5WzrbWEGfEvIkbDQlzx+G5gmlmVCKr9POmojEuKMiYfGobZ/2ruA
         0AcZhlgsgxLt2ZFNWgs7PPT+YFvCj87jQpp/FCcl/ZbTSCE5B3xJ1LR7vSz9v9pWZPrM
         NLb+diuKDi1SIMWJ7K5j0wVgaRR4EijsbVLQ+wlrKoe/iYJf7i9/0lFnc4YVTaVgO+AA
         UNDXRLQIaABOk+HbuljorZOa/IKg4lpjiKrg6pEH523xTN5S9D7c5hUI2EyiNzNscPre
         xRKIEpN4vixFxeUF6/f0msLDOY0qnbaw/lEgtFfewTnYsSewioKA6YLMxJEgUJpAdntd
         GTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409454; x=1774014254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=;
        b=S7XSvOBv2kklIzCL1hEM+lOZ1vBdGhR06z+W1d62D/9zDXVhSxLTXWZ1ENvSci+FLO
         WMIIorXxdPj0qKhILU2doLNF5im37y6kvq0kY1ZltHbrEtDM4c021QeNKRV1ZTPS7LqR
         1SCzEx07F0lsLb6Wres45PE2NNXsRvE0JZ6EkNcoMntehamBZ2fNSgKzYY+75dzaOwGq
         xAo2Ek2gCfEu1ZV9QSBGnoIT0LspLf/obaHYlpKm3t6hnPRExDzvu+iSQN/TZHwJ7GOr
         4pVSIFsWOytJXIqxbDnQxzsLK+ouP2BXuBHeH83F2Z0ZaGgqzmLz4xFMDsQqAcS9WjgY
         8NZg==
X-Forwarded-Encrypted: i=1; AJvYcCVwVj7ruRstNPTEAI789KxcplgKCBlCNvGTMrALKgggZXGAb5LzLtoAa4Zd3jgk3vgwoTKflXIK39hsrYJh@lists.linux.dev
X-Gm-Message-State: AOJu0YymBoFjvIZdwZZtw6KsSEryKYcXPjk9wOq6+N+Ss7UJjbQlfEJk
	MRSUsuxvJPyGRTT0xbEo4IZFt8EwGLamj9mIICZoBJ7C+1Lv5mcURY44DVKpc+sk7TA7wmLVrgQ
	Rq+YGS6PCmTvvb06U5UZeXXr7SZkAcyvGW3tDF1xl/kdMqbquMXHeGwlciA2DfO0pv1+h
X-Gm-Gg: ATEYQzyro/ZAeQFCwsJertvXBREATikxwxXTMQt/rhSZDrGXsDv/UIK5uhG9IjWGjaJ
	in0IJ94XKbqzPZK6sGGxG0IB0Yu4rGwobLlGNcwaroZhFCFyzo/vybvdiw5qoTIMKKUqFCxurUJ
	blfqnc5wss7w0fdVFihpwNZTk54sydqgF6IGsqUJfCgHPtfUfvNbog/KcoOxfpzpfzoKgZn8IT+
	r8bS8nNVqjPMoalFI9bM7Jk8bHVeQKRJ6Hz6RL5AXNEemlD3lgUrGfbPYKhG1i2W84a27WovWQn
	OenPD/zwO1ja0pxCgHglzt7n7f+IftNtDZUoZspst8ch7xIuXJMcQNN/up5KlCEyHshToXOf3e0
	Ujlux+TEa3nuV93m+Vw9EFI4jG4UMj+R0VghHxZpeEjIriusQt7A=
X-Received: by 2002:a05:620a:4623:b0:8cd:8fb7:7aed with SMTP id af79cd13be357-8cdb5b5fb55mr457721485a.49.1773409453973;
        Fri, 13 Mar 2026 06:44:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:8cd:8fb7:7aed with SMTP id af79cd13be357-8cdb5b5fb55mr457712985a.49.1773409453455;
        Fri, 13 Mar 2026 06:44:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:f055:6536:e7d6:661c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b4dasm17696873f8f.18.2026.03.13.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:44:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH 00/14] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Fri, 13 Mar 2026 14:43:53 +0100
Message-ID: <177340937994.51547.9424773605486301589.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwOSBTYWx0ZWRfX18R2oc05ilmt
 dZWHEceHUTVmrk8pgGZ7YdL9vLIssAd8wlZ4XFyuHlEVi8/2y1e6RX6XFdL24hPOHIenevywfZ8
 7FYgfFc5aOICgIqeICn4na38zaalZpabjOP1sBrt3CLQ+XoHVLqfGpsYuujmOU6qzb8EztiOLRZ
 SUq1IyaDOgTVBoqbDalwsuRnYcQyMMfhSviJTau7PX/SVLVzxgt72+E3BneTw/66sGYrIss0ShN
 V9tcsig2SHDYezxVmyuyAsfhK6JSRwxRflHEybsj4LtHML/IZkCRdzEVCVqH22GRHijnc+vYZGs
 3yNP41iGlTUL5SkI/6jdG/1+D8G4Tg2iEsE7IEFzcj2WecnExxsb2QUqux7Nz0ygIEo2WU5uCU5
 mV43eVaEm8f4bDEH23zTBjadBICveecysUssEPGmpApGSFwDs/Tgpn7xdOHA/ZrUtZFtyDTfjxg
 syc2k8xX8oWGc14XBsw==
X-Proofpoint-GUID: 2zXLebHwRT9UARi0eS_7EFvrdkiEUjeO
X-Proofpoint-ORIG-GUID: 2zXLebHwRT9UARi0eS_7EFvrdkiEUjeO
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b414ae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5BVL746LnNak5i1nQvMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130109


On Wed, 04 Mar 2026 10:02:21 +0100, Bartosz Golaszewski wrote:
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

I'm picking up the ones that were acked and will send a smaller series
addressing the issue pointed out by Guenter.

[02/14] arc: axs10x: drop unneeded dependency on OF_GPIO
        https://git.kernel.org/brgl/c/d2cd20f7c2a4e4bf4fca844c01e925b112c5a2c5
[03/14] powerpc: drop unneeded dependency on OF_GPIO
        https://git.kernel.org/brgl/c/dd1cdfb20e44e295512080dea508771b6a1f1c0a
[05/14] regulator: drop unneeded dependencies on OF_GPIO
        https://git.kernel.org/brgl/c/bf017304fce10933f18fafe140bf749fb9672058

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
