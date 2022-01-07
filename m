Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94143168
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 11:27:02 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id h2so14406146lfv.9
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 03:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RxWUtBRyBuu8CzF10hutvoPzGTvhxAChpkFfMOfJmvE=;
        b=GA0Mf+iffPTAJnINy4M8AAt9tQbBULAZNoe8zLYeTstHuqComujV6aSKbEHJldF3gZ
         +SirHlsCed9J1FeMafhn04vYGrqEHzujD7KmEp1E3sLfuiFPfFLQnkOyk/xApF+taYCP
         sX9kYvcGx/npGKYFo6Fh5HSKuMIGEhgTOupbFE4bEFdZkZ31ckdVKz1kn4IStozwGaAV
         AbrlpHtxYmAhKypfQq0Uld+lgYiu657i+3EPsAVt/Y7/AK8VoT/fnkpRp9zOF6tjN8xX
         T6HZ4DZTKdgRQ9SmL2M+Q9hQFbgahgWswsEtv+zJ5vLQLdvZVgIiG4ZVeuJWaNzqa/YY
         JaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RxWUtBRyBuu8CzF10hutvoPzGTvhxAChpkFfMOfJmvE=;
        b=yEokN/hy152NiJQkP1lZ00mg4ZF1v/ZbMSl1xMX5KVqfM7JjqcH5xp+gmUNLdO5V3m
         qBJA30yEpu/AHEg/XuJHYDloEXWTXT1MVU8W0eB7CPACBHHsXDG1VFTp9iMuVdEVW4jt
         20u9xrSRi12dTAsAi/DafLUqwW0o2JmwXLl6Hc0ehQRD5FHuGKUtN8a185pW25C5c/c/
         hCeH6TOdIGY6YsjMMA359RuPIZbjjyGjgHB5bPxNFINH2WI93wR74X0MkTctDlXQRFh7
         q28K5uMJsyuXT0WYMRc15PbZj+3+FgG/hxO9Oaep2QMiOliv76Vl7TyCdYoPezmP4/iv
         +QXA==
X-Gm-Message-State: AOAM530FJZLJ6QJ5BM+Ds/LHuXI6d8iqv02t8vvjWGO2s/oRaijJ+EYA
	xBWZSs6qadWuBNAByiCifTemB3zq+ho=
X-Google-Smtp-Source: ABdhPJww9MRxbZpc0vn18WhW4VAK3hqhxh0WUsSaZY9VC/I3EJvcyZ+NUMJLAxDRTD3ZBd4oo2HE5Q==
X-Received: by 2002:ac2:4e06:: with SMTP id e6mr55038059lfr.59.1641554820683;
        Fri, 07 Jan 2022 03:27:00 -0800 (PST)
Received: from [192.168.1.11] ([217.117.245.67])
        by smtp.gmail.com with ESMTPSA id z10sm541947lfd.220.2022.01.07.03.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 03:27:00 -0800 (PST)
Message-ID: <2a79a17c-5cfd-9aec-cf44-b44fb382eb6c@gmail.com>
Date: Fri, 7 Jan 2022 14:26:59 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 03/19] staging: r8188eu: release_firmware is not called if
 allocation fails
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220107103620.15648-1-straube.linux@gmail.com>
 <20220107103620.15648-4-straube.linux@gmail.com>
 <ca0548c0-b36c-98dc-3e49-b629b3d3fb6a@gmail.com> <YdgjJRwLjIBWVQvU@kroah.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YdgjJRwLjIBWVQvU@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

On 1/7/22 14:25, Greg KH wrote:
>> Or, maybe, Greg knows some magic that will help here, we can wait him before
>> you resend 20 patch series :)
> 
> It's just not worth it for this staging driver, and for an allocation
> failure, to be backported here.  Allocation failures almost never happen
> in real-world situations, and if they do, they are not alone, so this
> would be the least of the problems happening here.
> 
> So no need to care about it, I can take this as-is.
> 

Got it, thanks.


With regards,
Pavel Skripkin
