Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408B74C8C
	for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 20:58:11 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id f20so24302807edf.6
        for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 13:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=NDCKnBLvpg2LzjJfGZYpFUUWi7Xx7OQNK9I3O7rWqI4=;
        b=XkTBdCZA1pW+4DBLzM7t8sWztEr3z1dAcLmCVVVrMKZVBVZAjfmfcWiALKh7HyVULj
         bQWMJe281YQOr+OlIqDf7jo88wsF9Rjw5PQQn5wqJyCKuHsa2s5s7bKTQoTTvagbLeoG
         vXLO1KImc8WrXAk7xgN2oEm7XbMV0iSbAiBSUjRLrOdximVk5oPFti7BW82SaVfC5IZ5
         +O2daOu+hfNC7E4DArjFfYB8t0kbnViSCUpFpIlm249sRCAFrd/EenVNPowkB3g3FlSD
         6ObOzqUMEUNC15uk6ivvWSvwiE4K6pDHYTKm48ZPB4x+rC9OFUs8PTzLwUiOs3SvgTcE
         oJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NDCKnBLvpg2LzjJfGZYpFUUWi7Xx7OQNK9I3O7rWqI4=;
        b=iaROqd27Z0fil7GkJMQ36wi9S50RvrO9DgFJtZHHz/2z+g5T9zWooWwM9wHGJlNBFH
         TSlGUjG3o35yLZaAbMCGvHkwfnJqX5M4o+eIVKSpOksnHotfxidHFn9b2hh0cHko4CDe
         zSogD4QoYa0r45rOUcGHkmZVo12WppdsdmEC03u4gS4adwlEqJ0uEmzXqFml2nlM6spQ
         iVn8qyAoIu2LThSo93ig07JxKzeEB80zsi30esTeIgy6Fu2zYzZlXXVFu2gXA9h9hhsZ
         KpbV+NHB6kC18vRq1izxuN7O2G4JG+dQdVEIb2I+XDeG5kcT/0QXfnCSgv+ulM9v8E10
         ZYrQ==
X-Gm-Message-State: ACrzQf2gqAxJdmvy2yc5b77QiQxTNj+xYRaU+j3PJtnWnnJTvaVLgazx
	HDMRqXw7N+vvmnbm69JztuQ=
X-Google-Smtp-Source: AMsMyM5AX4Q55lUYX4I+iFuCwfkIARLhUl+5P7BJuNiQ4hZIr9T+skJIc5H0zzhkIUVx3CA9JqoBlw==
X-Received: by 2002:a05:6402:1655:b0:44e:b208:746d with SMTP id s21-20020a056402165500b0044eb208746dmr1410266edx.229.1663275489620;
        Thu, 15 Sep 2022 13:58:09 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709063ca200b00777249e951bsm9593972ejh.51.2022.09.15.13.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 13:58:09 -0700 (PDT)
Message-ID: <a046af7f-7b60-108a-39e8-9ac3b5ce7733@gmail.com>
Date: Thu, 15 Sep 2022 22:58:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 0/5] staging: vt6655: Implement allocation failure
 handling
Content-Language: en-US
To: Nam Cao <namcaov@gmail.com>, forest@alittletooquiet.net,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <cover.1663273218.git.namcaov@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1663273218.git.namcaov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/22 22:29, Nam Cao wrote:
> This driver does not handle allocation failure when receiving data very well.
> This patchset implements better handling in the case of allocation failure.
> 
> Nam Cao (5):
>    staging: vt6655: remove redundant if condition
>    staging: vt6655: change vnt_receive_frame return type to void
>    staging: vt6655: split device_alloc_rx_buf
>    staging: vt6655: change device_alloc_rx_buf's argument
>    staging: vt6655: implement allocation failure handling
> 
>   drivers/staging/vt6655/device_main.c | 41 ++++++++++++++++++----------
>   drivers/staging/vt6655/dpc.c         |  8 +++---
>   drivers/staging/vt6655/dpc.h         |  2 +-
>   3 files changed, 31 insertions(+), 20 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>


Find in this email a comment from Greg about RFC:
https://lore.kernel.org/linux-gpio/YwS4WDekXM3UQ7Yo@kroah.com/
This patch is marked as "RFC" but I don't see any questions that you
have here.  Please resolve anything you think needs to be handled and
submit a "this series is ok to be merged" version.

May be this is applicable to this patch as well.


