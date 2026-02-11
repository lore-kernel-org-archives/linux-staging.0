Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562FF28D850
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810623; cv=none; b=u8mSFT7hw7T/F5fDmjBpCGs9b2IRXNO9h+F/v4QtCzoZGjaSgM12kv6QIA2i2dLGw2Jfn7M18euQiAe9WJ42OlzWg6r8ImDUyjwkIaYLN3F403DBZoExGDFNk7hLHGhvNcK/ndmSt3O/V6d2VsFQnHvr9s6RJx/OOAt5gNrsJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810623; c=relaxed/simple;
	bh=wYKsv3bmtg7N9pxHjlqaInY4id26NwCDluvQ27D9FFw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ANatw26eTAwGjQhRBENcqub+3J/r/zv+i5YgtFCwaw9OMvYLjESY3Ndh2XL07Q+yJ/lbbGIs6jyHffa6su8TkRl/cNpSFzb36MLh+l0vEcLmb3LCuxQEdiNvqzzJGTYvymfqnjwkHEKZIxVeVV49dBC57veJm4WJf8lje8/l4rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwNI0NPZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5bAMuXo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwNI0NPZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5bAMuXo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BAOBcr2943436
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 11:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mXjiM2zPEAKKLoz2JpUQzTocxEfivfvIE82fqHenleA=; b=mwNI0NPZI6facgXp
	hMOPADq5LpXNhycdL/hQ64LtIj88QWWJIhysaF7+g1w3t9UGaULR5uE2m4BTtkrA
	MQHu/wp0MVX1TVAzyd6Tfv5DENOA71yPmxac3fRzoQpbvtm/UQ10s/ovaHvs1GbY
	ZI9/O9MZqrfhH4zZ4LQs3taDZ3V8zjLB1Mqyz5He0ZTuBQ+UkvUjMHdEGQdPLP5T
	dTklrCnyKneFJSwDc1NVv10XsleW3rsX+SSLKn5cinRBj3kWAtgHikDfDhduUkKp
	2xZbZ69xv1o4BRqH3DS8ACCOW+tErFMiHg1S/zRURXkJnRfMCu2joNHq9kmhnfod
	/ar3Gg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c88r739m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 11:50:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so728512985a.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 03:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770810620; x=1771415420; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXjiM2zPEAKKLoz2JpUQzTocxEfivfvIE82fqHenleA=;
        b=M5bAMuXomJC26tTEPnBVCSHti9awVFTuE4fe1cRi0QXDan4LBY8YiHzbp6UCxIzmeG
         ZHbBLvhO+y0+9KF0VHK5Sy9PP6YRRjXtCdHuMP1TpR0yvWRfFlZF3jYUUsBGIIGj9A28
         ih0xAk3spQwENoXvAgYwUNZQR6PdgeUjkHYuNG2zKvm6UaOvjYNv0Ajb+IaoyUJ2/xmv
         6Uprh/hy6E+a+jh0YBeJMnZ9qXmQ/ftlkNLRpNwcJrJqFeKzwvACdMG+ZHDjX3e5tS7p
         mlxuBe42s45YPDL+G1ZPVT92K6/C9/r0ivGoJcTWsb7CkwBnVriqbXIa0zZ133E9HFZi
         gCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770810620; x=1771415420;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXjiM2zPEAKKLoz2JpUQzTocxEfivfvIE82fqHenleA=;
        b=e+oiF9NDUJkEtI/qKal+X9XR8SNpqk0j2kyuyei3vs92cJxTEBf/fvYZpMET8NSl8q
         dxf+gSoqiD3Q2sqzEBn0MikdMCBA5RwZeCtMOrHBvFrzwokMWuUJVkmUPTGcW9moJC6s
         4/O8eD/hOLg3PE4mj/ZlXMd9fNzJe9we4MrkPoo5PMezEg4/l1X69gmhN3G6SoxaUIZw
         H24HdDPAG+o8uKr0yXCA4FrLsEwP42iu81Ls/v1GtUQPjGmMYcY7BpfhcwGam8PRWiuQ
         Uyqh8TNhs7OfhGwYNQWw3gV5BKIueuGSaia6CZunXDyWYtMYzWdU5zUdw235qo7ARaBS
         TmDg==
X-Forwarded-Encrypted: i=1; AJvYcCUHQnY55aixMCOzfKkLMhNZ2ef+yI1aBoHZi2feScdDUX6xwbcbg2oLEOdyBUnOKdtacq+yhSOiC3AEh9bJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyWrF0LUjY3jQqL7qdRmXASyWYVdeUpe7A4oeXta3Sb2roeACFp
	EU3JGxEv9lCk5VJRSIi2ZQWscPo3SUMRnm/PwXOK/RyuFukoUH4RRlSPFT5QSjlHCKlQP7Z2mQJ
	1rgBIUzZFVp3Ewn1heqIYQHBhj0QqdRvcAUJ94RDdHGBM13XAHe1ML/jfqZFbPUJ9334B
X-Gm-Gg: AZuq6aIYcXrvB1if7ldkvzkklb5TQMUELqzcAiulAOWK70o77J5s6geo46+6u3IdthW
	vw1NcmAN14Ce3mJp6b7MH13NjJQ2XCQ4322mxCTmnZ6aztsX2mZ7/iegTFJHgjD/cQgj3nE+iiw
	62tOfaFfMG7X40hZCbaeYmVsT1F4c6hVUKpGXL4OGDffR9uM70aQuZ/IBesMYbz+dcC4CNSzn53
	ZNSuszF+w3q7YL8gyQ5BAmGJOFNeSYpXcZF6NMVNCfb7kFSPymdTVPTtfI7i/anw0zlgZKYLKIt
	iXPCQLo+stCFcAAPDikJiTNruJYCvOdf+IGJgL3fHoWpEkKN6gK0bG4p8RCU83H9LEb9ey92yq/
	OuwJLBQOnMlOMQv0oHM6VZjd1G/+cUvhxiJM68+9lwsWnqy1QaVRjgD1J64CyhZa0bhcT/mK3Ew
	tJRWh1QzJkH+IX6YM2Zq3ciiGEIi7w3wV6NTFeJ/mNv8nzn1NkFcBm3wGO+nX8bsMTCYRO7dTkk
	ThAP3x5Kxs3Uq3N
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr2470002485a.67.1770810620623;
        Wed, 11 Feb 2026 03:50:20 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr2470000085a.67.1770810620224;
        Wed, 11 Feb 2026 03:50:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f79c79e12sm32546666b.48.2026.02.11.03.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 03:50:19 -0800 (PST)
Message-ID: <b8ca670f-c45b-487e-9e29-2b097c1d5c17@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 12:50:18 +0100
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
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>, soufianeda@tutanota.com,
        linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
        linux-media@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
 <aYt-vrc7h7CJOmSu@stanley.mountain> <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
 <8efb3705-42f3-40c5-9631-d72eb2dda74a@oss.qualcomm.com>
 <aYxqjBSI-t8Jk9UF@smile.fi.intel.com>
Content-Language: en-US, nl
In-Reply-To: <aYxqjBSI-t8Jk9UF@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4SAOCvdLl6d8HSxHCcmRQOX_ovP2vz1p
X-Authority-Analysis: v=2.4 cv=YaywJgRf c=1 sm=1 tr=0 ts=698c6cfd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=CA8kUe_sQCdszHEXljoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA5MSBTYWx0ZWRfXzKESVVFMWEDh
 3bwOYIy1+b0FmkowVy0HlzENEx8Ms3i5Ptuy+xAtL/xksIHL8Xa9vLXTZqwORWjops9QVblsk7Z
 5UZf5EMikNZmysUcpSMKVRtArMhJwq0XFR92LL8NrTjexZzuPpWelqtVLuYLufhI9gnSAm54lf3
 7lJVUyNzs9TnMfh1bjvq98F+YyNy9baMTouXqXwLSHHdclYLEZHaEg65GkEYgBDTZ+gh4kno00P
 ssJGEHeMh4Ywy+6Tl44gvGfaCjkvMcpKEJGqo7ZWFrmOrbk8TgSGBJdYXvNSW07LHC78TnMAl1T
 Ai2D1P3OJuXozD5iE7+a4+3JPwz4xwx8hW/dpN2JE1/8e+jUZHjH0kL/OruFFGgC4vW9AKEOr8y
 ODxyI1mCt3KyuG+/92/nBUN9JWyqjeutWRQQKfbyoW9Mu6K2J9zsqd3vn+z24xKN/yc4BVHb2ao
 gP/lJe9TCPjwtql0OWw==
X-Proofpoint-GUID: 4SAOCvdLl6d8HSxHCcmRQOX_ovP2vz1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110091

Hi,

On 11-Feb-26 12:39, Andy Shevchenko wrote:
> On Wed, Feb 11, 2026 at 12:28:35PM +0100, johannes.goede@oss.qualcomm.com wrote:
>> On 11-Feb-26 09:11, Sakari Ailus wrote:
> 
> ...
> 
>> This will cause a bunch of code to turn into dead code, but I would
>> like to keep that code around since when we add support for
>> a parameter buffer queue that code can serve as an example how to send
>> parameters to the ISP.
> 
> But it's forever in the Git index, we can remove it, so it's just matter
> of convenience to keep it in a working copy (tree). That being said,
> I would rather drop the dead code to avoid a stream of not-so-useful
> white space, style, and similar cleanups.

That is a good point, dropping some of the dead-code stemming
from this is fine with me.

We should probably stop pruning dead code when we get
deep into the helpers to pack things into fw specific
formats.

Regards,

Hans


