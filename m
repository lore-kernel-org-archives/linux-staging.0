Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838CA2746A
	for <linux-staging@lists.linux.dev>; Thu,  5 Sep 2024 05:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725512617; cv=none; b=KlVb6fOFXuySkQiX5P5T4pHs7y78jvSo/UP9VTXGnmM3gjWvX/XCBS9oTT5IJoCvx4tsnCk1bxI/yXCXdKsz/1kBXLeZVtrznvTfjcVUX289JyyUj9us2Vgs2Cq7MO9KoThmvY4MDr6Dgjt94BBU55kRtP8GTFV0GeJvb09yOAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725512617; c=relaxed/simple;
	bh=bE55jMswc3Kd1NA0WA3GkeMdZvR+oa4ium/onUMNrhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yc0iOBvAz/dObaq4GAi5RqBkYTfJ/voyquyeZlQiMY8HA/4h0YIrHa3kUKsjdBL0ebPMUoLB7AcSoraAyCeexrsXmoylZSopCa26VQqKQMRpKWHjgnis+xSOJpTHE9Dtsmr72f7ciFM9zevRrWFa6lKXY424IPZJOlN47ZY/yZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P0KqUsKL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0KqUsKL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c6187b6eso174976f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Sep 2024 22:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725512614; x=1726117414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bE55jMswc3Kd1NA0WA3GkeMdZvR+oa4ium/onUMNrhg=;
        b=P0KqUsKLSGLzdEt/2/tSfrvqfZX2jBNC4WX9GF2QZ8+QD8BJIvURS23meYnC9dacZm
         XPDBLm/2pIEDAi+v7JcMwJ5QrsbL/KLtOluLf2iBg9+o0txMBwlqtSv2Tfx2cEF19nIF
         ecV+ODXA7Xdej3XSftfMlQ9Bl0yzXPGKV6ZT8xipwsYNsXAnEoS4kovbbZo+kUIW9xyY
         5zu81E0WrezWVeS0nW194SXL1YqaRwlAhnUZ1O8Oj7nWQabwuJfTvGwUHcryH1ziPhND
         g0xCncjFRgpiXy2WQgBwoq0uJ25NiHnBBzo4y9OR3BIQnfo9oegTphangDmlgMmJWGhR
         1NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725512614; x=1726117414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bE55jMswc3Kd1NA0WA3GkeMdZvR+oa4ium/onUMNrhg=;
        b=SmhfijbuS1cnym0syAvZMD4MQRDJOjjjKqcBNulvFzsiA//0i38G1w141ZjElLq212
         /Sish38QS9kP2gqJHl1W1RMd9J3V6kbHxKerA/SbkRJsd38YbC1T5bn5V/XAxsJ4B7PZ
         sqDsOSejigwBowIqJO8ry1ZxVFiJBZEwDeMnhaqVhEh2UkEEuIyXUf+MPFj0mmdl4aHw
         DFY1IvSx9vMeHTTEmvxNrRmPwDCY1sHQreh0xOre8iRR3mVtGYRo52J/Wf1efH8ApXpU
         Dy95EI0gT6dGUnd60+yMckW9QVV3meX2tFmv7tvi8jSSd6cSkJtHv1MUqFvAK0TX6bLN
         Rwdg==
X-Forwarded-Encrypted: i=1; AJvYcCVeRoAbtgyIsk9fVQoiTlaDBQey8KT+0pO6IV5M1ZNxPJd9NriReGtsEeO/NomBwxLUSee/kSj2nGuzdftS@lists.linux.dev
X-Gm-Message-State: AOJu0YyBwIPd8xxrJQvihmAsrsOYtoUGo6FqUgXltb8+OoiU0CUWUi8W
	tYsY6bG6rNfl4W5vCrjuwgAucFjrs9RBzq+GUvxgw05JcOUsew6C2325pvjN3TM=
X-Google-Smtp-Source: AGHT+IGnht06+6EQRhWaBO3mAk2qqMwD7GrR/KXBQuajQbXlnpSMcTpVnd4FM3JnmruyXAF2Q1Cdig==
X-Received: by 2002:adf:f10f:0:b0:374:c9dd:2b15 with SMTP id ffacd0b85a97d-374c9dd2b64mr7705962f8f.31.1725512613496;
        Wed, 04 Sep 2024 22:03:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efb37efsm18421565f8f.109.2024.09.04.22.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 22:03:32 -0700 (PDT)
Date: Thu, 5 Sep 2024 08:03:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sayyad Abid <sayyad.abid16@gmail.com>
Cc: linux-kernel@vger.org, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, pure.logic@nexus-software.ie
Subject: Re: [PATCH] staging: greybus: Fix coding style and syntax issues
Message-ID: <3fc7ea0e-82e1-4df7-bada-b8cb1e11a0d4@stanley.mountain>
References: <20240905015714.356662-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905015714.356662-1-sayyad.abid16@gmail.com>

On Thu, Sep 05, 2024 at 07:27:15AM +0530, Sayyad Abid wrote:
> fix errors from running scripts/checkpatch.pl, including:
> - Added spaces before open braces and parentheses where required.
> - Resolved macro argument precedence issues by adding parentheses.
> - Corrected trailing whitespace and improper indentation.

This breaks the build.

Plus it's too many changes at once.

regards,
dan carpenter


