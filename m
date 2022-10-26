Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9B9EBF;
	Wed, 26 Oct 2022 03:24:15 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id d26so17843686eje.10;
        Tue, 25 Oct 2022 20:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCzzirgjwOdUAnOkRY53VJyqkWpOMP9smR0zkz0PYTo=;
        b=Eddol3R5wxuDuqINpE1iuUEar3C1wHj4Ohl35+H7sX5BqnpqoQ1rGRk/SygDLmx+wI
         ee4YKWc55O1xuZhLgpVdawjS9Oz2DCOE+MG/TYL3d1j8/msCw+qHOMF9nRTy+Mk0h7UO
         JYyuw/HM7Zgt3CzJ9y3PZ3+Ap9ivgk5lRGrGSY66BwGqUSrA/xGYwyItp8HUzKN11WRw
         yJzIOdaCrkGigP2RxrtbJ8i4YX/P96hienWdXevqyhPDXe949R7YNZHKdNLIUrUno8Xz
         LPTICeJj5jOZV94DeoiCa+pYacT7eHLWx4X+bsFJ43ne123/1gRYnl45RwJyewZTv2/7
         oN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCzzirgjwOdUAnOkRY53VJyqkWpOMP9smR0zkz0PYTo=;
        b=TaREVfyH3LMJ+NAL/GabdUn67NJiWFRWzndNEiIG1vuW5TLW2bm4ocKvrBzbzPc79y
         dIZiaFk7G3KUdmd6GXcIAoqmT6WV19dHLq4tetCM0JJwl5Hq1/XzIzpLgqSd0luRiF7U
         SCm+HUJDuhKeryKb9qHCR+mnnoT2MRiNN0HJmmp5OYb5EZ9LeGvsYah7pT0iwjLRRZjC
         yzTtC3SaC+j7RJ2XAQeObbzR6e9i7cEhJ9ku7fHL1CzlrQqNyH/Dwg4a9+YnvSYYn2NI
         fuHrKkR+PyAVyc1TU6yZ3bLpnJMR14XaCMRJzLmmrzRrPE2Pzta6n5f8K2dtnJqHzx3v
         vYVA==
X-Gm-Message-State: ACrzQf20nXDN6FtQnXdENXAIkiLFQI9Rm8pPy96Wvu6qH4N6rFj9qp/r
	9W12AIfja57QUdr4LYagI7JeLjqTeRc=
X-Google-Smtp-Source: AMsMyM6ZoEN3yiCLyBdNCGFw96yq+oeOazpuBqB89ZxlVjDwzMWdIsldOrC9h1JhWdM9KUq8Uhvl2w==
X-Received: by 2002:a17:906:c151:b0:78d:cdbc:9fb7 with SMTP id dp17-20020a170906c15100b0078dcdbc9fb7mr34069296ejc.688.1666754653365;
        Tue, 25 Oct 2022 20:24:13 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:b844:c952:3daa:e0a:40ba? (p200300c78f2ab844c9523daa0e0a40ba.dip0.t-ipconnect.de. [2003:c7:8f2a:b844:c952:3daa:e0a:40ba])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906314900b007acd04fcedcsm1409251eje.46.2022.10.25.20.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 20:24:12 -0700 (PDT)
Message-ID: <365358f4-eabe-8d91-e585-733cf1bb9924@gmail.com>
Date: Wed, 26 Oct 2022 05:24:12 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/17] staging: vt6655: changed variable names: wFB_Opt0
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <cover.1666740522.git.tanjubrunostar0@gmail.com>
 <62f69eddc9641ac9eb045edf8a9453bf36a02b36.1666740522.git.tanjubrunostar0@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <62f69eddc9641ac9eb045edf8a9453bf36a02b36.1666740522.git.tanjubrunostar0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/22 01:36, Tanjuate Brunostar wrote:
> change variable names wFB_Opt0 and wFB_Opt1 to meet the
> linux coding standard, as it says to avoid using camelCase naming style.
> Cought by checkpatch
> 
> Signed-off-by: Tanjuate Brunostar<tanjubrunostar0@gmail.com>
> ---
>   drivers/staging/vt6655/rxtx.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

Applying: staging: vt6655: changed variable names: wFB_Opt0
error: sha1 information is lacking or useless 
(drivers/staging/vt6655/rxtx.c).
error: could not build fake ancestor
Patch failed at 0001 staging: vt6655: changed variable names: wFB_Opt0

Please rebase
