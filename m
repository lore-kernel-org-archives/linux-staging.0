Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259F7299929
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 06:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468340; cv=none; b=X9xO5cLT0XfXdBhYLicyjyCA+WeURhcDRRTRe0pa1CEEWitxADYdqUKSbciGOZ4SB705KF8pxGGxiDsIqOkdFUGnt+LgyKGwI1bQ2G9LU6nFn2OFtcXXS19hbGg173suegKYoMCCibmuMPhrD8KC56AJkJoOfRNRpyCQxSxgFKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468340; c=relaxed/simple;
	bh=bKpim+9sp3trzvCBDLJ81+RdtyUmA8yRp5E2hrCBGGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl6ihjpMxiq7QMJWK9RUDCr0OxQXtLrkym6i9w1MYdzGKCm/ahS70sx1lItHY4SAAJbfbrYgWPm8Qw8uZCH1sUTK2UoEknpHN8zYZpQIpk83q/7i58zizZWA9k41iGpGnWfyk2hVUrep8ocIUzYfXov0kjvJhJ431iuO5EYA1R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPFRez3o; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPFRez3o"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso5312250a12.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 23:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780468337; x=1781073137; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Dqle1IgOBxWtaEbNXYbQA6N3q7speS01xaOOqTbaug=;
        b=pPFRez3oO1Ljz6ThvTFP56Am4zUiXwKlYgxNS/zm8zLk4KRomO2yQRABAPWpho0+Rc
         K+R+K1kSA4OEZYMaWrOBa1ZgCwQiSBDy7lis/oeQKPyh1tQORYg7te497X1T9FKBd+nO
         jBzBE1rb5FeVBya6poxAVqNYGGnCCungNNHjuxpf1q9okr38BEbGGsg7PxQ9hxQyK+Sv
         TrgvN/SkBhwUgbBnSUMM+nze1LfV4in1qV6j2kWaWVk8fkPiEbVGYeSX+965QDad0/R0
         xKA8Sd9SMzI1kUvoD4vNTLNCJUyZRvKzGTdlNLM9zZdnjKesjHQncapEKNdrsb+wBIGf
         Y2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780468337; x=1781073137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Dqle1IgOBxWtaEbNXYbQA6N3q7speS01xaOOqTbaug=;
        b=dgNQkoKQJb6tUPd7NcgCRkZfnfSqBN834SxzvmF5Y60ZkSLx5kIeQs68PJARMRtVXG
         +DfAWp6tccoqGyD6ajcOjZkeBhYDzsHIb+qT4LI6xaZh/JhM5wpHFlNkCe1oxRrCVxgI
         tCg4xRBqEdLBUjp5/5q+ZJZi/ESn8/PQ1Y/SQph0gTHWruypl7klanaX5O0wHn/N1iYp
         +TWEZKvJA/R8JNdw4wiVTzAO3V6Wg/DoMlyUA9YCXMyrfHjqSqOI5ZZJ21Mgy9kNyuLb
         tpjoLqtPLf6wSMYzubSBv3BHg8pjPSrR8cW88aU+CWxUocTL8p2P3KSNbdQf412jGAnh
         e0Qg==
X-Gm-Message-State: AOJu0YwLitHasvppi+iRDVaVKxyf16d1GhK2OQgxCBBdV6HuVEh23mBh
	bE2NSYEr1oefDVLGEMMEBAjezQ8NEwGgslE25Qemh4B0rhLJERf/YbsP
X-Gm-Gg: Acq92OEJCgVcAva53mvMf5Wqx55goU4iO/N2VKGIrybE1gwveKtnpKME80IUmIga8dk
	dSYGf05+22uLs+sm3Dmqq8ftVNemRewry+PyIyYoQxFtjMSxyjNg3sS5kk/b42w2MsYqP+Ap+yu
	rEqJXsSHXXi58Kdoxboy0sjDheK8x3T9X9A7SwvkxKdR+L5btp4gyog/GZMJDbSolCR9f1+jSRG
	FdjzM5/sRrYF+yPcUJqTkGgRZC/MrzyvDCkdXWVn/Ya/CkJdJgaaI0K1Qo2Yzrm6QrDGmzHYbB8
	PEd8YOnut17EPRFe1VOnmK2OSEqVfxYfoiYQqtXMBGcButlHUhmIFs+robVWZAFTahTp3n6bUjW
	pT5Vf8U0pBVjgMGtQXVIaKhqWFv/SZ2HPqO9FQoVkYkZJS0ErLKOVuxEHrrWRBBe73cU2w197Ug
	5RAjsyrFdaEX1B+W8pUrgIJYIN46+Wcw==
X-Received: by 2002:a17:907:2dac:b0:bec:64c3:9ac0 with SMTP id a640c23a62f3a-bf0b10d94b7mr74001366b.14.1780468337235;
        Tue, 02 Jun 2026 23:32:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm91327266b.38.2026.06.02.23.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:32:16 -0700 (PDT)
Date: Wed, 3 Jun 2026 09:32:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-iio@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2] staging: iio: addac: fix CamelCase naming in adt7316
Message-ID: <ah_Kbff-c38NWV66@stanley.mountain>
References: <20260602190308.158051-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602190308.158051-1-inasj268@gmail.com>

On Tue, Jun 02, 2026 at 08:03:08PM +0100, Jad Keskes wrote:
> checkpatch flagged a few CamelCase names in this driver.
> AIN and DAC prefixes are lowercased as standard kernel style.

The AIN things aren't an issue and checkpatch doesn't complain
about them.

> Vref is kept capitalized since V stands for Voltage and is a
> proper technical abbreviation.
> 
> DA_AB and DA_CD are renamed to dac_ab and dac_cd to match the
> register constants ADT7316_VREF_BYPASS_DAC_AB and
> ADT7316_VREF_BYPASS_DAC_CD that they reference.

This sort of change would need to be in its own commit.  (We're
dropping the rest of the commit anyway).  The difference
between DA and DAC is not totally clear to me...  The
adt7316_show_DAC_2Vref_ch_mask() function only seems to deal
with DA but the adt7316_store_DAC_2Vref_ch_mask() does stuff
with both.  So I'm not sure I understand the naming.  (I have
not investigated and this is my first time to look at this
code).

regards,
dan carpenter

