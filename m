Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7656533D6
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813084; cv=none; b=T3b8wQqQueSgRMPTCBF1Bf/DuusE+jLWpaoNM+ke8sx+WCEq02ik7CpwovVVqBnrH0YydG/SCr79oEPLKTJS0ZwAkI2i7C0nv9qyPCPdYHXExyjugoaV2x4OgLPL4rirNdQjYAw2NP4b0Dz2faXODuX5Uq+SFPcNcBK9VQgOgSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813084; c=relaxed/simple;
	bh=rtTI3U1uKhplVdY0K62ki4RZ4vdy9KQD0GTm8yMp7Lg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LyWr3V+0j8s9PdcDuzrWtwAekx5NH2PSCnzHSZFOCdtj/Cf6bIRvUgU+NkacFnYa2JJwLygaIezXKGeMRK//t9pOYHuai7hlKZzfHOgUTPLlg8ZxuEgJG0WKa7C8PQyYnrp9xbkCkWMo+pBcpw/6sUCK0AnEIteLU6jRlwXVjKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKt10MGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HrXUX8x+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKt10MGj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HrXUX8x+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BBRjh63204222
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 12:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7pdHEvUCQ6XNAHV+59wfpRIZXDYk1ukxnvRIKuO1Ug=; b=bKt10MGjX4+kUzG/
	M09O9FJ97LLUSiysPeM2NwtO9vzRxTbeXxFHfvojQ6G5OJArDJeMKybP0EHBPASr
	OFf43zn6AzWP1xC4ErZQCCY4B6apd/Weog656nM46/NFmDCl3ausVeDCtfOmj3vz
	8cyvRdTq169kDL8gyYermeK7QC1O2bGDC5ylEhuOxRdLAe8oy9cOWj3j+jkN+loV
	WsiviUendjc/hzbaoW0Ug/f0exAClCt2q2GwuwxFEf2UGBNb4+q6e2HRudFf6DHI
	41HgzXhBX0XqXbWDOSEDCXf1zRCw3ek29a/cttG5MHHiM7O/hgZGor3evkJ5I3PX
	Wz0+1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c894g38hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 12:31:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a5bc8c43so2043579685a.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 04:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770813081; x=1771417881; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m7pdHEvUCQ6XNAHV+59wfpRIZXDYk1ukxnvRIKuO1Ug=;
        b=HrXUX8x+vVt/eT3jUS15h/mVxWu/E4jW5LpzruTidEhKi44vmQqG9XWSE1xB7P57g6
         Do3C2JnS23P3LVNn6CQG5JvLmmu6lpt8+Nk14v/KbnsyZPv0Bu2p6EH6oKzchqyGFpN1
         7yyhs6D9Gwcscj3xwnimnwBIzGoSe+G7Tvg+zxnCUx5sKsyauTfAzz5QkCGTkwCqafpD
         UmRZLE8qAl2tmshxyFOZm9SOo/24WF3YIAKysHC229Mn93Vnqp+zHYsaXGrrQk3OnWz3
         kMXjw+M7/xYZwQp4G069W0k+Zae8Gb0s1vg6WuwL0noCQzUSyGNZQRd7dFBHvpyu8xXk
         4DVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770813081; x=1771417881;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7pdHEvUCQ6XNAHV+59wfpRIZXDYk1ukxnvRIKuO1Ug=;
        b=t1EiYRAI83rgKQ8ymm0NYDDXFaO/vdtoyBgNTBb318HnpolyYzaeB2RJwt1/0+6Moi
         P8NGubjOGexHANTJRAHi3tFevTR/mE02tf6JHYoK6nNHf+zPWM/by7/olqtxYjNIoNUC
         OcVq2EH92cmjPuf6p6AbmdNn7uJnYgeQHJBH0fDKURYeEoyikpLIRXwty4XEGfJzTDYM
         hmLQcJFz7S2EX6QRPkC59/+RfytpLbWijh7yOXmQW4HX6FOZ1ujebrj+5Ry2WcXhbgv1
         fRNYTczwSGZ/m4aW0xp1Ty5KTf87OkNrWQn8R6L3E0Ec9WRJWZTzLPhtkOip4t7Q2X6/
         ALYg==
X-Forwarded-Encrypted: i=1; AJvYcCVYrRWHF+XnGLtvHefchKxSXWymBIf+OdCWjcScEAJVOXxeHghtJ8XpYzvs+lXXd9ON+vtrbqVoC9WI/kii@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc5fRjbO4vvP+NuUWD/swVU6CuZAkzBJM4y2q5RwCKI3fdmSjI
	sOBPd/xiYR55QIDW9rlbSMZcnRpfY+Ulkee7dBqLPAJvoKdfBjCUSE5c9k/aAQnn//sv+xFHbJh
	UyLdm9m6qdlcN4YfdbvmYVk5isF8EC8i+vMEd7LhCBBfc25LpcYghu6T2PeQuTvfrKU76
X-Gm-Gg: AZuq6aIhg4A03pow+YrslzPVfj0bHzdQ4lBAuj2UaddnyNz8JuRllZXMATQfaEhUb11
	c1t6fUerddVxqG67fOZ0uoGQJ7cKPFLFuCAVnujnmsDA1dbaOwPcnUHcG1GhHwBeM2pTTCRqX9a
	ifNmIJ3Ra2Ny+Ps/urJCjI/Z8aQ618IrXW31sa+FlzsJ26cr+DhRKVXBpGLIX3xBFUhYJfRLFV5
	OwXDU5DsdkkRifUFXPsYCM7H7+eeJTXI7KeE9q2L4ZRGUagFzLqiJzhNF8ya6i9AfxQSs4DALn7
	BcX9g35QY+WF/tp73GlYidNZRzRxt3v+YaQyzBtlH8d/uVgbmtFJahqZXJEnr3H4ope+KEQJSR5
	yIUZvEhtjHlC1aEazCrEjCcb2ck9xo/MK8jp1IK+Wj2f+EiZwfBiqiRxs7YgE6elrn2iRaG2Qkv
	IiRm7o8WFqFEBVLUYFu8bntS054/QW+zLv43bNVatbm7ez+/Ncim8OHbCYnz7ksnvoFSMeUh8vG
	nR7Rcm+7VfFgz71
X-Received: by 2002:a05:620a:d96:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb2ad1a73dmr171488685a.72.1770813081046;
        Wed, 11 Feb 2026 04:31:21 -0800 (PST)
X-Received: by 2002:a05:620a:d96:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb2ad1a73dmr171484185a.72.1770813080420;
        Wed, 11 Feb 2026 04:31:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ecadbdasm54261566b.62.2026.02.11.04.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 04:31:19 -0800 (PST)
Message-ID: <83b1b61c-828c-43eb-b297-8e4d8dc014be@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 13:31:19 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in framebuffer
 conversion
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>, soufianeda@tutanota.com,
        linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
        linux-media@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
 <aYt-vrc7h7CJOmSu@stanley.mountain> <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
 <8efb3705-42f3-40c5-9631-d72eb2dda74a@oss.qualcomm.com>
 <aYxqjBSI-t8Jk9UF@smile.fi.intel.com>
 <b8ca670f-c45b-487e-9e29-2b097c1d5c17@oss.qualcomm.com>
 <aYxuCyTizpKM4Ul1@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aYxuCyTizpKM4Ul1@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA5NiBTYWx0ZWRfXxgE3U0Y4bBV5
 7bUCod8nEhIMXkCMvVLx02xmFek0LP8QvNuOzsGzxo/LRzWh/dV2Cvnb3b5Yk7nCP+oXKa1OaL3
 dXHZrkDQO6mvK3xP52TzAC0jW/FBrCJDPam7epIeo5NFNfFR1XwHiltc7A0a0yloA09RXyO9NH8
 ijM6/FED/GslTl/Mgxb1hhyrtDTR5J4c36R4NrQuOdT72ta3yA9OIyesVEfyzPP12UfXiCJ47LA
 /kgpKhQi6xjqhMeXaQJxYssSFwkRkAtM0+w1J2okNiwYNO4qhBrMYhPxcAOqW/5P0inwGe69nzW
 Z5wJYpVuYDyGQLnwHwvQcsvOtonZ0tFtz0a9+jng8wc4vEtQ3Ct961uLSLaLYeZHu9nIQXZn4XL
 VOD6NboDtYdo/RZemG802osPljJEIOekIUaSrN+IvXfDC9Bl6njX+8T6j3gB3gTVE6+5H5iVFlo
 CMrWjsWG7bLn3FRPXHg==
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=698c7699 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=_uN7KCINyXfYSksNRHIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ey7VCxkrUAF9oC4KtvDQdoRyOMkL8Tk3
X-Proofpoint-ORIG-GUID: ey7VCxkrUAF9oC4KtvDQdoRyOMkL8Tk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110096

Hi,

On 11-Feb-26 12:54, Sakari Ailus wrote:
> Hi Hans, Andy,
> 
> On Wed, Feb 11, 2026 at 12:50:18PM +0100, johannes.goede@oss.qualcomm.com wrote:
>> Hi,
>>
>> On 11-Feb-26 12:39, Andy Shevchenko wrote:
>>> On Wed, Feb 11, 2026 at 12:28:35PM +0100, johannes.goede@oss.qualcomm.com wrote:
>>>> On 11-Feb-26 09:11, Sakari Ailus wrote:
>>>
>>> ...
>>>
>>>> This will cause a bunch of code to turn into dead code, but I would
>>>> like to keep that code around since when we add support for
>>>> a parameter buffer queue that code can serve as an example how to send
>>>> parameters to the ISP.
>>>
>>> But it's forever in the Git index, we can remove it, so it's just matter
>>> of convenience to keep it in a working copy (tree). That being said,
>>> I would rather drop the dead code to avoid a stream of not-so-useful
>>> white space, style, and similar cleanups.
>>
>> That is a good point, dropping some of the dead-code stemming
>> from this is fine with me.
>>
>> We should probably stop pruning dead code when we get
>> deep into the helpers to pack things into fw specific
>> formats.
> 
> Either works for me, however the actual IOCTL handling related code
> contains less redundancy than the rest of the driver. When it comes to this
> patch, I'd keep the changes small allow easy backporting.

Ack, as said we can start with a patch just dropping the
default ioctl handler. That should be easy to backport.

Removing some of the then unused functions can be done as
followup patches.

Regards,

Hans




