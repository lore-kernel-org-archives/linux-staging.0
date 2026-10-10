Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE043B894B
	for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 08:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621777; cv=none; b=S1IPrsSieIOOoVOsoyf06s6ipq+qvNyevIkvraqyMy9kfFBKVgYYaciXPz2fc418Z4z1Z/7Y9kmCGWuMnlcwxVVcxhXOjOPX4mOMn27Vu6rbanH1LynnN3Py+W/BA6QNq68dQ0EedSyitFQ1sp3v4mMJfFZQOCS+t4+aCkX8Fd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621777; c=relaxed/simple;
	bh=T0cHhk3sVg14STn5ch68EKKiVtS63d3OH+IINR9SoUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DmbMndmfyyFe2hx9LI/2YTfMRIgCznKX6cYx/zPH5rMjqdUTul2OrXyyJ+iKKeAXWA9PQdJA8+SEHSH1Xbjwyps6zcka3VoDMZ/Q0WDHr0Hp7rPGHiaiEN5jPAyJhS6F0A7oneksELp0qx0Mzxg5ZOY2/QfVXWV1LzCVE7FFybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fo5lzCKR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbbpUFfw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fo5lzCKR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbbpUFfw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A3Ya2D3723765
	for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 08:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqymoQ2HDibV8WA0yhfluVKdlQdB/7YbmVl1gD2ORD8=; b=Fo5lzCKR6ouvQqMF
	AfXvk7qHNy+UGr0uB/I75FzhO/oHguIgOagvJ50C1NXQUikQfyJk79H9vjFIlnjB
	bgTjhV8vSzS4dPkTiu8g6i4oO5GZS5Hbva9CkwhMzsCPgcJ3se2tzthEO1U0YM/h
	qqKO+KNKfG+Bwtqnb1VFRRoze4vVy6qBoY+WTKXije/fNbbTy3NigBrpI1x3+A0r
	uIlAHrfVf71v/5ji4yntBkpw+jq2Bhy0bKyGz9N8eUDWvzrEPHJpKe+wvJJZUPau
	BceKIvfkXsLXb5ZCrcR4QKdS/cROb9qNkdQ3r4GI9dt4fqy1ey8vUMAPPuUjd38K
	cYoPsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk20jsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 08:42:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so77915385a.3
        for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 01:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791621772; x=1792226572; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IqymoQ2HDibV8WA0yhfluVKdlQdB/7YbmVl1gD2ORD8=;
        b=hbbpUFfwAmsGJLXp9DhNx0Cj+WZGTMMDv6IiWWy/uSqYmO3pQp45lKvk0ZOqsNP1N+
         pDaDEaDayqPoT5dS64jhxBnmEVOJd1oWqrBNz3KtJwtlNvxuBX1RZ4HxPo09ERvgkJd6
         1xUS9qHfQa/70E12HHDBJHbdnL2885cwnKFLFRVXlvtZBcLzYPCfHkjm89mTQrLr5jNQ
         VwBqZrQcXEaQJaaP84yZ0gvpew1hdjNoRek6VfiCHkV/taVer3suykHD98oTWo11cU1i
         MguKvKMAFA6FgePe6uUIZll96eVCK7FBHKuNujzl8OBPjZktK7jCkns0xjdC570nj9X5
         adIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621772; x=1792226572;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqymoQ2HDibV8WA0yhfluVKdlQdB/7YbmVl1gD2ORD8=;
        b=doX70vZK797tEvwuBtN6PuuRgK9CxzxQPY/x4wp0Sk+QCJa1VGGmmJ4PRLe6jdray/
         OCIdw1JV7seUIxGWMxsimWL5CSF3EvxV1cjhDcyo7LMDcA903zKP/VX1m3UeXiKn9YBq
         eEdeUwIAQH9lBrkGBXqFwYRcL8RpUwRdAUniQ3Frw8PAHpTGnoIQuGgC54DeYYeko3Sb
         GGHxQBLiU7qrhSPMn5pqib+iaXBi3gum2flJNHPeQXDTZ09Owy+U7Xve/SSU/DAOFtpI
         uKvFF5yCBRJdduzD/imh0MnsyNr0k82pdYYboE5cSUgLuKY6zZUNNKPCM6ZuBNh8FUJz
         fSpg==
X-Forwarded-Encrypted: i=1; AKwUvBw7kS4UfDwT0Rq8cXuXDVRKN/TR/ab6eewG+q2Cp7s6e83FiQq9XNY9HVwUmZXazMmgHv/qPMNrBr7xbSrv@lists.linux.dev
X-Gm-Message-State: AFq9FYIzEuwxfpSPg636sRPdET5RxJSkbZTDol7aV6PUwXMUyWJyQBqH
	USitNGwhhkmyChafLgy2DmQnLUUe5Lpz1hoSxNwOx+3JpxPq+2MlFW0uccFtGuK8NQqyeLsOqVe
	zODzqNjQuwaIQstHYE5SA3AQPoJFcSS6kGWDqwU1sVL98bCX2c8bxZmuN+43HSbczq+Ss
X-Gm-Gg: AYBFou3nd/OnTSGS6HbJlEm/U9+Ls+qCFA/s47xboLT4p5u9gfFcWMYPpITz/xwyAjv
	FQwoBncpZ0PXcwg5ds7wzmHSj4dZyap2aUa1RAnxsczbZIKwKoGbh5F8FYOZ2TiPyOrvl5x0DgC
	GICUeO4djuCpelb91dNpBFUE93yolREObWqojxrH+NUXHHMtbq0y0Tv5c08S3Lglo2aEIijknKO
	eRC8Djx1mrXpDAXBvz835VQfqyZki7DsBho6oaqFa+RMtZL1QZhq6KO+1/ksKuVNahlT0GfGbsY
	zydkan/R4sISkcFo3BmBrrc9E+yg+cLOCto199W0QL3SPL835poadjcFWc+T43Ru7ktO/9zBzqG
	IHhr5y0SqkpovkJLr1zTAE//jW58gPSI9C4g0hx4Ge6uu4o4LNv0=
X-Received: by 2002:a05:620a:4146:b0:93e:5929:f012 with SMTP id af79cd13be357-93ebd1bb215mr668129585a.18.1791621771778;
        Sat, 10 Oct 2026 01:42:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4146:b0:93e:5929:f012 with SMTP id af79cd13be357-93ebd1bb215mr668125985a.18.1791621771276;
        Sat, 10 Oct 2026 01:42:51 -0700 (PDT)
Received: from brgl-qcom.local (126.171.88.92.rev.sfr.net. [92.88.171.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm49065585e9.1.2026.10.10.01.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:42:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Brian Norris <briannorris@chromium.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Alex Elder <elder@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        David Lechner <dlechner@baylibre.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hadar Gat <hadar.gat@arm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jaroslav Kysela <perex@perex.cz>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Johan Hovold <johan@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Linus Walleij <linusw@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Olivia Mackall <olivia@selenic.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-staging@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: (subset) [PATCH 00/13] PM: runtime: Convert pm_runtime_put_autosuspend() and friends to a void function
Date: Sat, 10 Oct 2026 10:42:36 +0200
Message-ID: <179162175231.5836.15015381844446264252.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006231900.3230373-1-briannorris@chromium.org>
References: <20261006231900.3230373-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p98qQm-sw7WqvasJt8buNgsP2JW2n9Qj
X-Proofpoint-GUID: p98qQm-sw7WqvasJt8buNgsP2JW2n9Qj
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6ac9fa8c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=3oaWUOhNWTYPA9BJS75j6A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rmSHi3-zQwwJBmM97rsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAzNCBTYWx0ZWRfXzZFUB/5oTslA
 Ec9+EwSy5/1f0yXeanLHBHMlic2OhSAEK7rETXi710UsqFyRDlLc05jLlBZBoc+dg0CKVxkjUMc
 FmkRLLzdzOkgNskKYrGBdOtEAWQ+ePej5oJwTtXO6/mcRKy8qi8qIxIY4w8QFOMi9p52kqfazGE
 Q+WHvnE7QP2zP8TadCgU/B+r4yl/3jJzWQev3P6iF0aUY6k6z2BWhqcQ4jElHJSOjLemyW/y8ax
 I7l7SkxF6Olfv0anNoWwlgJYl7tkrtEk1iseEBteZX7+1Np/LkxjjkERSMY9oWApiLIS7VZdmuU
 aIpKtTUAfM2vVP0yk91Ci4OsVmJfaFsb82HPNEQdrPjJ3QJkwvuPYGDe5lTsnht70GTl2Li7y19
 e3tYb8Q8qTszDHf9Cj+3VFmm7oqqAJhYK9mWYw9SUGqYMBaBlf6x9kmfW48Xc06+6T58h7hCJra
 v9M92Do24/1qyoDpSvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAzNCBTYWx0ZWRfX9NCPEm7pPk5i
 ZP+xPVqlpgJ3Nq8Qlgadw39bLxSGOK4jwAijy6b635AWUdyelX+0TrnGfiOSysmRV4l+28u9xeF
 BwU5YYOPMy4THhkmFPgdkfWnaYRVQH8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100034


On Tue, 06 Oct 2026 16:13:28 -0700, Brian Norris wrote:
> Similar to this effort:
> 
>   Subject: [PATCH v1 00/23] PM: runtime: Convert pm_runtime_put() to a void function
>   https://lore.kernel.org/all/6245770.lOV4Wx5bFT@rafael.j.wysocki/
> 
> i.e., commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
> type to void") and friends.
> 
> [...]

Applied, thanks!

[05/13] pinctrl: qcom: lpass-lpi: Discard pm_runtime_put_autosuspend() return values
        https://git.kernel.org/brgl/c/9bcd1725b0cc7954525e3d0d02fecaec7c7aab33

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
