Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C65D1993C
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 13:58:50 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30af86a96b4so233303f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 06:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685455128; x=1688047128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdOFQT9QGCau59bHLPd6rRMxmv8ze550SRwO31KCFbo=;
        b=Iw12FCXYG1FQW82rir6GYU2Dvz+V0iqVcnckCSMnorc8/fyHEnADPJt0uMF+tsA2Bw
         PV10FSCNiCghM7VXk5jiW5gPopcSOKTjs/oL5iW4teAyWvIbw6zIP+1Ya4U734gYm4Ao
         MSA40u+vrMUHaRKZXPldVj8KJX9SZhs/2W6uXkwub0cNNBZWK76jenBXWYZZ87Zx3GA7
         vts3S7rT3tvldCOkDzUUgE0SfN4kQCNVB0Q5Kzfc2JhGGfGf84LG9C025dNVlhq2y5bI
         XRACWMYnBtwkWzb3P3/vG6pCASVBOS0JzGyiap6LWu/x646yADOFnkRmyh/Qtm01Krzy
         +1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455128; x=1688047128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdOFQT9QGCau59bHLPd6rRMxmv8ze550SRwO31KCFbo=;
        b=hWiJG6p5pdrLpygQ7TTTX3HfOopj2fSQSfk5a9XDxK6f7lCSxNuqlEcOoc5f4PdgIq
         5vAlq2atBljPVfDwtZsIk6hDfr6v7tICCvBzJRK/n3l/S3PwbVH0tTe4eBk6eKoViPTG
         JN1tTAhT9bqpRf7nVVnlP9JgsVxcRmM8bgw6wQHrZ2jj+u5l/Mhz3SSdRh5M4kOKEzye
         gQx/QbpwS2GOJqzrNwN3glEZye/PDaiCpa3Fh4FGxlVf2zYq3BoW5a+kdse9xskOjWcn
         jn6qQNjHDcGyf9Q5BBWk5PMgIcC0+RbDE8+WT9qY2P3dd/ZkqMhHNiXOY3RgCPAbKWtu
         xT8g==
X-Gm-Message-State: AC+VfDwqJAdrjZm8jyJ0fv2Kzcsqh4cC8SzBliO3COhjZOGAILNXFnya
	l79VswCcQAVx4aPsWYvhetS2/g==
X-Google-Smtp-Source: ACHHUZ7gClGW/RNlcSsPPzcfPDQ3QOTjtpXfK0sB7K+aNfqLKFeOMTI5q1cV7i8/4WpYumWm9WbuKA==
X-Received: by 2002:a5d:408e:0:b0:2ef:ba4f:c821 with SMTP id o14-20020a5d408e000000b002efba4fc821mr1579352wrp.36.1685455128679;
        Tue, 30 May 2023 06:58:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d490b000000b003063a92bbf5sm3361859wrq.70.2023.05.30.06.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:58:46 -0700 (PDT)
Date: Tue, 30 May 2023 16:58:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] Staging: rts5208: rtsx: Removed new line in else and
 else if
Message-ID: <7acfc70d-c136-4493-bfc0-9419fe13e3a6@kili.mountain>
References: <20230530135120.37637-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530135120.37637-1-kartikey406@gmail.com>

On Tue, May 30, 2023 at 07:21:20PM +0530, Deepanshu Kartikey wrote:
> Removed new line in else and else if,
> this warning was given by checkpatch.pl
> 
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> 
> ---
> Changes in V5
> 	- Moved else and else if to the same line
> 	- Moved comment on else and else if statement to inside of it

LGTM.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

