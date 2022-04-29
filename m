Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4701852
	for <linux-staging@lists.linux.dev>; Fri, 29 Apr 2022 15:32:08 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id m20so16109838ejj.10
        for <linux-staging@lists.linux.dev>; Fri, 29 Apr 2022 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CxIK2BS66/XSrDJiP6Yt7UmjlXDbEsdmBMV4jeqTYB4=;
        b=E5xcQzYCJinBkCqDCJVbzR36vn+R6S5qJXxBDi05rs0AtaIMp8rBilIkCDLnzVla8V
         Qknclo5HZRmCxpMm3hF6nueKWM4Ti58SZd5W6cyWpmh4OYGj73Y8H5+jaA7mIKZ7Zs4U
         X2bjBgB/dD2+htc7DRqx+Ox6AxfEBfH+OcFyYlzuidkzvdxFJ9yBiNqErUsugCP3YBj4
         ZNUeTM1MRHfetBK4/yX6cXH9bMqRLighqwBkrhZ99tiArSDwP6Dzgb6y8pzSlZS3rTmJ
         2f7psuE0ktpEuV8IZIYPCkHr0VAu8blptRWIttRsvQkWpwxPiiv0X2qEKKk6TTHQtJfV
         Q1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CxIK2BS66/XSrDJiP6Yt7UmjlXDbEsdmBMV4jeqTYB4=;
        b=DIRDFalJ/3NSs/jx75sxW8lN21yw0Ya3Cq/fHTV72joQ7rrZu21eobWlwBoh8hueuS
         mopKMX6cQpGsNLJk1xnxNHgavUeG6TTfTQAlHJwapu0PebR0pYDBCpPynOEoOu1ipWSc
         89tCfN7yj5wyC6q9pVvqw+q4/Swlp64ZGSN4/q2Ut1HOgxlCHquQVtHWcZS/gqW0FG+Y
         N2BTVYfg1to9HqPlaDImFM2wepX3+PTOUy/DOD3ehpi38B/MBkPH7k1scLKOq6TqJIim
         QY5onZWlSi2GFf3qD2oT3hmB5Laj/ySfl7W3yxllWNuirwwGkh5Ebb41fIkdE8m2yO7/
         eS3g==
X-Gm-Message-State: AOAM532YHejTScykxP4cSB0izQ4/OZeeydrGw1yP3UkiexObaKxWYpNx
	tMAjvUJBBl/40fxK1Ul73xw=
X-Google-Smtp-Source: ABdhPJx2xpS59apduiN7PTuBQBoynkI/bvGG3RrPNY8RNFnaEKFAq5lC9hn1Rb9whfcDv/OzqZWHZQ==
X-Received: by 2002:a17:906:b50:b0:6f3:ce99:3c39 with SMTP id v16-20020a1709060b5000b006f3ce993c39mr12005703ejg.52.1651246327030;
        Fri, 29 Apr 2022 08:32:07 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f1b:f037:b0af:cce5:5488:7b95? (p200300c78f1bf037b0afcce554887b95.dip0.t-ipconnect.de. [2003:c7:8f1b:f037:b0af:cce5:5488:7b95])
        by smtp.gmail.com with ESMTPSA id qp24-20020a170907a21800b006f3ef214dfbsm736419ejc.97.2022.04.29.08.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 08:32:06 -0700 (PDT)
Message-ID: <1d70d285-c839-8e5a-e3f8-d5184acdf769@gmail.com>
Date: Fri, 29 Apr 2022 17:32:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/3] staging: vt6655: Replace VNSvInPortD with ioread32
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1651036713.git.philipp.g.hortmann@gmail.com>
 <7a5f7f98379fb2af2741f613f5ddda53e5d4813e.1651036713.git.philipp.g.hortmann@gmail.com>
 <Ymjaxby2vDJYz6KA@kroah.com> <b3d6b773-4ca1-a72e-933b-455c5d2b91c9@gmail.com>
 <YmwDZi3mmWRHzKAT@kroah.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <YmwDZi3mmWRHzKAT@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/22 17:25, Greg Kroah-Hartman wrote:
> And for a big endian system?  Do you get the same result?

Just looking if I can buy one.

Can you propose a low cost big endian system with PCI bus?

Thanks for your support.

Bye Philipp


