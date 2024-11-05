Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718AA13C8F9
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 15:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822099; cv=none; b=HdmiNIdL+jbb9MMBMOOVKhsd++bzEFsBrrI6gEy648ofnGh4PdTsLkJq4VEpGBf3dgDZqS/sCeL8PMX5LIDF0YesVenMjAvajysizDbyfhNiGN0wF6rOXkNtnqbYaT6K3lizvXudKvmqQFtDLwf9IHemGehWU5SVVQmVG2pHEYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822099; c=relaxed/simple;
	bh=hyWtsIgGDAniL3p39e/pGqovDCo9zE+kY2920F3jbl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWZCHMdl0dJeCOn5FzTnbjMLgxtwGYDAMnoH7MW6/YR0JFvZHEHlOnAtU7jT29/JVeZysLjLCjAmSh9I2CVX1q+1cddXygUYs5PbYr9aaMn/xXfLBXLykCH0uMz4jfsQisEc8HEMaM3YGxHkxmd3XUGFItE5Fnzv7rYlhzX9+0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fRAfC6SX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fRAfC6SX"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so3830427f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 05 Nov 2024 07:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730822096; x=1731426896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3njGTXhIv0MvCjh27pJAW/MEoJztiS2FVGTmfPZr0ck=;
        b=fRAfC6SX0SFnsmrDfHFsOgFT/il37Zu0DaRZCgQCRXAXIMgLQ+RT2twswqLID3sw2F
         CvnK2msm+b3gqoQv9mBPb9SHzLSZIj4K6tCSP5B1vueAQrvtLHHMDTKvkgVmoDbXb6d3
         ZvnHGSG/swzTbunIzzyUVUtJFdGNFi4dEd600fXt873gAasl7kYdn9F8Ki8+4VpFIDyu
         TV36tDlfa8Vp8URgZf0o2flbW+5VF5uEigmz+XHn0G4dJJekunmuyqdOMVtkEj6Efzj1
         Zsu7yE2lNKwfyJcVFmDL1WH2iJegPQgYueaO8mLDmqBr1i8gDgAEumyMpw1WeYZMeSXQ
         ie6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730822096; x=1731426896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3njGTXhIv0MvCjh27pJAW/MEoJztiS2FVGTmfPZr0ck=;
        b=I3yFriTCiB3Z/5Neux9yjb97jipq/uu1W47ShB3lT+apYZd+T6xV22yoK5LB/BJDvD
         Yrtxk7cIEOOHnl+lyQnDJsuHLz8WO1IANgOzGIYp9XG33Z+wW8FpBbECobwNq7dOl/wA
         gcIPjicyVv0wZG/RhYLfafalhr90wW3DpORZf3zSGCqE7yPFKxoSkcSXHI7pcBPj9FxU
         G00YPi35z1oqH7Ank2TNeaapwEXb7yH3bO+k+jqpg6w/S7mhjmsWiKNAKHQGTwgE76MF
         My9MikH/h2U04g7G18jy7y7xfvn+Ufivq7GmLG2+DXJr5ZU7wqttFxf6IlvUi6s+zLL3
         AVvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYBi0lSyL/1SOWGadWVjC7TtBr43HYu7cJmbGElcizKjuJXDjZqzlVNEAlRUwd1TzdtX+dHJVOHuVH0ws0@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgtnl+J2B1S48MvPvhXKWCe9OrigOzY5IdtVGMQLp9dhErrsa1
	QzWVf5LpHUCc0UfNBbF+RDNy19B5nY9NV6uwCbGYbSRa6hBgw7INMuysCu8Cels=
X-Google-Smtp-Source: AGHT+IF7rnb/L+HIkfYfKE4/bBO2tPxiKGqEVY92wIDxONH0zhaa6XG02B8P6pUs+dM/p/GLFXJvgQ==
X-Received: by 2002:a05:6000:118c:b0:374:c4c2:fc23 with SMTP id ffacd0b85a97d-381b710f70bmr16642600f8f.56.1730822095676;
        Tue, 05 Nov 2024 07:54:55 -0800 (PST)
Received: from localhost ([89.101.241.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d40casm16558370f8f.27.2024.11.05.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 07:54:55 -0800 (PST)
Date: Tue, 5 Nov 2024 18:54:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zicheng Qu <quzicheng@huawei.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, cristina.opriceana@gmail.com,
	daniel.baluta@intel.com, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	tanghui20@huawei.com, zhangqiao22@huawei.com,
	judy.chenhui@huawei.com
Subject: Re: [PATCH 1/2] staging: iio: ad9834: Correct phase range check
Message-ID: <1405e340-db97-47f8-aa56-5f507ccd821a@suswa.mountain>
References: <20241105140359.2465656-1-quzicheng@huawei.com>
 <20241105140359.2465656-2-quzicheng@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105140359.2465656-2-quzicheng@huawei.com>

On Tue, Nov 05, 2024 at 02:03:58PM +0000, Zicheng Qu wrote:
> The phase register for the AD9834 is 12 bits, which means the valid
> phase values range from 0 to 4095 (2^12 - 1). The current check uses a
> greater-than condition with BIT(12), which equals 4096. This allows an
> invalid phase value of 4096 to pass.
> 

I tried to figure out how this looks like to the user but I didn't
figure it out right away.  Please add this information to the commit
message.

> This patch corrects the check to use greater-than-or-equal-to, ensuring
> that only phase values within the valid range are accepted.
> 
> Fixes: f1d05b5f68cb ("Staging: iio: Prefer using the BIT macro")

The Fixes tag is wrong.  It should be:

Fixes: 12b9d5bf76bf ("Staging: IIO: DDS: AD9833 / AD9834 driver")

regards,
dan carpenter

