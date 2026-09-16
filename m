Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861DE5013B7
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 14:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567946; cv=pass; b=dMeVIhwrgPJl+HY/rQyNycBSGQgrrgzEyYklCFSwzywQLp3nWHCzQ4T9L44MCesy4AF/PqGnwFT6g60L/PmgN44bKT9JU5+VIuh66CmzKHPEUNYsnxIVtW2Bs4Sl+a+cK06lR6d+t2YohHd9ApBbYjBa43G3ZfPUDpdFRhmnJ3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567946; c=relaxed/simple;
	bh=d7Znp5NNZxYJd4Xe/QgaIbKxuaLC2x6XIlcie67IVG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSt5uHu4pbpFg8//W9SB0Maan7NP0lmXtjSmHmcO2PuG1fPCRKPTpRXMD6zzEN15fVasIh3e7sNk8kkJ4xnvAXuojlo47Ug1RsPBSFlSvK2asCIJlyLUStjqQkGy22ICOWptCookzeytdOngrHtdr6VeZaOKAhPkvhhBGmZV9co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZbJrQCt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQU+BnSN; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZbJrQCt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQU+BnSN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYjE91440619
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 14:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7Znp5NNZxYJd4Xe/QgaIbKxuaLC2x6XIlcie67IVG8=; b=hZbJrQCt7xfhxnKG
	PbBGY+RlohLA50nEt3lLit+T5kj2GQb0umm1euW424NEYPuNvULZDQ/0HMxuAwzH
	Ul74ycK1A/oUcAAOKrj5b6zt+rEzIEnQRcJdnB6lbCHGvtl0FQgR3gOd+VxtfqwK
	HvhKsAlhSWYTSN7pDn87NeHlr2T9psF6uqPx38K5xRFOtGQAfTCDfxJuPulg2rZ9
	5753pJkRtQ4XCSsAPtSBdx2nlUOgxZ42V/CFUA4fuFRZEXDIQUJs3TeKZeloFeiF
	X7y5m4Cpi+DGYJHc4X9Vmv7bA7xX3csTnYCPLRum/B+bVTYsAsblHP2gRU4UYnnH
	b4ldEQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3sc01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 14:12:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8699b293a80so6226435b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 07:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789567943; cv=none;
        d=google.com; s=arc-20260327;
        b=ILYknaI6H2acJxl9LuL70wgeu6/yJOEdeh3xZ3wuHslDizOsrQcx0qOqtYcjHsnwDJ
         u0I6VO5midnZ2kdLatb6nG0nh2R+6HPfV6EGdmJoiK+BpVnpv40oo0kUpevukMbo21RW
         EHSJIyqI0JgYfGOvSS33yifH10wgtsxYTiKEmPuAW3Wp1D5mF59lm8ww6Ylwx9huOPPf
         EV7G4pFGwys3g6lucctsmQ0j4szcVqqHpc3qYHE+sBnZhH0xFOchbduUta8RdWrDt07N
         JrvU3PpmgF6KLlKoi3FXItptgYHyZYtVJZ5Vu3IgX/FDmDJHYKfwmQJW460RRSnQtYPQ
         O59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d7Znp5NNZxYJd4Xe/QgaIbKxuaLC2x6XIlcie67IVG8=;
        fh=gD/lC2X+gehlSyNFD4UNv+77cqw6p72STNeEDJGBeQ8=;
        b=bbTp/QoX3uy1dtVjTLUOsmDYmrUC/Qhih6Z+LqxUVbnlZgNH2zQOxApo/hevpGEfjK
         XZeKNrVZ0jsIPWKYoSSAWp7GJ9AA6TIxG/4tB/SzE8JR6GjlD6be1EYc/SQYb2bEBUeG
         ZuPirbouHyIQ3QFrwnErzXsCFxfbtUOAoMFVfDtJX+VAJLuzMFGTbPu1+Bx8N03PdF6O
         rlEHlomULjfBnfVTLiHONWJZzL24v17g9wTiGmZZyeFGzYcTqmUmLTPgqyygOG1v/NyY
         4Pqsg6HOyRl89KM8pT6kOZHiPi+bxpzZJK2hioCsTeYCahZo3rtmJupNChtDdl6ALjmj
         R0Qw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789567943; x=1790172743; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d7Znp5NNZxYJd4Xe/QgaIbKxuaLC2x6XIlcie67IVG8=;
        b=OQU+BnSNxrhXAJflxhkw+cRMTlVglA8z+sVCx3AlUrRvOXolrPTle5cO0UYwMah6Qa
         dUhtl6S9AggC8IIw9y+h7EPdKNF0UHCG5FHyw9LMFDwZ/oto9B1HS1q9Ksww9cBSwlTd
         m5cZeP9ozlU+hsHNm/H2q8VHG2dt1FPAlQAgRhmMWWLe7WLnxV2huOaFR6VJ4TPkYZt4
         Ffsq9JZlbPKCgP0C1Hjmm7XheyzIvBo1TgMBML2MtiUyrX5MnyWco2fS8IAtNAdtcy73
         3ayl7i72bsTHnQUwKv1ZFadiFWLYn5H9NDocxEUOxwCzk6Jcpz9qffu7RBL6ZDID8/X9
         lrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567943; x=1790172743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7Znp5NNZxYJd4Xe/QgaIbKxuaLC2x6XIlcie67IVG8=;
        b=YW9HEPUoBZby56+rdFPn82aZfcES342Pe0PTiZ4QYI6Nn6MD0Yt2odASsbsbrpt4Uj
         ThT1LVVSbAqtWA+f40n4ctMmuy0hDz8Om62HCuyov00sEKl5OXcj95gSTKfp4yQU3hib
         gLPPzR4LZkMBK5XulZ2EXJ8x3vLjhNJweIbZ30UhkmnmT5SqFeA0MhUCp+vjOx4GZXJJ
         ar1FfwjuROh03lfKoQM2XSR40bHABwtUyszaSHoXFJC69zsuOZWCGY5hLC8GbaadHHzc
         qcrTffUtdhbvnWqhPlKSFhm3OGOvQRkgzCT+PDh2lo9GcMFzNoketE4fE5nsLxrcvbN3
         VgwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdJEoVQ/Ix2KBVe6UeQxy7ikfXMFHQdGBnIdvlR7QZzOFwVmwsKev0Y2mdtpd15NbVvhWmsaw31a3rirzl@lists.linux.dev
X-Gm-Message-State: AFuF++l142EPCCa/u16XkTfyc28RGyUs+0AODSQC60Kfd+zYRoFPVHsg
	3BItcKzdbLkNCo/Q2aF3YyOgCv3ncs093uWkyrB67uRRmdNYjzXWwnD57C/AfcbBfVg+uJRP8+D
	daauwFHoFQxw43T6vnXlwpvlgrVV+GSFJy2XHLPo4WgGDHgpPUQ3B6PLkyZfLEDeURTcazRkB0q
	SZEwxHJT2WzQvRyZ+WW7bimA97Metc/ExUlHagZmFd9Jw=
X-Gm-Gg: AYBFou1hAmqzpFUVzFya2yIWiMHoh83CLQNDma9Fn23vRu0jq3uy2uoRbMObjz/KiEQ
	KRkfpn/dzCUpqq1kUt2vmO+Hs/WtMW4klLITPD6GbJfjyvfYysb+MJxITicXy3xt4u3WfUE2wD2
	e6P1BEvz5XJeJknuk60fRNzhsM8soPNIkzb4tdAST1hX2M6NSu6swfFQOrHg==
X-Received: by 2002:a05:6a00:300c:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-872372c3f18mr6019648b3a.4.1789567942644;
        Wed, 16 Sep 2026 07:12:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:300c:b0:848:2e3c:9955 with SMTP id
 d2e1a72fcca58-872372c3f18mr6019564b3a.4.1789567942091; Wed, 16 Sep 2026
 07:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
 <20260915132052.273212-3-ulf.hansson@oss.qualcomm.com> <aqpIl5NWCFiuKy9b@hovoldconsulting.com>
 <CAPx+jO86Sy+of41dw3Gi5CNfyc5+iOyDU4CZypz4YGzG27QW0A@mail.gmail.com> <aqpovla0rTDnmwRh@hovoldconsulting.com>
In-Reply-To: <aqpovla0rTDnmwRh@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:12:10 +0200
X-Gm-Features: AcwNN1UPNXOQLfdSFRPJAlCiq-g_reRwNd6uIUSpPLv6c1bEYkBTby_bsRYsWRY
Message-ID: <CAPx+jO8WS3MqzS3txy1B3FnQ9OzRjDGzxMLLZ+Mys-jqego3_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: Turn mmc_alloc|free_host() into static functions
To: Johan Hovold <johan@kernel.org>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5MSBTYWx0ZWRfXw3K670dD9h5Q
 PygQis07kWPVbVQo1isZsTaphQWuvT+XdkmNC84n9mc625PVrENY871HRk1AhYgUQrtIgCr2Lbp
 RX9klHHPczAFRus1EA1TfIMsNfMrSIWPzm0y5P6h8deoL/tipWMd8GJLT1RERilRYopo3xzclHU
 ApC/7sQhScatkof46zrPlkdiy8t7Yu7BLfX5xkjrI1eMSRMEkpGbgDzu9pDcD26ZxKCrlrGRasE
 CBUWy+pIxmfIog78mhvoTM0JuFB6EZiSIsemo/H8wZtg+Sdqs1afruuoBjmpnVuMqy3poG/lHR+
 /LNprtoKEKQbeVde/NHNroTel/fJwd2J9A4/33a8l4f1l9kyXPrUyefcLXV2lnm/j2SaVpCO2KE
 En3PH1fZGXcWaZksaDpQq9a/ZK4Lu/6kjnuQqKCQDZ/aXEP8abAxvvfjMpKTvb3y/pmx91/IYbV
 cChVkmtTIcvnCt3m07A==
X-Proofpoint-GUID: Eih4-J04ylh_ayNvPvDQAtXATqaNUQqU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5MSBTYWx0ZWRfX82c8z7ogtY5z
 5CUJCVwBZzS6COvUBwalgYVKFkfYb5ouUcq4qv2IEzyWo9zdI4a0E7bgKJnIyW1BDv2LJw921f9
 GnJIz0khFM1hzEXsr2WMXXdc5pLGvLQ=
X-Proofpoint-ORIG-GUID: Eih4-J04ylh_ayNvPvDQAtXATqaNUQqU
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaaa3c7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=sgTPu796ueBBQ-pzyZoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160191

On Wed, Sep 16, 2026 at 12:00=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Wed, Sep 16, 2026 at 11:36:25AM +0200, Ulf Hansson wrote:
> > On Wed, Sep 16, 2026 at 9:43=E2=80=AFAM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Tue, Sep 15, 2026 at 03:20:46PM +0200, Ulf Hansson wrote:
> > > > From: Ulf Hansson <ulfh@kernel.org>
> > > >
> > > > As there are no longer any users of these functions, let's make the=
m
> > > > internal to the mmc core.
> > >
> > > Why would you want to do that? The devres helpers should just be simp=
le
> > > wrappers around these and sometimes devres just isn't a good fit.
> >
> > At the moment there seems to be no need for them. I would rather keep
> > API/interfaces as simple as possible, so I prefer to remove them at
> > this point.
> >
> > If we see a need for them, we can always add them back.
>
> Devres generally only works when all resources are device managed.
> Therefore you should always provide the underlying non-devres manages
> interface as well so that you don't force devres on drivers where it
> could cause trouble.
>
> > > Especially with the work cancellations present in mmc_free_host() (wh=
ich
> > > I have pointed out elsewhere should not be there), a driver may need =
to
> > > free the host before tearing down other non-devres managed resources
> > > during unbind.
> >
> > Can you please point me to such an example so I can try to understand b=
etter?
>
> We just discussed the renesas driver which can schedule rescan work
> before registering the host controller. [1]

That isn't a problem, but it's not the right thing to do as
host->rescan_disable is set.

>
> If such a driver also has non-devres managed resources that are freed
> before the work is cancelled you have a use-after-free.

If you are referring to the mmc rescan work; mmc_rescan() will just
bail out as host->rescan_disable has been set as soon as
mmc_remove_host() is called (see mmc_stop_host()). In other words, I
don't see how a use-after-free would be possible in this regard.

If you are referring to an internal work for the host, yes that needs
to be managed correctly. Although, that doesn't matter whether the mmc
host has been allocated with the resource managed variant or not.

>
> > > This may even be needed for greybus which currently destroys the
> > > connection before freeing the host.
> >
> > I looked closer at gb_sdio_remove() (the greybus sdio driver's
> > ->remove() callback) and I think the problem isn't about freeing the
> > host.
> >
> > Instead it seems like the call to mmc_remove_host() is done too late.
> > To me it looks like when the mmc core tries to power off the card
> > gracefully, through mmc_remove_host() the driver has already moved
> > into a state where it no longer accepts any requests.
>
> Yes, that looks wrong, but that's a separate issue.
>
> I only pointed at greybus as an example of a driver which has non-devres
> managed resources. If there is (rescan) work still scheduled after
> probe() or remove() returns, there's a potential use-after-free.

See above. This should not be an issue, at least it has nothing to do
whether we are using managed resources or not.

For the mmc_rescan() work to access the host internal data (for
potential causing a use-after-free), the host must have been
"started". See mmc_start|stop_host().

>
> Johan
>
>
> [1] https://lore.kernel.org/lkml/ap7CaVj82BJZgjf6@hovoldconsulting.com/

Kind regards
Uffe
