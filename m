Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559513009C3
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760462033; cv=none; b=YE/y3yqP+SAgoGgDWaRSZZjAp27auBEbHg0a/t+/nPcFhDGtZ3oIcumYMGD8UYcMBNFLwLqe27Mf3YiYk1U9EH+8iH5Y4fbIPgW2rCqs9Q5g+D9BhseP7w8wgKK+WTYmqsPMiKUVUi4+ABw/ZEiiRHpRs03jxVLBqURD6dQEajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760462033; c=relaxed/simple;
	bh=GpTOiyFRtNdaMSqi/bYVQ3sJz6AasUzfc3zGOwHXihA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEUqfsKqTin4HDxRAxTjS6jOOTVoQVs3W89gf2yFe6zVWFcwo3IETcUWFI+vINc7SQUatxsvfrL9DzXkllCj20aCbI8aNmWRgP89MqBN79QLMD5ynIxumtceoTCHaBKrG893MyrYRw/4kvk+DdDGCLHSknMNY57jIoIF44I5Jw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LpdRHHn7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LpdRHHn7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso3549539f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760462030; x=1761066830; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y/vYN9+i/8qfTPL7Ep/qCKS+DKMGJXilpY9pRGklEdw=;
        b=LpdRHHn7BTLy8VYx/P80v8BptTdXjDzimQXn8ARpLtCtUh11pIGdYncBZH/LEWc8rE
         qONlMw6AMF0yYx5u6g0gln9x6Wxn5PHl5VwbQeBnvDoHwH9UzBnPlPTUHLmG9zi74m/d
         X/Dow17dzqQ4YeowLmbFlFV0cJ1l47n/2v3IxhIm87+qJb4INOkXIKK/fuZPJi6TVnAO
         vQCmtKgPfKhrRr+/WYEctwJx8BFb/C7CIKcYvygBJdrJYOLy6ts1H/ArBkves9Lm78NU
         x2pi3BWdft7oZDsdGLLo80KKYnmfpIz3Z6OB9HQJz+LfgXg161CrZUSLCd++qB85a3xf
         N4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760462030; x=1761066830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/vYN9+i/8qfTPL7Ep/qCKS+DKMGJXilpY9pRGklEdw=;
        b=gkm5Wyquj+1ZN2uek2nlSQt93shGF0LQN7VB3atzwyAe9b1/MALPNeMFy1qL+rcb0O
         QedwAc4x1bcN1ktADeA/xzWgzNSMN7LiMJ/FzO30+6vZUUA12LYvydtRgYtzmSAXM1Jq
         NN3upqW+eBXciFzQ9Oja8IjMHGfLamJxVlf8FyifWc86R4UT+rnpOLZoCl3mU7ZDpkAt
         N+LxQvErTskGejB6jO3z4U+xQrBdv0rwyLwaGenv2Rk/VoIQX+3I7VqQW3OhvPUQHvVB
         3Hn83vu9yArBhqSUw5zmktoQz40qZz02DKLkcvbSsaSLIdEchLkDc1+/+g2DgaX2S4wJ
         ZxMw==
X-Forwarded-Encrypted: i=1; AJvYcCWoyf9YipcxOJvej/X/XER5RVov5uwHhmKK4xKuaT+3K7/8Sn4+6qhEqSRp4MJwc3Q3NjB+pa/ISrCPXpVA@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc282gYYZLRH2QKHE+gUv5YF2iBzuDp0guoMBWSz5j3rrI6po8
	Gka8b7yicZ0BkrVNqosluQlgDRmLAq00ZSxIVJK3HqjeQJIeqjkTud+DACv9TZaJxGQ=
X-Gm-Gg: ASbGncuZ9AKxX1JhbaDM8dnUfmZBcYjLTdOc+BVMjvCLtfNS/XpmafAYA3aEc1KRMp3
	je5o41A0Dns+E3gCguiVGA8nc6yWkN7p8osK2uD+GWPMWm4zJA73iKCmUlOI14HlqGiYxgezfoM
	U3vGcgdLImMNoi62il3rCrae2FYW6Hy7cS5us4QOqTgjFI0A5yqZAVkaaLfTkC5wAjZY3aeuaG9
	qGUGoHwflITGMUzcF/ZVlS0T37/LUsiIul7J38kWjjC7YMc1zSGhFaTLsc9ugkGh7ZWvMwKa3zK
	IriYJwdg7wDlEofusouxxkSFBQoAhkQnyeRRE302Vtzpc0Af65eKb0G7suuajMK3ebDjWDTL5OW
	V+WBWOLrYPs+Koly/BK0rYo1bqJXn+JDW2d1jIo8AuDccwMVwB2mS2nh+FyWwdA==
X-Google-Smtp-Source: AGHT+IGGYXaAodq6m4PGqBgRPauJSJZxd04u1Kj3/fbCuSDrFC2zdB/eMxQhep/Yh0n+luFWoRrXaw==
X-Received: by 2002:a05:6000:40df:b0:425:6865:43fe with SMTP id ffacd0b85a97d-4266e7cdc9amr14865200f8f.2.1760462029517;
        Tue, 14 Oct 2025 10:13:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb483bbb4sm244163775e9.5.2025.10.14.10.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 10:13:49 -0700 (PDT)
Date: Tue, 14 Oct 2025 20:13:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: gregkh@linuxfoundation.org, johan@kernel.org, elder@kernel.org,
	schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: documentation: replace strncpy() with
 strscpy_pad()
Message-ID: <aO6EyUVO9EOYfzV4@stanley.mountain>
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
 <aO5VvrKTswmfO-n9@stanley.mountain>
 <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
 <aO5a9izAISpCDJrc@stanley.mountain>
 <8f550b4e-2b7e-4266-be92-bb724265949f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f550b4e-2b7e-4266-be92-bb724265949f@gmail.com>

On Tue, Oct 14, 2025 at 12:10:50PM -0400, Vivek BalachandharTN wrote:
> Hi Dan,
> 
> Thanks again—confirmed the structs are zero-initialized before the copy.
> 
> Would a minimal fix that guarantees NUL-termination be acceptable, e.g.:
> 
> strncpy((char *)&intf_load.firmware_tag, firmware_tag,
>         GB_FIRMWARE_U_TAG_MAX_SIZE - 1);
> ((char *)&intf_load.firmware_tag)[GB_FIRMWARE_U_TAG_MAX_SIZE - 1] = '\0';
> 
> I can respin as v2 with the same change applied to the other two
> firmware_tag
> fields.

Sorry, I should have explained this at the start...  The struct is
initialized to zero.  The strncpy() copies at most
"GB_FIRMWARE_U_TAG_MAX_SIZE - 1" characters, meaning we never copy
anything to the last character which stays as zero.

regards,
dan carpenter

