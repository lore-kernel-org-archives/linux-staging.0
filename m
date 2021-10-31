Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D1868
	for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 09:31:27 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id r5so9727814pls.1
        for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 02:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=p4CdOaBb79UP5ICFne1K/YjK6ga1457gkGiduMDgE1g=;
        b=AjZKa0pDOUbKoNsc+LnDgDuHJ4/8TzwK/rsnukwmkYiHccKx0mlJnassSwvcIg6eAC
         UZ1wDijRgEQUfdIMa4N2o/0z7Zl2zJuBe8L4/nWHZWq4DueCifWbrW9qy3Pe8LrrzDdv
         Ohy8noXjqt6FcL/Ocu5Xe/HdOJt22245azBEJTrtc4BYflUKNWQ1O1iGEdR9MwKanVvV
         y6DxUH5cnYIuRMNEwpgf3mXHdsVBLK5ZS4FHYPCtGFzQZIISk12ofybR+GbkcamOC9vl
         5xNmn0qM7hMVdeNaGxIfEOEq5jufjtPxWxTusWKoMaD5pEa4L/5KzGNCuKVYiMD0MLz8
         +7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p4CdOaBb79UP5ICFne1K/YjK6ga1457gkGiduMDgE1g=;
        b=auJ+u0E8r84H49taHfP3w8y17ob2JzqYVYuzXW1SdNqCLjl9UwzTDWAhvmTO+tIVWZ
         F4TYVhp8eXFGX3O5zMVpt6VFgW9DChP6ivr2FWaKHfLRxqKczk4DhhRNzC5Q9V5K8x2Q
         +CR5o9BvPZwGW3/IBf9NquaaeFqAjIr37syqyFRrd5pLqRg8QQnDN91g+r93ZM49oNXA
         369lXFi+rgEJcPVBFFd9ONndIVwY+1BclLYUG71wVJmrQUdv0FXPTI4UddskPlhWN9O3
         XZTr52j+kM6YDmhZSzU4DJApyAkmH1kIMCeZSjRFOzaqz2cA1NtLx7TOXlcLaX6UHAK9
         V9iw==
X-Gm-Message-State: AOAM533fqBe3oT1qRLWQXVpUDh4z7/EmdxM32t+BeEW94rNd6bWpZky0
	nHrHFOxqrgASBFMbRlwZHTA=
X-Google-Smtp-Source: ABdhPJzUvDFCJc/gHSSbROzaT2bEkrMOQhGlUiv1oedVQwsjOaamHIpCaJahJj/NnuZbkLB+vefBcw==
X-Received: by 2002:a17:90b:1e0b:: with SMTP id pg11mr30724844pjb.230.1635672686718;
        Sun, 31 Oct 2021 02:31:26 -0700 (PDT)
Received: from [192.168.160.115] ([217.146.10.210])
        by smtp.gmail.com with ESMTPSA id d2sm13011730pfj.42.2021.10.31.02.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Oct 2021 02:31:26 -0700 (PDT)
Message-ID: <26a88652-0db7-6b85-565c-b7d002039cd9@gmail.com>
Date: Sun, 31 Oct 2021 15:01:21 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v2] staging: r8188eu: avoid use of goto statement
Content-Language: en-GB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 straube.linux@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
References: <YXbA0BgvKZKXApaW@Sauravs-MacBook-Air.local>
 <YXgw7tOmgO3almYe@kroah.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <YXgw7tOmgO3almYe@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/10/21 10:16 pm, Greg KH wrote:
> On Mon, Oct 25, 2021 at 08:06:00PM +0530, Saurav Girepunje wrote:
>> Remove the goto statement from _rtw_init_cmd_priv(). In this function
>> goto statement can be replace by return statement. By replacing the
>> goto statement with return statement local variable "res" is also not
>> required. As on goto label exit, function only return it is not
>> performing any cleanup. Avoiding goto statement will simplify the function.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>
>> ChangeLog V2:
>>
>> 	-Add space after line end on changelog.
>> 	-Remove addition blank link after the local variable res
>> 	 as per the coding guidelines for linux kernel.
>>
> 
> This does not apply to my tree, please rebase and resubmit.
> 
> thanks,
> 
> greg k-h
> 

OK,

Regards,
Saurav
