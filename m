Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F974ED1BE
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412322; cv=none; b=lMReYZ8kVr0g19h4om1f6BHul7pXRWR/6ZmskyYS1sW7JJ4zlAKvxZ8ziPX0ZleKmXIc3Gb9N6aHv0h7l86YRbYpHh8dex4smSa7X6UqSQYCnSr98gmz3/OGKX0/WHiHAf48R1aV8hCj+tyS2mKrAxhxOagCqshvNArdDu8ZyIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412322; c=relaxed/simple;
	bh=Dhz4EAB84K8YKVdaec8L7yXiD31Sa6yoCg3DwbxFBCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvIHUtsx67WgYt0OPRiFzikpFuuXA93PZnaycHUUaeozH7X0siXIbFNJv8KeOT3i6ua7ORJwwJrnpKIIDQPHrkwD/JM1KMfQjkFe6Jfv0g7yALfSS2BQMXJvre9Y3N6viVfpn4Qf5mmH6skP6753LFP8wgR3s3fbJsmki4NDYOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=FHXW1EkN; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="FHXW1EkN"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53644b28706so22112251cf.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 05:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792412320; x=1793017120; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3WD+05XQNdmEK1W1t9slgGmeAmpjGd1vFRCxbqLd94=;
        b=FHXW1EkN83BO/UiMdlHWzWdqMTjkgc5JM6Dy2mNwxZjEm/X7lS991Vq7QtWvvi+MG5
         VVkyYmY1C2XeYP4t8Q7swzNyv4QQBA6qM1OnFNQH4OL6u0KkXYf4jt0UmOqAVfjQBf6b
         JjDj3+Rq0301nGRWoXETUcM3VPmzQdeNCda+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412320; x=1793017120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3WD+05XQNdmEK1W1t9slgGmeAmpjGd1vFRCxbqLd94=;
        b=x41yaS7HKcw1VTlubyFuIGsFAt0nZTssxIptZ19LMS+qj9Ivw5ZxJkcGhFWAEIEs+w
         JGg7dMQJBsncFS7rsceLoSCps/HpkhbUrthyZi5wY4Tg4kACm0axtsCVTFf5QYGk4SHK
         ycZG46hLRbKL8lKUQt4AERTaitXL441GzWUcY7uTsodETAdWMhgqwht2FgFzEk8SxD6c
         7P9TrSkbdHnMvDn9iZXS4NRxUXT4HTMqJLC3xZxiaLIcxO8CMpIJKOmV4i1M2EmWSQdQ
         21M8dZMOY24Z2GuWP4XhCxl+oZ+5RfVfT8CHCMTjUIYdX61l8Q+y6nVAVsAKH5oybdB3
         Hu7Q==
X-Forwarded-Encrypted: i=1; AKwUvByFGY/L5QJHqoi5PcfRK71HI7LbMV0fDd5vs9OihHFxG6TMZjheSdD3PdwCoXBzT3fHKYsdONj4Zyu98va6@lists.linux.dev
X-Gm-Message-State: AFq9FYIRzeUufDlm2nhTo94GBO0tTgoM7X/EEDEtYxhvYnQqVErv8/Vw
	WAlQDDi7GAODixqEKJMHAyMHmwGx4XyV9dL7LBaHbP2DQlmQeZRZwipfBA3eNRRXgQ==
X-Gm-Gg: AYBFou0czpRXKxx5N5LeNUa1EIIPgQoLjvhjcSjkYBpJZ/d9zm+J/3A9FOXzbV+6PEb
	f1sjC9Z/xSzU6+m1BIytea3WMglsq9WRbrPYHVIr2ONDUZwpWy38UYY32UeQrvldXdrQjRB9oNo
	cI9uaWHm4qVPdpuXTWmP00gI+EhcvuCnJ0dnjzAW70IIfUlDZYlAB+Lz+sqy8kq4UBA/na4MSpj
	Su4gsX8CiRzVsslLJPdOeSwLzZkcD/eqnVQAhsL68q9XcZgnIa7wAJhLQVbB7NN/q3rZZGRqpDM
	OQlXIVUBt8YReRjGSdp63HV27/zPKmmwQ9TcIPdQW73Ij6AKIQ7iFnINrIZuLStGplaZA+bAvpr
	AiO8846XaEhSkVGEceVSvTu7DoD7A63Zz7eu/ogzDGqxzoLuoeNbBpGRM57epFxsVk6oYwDyu1A
	bzouir+ABnkM017Rz2WbhNhivPMNr5JyncoWU+QHlkRjgomDfBuQEyQqulQIBDgXN0dMwN4jZm3
	BtU
X-Received: by 2002:ac8:7f4c:0:b0:535:cd9e:c0c9 with SMTP id d75a77b69052e-5364611f857mr110473131cf.74.1792412319625;
        Mon, 19 Oct 2026 05:18:39 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-5367f9abab7sm2496911cf.1.2026.10.19.05.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:18:39 -0700 (PDT)
Message-ID: <2977f214-00e1-43e5-b286-eecadffcab00@ieee.org>
Date: Mon, 19 Oct 2026 07:18:37 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: fw-management: fix argument alignment
To: Okhuomon Ajayi <okhuomonajayi54@gmail.com>, outreachy@lists.linux.dev
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261018224241.46011-1-okhuomonajayi54@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261018224241.46011-1-okhuomonajayi54@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/26 5:42 PM, Okhuomon Ajayi wrote:
> Align the arguments of the fw_mgmt_load_and_validate_operation()
> call with the opening parenthesis and split them across separate
> lines to avoid an overly long line.
> 
> CHECK: Alignment should match open parenthesis

So this was found with "make C=1".  And the checker tool used
was sparse?  If so, that bit of context for this message would
be helpful to add.

Also, I tend to ask this a log on these small one-off patches:
Are there any other instances you see of this particular
warning?  I *know* not all of them can be fixed as neatly
as this one, but are there cases where aligning arguments
this way still preserves readability?  (Greybus code also
generally fits within 80 columns.)

If there are, I think it would be good to fix them together
(in one patch, or possibly in a series, one per file).

Other than those comments, this change looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
> ---
>   drivers/staging/greybus/fw-management.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index 5d01da6b6eb9..e20e9136c106 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
>   			return -EFAULT;
>   
>   		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
> -				intf_load.load_method, intf_load.firmware_tag);
> +							  intf_load.load_method,
> +							  intf_load.firmware_tag);
>   		if (ret)
>   			return ret;
>   

