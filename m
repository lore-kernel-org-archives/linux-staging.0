Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8707B4D6C2D
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650614; cv=pass; b=r1WlhKMSaM3ZHx9pfoqP7D96n0xvzT6HarfdGuDzTa695xcFSrsVVdlzwUn3H/B6TvrqFScoXAvEzRDHl0FYwL3B4oWCPKdBHguyixQ/vUH7dO3BHKzO+o1yp461jMo6qNBMAINgKWsQsMc1k3iVzcZWLzst7Mb1AauJWWwaUdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650614; c=relaxed/simple;
	bh=dSn/lYCGf47xluUTvALJXGbm/i/dzTFyyRRAL+e7HRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AbM+OE36PTThENQ7/D9B0eqE87ccqhsdh/DNP3WStS+gMIyk9+pJBk2hLrrs2WN541AxgMDC1mLWvjQ4iIotggf1/+WbTyuu/3EX83/boptjaWtKMY5C8zmAVyjti3D75t+C3hTmzz5ZbPcWrFrz+9SWV8JKwSwVNkVySZ1ZxKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5LO6BYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A64sFGuU; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5LO6BYp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A64sFGuU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HC0IjZ1853514
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 13:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSn/lYCGf47xluUTvALJXGbm/i/dzTFyyRRAL+e7HRw=; b=h5LO6BYpTXAH5nwx
	VwuBSfEzIGBVZY+9K99uOxxLNxaGkJyTt4VyrwOZoNAcIhfJeVVSAZ0eCaIQaJvS
	nDVEOCFYHSRyevvYxRN1OWXFxpvJz3jbojOzibn8tN8m54CTzFz6Ac9mjN6JA+dq
	pjPJ2KGX4qfNJTznoMF9junvBNjI2gDnqyYGB7Mb2+jxCxx9Lc0W50NkZSoQnd15
	WvZyMJQ8f6ojh0k3aD687Sdon0RPTgkQ0kO/g0rU/8BaMDwpAT7IT08qPc95tjEJ
	Mj+NIYVuL5xZvvLVQ/0eLmGn3p6czFlPjWYh9vvJHXu6UEqYdabOfzVt5bKjiKMR
	XbgxQw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu408wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 13:10:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso1486412a91.3
        for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 06:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789650608; cv=none;
        d=google.com; s=arc-20260327;
        b=Ip+oWuzeYFL2Ap+JboaY/EcbtHKjo7Z7/oLlSUdX3KmH9EccIHxxjjzalk9YQVOfff
         AZ3Ku0JCwCznnk4BHjXhBq10fn1mlpEXs2RDrOqjCF7r6q7b/516cDpn5TDxvg96nHtr
         HZdwuv2xxk7pOqURrah/gGjgjoiEysRv1Hjy4JHcy1gRWz7LiBZxl9lnTy5Y6fbo975V
         sbum40bUsx2kabbZrAtAlX9XKJyAy60Gc0znArgOiFVbWwfx8+Sd5bXvifF3Sae378sh
         T9fcG/PGKFVoz18cAz7AV0Tp1QhYJa+RaFs2KaiF0C8aRBjFReRtxOFLnkeaAUO+Lb4H
         x30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dSn/lYCGf47xluUTvALJXGbm/i/dzTFyyRRAL+e7HRw=;
        fh=WyhuRviT3MqKWR3qeI3qL4i2i5r0O9IFcr//rhM6BuI=;
        b=hr6NJWXImoPFH94QDgFMs5Ko/BC78ZQWK1mCIcSSp2AA8ei+eo8pbsAwt7WR4m3P3z
         NCdVvW3CLoYn9cUKFAcAM4AmVwSzOgJHQDWLBXPOGDoPUGgZkvck2zrvtlQrurS0Co8d
         jhlHt629tO+JGLU5zFdKQ9cF4o7RCg0qo7N7CavCqwMtZu1DN7ayVDpEKizBOq6pFvUb
         QV/wWDrzf7598xaUARLCdJz7AuLhxdLYQnaSLX3hWxhyPy1LE1ndH1Ym/VMdt7cTKSCq
         xNNlnZr0Fz+u0SgK/RQMQitltOUplJnYh8v9IyVRIFGg6bhzd+XnzvYCdt6u6lnCVo7X
         JJ2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789650608; x=1790255408; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSn/lYCGf47xluUTvALJXGbm/i/dzTFyyRRAL+e7HRw=;
        b=A64sFGuUFpmjmCbbWPDiRyCdRxz3CK51FsSTgrl/d40Sk33UrCWu5EAN5HWkFx75pT
         du0PK12x7TCq0Tq78KeBo2NIzgxRi33hgxaIzRud3pPqnT2+1O8QImg0fL6qUPd8bQUs
         /RuvdzJkS/tAbcMmXWs9RUJVvhu/ldNwQgtSTpn5q8nqwEd4wNrEWNxYowvkFdFM6mt7
         lf2e9S9IsAbCjl2M3LD2zSXo5WBArY2KajE4PMeiLE/tjXGfdXD/mK4ezH8MraiDXqzl
         tlhjvMbgSspu4ruHqUNJBhXanDa3TEgCmHs8yfnJbRnDqhESLnL935r5uERDlFoSjjZ9
         XLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650608; x=1790255408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSn/lYCGf47xluUTvALJXGbm/i/dzTFyyRRAL+e7HRw=;
        b=A6AOXEBwNWqAswN/G3buxdLIGGtOcNBmSQplrePPIjv3fRTDrnEjzu61WqGhNZMmvW
         DoBlSEIH2orF0nqpen+kZjqxRE3NKiavYijp8oUyfxoT6lIZFsoNVB+h14MrIUIhtyXS
         H6kwlRsFZzQJfNDaBfJdFHLU5AuaIKwDQUROMYJwm6356K78xbmjD31rDYAuMJAj5kn6
         TR9VIjV/39ERsDwo6HEQMu04TirUWWAT65Gih5bERm1j1NcuuwRQNVKEaKNSOH2rC2/C
         qsFOYGUVCHYvtPr/WpM4+FQKlDx8wXZXKhni8KyrGH/aBgWpzCh2R+cwShQIWxc5gY50
         t1pA==
X-Forwarded-Encrypted: i=1; AKwUvBylEKMbiFv8Y5teXsho8PxgHO2irxrHpmWgeFI+y6ihJOua5tVh7zcoUZIwevKniFHqgbjVVRuHxdZ3+fcK@lists.linux.dev
X-Gm-Message-State: AFuF++lZovBIOwrkBNXYLR3tm760flOF8Sy+L4FUsRw28krd1bByGPVV
	xFnFJrMp7p18zRCCaiWVUb6o87RDfSCeDV12smZCLjHv4hM4oQwaJAusUQ6lR88X0o5Rqo9VF8f
	fzmvveeySEip/lQsehUY+/PRrECqfkmj0IV1ELNK09iqHx/qlszb6hyVlLdbqXXRf1onDwJYq1a
	e7nTJXCySnXEt8hNszNE2XULGQyQAG9qoXwsj7FbVB1rY=
X-Gm-Gg: AYBFou2ZKOYkS4qP72YkZImb8jt0+X04ycaD0fSvT3G3Yro6HVUwSTVKLEBx9FIr0Z0
	G+xO217XerU5ePE/RMunC+APJbz5BFGGZC9teXoZpTxRGaEWttA948P25oOzcL21EEst8STn7wf
	7gvxQUXE++VU2vwh0HN+Sq/lJKV9PczIkF7GUCpqxVgdLkqtSqOQlJ/czdAw==
X-Received: by 2002:a17:903:40cc:b0:2dd:7979:246 with SMTP id d9443c01a7336-2dd8e633921mr148273465ad.16.1789650607508;
        Thu, 17 Sep 2026 06:10:07 -0700 (PDT)
X-Received: by 2002:a17:903:40cc:b0:2dd:7979:246 with SMTP id
 d9443c01a7336-2dd8e633921mr148272805ad.16.1789650606942; Thu, 17 Sep 2026
 06:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
 <20260915132052.273212-3-ulf.hansson@oss.qualcomm.com> <aqpIl5NWCFiuKy9b@hovoldconsulting.com>
 <CAPx+jO86Sy+of41dw3Gi5CNfyc5+iOyDU4CZypz4YGzG27QW0A@mail.gmail.com>
 <aqpovla0rTDnmwRh@hovoldconsulting.com> <CAPx+jO8WS3MqzS3txy1B3FnQ9OzRjDGzxMLLZ+Mys-jqego3_w@mail.gmail.com>
 <aqudoCAtZTgq_31Y@hovoldconsulting.com>
In-Reply-To: <aqudoCAtZTgq_31Y@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:09:56 +0200
X-Gm-Features: AcwNN1XmCRz3ewGD_qaDz6B9arOOIwfnzlm8ZiND-YnUnSWbnYkPL_h4vprGqQc
Message-ID: <CAPx+jO8ETnyiZ8i2AJKa03HZ-iOryjf3Y8DPOqqvu-W_9ThZFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: Turn mmc_alloc|free_host() into static functions
To: Johan Hovold <johan@kernel.org>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 75B9Xzcf96SAdUl2-nlOf0E9hbAaNi_L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NSBTYWx0ZWRfX8or8UTuLdVH5
 XizuZ6XWcatDUiIOOrkdvfaJb5I4asUuxXW1Ee0FdYYl3t6XjtPDkqbo2wxuXn8HnS5YR/2XV1t
 x4nWCagQVNvI7l8k88DxkgR6/Q1zGJ0=
X-Proofpoint-ORIG-GUID: 75B9Xzcf96SAdUl2-nlOf0E9hbAaNi_L
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aabe6b0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=ODYK8XF4EdztDUzRPCIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NSBTYWx0ZWRfX++NEgdxm0OMB
 e0zaSXeYRaZBoh5LCICWLroyRHMBpfEhazzzskXd0tRccfvAC4BCZy0Q6EyOkkJYYVvCMoZM4+9
 ubohfj20/9igF/XRbLZgKPUlIk8FPhsT3acQk1OwcmgT0ytxsveM0BjJgxyEmNUvq1D0x9AgTuR
 7RKtDsTtpE7pdBaHXE7O23dndFxhdxiC3Ve8fL+6T/L4M4cP/S6iC0fDC7zMwT8z70PMj1kfqxw
 lTYrW/Z6zKI1WaTx7hKhMUZJ3e9BBst/1HEQbTb7KIFASgoqUOS8NY2dod5zr4yhTBM2r0kQjU0
 b8OiJ1NdzPPPed01tLlAAYk4mX2PD3i6YfzvizNAeehIwUL7oeLqKUMzTWk1d+7zmZjX2T6JPkt
 ZWY81aef9cIDelJCReSEnBCHs6g9/siY2hZG6e1U/KaRjudXXPOTb+tRcS4KURGnaDUlsd0q4Rc
 jJ+8jUvM7//7gUFLo/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170185

On Thu, Sep 17, 2026 at 9:58=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Wed, Sep 16, 2026 at 04:12:10PM +0200, Ulf Hansson wrote:
> > On Wed, Sep 16, 2026 at 12:00=E2=80=AFPM Johan Hovold <johan@kernel.org=
> wrote:
>
> > > Devres generally only works when all resources are device managed.
> > > Therefore you should always provide the underlying non-devres manages
> > > interface as well so that you don't force devres on drivers where it
> > > could cause trouble.
> > >
> > > > > Especially with the work cancellations present in mmc_free_host()=
 (which
> > > > > I have pointed out elsewhere should not be there), a driver may n=
eed to
> > > > > free the host before tearing down other non-devres managed resour=
ces
> > > > > during unbind.
> > > >
> > > > Can you please point me to such an example so I can try to understa=
nd better?
> > >
> > > We just discussed the renesas driver which can schedule rescan work
> > > before registering the host controller. [1]
> >
> > That isn't a problem, but it's not the right thing to do as
> > host->rescan_disable is set.
>
> Ok, good, I see now that you also cancel the rescan work when the host
> is stopped so that seems fine even if the second cancel when freeing the
> host is unexpected and bit misleading (as it was added to work around a
> driver doing something it should not have).
>
> > > If such a driver also has non-devres managed resources that are freed
> > > before the work is cancelled you have a use-after-free.
> >
> > If you are referring to the mmc rescan work; mmc_rescan() will just
> > bail out as host->rescan_disable has been set as soon as
> > mmc_remove_host() is called (see mmc_stop_host()). In other words, I
> > don't see how a use-after-free would be possible in this regard.
>
> Looks like you also recently fixed a related issue with sdio interrupt
> work which also wasn't stopped (see commit 6feadbecdae6 ("mmc: core:
> Cancel SDIO IRQ work before freeing host")).
>
> So I was referring to all work which may still be running after
> mmc_remove_host() and potentially call back into the driver being
> unbound.

Okay, I see and understand your concern.

Although, if things work as they *should*, the mmc core must not call
back into the host driver when mmc_remove_host() has returned.

*If* that would be the case, then there is a bug in the mmc core that
needs to be fixed.

>
> A quick look at a driver using sdio_signal_irq() indicates that this may
> still be racy. In dw_mci_remove() the host is removed and clocks
> disabled before freeing the host and cancelling the sdio work. A racing
> interrupt could have scheduled work that may result in MMIO accesses
> with clocks disabled.

In this case, mmc_remove_host() also removes the corresponding SDIO
functional devices that correspond to the SDIO card, see
mmc_sdio_remove().

This leads to the SDIO functional driver's ->remove() callback being
called and from there it's expected that the SDIO irqs gets released
(see sdio_card_irq_put()), which must be done with the mmc host
claimed. If this isn't happening, it's a bug in the SDIO functional
driver.

Yes, there may still be an sdio_irq_work scheduled beyond this, but
when it runs and claims the host in sdio_run_irqs(), it sees that
there is no SDIO irqs enabled anymore and just returns. So, there
should be no calls back into the host beyond mmc_remove_host().

>
> > > I only pointed at greybus as an example of a driver which has non-dev=
res
> > > managed resources. If there is (rescan) work still scheduled after
> > > probe() or remove() returns, there's a potential use-after-free.
> >
> > See above. This should not be an issue, at least it has nothing to do
> > whether we are using managed resources or not.
>
> Sure, if mmc core guarantees that no callbacks are made despite the work
> being left running it should be fine. But that does not seem to be the
> case with sdio interrupts currently.

See above. SDIO irqs should work perfectly fine too.

>
> But regardless of any potential races in mmc core, my devres comment is
> a more general one: subsystems should not force devres on anyone.

I understand your point, but I don't agree, at least for mmc.

Instead my take is; come with a use case where devres doesn't work and
I am perfectly fine to bring back the non-devres helpers.

Kind regards
Uffe
