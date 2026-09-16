Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9F249DBBA
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551417; cv=pass; b=bMZO/b6ofIuBFp+GnBKbMELm8jiTRofFiz6lNCFOsZGEbdK3AWRo4KTBD6ju+XFYGtIa4mkz4EHuBFmCdHxs+2FqtzCxYYEjQJGHBDiM2Gld09ihUv1cJtNc4zQG8tUESV5+9lirvNK5KrLQAPFlmbv0i3blmhhhVcq6jM4cTAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551417; c=relaxed/simple;
	bh=c4DGMrBsMajbdwdD2OhI60qkY8BD6VCk+Kt6O56KwVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irQnyPgs1Vyd29iKVmpITy23FmrndhwiBKyUD3XU81KBRC1VZbop70W2pta0fMwFsdY10OqrP+SHhwcpMUdTLh5qm4mOHv3sWzSuXI6VEhZebGC9v105nahJNnSYxrOVKMgvv7/OqLP3dSLZF4Tv3Kx8N7FCuE1UkU9KPNlRYF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5b7xWUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=As7Y5FB4; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5b7xWUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="As7Y5FB4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92sL41552927
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 09:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4DGMrBsMajbdwdD2OhI60qkY8BD6VCk+Kt6O56KwVg=; b=T5b7xWUyo3gy4Mx3
	20mskpuJTgh7bxXdtlpKH51GqGVtfIjbL2kmUuHDlO0/r2MIShKC4HSc2oNWzVvq
	YBHrhSJ7opl7EvI3AqgwPZMM5eFcY9xL/ioamRPTxFIoP1pt50KDzIG4xaM3H0Kk
	sbd7If46Re8jAC7MEer5wfJkYyCgoBSygZdwXyQunmM3W5uI0oG9mgWNuEI8OVnN
	0+m2W04sMDI5vG7dMHBPQ1ZvBpUIX1lR2zAaXZmWVIVdJvUyJsdOh9KVGw92rQDh
	X4prYTP/uOmFbD8xg7RZjryF5cgIMV3psY9wdCA1Vl0fd2wpAxdDPL4ZxvXFsPzV
	ZV4vuQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n63wd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 09:36:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso72409165ad.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 02:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789551397; cv=none;
        d=google.com; s=arc-20260327;
        b=sw1sFpo6V/vGsHlL/Lbzqv+hePdXlpTyrehIFr2lAnSJwZgehCxrPlWPBynDz0LD9O
         yn2dPwpXrXlxV4yKfUOhxn3hq3wPapZUfQJ2747E9nFdTJOqpVx/gRiNvBszu7bpe72p
         Ex+b1xLMty8WU/51BYnHmL4oQwvnxA+tKTNtgWpIcv1fg0yKpA+TPbhZiA0rdNDXITzr
         GjLXU/8+spOOVI/9pxvFnmrk0+Ed4Pcl/ymlaCmWuf7uXqx6GpKEmEpNWrJk/T2P4Xxy
         Dh5Rfg6eKZ7fqDBC9yl5LNFgAHpvY5ifAOneWpsRjIh55zyR3I3hmh7sVW9C3Si7fBp5
         EbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c4DGMrBsMajbdwdD2OhI60qkY8BD6VCk+Kt6O56KwVg=;
        fh=+VKFuSlWIjCoc3CKV65VpyX453eWdEmDjCvs2cPR8eE=;
        b=pJtU+psd1eZ2pqEWQwtNREtfp+eAj38sBoLaPG0eeLgUXmrD7IClj37vRn8DQEDfht
         Oz9N/mKNhtHSbuYAtJQJAvqnb75NhrGWMzbwU3MZoToysY9pH11QRzRRN2WjQf4QU9iP
         b1kMILO/z9VN/73wCuVDBH7arJlZB+kCRoFLsJqaEclv9+gElgjgpfN+4+187CRBVdXP
         91YtD1oggeoa4h4G5RxDTQCM7lJYft6MV3HIWAXpu4M6oDGU5ERJ0cUQ6cEvrvsCPD8l
         aIl+H1lYBRXFEB3h8DkXqXVh22KJse8ETuj86Kpb86TffffC65pP83O1hVLfxz691f5p
         YYmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789551397; x=1790156197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c4DGMrBsMajbdwdD2OhI60qkY8BD6VCk+Kt6O56KwVg=;
        b=As7Y5FB40NhMBW3ioF6Gt3kEdK00FE4c0+lYPf6Vhv90EQwqjXyBM/VHmdv3S7l2Rm
         jDNkj17m3DIhuqCQJLdU8+GXhFkz2NkvWToBvx6VdzBP1/ha32RUPvmUn6P6k41+ex9Q
         0UovSZ/GvC8fduge8Qp85XCPG8oVijwfmk3t8Nryx46xFui+2pTYIshCZZf+BOZXJoIo
         jLi2sCQPlYQZiuqe9GX8ae85LqgTXkrjC2NZQeIaRqRhKimjqXx03Mc0WwoYTUejPy8r
         6/LKrAd3uMbQdWbz9Lsu5J4XBxreiiHj4DTYgQvRhjNVNkOlsvVqYkH2vRu8NSC5rJ1s
         7jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551397; x=1790156197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4DGMrBsMajbdwdD2OhI60qkY8BD6VCk+Kt6O56KwVg=;
        b=FTWEJIeJ2pjp/qUXiqSSlpY0T9EcvQqgKKj6zUragLfvJl2WAuxlMuFnUKP3tmgv2U
         Micq3u0QYbVbStot8k/hr88w8kLvMYYXcYH7H/zK2r0Z4SIUmFSUzb1hSIKf+R+yaXNw
         W0Gtal5JTJP/ZJdrNSdsSTkLSzwpeyhoY8aSt7KeQRM/ANy0SDQgcs7POKQ4cperqj1l
         dwZgekL+sR0fMDdy3BNhoDQ4PESiMKrw3XE0XcOd4NZteJ/+sSPwMbxfYK7Iwp8erXhG
         g207WHLTudL3dWrZpKRfLTODxoGGgFHkJtUong7IIdXZZQTNPPU09xGlUuiwYa103qv2
         MxqA==
X-Forwarded-Encrypted: i=1; AKwUvByOv8TtYHE6x9FJ0fw3XwjCUjp035B8ASeL7MrE3y4s/vaXzvxXkoh/t/mkR+dLrL+SiYcTG+Hu1LL7E+FF@lists.linux.dev
X-Gm-Message-State: AFuF++mJoG7WGlQyCYTtkfO8siH7LNpAdstjbpTIOeKmtYwRQ+rHuwjp
	bC53z0gUV0Sisqp/TpKGL6sLk2kMQ8/qNm+SIJOO6hiJR0u6Kz4POLqylWpJEBa6ly8DLJQxpRu
	Ek8500T5iuMyUhcGH6kaRBNrv5ttWXqB7ITK/FuKQgvbKiuyz4YRcF4xsdwrziPAzHldyO6TnSc
	4zEZeclV/NFBgYdqG+il74lhVdOCSBczRu/KOiK8Arbi0=
X-Gm-Gg: AYBFou01uzLWGdP4RPxZVTqeqmBeKYDvMcjG8FPeG/WXvKsTqLEXRo4ZpY6L0nKAU5I
	aKDf+lg0oin4fBAYbGYjvdzMcgJUARFJJPZ7YSeF18tieY4up5xoy2fzgKNvgash90bwMSiz5FU
	9RDXEGOROZOdgQ+uZwbOs5EWJ04F+Nqd1GMYxeYJOANk/UwMDTwR6uBW6HRg==
X-Received: by 2002:a17:903:22c2:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2dd8e52c3aamr36286965ad.15.1789551397185;
        Wed, 16 Sep 2026 02:36:37 -0700 (PDT)
X-Received: by 2002:a17:903:22c2:b0:2d9:3083:a3ac with SMTP id
 d9443c01a7336-2dd8e52c3aamr36286545ad.15.1789551396701; Wed, 16 Sep 2026
 02:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
 <20260915132052.273212-3-ulf.hansson@oss.qualcomm.com> <aqpIl5NWCFiuKy9b@hovoldconsulting.com>
In-Reply-To: <aqpIl5NWCFiuKy9b@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:36:25 +0200
X-Gm-Features: AcwNN1URMFDti_qG_vPpRruVZwp168EX0dKhlyzlmVzuq_rdnS_nPLrIHlUnh0s
Message-ID: <CAPx+jO86Sy+of41dw3Gi5CNfyc5+iOyDU4CZypz4YGzG27QW0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: Turn mmc_alloc|free_host() into static functions
To: Johan Hovold <johan@kernel.org>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa6325 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=NPqBZDST3jB2sRw4lm0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEyNCBTYWx0ZWRfX4UBf76PUq1zl
 lkwQX0+uTFsWcaQ8pP0+YIgFgjFPmgCR+L5g/jdTdpYuaT72p9i6jxOscjn3OssFWyaj5vFYKzx
 BGvwDCctF1wKjsVe8UNPflGQKl5L38Q/VEe1j0ZG5b6D9Um/6oMJ39XnvvmFSOrrW8b/8G+iex/
 IyjZ0xcaXskQz4JU1OSsHlSotQuJTydB0fLwTeWn/JzBY9CkAvY1kzPRvkH0hUCMuQwr0nyIKSw
 zBcevV143BY6Ogssm48U4NKH9XgnP1adCQoW/wMpnASSQl+twS4xI6f0kM8Py8bfuUQ+mqnZFG9
 I59QO9PFAIAGeaRVN7a+xX9283bURzeXWi3bAY9OIzZ0YhkZy5u9rQFvXVwsdGfnOm2kYajGvN/
 VqFbJ2G9nc7/iTexdgJ0lFHDleg2o/Y8heTkgPLEjWW6mmau1Epmoru3I5hHn8dyTXOuARSxWvo
 3jik0yp9mMjYON8JHOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEyNCBTYWx0ZWRfX1AQXVfnPjLiQ
 Ir9nDkFgYECCAcowwH3ySTZvtGTKk2jADM3fWgGqcH4sjAo2joAhlglT1F0XZ7RXpnFaUxTlcp6
 TuuW9hyUq60SsRe4Q3DQCbQGSKjXbTA=
X-Proofpoint-GUID: 6KN60BxPl9SE8V86RcKIz-c9nDZMXnhg
X-Proofpoint-ORIG-GUID: 6KN60BxPl9SE8V86RcKIz-c9nDZMXnhg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160124

On Wed, Sep 16, 2026 at 9:43=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Sep 15, 2026 at 03:20:46PM +0200, Ulf Hansson wrote:
> > From: Ulf Hansson <ulfh@kernel.org>
> >
> > As there are no longer any users of these functions, let's make them
> > internal to the mmc core.
>
> Why would you want to do that? The devres helpers should just be simple
> wrappers around these and sometimes devres just isn't a good fit.

At the moment there seems to be no need for them. I would rather keep
API/interfaces as simple as possible, so I prefer to remove them at
this point.

If we see a need for them, we can always add them back.

>
> Especially with the work cancellations present in mmc_free_host() (which
> I have pointed out elsewhere should not be there), a driver may need to
> free the host before tearing down other non-devres managed resources
> during unbind.

Can you please point me to such an example so I can try to understand bette=
r?

>
> This may even be needed for greybus which currently destroys the
> connection before freeing the host.

I looked closer at gb_sdio_remove() (the greybus sdio driver's
->remove() callback) and I think the problem isn't about freeing the
host.

Instead it seems like the call to mmc_remove_host() is done too late.
To me it looks like when the mmc core tries to power off the card
gracefully, through mmc_remove_host() the driver has already moved
into a state where it no longer accepts any requests.

>
> I suggest you just keep the non-devres interface around (after updating
> the prototype).
>
> > While at it, let's also flip the order of the
> > in-parameters to mmc_alloc_host() to be consistent with devm_alloc_host=
().
>
> Johan

Kind regards
Uffe
