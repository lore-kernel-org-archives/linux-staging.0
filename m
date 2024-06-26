Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E933913CFBC;
	Wed, 26 Jun 2024 04:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376915; cv=none; b=bDUrOa+SfQWmEcbqGjicorJn5bvTCB/9SOwG1T3TNA4X2LEGXUx1E3C2NBmV7qMx+InOLKzHHZ4GmCGa7puMti7XHmeNHtgR15Mf+WlFvfPdwNQalrhrbyVzhS4WF4mI6SZajfrU8T27PRQQAOub40+VH8EW0fINkwR55ZG4+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376915; c=relaxed/simple;
	bh=c3Yze73LZu3I/gljxsqZ2WmNEz/P/xYnIpox7TAo2FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Olx1uFJ9ZFyqkfzoZrtHfJwKlC89pyz3kCUF7+L1ibW+hDjWxJDsdbvfcmNDZ4v756rKjbGGCkDNuZxrjj0/YzdeyuE8PqL27FkzFN2tFwCE7yZOlPoklA2w+OC9v7lwOqmftTx0pJu6UHW5z6KmEiT1ERVCbZr8on+H4i44nHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3jwAnsJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3jwAnsJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-424a3d36c28so1432395e9.0;
        Tue, 25 Jun 2024 21:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719376912; x=1719981712; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OPu8o3NFntJwVaPbGld8pCdkv12AmcbKbLHyv6SdaIc=;
        b=K3jwAnsJ9rxB0P/9cMlMc3uGP6uBBfvEHv6sQeOYCS2cbaiadcIwJHq8awWmNI5SYA
         Lq6XJKGkM+jKJmbu6HR+gzSd/2/o5/WfRUG85ugCTehIlzfnnRjUUhitlUg5yfsxBOCU
         r8OQXMGMjWH0TxK8ErNaKsB7bSB+9+79YY8thZhye9fEP7ve37ofp9L7Nkv5Hkgi70Lv
         w0FSinP3fZQsejST85oESw2lXRlAoAFXeQ72CFRvicZl6EZwSvWU5ILSexwaxNEtyA1O
         6ZteVGThcX2HCSJJC5cffbunl4oXXbkYa/7C3mMy68KANr89sJJeAZtGTkVb+hQVe61q
         MkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719376912; x=1719981712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPu8o3NFntJwVaPbGld8pCdkv12AmcbKbLHyv6SdaIc=;
        b=Pa4n4Ihg2jj2tth9SxqNCVdVrf8CqurNCXA/YYJJesxOJ5I8LiDJ4+g/CWb+31nH8V
         m60VSvLhPKmP7LVNlof0QvzZeNin+aVjQ+pNnonEy3AzY4YULxy5UghhVBDCTVa7kBh1
         dvuJbkVD9YYtqiwJLjvCCmNmJe0PL6v6E0CayUxSuIA+SEV7fZ2joW5tr8PQVeKVyOLZ
         x82TMF1Qz6LTlLyD6quA+/GSGkvP+okXWxvBhzS7H3DDYmfvN8lVDmigupVDKa30oVet
         sJNbvYaGAUoFbkGoEGwDBepjbuEy7JnE1Trg/MPTyyAIdpkKmkgY5OXhHaagoUAVZt1e
         mDxg==
X-Forwarded-Encrypted: i=1; AJvYcCWWGzNUuelWQ5i89KmpGpKtE4qHVsQCmK/WjSuPtWF292m1K1ldGo3p4UcGe6sKfBa0IVPlCyssyWiozHwKU5Z2DCowSIsZYVv9cV0aWLelCOuDZ8GCj5vRB6hp9NBgvDXIMuKQKte9UQ==
X-Gm-Message-State: AOJu0YyBc87nF42RwVmLw79oH3z5UnbgHHWsemmTsenJM8+N4sOdD/la
	7Y7idberOA5rQXjxJagxiwhtccek5RNXx6RpOcnPGIopfRhuH0YT
X-Google-Smtp-Source: AGHT+IGrG4cFrWFZFLHowsdYdllxDPlIUG7c3w0AxGdkSM0WlzloTYOFNV/Z1mztaxkugppxgJhufw==
X-Received: by 2002:a05:600c:1c23:b0:424:8c26:a236 with SMTP id 5b1f17b1804b1-4248c26a402mr71896525e9.0.1719376912043;
        Tue, 25 Jun 2024 21:41:52 -0700 (PDT)
Received: from [192.168.0.103] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c824ef19sm10021125e9.15.2024.06.25.21.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 21:41:51 -0700 (PDT)
Message-ID: <c2911f68-d1e2-4b45-af95-590926b7a6f1@gmail.com>
Date: Wed, 26 Jun 2024 06:41:50 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: nvec: use x instead of x != NULL
To: Tom Mounet <tommounet@gmail.com>, Marc Dietrich <marvin24@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <667b2ee6.050a0220.f9c1.5426@mx.google.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <667b2ee6.050a0220.f9c1.5426@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/24 22:56, Tom Mounet wrote:
> Comply with coding rules defined in checkpatch
> 
> Signed-off-by: Tom Mounet <tommounet@gmail.com>
> ---
>   drivers/staging/nvec/nvec.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e5ca78e57..814eb121c 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>   {
>   	mutex_lock(&nvec->sync_write_mutex);
>   
> -	if (msg != NULL)
> +	if (msg)
>   		*msg = NULL;
>   
>   	nvec->sync_write_pending = (data[1] << 8) + data[0];
> @@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>   
>   	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
>   
> -	if (msg != NULL)
> +	if (msg)
>   		*msg = nvec->last_sync_msg;
>   	else
>   		nvec_msg_free(nvec, nvec->last_sync_msg);


Hi Tom,

what you change in this patch is fine. But the Description is not so 
lucky. Reason is that checkpatch is not defining the coding style. Not 
at all. Sometimes checkpatch is even wrong. The description I like would be:

Use x instead of x != NULL to shorten code.

or

Use x instead of x != NULL to improve readability.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks

Bye Philipp
