Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE957261E
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752639510; cv=none; b=WjL1q1CmnOlv0PNXbA6uOVPMUeskQg+uA27W/u1zkeLXm1NfIuQC2OqGoQN4vHOqj6osZp1c2HQrbvfaU2pNt7GocRqKXbZ+bMrevjmTussbYc7FTsNqL/uP5uMfl2mnMFCGKlQQ2CbMfvL3YRH4Qp/S9v5ehmWb43OQ03CiAOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752639510; c=relaxed/simple;
	bh=oto/n6TCbchQzSB703btk16cJiplLhgQ7zW4XX5nZ4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3xTtWAlNrZbGQWswJ3GqvchoKxMPU2DPbpL6eHEXFuWRnQyW9Nu61crPg7IXc6RubjzsHeftuvluvDp+RlEAzLlf1Dx4g+mK9d3/DMsEtdgp+525hkxALPGuRughJ9UAF815Z3WgnJzvaqb/NnoCPrDC7mBIvsxHh47nG82Si4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lcEe5mqr; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcEe5mqr"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-41b6561d3e6so1095426b6e.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 21:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752639507; x=1753244307; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5H4HdKrcQEwabRwfwGJyrWRCmxFyWkQ7fRmOg4zE7oA=;
        b=lcEe5mqrZNzuudlKtbs96EhJZGA6Qjgf/S2T7ET3oXwO7f70X3d9aiccvNqsS4NzT3
         4GfZ4YMGhGAbOj5SgJncN/Pt8/UH15slU7us8az9CtDeUAxL5b6qzd0GsfZb2wUdITKe
         Qx/eJ4HZZ9MUrlKctgKcJ+i/y06kpjwVK84Dj1PnhcwU5UUIefAM+n/fyFyv4NPz7bXU
         f70bTm2ONJm5KCPvyVxWglxjZ5Jgtgl4AnRB9DOozkAS8MI3LDhm0lpRmb5flV+QF0ew
         HnpkHd4oDmB87iF3uyAl9grI53LtTiyEaR4tKIlqZvzUnwfNysbuZjYBVzfU+IFQeW6a
         3dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752639507; x=1753244307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5H4HdKrcQEwabRwfwGJyrWRCmxFyWkQ7fRmOg4zE7oA=;
        b=pBckfgLL2L7AKqELJhAD1g5GeR48QB2dlRYj2gj1e1TMGcl2yeGRWCmX9840Zs7GNu
         Uq3llXA547AXIrVDbd6cx5Ffufz/pB1lzIcSlqoRHKlXjprLBTtBAaDX7unIMlh9qXq6
         y+EzlT3WUtd1AciXuUTgCnBTH2A+NDk36TwreE18uCW6SbIR3KFoCHN/GKk4YbzXF39s
         J96FRzv9VoU+rG/jsI0FcbW6ZNYfwfL6NmPw+NeCTnGNlIlLQT4hP2DLm21x8BKdSqmg
         XifQoZ126VJCRqBrK2jpR2FfagkreeLI3ylG49haLoB0f3E/T5CFNq/9BjxVM1caM9qm
         zR7A==
X-Forwarded-Encrypted: i=1; AJvYcCUtdpg1Nux++fgIZ+Jkqe5X2jB9EI0KsIzNIiX5MJCb6XC919gHqlVmy71ypatTyXQHwdAvNH/OncqffQRn@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+J8UYOC1a05mr1Y7cQASQdTWTFOeT7HibERYhvJXLuGb7I2Ph
	taoCakAtO/YBD9YvNqSbOF/mJ5fIX2dX2XD+zZZtOpsvIxiY7JIALM8psr9qTC+bWY0Dy4+rWdo
	KT93+
X-Gm-Gg: ASbGncs9Q3YG3JRZ5mGxATqWrn0TDbaHz4Gzpw8XE1n4OxrUgY458U8u6zV6q5/U0rV
	s4tTWxv9AjNaWQ8J4BHHstQoqioEBEA+uw/oNDi/i6gRTmajzsYiVHWtqe/dYS/Pu819y2RD+d3
	4nakQxFRBlL4bSsDKQkwqpluIkaqEOiRXzXd8kbeUFMmHTxFWY3yUcvv/RxUJluRTzOK3w9tqW4
	ewJW1eixYG1NKtC3LDG3+cza2Gqh3SGIm8W3dNPUi50I/dHhpI/xa3EtHMF3lgeEewaeRoAhVeX
	na3OgZ4NqMdXVmvzHdZ8DuyNtxkS1gUy4emZi+KvusCmCqqCCOjNJPNndL+P79l43mvY2zk7uj5
	0k1NYTSCX6QLMj+aAFn4/frzLo7JEJck/IB2GZSA=
X-Google-Smtp-Source: AGHT+IFhLjhnOeo46E/SOKl3OzTueSgMQlM58Zb0eK9UOOWBXR9DisA8ORH00rRKCtUrLi/toP8HcA==
X-Received: by 2002:a05:6808:1512:b0:40b:2f3e:5f55 with SMTP id 5614622812f47-41d004038eemr1085693b6e.0.1752639507467;
        Tue, 15 Jul 2025 21:18:27 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2564:68a3:7d6:cb7d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-414197c52a6sm2482751b6e.19.2025.07.15.21.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 21:18:26 -0700 (PDT)
Date: Wed, 16 Jul 2025 07:18:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: sm750fb: Fix const declaration for g_fbmode
 array
Message-ID: <d7f17f72-d086-4ab2-a22d-33f0ea125f54@suswa.mountain>
References: <20250716005553.52369-1-ignacio.pena87@gmail.com>
 <20250716005553.52369-2-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716005553.52369-2-ignacio.pena87@gmail.com>

On Tue, Jul 15, 2025 at 08:55:51PM -0400, Ignacio Peña wrote:
> The g_fbmode array should be declared as const pointer to const
> string as its contents never change.

Try compiling this code.  The contents do change.

There are a few other issues as well.  Try running checkpatch on your
patch.  Also there is a specific format for v2 patches
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

