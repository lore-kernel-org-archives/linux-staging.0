Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307983603ED
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775201481; cv=none; b=awNiio2axyiDFdMwdl4cJa4MOaoooLHehVvHJTvg52DSwSqjmKFbSGv+CmQ59/q1Mg+DCZmwWAp6z47oNrbgjcVtvtgUItfWW90nQTUujjIp7xnWgw9+xrX83+f6pdSziDH4wK8RWkGdz9wEa/7MdI9C/RuE2cDTizzKa9kxC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775201481; c=relaxed/simple;
	bh=rZ9YqBG8TkbbbOZnyerkTV4TfrBtBiuUGlowBhsF7Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/PwmryFrvbt87jsX4tIyR0BHyUKeUA8wQGW1ujMne1a2HDZJ3LT+jeuypQsZ1AMPw0SKRhDF6h/UILUWJoLoc9WRFvwvgWL+RLmdO+jKCn4QrGeHF6txKeNxwq0C1SN4a3cPyOQZAieOW/js7mdH0c0nSERm6AJfMsiejPDHmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnwJJIcF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnwJJIcF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b23fcf90b2so15371225ad.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 00:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775201479; x=1775806279; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=StDviqK2auPtsxUwQZnkiY2ibM0+znAstnSyvsxhsUc=;
        b=lnwJJIcFqrGcBTOCTUTnxLb0l5QFJ0Vzxe30swro/WPjiYxy1NEbxmW83nanBAf2KI
         u2fSwoNYI9iK/7OEwS79g/wPvDGxIbVv7BaQNetX+cziBUGqyrUd4xCpCBCzHwNV46pJ
         DeHqZVQ/dT2vTw294+SO8Y4IYRsx6/MOnudCoxQBOvgJpOyvmDc1n2CYIlB7SdClIir1
         Xj8L+yzi/stnIYZ5WUwWgt7vPBlzagczH0ahKUcmKABi4qDz5twvR2qhPKCC3/1Y5rS2
         8hqqrQ6mF5jSFHHUSa4ognigSCWStnMmkzrqqpB0/tK0tBftLGWl8/T5LPchxgo+DoQY
         wwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775201479; x=1775806279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StDviqK2auPtsxUwQZnkiY2ibM0+znAstnSyvsxhsUc=;
        b=dyOeZpUqGN4IVQBfhaIlxcaA+T/MdQeSP7r2RgXIX9yJ/ttm8LY28Q0ISecqohNr2A
         6lchrM2YtV7voGmYlTu9pr3DoclDCi5yaRQH/kFC10w8a99MMjhNr8iAYY5ueNBSqgfI
         bIVb/fSban9rgVgjdeCp3pBpe5L6w0YtPo1P7M0O5RtDdWVCg95Hs1vgrIiCmmWzf2dJ
         j8uiOgm5yvRBe6UjBxGGhwadia0msRRE8FkmZI+xv53fYDCAHsmX6GvwKvjelwX/zdOY
         SbExpklzmLtGiPzI/q1fP1XOd7L5VL5qUaftlDSBHo/S21FhLflfPSTd5GRGTvhDp/KY
         g4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCV+rAeVBueYtTGrAAeZDP52zt3G+NckeKZuq9CB8LPwYjFmE4k2I6jxB11oZQrLPKVegcLO1MYZYPpf/MWS@lists.linux.dev
X-Gm-Message-State: AOJu0Yw878Kfla5d7fiCk7Lms1rbTcM17DZkfcN0A+aEHpVzBEYi/yEJ
	MwsDnTAXSULfpLkG3lPx2EsPUc+c95r5BnRz1KQZo5dmycrhf9a2P7G5
X-Gm-Gg: AeBDievowd8hZ101cS9nYloPkL6UViGe2uTf3YFgcsRo6Mp5TnM3beN7IIQyCx4+F2e
	STUn523l141m9w+W8JiS0dsygaCYQFGaIqzmMVfCWbi0/OJL3J1MC3Q/AEZCPgdzvRgYuSSdfEi
	r44xltGITyPWmu5UMPnNb/sLKRPDOqg82zHYFiRlDIrLyOHOZ+CNpm81VherMjZkldLpbGh5LYQ
	sHqIx7CZMu2pht7UgxcnEfVbzbDa7JYi0q5LSmy/HoVkI7GcrA1jsNXhLZgQt/DJ6spPUouYzWC
	cpiaYVwRAxPthCOE5CF6gI6pyt3PXfJWbZZB96z6xkICZD/UQ0r8ugETOQWMcAPA+4gtDPJlUSu
	DokGaTUDOOoCLedLyiS5XC3K9l6wl6g0ccmi16dN49B2arcT1utXQ5XAzF9h8vHLDPg847YF4zI
	orTIWCi1ReMhM/oS+nFPuo4K861Ubh81Y=
X-Received: by 2002:a17:903:32cd:b0:2b2:51e8:2c20 with SMTP id d9443c01a7336-2b281760833mr23082345ad.21.1775201479414;
        Fri, 03 Apr 2026 00:31:19 -0700 (PDT)
Received: from inspiron ([114.79.178.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749c38adsm63481725ad.69.2026.04.03.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:31:19 -0700 (PDT)
Date: Fri, 3 Apr 2026 13:01:08 +0530
From: Prithvi <activprithvi@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andriy.shevchenko@linux.intel.com, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, weibu@redadmin.org,
	knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com, lukagejak5@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <20260403073108.qj5vjqx7zq4l3kdx@inspiron>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <20260328174716.rna2qykokwkojzpt@inspiron>
 <2026033047-explore-embody-564f@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026033047-explore-embody-564f@gregkh>

On Mon, Mar 30, 2026 at 06:03:08PM +0200, Greg KH wrote:
> On Sat, Mar 28, 2026 at 11:17:16PM +0530, Prithvi wrote:
> > Hello all,
> > 
> > Thank you very much for taking time to review this patch.
> > 
> > I understand, that this patch may be considered to be majorly mechanical
> > changes, but still, the scope of the patch as well as the changes
> > involved make testing important for this patch.
> > 
> > I agree that, in case of unavailability of hardware for testing, I should
> > have mentioned it and used the RFT tag for the patch since v1. I
> > apologize for missing this detail & understand that compile-time testing
> > can't be sufficient here with all the changes introduced by this patch
> > and also the concern of the possibility of regressions getting introduced.
> > 
> > Going forward, I will be meticulous about clearly disclosing the testing 
> > status of the patch and if I am not able to test a patch, I will be sure 
> > to add RFT tag since v1 of the patch itself.
> > 
> > Lastly, I wanted to kindly ask if it will be alright to send a v3 patch 
> > with the RFT tag, incorporating the changes discussed in this thread?
> 
> Yes please.
> 
> But remember to do only one logical thing per patch, I see multiple
> things happening in this one :(
> 
> thanks,
> 
> greg k-h

Sure...just to confirm I should send RFT patch series, with patch 1 being 
regarding the change of keeping constant on right side of test (shall I 
include the minor changes like proper formatting of if statements, or even
value == 0 changed to !value, etc. in same patch itself or strictly keep 
only the constant on right side changes in this patch?) and patch 2 being 
regarding the API change of using read_poll_timeout_atomic() only, is this 
correct?

Thank you, 
Prithvi
