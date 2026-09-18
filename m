Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74E34E4C49
	for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 12:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733946; cv=none; b=eXGxL+POUb6P5KkCnG/NUncuuOfPVvqrQmYYjONmBHeJYilAsq18OiUh5RxzQQdxe9QfoSlKRp+tC/RMIZ0DC4C9/ViTFFyadTskNGEbNKQ3kwRgkkLMVYq4tGwhKAOwkjMBAtMrykeFG6daHILdoFotHQTYm+O/wy1JnXJtiHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733946; c=relaxed/simple;
	bh=T5LKBNbvYR8NcQ1C35yVmY+2YpnZr6sgSZUAEEmtdLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPsZ7qcnG/mTRbjAkTN7IhjBLKXUouNxmGitRAOGqK+RWycA7aR6nyjUFZd0r3/O9OfSg6AobhvD87hhvmd+y2T98ZVDXGcqprWbaLLkdEfnjjObvc0yRT5EBhYpkPYotMLCPQ1w6+RQgMJPv2r3pw4nTOkW22sCC0L2E28PoPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=GzoWVp5Z; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="GzoWVp5Z"
Received: by mail-oo2-f38.google.com with SMTP id 006d021491bc7-6c901f4bfffso366410eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 05:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1789733941; x=1790338741; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsDoVpXxldUgmpDo2FIGPQNmvGEWxWO9/A1/cxllYOs=;
        b=GzoWVp5ZQgOO8xIgqv86M0ajmWJSfTcsA2jM5RneWeKxOUjFJ/WKHE8f9nlHNdQKAA
         DEfeUkhdd39MgDeWba8eSFvYp+itDgUsCoe/0z4OOkPDxOFjDzR+NxmYjVtGp0ms/6/H
         lRYW0eOTflo9sE2uygGpM1kJEKkmSTs/HKXmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733941; x=1790338741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsDoVpXxldUgmpDo2FIGPQNmvGEWxWO9/A1/cxllYOs=;
        b=Ifrgsbt4WIDOPLpCwfrHSJZxpRzEPASMrn22eZOENsPG9BuQzxAzyG2CTm0WpfYEO9
         O1C5YnC3zwE0dh+K+0ojiZsUD5zViNBPJDir2NBxHPV3hFYhOvmJgY69dONrFGJJZf5f
         jtwbf+UWi5JRoCW+uRZ3JR1yJp5Mjj3S/HlJmCoWw+sM84WGLOOSykmS5r1KJrVzZK1H
         ZOc0w6ZMGICavAG5GzFn7jA6YR0gVnKi+XJF9rIJOydPXOu/PimCTpYn7e/kbEsn1cpH
         KYa8GOR/RSaDhVUXsAKH/bdSJd4AVNoxNOYKsD7yj0u05ZsrNZ84dRQ/miVeHwRmfvFc
         S9+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwxHcZK/Mqr5BttrXrxktzlg0KCkOab6+LAPdUt60rmWWYqLncGVOlyDorpg0K3YPjkOOjT2PTPihEx9+b@lists.linux.dev
X-Gm-Message-State: AFuF++macNhPb2Y9xPzUOH22JEd3iN25f/rNvS9JcbBvJYV0IWqOZRAZ
	wjsiIThP8YXQZMuZyjpX5HtUNPYUSY7rcjGoidXS+OkT0o9LVecGqWGb/SCj4fhfwn2+0wRY1ir
	dZRml+g==
X-Gm-Gg: AYBFou0WlEjCm1aLxGyiES58/vfSGla6kmnLwpJHARTAiEt2zEYsB8Vl9uMw13EezzV
	/gJiqLWKzLOebD6ImQSJCtticBDjRPejwlG8yWge0m7EA0Ygbyl2ljbDPH23nh2LoyYWx5vrPIX
	Ap/NTSfgtitw12drUNdnAnKgVbO9S4LM/5HM5XQfaOMSAaIrerjGDuupD4CawOCra6C2bUa6Uk2
	W0Mq/K2P4HNiJfIXhOcIexiUF1yLKQNVr0CzsJZdSPg+gW0vgc7FT1zeMl54X48z44Sq4KeVgqe
	Znw70EolvAeHxRQ4CJb49DFr/d2dEB9ftJdU/F+pICFqw1kT0ys+akmj0MVd2DJANxwv0A50OGR
	vCXiKN5riwVq4a3XSrkJ0PnivR/Qx6EFDyW1RQ7LmzNsSg7mRwfenmhMiVRMD//c9aGHWjCF99Z
	FmKl9BIdYJb65ElEGMqiU2JTfP4Uud34io1uv8zvXMen3aCl61PGvZ/G4ulxcujeXTiw==
X-Received: by 2002:a05:6820:628:b0:6ac:b6c0:2bf6 with SMTP id 006d021491bc7-6ca9a63c715mr2145626eaf.5.1789733941134;
        Fri, 18 Sep 2026 05:19:01 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4873a2ea6b1sm730690fac.15.2026.09.18.05.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:18:57 -0700 (PDT)
Message-ID: <d527cd2f-6a74-4bda-b84d-cffc523a861d@ieee.org>
Date: Fri, 18 Sep 2026 07:18:56 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: remove empty TODO file
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260918011654.115001-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260918011654.115001-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 8:16 PM, Ethan Nelson-Moore wrote:
> drivers/staging/greybus/TODO has been empty since commit d85bef159923
> ("staging: greybus: remove completed GPIO conversion task from TODO").
> Remove it.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>   drivers/staging/greybus/TODO | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   delete mode 100644 drivers/staging/greybus/TODO
> 
> diff --git a/drivers/staging/greybus/TODO b/drivers/staging/greybus/TODO
> deleted file mode 100644
> index e69de29bb2d1..000000000000

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>
