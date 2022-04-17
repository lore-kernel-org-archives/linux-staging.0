Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031802C9C;
	Sun, 17 Apr 2022 20:23:07 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id b21so21570593lfb.5;
        Sun, 17 Apr 2022 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=umLOpU+0I1iOAgBTudA/7ZDWer0bJgohRBccjT2TBm8=;
        b=BGZfXiD7+DzTdHXLzDwTfT5VuQwbA4EiqSj0EnZgDj/7WlOXLkLUsFUVuYiR9sSX+s
         K1MhK5dWyCahlFIjG/Cb3ODkMITf8l70gxB/Sn7vKPBqyetVndafrZq5gYmU9ihSFER+
         rBjiVTJ5ZDRAUv+L5ZojYqEkB1mCxVWxjNkimUGLnUZ1ioGa7m29qgEbz+hEvIFxE5Yv
         VudMY2nsIIIGHQk2w+yi57BLsfCApv6D7CXZF/3Pz49lKHiMeGEkYqvAsw/RL/Pk9+e1
         N69TnQnKiPvJea3yxdSDNXAt/LE/MMzjGesb9gjyn5oYl87PWe9UzrtvjtLUcz6ejOPw
         Ny4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=umLOpU+0I1iOAgBTudA/7ZDWer0bJgohRBccjT2TBm8=;
        b=c4zuZ0p75lGz3r9GZGXkJ7GKW+aC89j6Uh+6pfRGfWBxYwMg+ZwSFUcLIYVqdj+Yvq
         OXAVYWvCNYeLIPbVGKtvA/BW1xx+yauoTTnUhrYL+BbE3ZjScwaRF2fBj2I4X9mER7NK
         tN/c/q0TBR+L7ig+769S2jSYLwzWEfKxR4yXWirxX0NXddH5WzPsZ+nTtn4Rzyjn8Mhf
         PLzMar2G2ICyyVl7E/0WjcK2OM1Rmmf3al1U5pv/GnLtnuwmX3eP7X8nz3s1ZKUoU9OV
         NqTR6m8c3+OrkLCM/1O3x3W6KRZDed7p9Hg3fcGmS4PulRkQBd/WZ4g8lRndFE6BhEhK
         On0g==
X-Gm-Message-State: AOAM532u+Dp1MRVL18YTLh1k7eLP7bAnbDrkKnRblAIorAy1N4xJe/E9
	8/LC++d0kUyz+2H6MP741w8=
X-Google-Smtp-Source: ABdhPJzqDTzkV1w/pnVoQAQOWVEYmGJ7tIQvYYLX/K1xknW3ohqlHF6jl3oekIxTFjE4eopmbK0//A==
X-Received: by 2002:ac2:435a:0:b0:46b:ae5b:83e8 with SMTP id o26-20020ac2435a000000b0046bae5b83e8mr5941240lfl.485.1650226985931;
        Sun, 17 Apr 2022 13:23:05 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id u18-20020a199212000000b0046ba06a6a19sm1015663lfd.143.2022.04.17.13.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Apr 2022 13:23:04 -0700 (PDT)
Message-ID: <6925e230-b816-ea9a-067f-60cefecd8af7@gmail.com>
Date: Sun, 17 Apr 2022 23:23:03 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/6] staging: r8188eu: remove 'added by' author
 comments
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev, Alison Schofield <alison.schofield@intel.com>
References: <cover.1649990500.git.jhpark1013@gmail.com>
 <c0eaa7cbc61d89967d81ef864c1a791f4adb1978.1649990500.git.jhpark1013@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <c0eaa7cbc61d89967d81ef864c1a791f4adb1978.1649990500.git.jhpark1013@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jaehee,

On 4/15/22 05:48, Jaehee Park wrote:
> Author comments "Added by Albert" and "Added by Annie" are sprinkled
> through the file. These comments are not useful and can be removed.
> 
> Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>

I don't remember giving that tag, but now I am OK with it, since patch 
looks good

Please, don't put random Reviewed-by tags in your commit message, since 
it's not how Reviewed-by tags work

> Suggested-by: Alison Schofield <alison.schofield@intel.com>
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>




With regards,
Pavel Skripkin
