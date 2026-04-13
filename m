Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1818363C6C
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069204; cv=pass; b=cX0oK5WmqoQUdT8a1k6O0NcJ+Rb4HxWBkedmkGm3JuQtA4xoWUOMWzoYB19Ean5k5J4BeKDTMWFOSntQ4QqcJ/aloIe3nyV1QacF+Zx3dcsXMQMtYLqI/EFvfpPvuAfGS2zlmip1jZ/4Lg3I3QjHV398yAZVtFNXvfmWDi3b8bE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069204; c=relaxed/simple;
	bh=5RU0nj5Hybs1aPtlV5028DIT5U8+h+f963lhnIeQAQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEf7ptpcLwTX6CuhUWGP2kUfGBfMDSwNB9mMCnH+9hQWTH3MsxyM0jpsRKfEr/pwVU0/GF816GK6I2O599rvWRb6TJVNXKIZaeUE5og6cB2HRcslb+gosr6yFCVkmwzVFhEkXtCutsjtk7Q7CMyZZVSbTbP6BQ4xkz1dLao8WkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2J80jGa; arc=pass smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2J80jGa"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-5a3e66f849dso3849763e87.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 01:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776069202; cv=none;
        d=google.com; s=arc-20240605;
        b=WOZ1g7fGak3Gk7ha8k99Bc0hExHysUSjjBv6MSC+BntnFPkG0YJkKCSWTQ4GfrzFqv
         Ccy0/uZewr5LxFTPyeuLUe6ym4MNx42UrHx2JEDPQGWFnF6HlATe4IWx4YYZS+Cq1b/F
         9XgSQEiI8Jd4NW5YqSVdQRZCbsxDFgo2hAvN54H66Ci5Sklei+cvTxNEi30jLcFpDje2
         xoZ58ZHmeH5fSS2lTS/8KVOCtiemKq6rgXORbSQ9E9u95gKahjlXDVbKpwajuF5PizFa
         kd0PcENifyEaEc9tlAFhC7yKwW2SE5epcf5BAjtHsq3Z1neja0+ec3NaWB83Agla8xY+
         rPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dK4kJdzKXHKDCUCLBrZ/FEqxTe/gWrJpiQBUKE6RVXw=;
        fh=v5Ky6flZBkc87sSV/dKGLbL9OqUoqgkWaKPxds638QQ=;
        b=kdSShf1WBcnbKlAydEMXpmBf6eMsq+OdJNFS6CFuN9GVe+zMsVMmdaT0SIX7qxcZB6
         Vwajg2AWeWLjJaGA+qlKJtT2K5cB6uY5UX+Rh1VexN9+Q1InBgYAc/a5U9hX/12eH7Sc
         UCa2elaZB9y4GMjruYdzVJL9jaIFS9TlNPsNIZivvzXIUVj4oCYCKrijFzjWvgzYvlUM
         0i4hlhv/H23qmGcUtZjxQ1B7jkNPyyK1rWhmhPBEjLKWn8QXk+J+6EW1cSKCkL7+KS8b
         6ImQol/vvixOTBHQETMIh8lIlMdEY39zWbkkCKpXflvvAolLEdtIRMK7sW1x3/L7P9Gj
         BF+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776069202; x=1776674002; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dK4kJdzKXHKDCUCLBrZ/FEqxTe/gWrJpiQBUKE6RVXw=;
        b=f2J80jGagyKu7FH/ODzbB20y1NZ6M8Pzs8EaCfZzjZ6L1LQnZekfZmTnXvLpOLSeOW
         ceTScqiurVfrvLQADVmfm0bHmGlsz4XznULqliV1J+vTbxwJnwmeUQsr7nVER4tOfrZ9
         R5zpf1IpvpxFrRm2Nps92XDAXcrBdoFrNYejJD0t7mgXqmW3hrjXWo/95CoHYPxuRAfJ
         ib0HdbztZUJDCkvFP7W6j0Xmac9hQJpQgX+E3znlrzsdG/wyZI0Bmr76oxWdOfnU1+IZ
         uUgGfe+ZkWYFGl4knrKYgLTrFOAFFpTOLDZmgqzGKp1r/gymi1XCCa2aNXV0M9dl84zf
         5NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069202; x=1776674002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dK4kJdzKXHKDCUCLBrZ/FEqxTe/gWrJpiQBUKE6RVXw=;
        b=jGAN/TAaYpNFiZ1ZP5slgfeMjh5LSm8EcOQGpF0Sop42UV8ebooMAIrRlULAl2xHyB
         14wJZC5Mq75KUpYBTUFNRJAdjTrmsk/2rhxBph4HGKo1TbNEljh7r0SxKHQaT6l1h6Jg
         Z/KJvuAbGG4fHl/Rl/ut19xEni4NAZ0cTiml5ll90s+FRuFfl++yCAEV1dry25RQS3Zh
         Oh39/aGk+qBSVo9C1Js3ipr/MhjO/Uw75GFxQs54AP3Lpb9WxG2Aurht+tCwSiaXDIGA
         BIrWvjGGkfIptsIMM9pWHzYr4i5zURPgY9CUbvMzN4WeEqSspUwpKv46ldXVjdkRhmvP
         wRsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Hpx/opQvv062BEtUGsY5ppdLa1xWtCSiqqURuWJCaHdSkdYSeg/pjTWd5pQkDB+yeEuPkOq+0tV4whM5w@lists.linux.dev
X-Gm-Message-State: AOJu0Yy51u5vwKyscslVBwqmJy84OBaOXB9PW9wBN4XAoiyAKDSPKNeg
	YaAKj/yoMb/qcJJP/ly8P+GSR0c0GTw4yaNSQw41qEBM8UdD+nm5jUOE1cwdVd3jxLUQElbkEqJ
	q9HBkzr73c9VAqDbmPdcXAVbaPyDDqQw=
X-Gm-Gg: AeBDietZprOQV1YeAF8465l3myDhIKpi7SHdhF9w/oVCF2Xqtq8BHl4HcjOES5QzgUl
	pw3pM7K8dFlplocmssOml2zR/h8x2pMHRwnNef9sr+h4S8cZ2bUpXc19WNvSTQCcglLjLp8hPv3
	J8XAWMoumtPaJQ/X/yqXPC7I3h+sJndgfr/710myeYZ5DM+x/bvySIKoDXGjHrGoI7+Cwzun9Oe
	JRBDKyL7iXs3HoVW42Ao97R0CQcl8FrRuKlRYNsSupqJx6i5GgcUBUt5NvzmNYfAcKANzMs21Cl
	s1NeGrMNs0nce/dwR1x+XELxwSV8hikbDWv7p5qsJg==
X-Received: by 2002:a05:6512:1110:b0:5a2:c66a:d6d1 with SMTP id
 2adb3069b0e04-5a3f0848711mr4280644e87.6.1776069201441; Mon, 13 Apr 2026
 01:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412163600.29925-1-dennylin0707@gmail.com> <adyjSM70HcX5cq9s@stanley.mountain>
In-Reply-To: <adyjSM70HcX5cq9s@stanley.mountain>
From: Denny Lin <dennylin0707@gmail.com>
Date: Mon, 13 Apr 2026 01:33:09 -0700
X-Gm-Features: AQROBzCK_WHlyt_DtYrQ3zmGBT5e-OQtv9pIgUn1-ecfdBcx06XmgaGhc9zsw1o
Message-ID: <CAGEkeHcT-EcqFTHKybOLqUxzbK8hCB4+XfWP=aUTi1e9T5-XwA@mail.gmail.com>
Subject: Re: [PATCH] media: tegra-video: tegra210: ensure PHY is disabled in
 pg_mode stop path
To: Dan Carpenter <error27@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thanks, I'll wait for feedback from Nvidia before resending.

Best regards,
Hungyu

On Mon, Apr 13, 2026 at 1:03=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Sun, Apr 12, 2026 at 04:36:00PM +0000, Hungyu Lin wrote:
> > tegra210_csi_port_start_streaming() enables the CSI PHY regardless
> > of pg_mode, but tegra210_csi_port_stop_streaming() skips disabling
> > the PHY when pg_mode is set due to an early return.
> >
> > Remove the early return so that the PHY disable path is always
> > executed, ensuring consistent teardown.
> >
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
>
> The obvious complaint is that this patch needs a Fixes tag.
>
> The early return is suspicious but I don't believe you have tested this
> patch.  It would be better to not send untested patches like this,
> because there is a risk that the author wrote what they did deliberately.
> This code is six years old now, so the original author has probably
> moved on to a different project.  It's not necessarily that easy to
> review and test the patch.
>
> On the other hand, if someone from Nvidia wants to Ack this patch
> then of course we'll merge the v2 of this which has a Fixes tag.
> Just wait for someone from Nvidia to respond before resending.
>
> regards,
> dan carpenter
>
