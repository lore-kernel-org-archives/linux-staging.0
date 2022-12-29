Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16941C2B
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 09:58:27 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id bg10so12811815wmb.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 01:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMF1V+bX5VSu/qYwgCDVAw9SWhqjhgCVAzGi+L4Jh38=;
        b=VGKx215Qw+8PT9HN2XTTThZL6rhtlu7Qc3K1mPu8pI/L0q6dz9BioGygVGFMZACMG8
         RvDZf48kvrQzAzRIGCXzIFbYVKTv8VyFgPx4Yha6h6AbG2TTtsRVMCBDk0fut9ocb9Uh
         pgPeqA5EAUVmJ7PfNB0+DZ8YgefRCHq2NR590AI+4tQQmaiodN3HSR7JIud1MKKnLC3V
         tbsqDxljDVHqhTHosNgQB+d95JMBqyULR0bdsaI9UOh5HDgAlCXVuIOa/DkDQtfKNtbA
         3NxMOKQ4Ag7ZXpL00u2MEZtGyg25UuJXu9msRAn39QJPR+vw071k6T/0C0R9XklUblbd
         cApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMF1V+bX5VSu/qYwgCDVAw9SWhqjhgCVAzGi+L4Jh38=;
        b=ITG0Q8cplQlcCeBqgU1i30J0M88ydZA+XQ0CA8t4SOBsC7P9qmWKiovzrnHMyE6Jp0
         NK8Mr9lT4ITHFkF00dPKRQRiRwVkF+8vNCuPE4lTpy/yx7lPlqZ0kDy/5vAMKoPss+EI
         p7UvHz5u++lAHfUEfpLNkeNnea/ev+uSM3AF3/8r/rqYoNQqoDxM99FK6+4SVHT02lIt
         4EqeVxD693puC+2hPZ6PGWMFEhXnlwOQeJujrfY7qpEgkwOKqTRP/Bvx+4eD88hJX6DW
         6sXIEJrElBHQCCjNZycRjaIyVjqf+I5yrCFri6Yy9QuCI6OHgSSfrKn0Y7wwJ3064kbv
         VvCQ==
X-Gm-Message-State: AFqh2koLnzmb1tRAvDVTirZII3iCvW7Q+NWUcEtFfyAEP+UcuXr+w2Ca
	ACEQqOsnTIdlLj1I5vi+kYGuUm0M4DIlJuTO
X-Google-Smtp-Source: AMrXdXslKLwy/ZCij67buma4kdC4M4YgEpnRQ+RiyykM6XMUwCmMLZnvhiJ8DLqH2JjyAZtGEfMLrw==
X-Received: by 2002:a05:600c:3b2a:b0:3d9:7950:dc6d with SMTP id m42-20020a05600c3b2a00b003d97950dc6dmr9644668wms.40.1672307905834;
        Thu, 29 Dec 2022 01:58:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j30-20020a05600c1c1e00b003c71358a42dsm37644500wms.18.2022.12.29.01.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 01:58:25 -0800 (PST)
Date: Thu, 29 Dec 2022 12:58:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: yang.yang29@zte.com.cn
Cc: gustavoars@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, xu.panda@zte.com.cn
Subject: Re: [PATCH linux-next] staging: ks7010: use strscpy() to instead of
 strncpy()
Message-ID: <Y61kvh511t57acYC@kadam>
References: <202212261903245548969@zte.com.cn>
 <Y61hpuMcp3NKbqL5@kadam>
 <Y61j1JRx0ZMeVjji@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y61j1JRx0ZMeVjji@kadam>

On Thu, Dec 29, 2022 at 12:54:28PM +0300, Dan Carpenter wrote:
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

Heh.  My fingers are on autopilot.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

