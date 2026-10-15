Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9F45226AC
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066799; cv=none; b=mRrq7WZ/7k84hF9qz7hW+XtLRtg35t42r93qExOlR+Mvb4iTyBdYixTveS6pDI5SlcIODeQM71cweF6Ok4Mf3LY7h6l4gXKS3K5Gnpsb+cSSWLEJDQDCbPnaL+GWKeqdXtbPpjBx9zaI0QNPlI0/p80w6L47KR4QPQ9E53YQ+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066799; c=relaxed/simple;
	bh=N7pksNGYwP5bIoLxax1myHPV/MNG0nXyJIIQxi9X+RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RrCQUYtkNqHpkkFtnjhZgxwuXNoIhlN03vT66dOEj5TyPKRIXxTR9EnQGgRNqGFs9CQ2pQq8xKsRH/MmKxKkO7vOTOXcDm7D3FWNF/ARD7//tbSNuOPN9Kmn4Z+6nCwqWNSE4gPNGqOIOzolXbFCfMQNhAZCojpCHP6xnYqsu3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=BUhahIjT; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="BUhahIjT"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917b78dfe30so83327056d6.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 05:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792066795; x=1792671595; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7VT0D2PaN+6c8JQLPdTKBkDcQOrdP2XWII1gwddmXc=;
        b=BUhahIjTo/Cq6Yeonmp3neLGB1hlx9AMIDPDyLwn/d3t0owt6w6ZbLyISAavcpWsJR
         dUQvKNjV8QDsPwJo8lKJLL7PYkRd+Uodn9eC1ifSPgCPEB5Bt7HWXGGHv/ZZGs9hgGKz
         0wAn7o134mk/b/4Iwra6sy8P/sTt9qMtdS63E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066795; x=1792671595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7VT0D2PaN+6c8JQLPdTKBkDcQOrdP2XWII1gwddmXc=;
        b=phWUdGJEm64xf+BgzYPvYN0wdkI+rGniNQWovZ9RBy8FnTQj95V7J9Ty/NdBNK66dM
         Rkt5b3FR/U9GBYB9k0i/uGs4eoOPk9yta+RDjXtLd+FKvUt6nUuvnMZK3twfT/y8aZkV
         qsI5AEtXuGJdjrki70RFR0oBj0NEuoq/xT1iLb8OJDnRqrHPX+SKBarXUSO6wy1KahQ8
         I0HVAulwmXrHuYuNphKGMZy3q53b4DEJqymE5N5TC4J59hGpHSWWdohZD/ZogvrlJdCM
         Fs+aQTGbAcEDZ6zJNN0aGRZNlqnfgumdxZVa1Eb+FrnE6v7vbVMm+S4/zLNPZiMqAxHO
         Vgkw==
X-Forwarded-Encrypted: i=1; AKwUvByZm7tctWOtiYkU7QWQL2/O7AdAHAGwR85DeLvSfzvNGrad6Vhrh1orslq4St2aGGzxjwKpo/ZPRPFvdiNy@lists.linux.dev
X-Gm-Message-State: AFq9FYK1W2s6bUlTntBNSxfmN+jFZ3ZPzyIx50VSgFEWbM0YtjUprntc
	1A/01JsG9tl524yL3hqwpFdOPNfW4zstexKVgpAc0JZp/7C/rFh9tscb8bFm3F1hjw==
X-Gm-Gg: AYBFou1hP5YgQxq9dr6mIlPAsCTfnnoa5o41lBZWDkqQEyeSPNXgzdkQY7ML1LlEmyk
	MjpQO4rcoecFuvfSBNJ8usPyEOoejR1K2YZCqT1ULKC5dLGEgVGZ0vOmPPZY5zONdLW+uKhS9PL
	GexukkgYW2JRNtNz0PSRwLBxTURown5TgB54Uv9WSO7JkKtMYQBNFWy1hXFy2CLl7u+KfutMxZF
	wmVeXvMrp86yOm1P9w9N9jdEldz6Wg8XSuUwjV3DNVO+jwh8fCUN8bwPBXS+hH8dUfNZRdCbhJL
	Piy9gd+yECZ/S963K6ejGGkPJG6TGYrZCtBPfaGL7gKHH8FbcbPF+hjQFf7kMlErvVV/JtWh7mu
	QWZ88ymGuikETY7XBOWh1+f/Rf5iZKKzYkIfo+6dbiCo7lybucpqEC8rq6gF1kQqlxJwHSrs9yf
	Q/c2bhaTIg3wkAwWlCphXUePnp1M68AuEqQ597HCEfQE+IRMMH+0fDkMx3jcURgtxEqg==
X-Received: by 2002:a05:620a:3712:b0:93e:92b8:e373 with SMTP id af79cd13be357-93ebd0c0183mr3124333785a.4.1792066795257;
        Thu, 15 Oct 2026 05:19:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-93ef502b096sm751802385a.21.2026.10.15.05.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:19:54 -0700 (PDT)
Message-ID: <5c775b87-fe61-4384-bd23-9f563237945c@ieee.org>
Date: Thu, 15 Oct 2026 07:19:53 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: greybus: Remove unused header declaration
 to_fw_mgmt_connection
To: Jeremy Dean Clifton <deaner92@yahoo.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261015020731.98150-1-deaner92.ref@yahoo.com>
 <20261015020731.98150-1-deaner92@yahoo.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261015020731.98150-1-deaner92@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 9:07 PM, Jeremy Dean Clifton wrote:
> Commit 3228900f80c2 ("staging: greybus: Remove unused function
> 'to_fw_mgmt_connection'") removed a function definition but did not
> remove the function prototype.
> 
> Remove the prototype.
> 
> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>

This could maybe have a "fixes" but if it gets accepted soon
I don't think it will matter, because this will land in the
same release as the fixed commit.

This looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v3: Change to imperative mood and write in proper English (Julia
> Lawall).
> v2: Fix grammar and spelling in commit message.
> 
>   drivers/staging/greybus/firmware.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/firmware.h b/drivers/staging/greybus/firmware.h
> index 5d2564462ffc..04a67d2d5b8f 100644
> --- a/drivers/staging/greybus/firmware.h
> +++ b/drivers/staging/greybus/firmware.h
> @@ -22,7 +22,6 @@
>   /* Firmware Management Protocol specific functions */
>   int fw_mgmt_init(void);
>   void fw_mgmt_exit(void);
> -struct gb_connection *to_fw_mgmt_connection(struct device *dev);
>   int gb_fw_mgmt_request_handler(struct gb_operation *op);
>   int gb_fw_mgmt_connection_init(struct gb_connection *connection);
>   void gb_fw_mgmt_connection_exit(struct gb_connection *connection);

