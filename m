Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CA2076A9
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077235; cv=none; b=TeQKXlqURpV9mA/561OhN6vBqLrwG5J7E2GacdSaE+fJztQ8svcUfpmzhhrxqy8TQE+1gYvI368ilNEcb5AHFLJkesB8tb2SjhxIbzGAcNHxGrIWbiVMb1YAl08jwxogut3EqTgcn/U6Nbq6Nj5MOyFLMcwKaN/8kJsjShIRsqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077235; c=relaxed/simple;
	bh=Jgb2vXvtvTrjax6bzat1AGoOPsyxMpin/EEuLtOu0R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGFCyOsJsLNHRycRFKdQoST2sfZTKp1Htoxl6cr52DkCaQ2crFhbOVjQ90VZ2R5UddF3ucb0ngqw6thTMaTz3/BiHejc47f1vPYNkburIaOvLQT/oCN/tHgNNwSdD2e4KfsqyDssFMOfKKWDehB45vzewJNyZYEtBB+q3K8vQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bwmLLzVJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bwmLLzVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729077232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IemnLu1hWapO+xi2LzJ9xTJk8lHkwz8XBpQbihdlK3M=;
	b=bwmLLzVJsocAgfYogWQFCTGeds5Gms2uL0qE0cKdlJKFrPLj+M4CiTI0TioixNFDz3+5sQ
	SnCBC+EnKwtioNkBE/9+TF+ODZF7VwPVEJBxxMe0OUe2sDsPlJJtKTclRqi/eYHCgF38uH
	/i0RCQpyVf2H7XXicvzmjIIGHodwwko=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-URvAH81NNuybfZqJSoR_4A-1; Wed, 16 Oct 2024 07:13:51 -0400
X-MC-Unique: URvAH81NNuybfZqJSoR_4A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a99cb787d2cso299499066b.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 04:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729077230; x=1729682030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IemnLu1hWapO+xi2LzJ9xTJk8lHkwz8XBpQbihdlK3M=;
        b=FGLC5rYmRqUSk3vUVgGrrZX/KVTos9BGkqiihGTy1L29Rq+kN7OoSc6l9gEJa19KIV
         Sdv1hyO4wtnTqKj2XCUc3sea3syw0zBFm/Wn6QSJqBtUhVHoPmvSQgh4Hv88Tj9f63x/
         Jut+LQukvExczr/cfB6UJStbGPCyLyoRrGoaneO/Ypjm/T+xVU6u8LO/foo1YRESy5gq
         QCozEkar9l+SyJ0lSFC0QvqBdbsoUSl5+7GcXjezOUFCkkfe07TaEopd87XkG7uFeL5d
         huYp1xvTzmlNMg2JVsGeQx7KZC8OdgUFwCKgdbeOSmnIpOLhDUzdUg9ZwQYk2D7ZlXxF
         Yr1Q==
X-Gm-Message-State: AOJu0YwOXou4PWQLSUTZpkKdWCy+9N9tgQXZVoPjTeWQmwMkSmgI5QXN
	4S7DAqOIjSOm0XLL7r36G+q5pE7HedltX+GCkPek2RiDChR44MxNJoIsjU3Kp16M3ACnGQkcByg
	UDaNn2ccxhTOHNlHrpzk3iuC+wmswnEjS1etVI78EoOBGUg91VUWn8bt7c5ESZRU=
X-Received: by 2002:a17:907:97cb:b0:a99:da6c:f607 with SMTP id a640c23a62f3a-a99da6cf789mr1456763966b.44.1729077230281;
        Wed, 16 Oct 2024 04:13:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnOLz05v1d/XDAdmh3+SntUIfivgO0e7SgG/fmCg09rvV1aXwMgbIevsUR+D2mwdmeWZx+eA==
X-Received: by 2002:a17:907:97cb:b0:a99:da6c:f607 with SMTP id a640c23a62f3a-a99da6cf789mr1456761366b.44.1729077229905;
        Wed, 16 Oct 2024 04:13:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29817599sm171844766b.98.2024.10.16.04.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 04:13:49 -0700 (PDT)
Message-ID: <cbc6ee63-a364-492a-aded-afc690a924ec@redhat.com>
Date: Wed, 16 Oct 2024 13:13:49 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: staging: rtl8723bs: Replace msleep() with
 usleep_range().
To: Aymen Khalfa <a.khalfa.1012@gmail.com>, gregkh@linuxfoundation.org,
 Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev
References: <20241016111210.2469193-1-a.khalfa.1012@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241016111210.2469193-1-a.khalfa.1012@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Oct-24 1:12 PM, Aymen Khalfa wrote:
> -Fix checkpatch.pl warning by replacing msleep() with usleep_range() as
> recommended in the documentation.
> 
> Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index dbfcbac3d855..26e125f556e9 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -429,7 +429,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
>  			err = -1;
>  			break;
>  		}
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  
>  	return err;
> @@ -591,7 +591,7 @@ void LPS_Leave_check(struct adapter *padapter)
>  		if (jiffies_to_msecs(jiffies - start_time) > 100)
>  			break;
>  
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  }
>  

