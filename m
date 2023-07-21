Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA74D2E5
	for <linux-staging@lists.linux.dev>; Fri, 21 Jul 2023 06:01:13 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3144098df56so1332456f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 20 Jul 2023 23:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689919271; x=1690524071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6wPB1oqvrAfuXOneG/koIMJSYYKGh/zyRvxTmEarSg=;
        b=DCr++gWHC6M1cwUmnINttDgQuZ24bhZRNUevKMh3vglrWRTmThcHbIUvBFCYo8B5Tu
         zq75gKuJfjsWV7u4e3hxgfZ8nOje54X3L+kDUaqm3guQ65ssq9aywj6yNlZNQ7QJqs9w
         oNE0VhpyUmIwo34MI3/g2LJVCNi42bdT0U8Ku0edXOeaC+pjEd//MiEjiFE15/bc4SJG
         6Jf/U1UpFvmaIzLoMCqhbGXQtSnLT9sgg8/AESXF0et2iE+Svqp1XBHjs0YnX55aGqf5
         KArnos3pXvOxMVLbbFuIrGtFRwR23faYBxlQw83fO/8c6DwtnM0Wsh2KkeyF7oyQsp08
         8NYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689919271; x=1690524071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6wPB1oqvrAfuXOneG/koIMJSYYKGh/zyRvxTmEarSg=;
        b=Ko4zO7vZp4tP4kuNEwA3PkfRvRUkojZiA/3LJRqHPscHbuMbCINN4rYtLFyzCk9+vV
         zHOIV4/cf2WUAOCnyhvzaj3VdnL1sHoMrZgz7vh9+MshzLBi4CI7KF78oZ66zKL/UPlB
         d/8+bTUTMHGQ6aQMfAx5GafFy2PqEyxK6Mt9gFrTadPMs3BLM9X3Hf5qzfNuVQ+ryZVC
         ChN/FM3/8Jf2uZxISDBcQvy8s2GMJAwo+pNxU7HeBYOPJ7v38qh4a9U3WDaC8v1XD/uF
         2mMn2fPFzYm5aM4RjVRpo18MU3EU9PBWE3M46lOxFvixzzJF9BY7bLfYTwz900b1n86O
         YIgQ==
X-Gm-Message-State: ABy/qLYn91oEhcWPJsy3XpQXNG9aWX8+39847ZedW3SmpEh3sseuq59g
	pbV8JPXlC/nu3n7Y5Ved5jXBFg==
X-Google-Smtp-Source: APBJJlFqofJ/Db9+U8m0UpVwQZ8mS94VziVkNs8TI5/dr6nC0QbHrBQHPN0UMAsb15PuBYUNTX1Sjw==
X-Received: by 2002:adf:ef0f:0:b0:314:6252:d4a8 with SMTP id e15-20020adfef0f000000b003146252d4a8mr663757wro.43.1689919271320;
        Thu, 20 Jul 2023 23:01:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q4-20020a5d6584000000b002c70ce264bfsm3187978wru.76.2023.07.20.23.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 23:01:09 -0700 (PDT)
Date: Fri, 21 Jul 2023 09:01:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sergey Rozhnov <rozhnov.sergey.89@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Remove redundant braces in if
 statements
Message-ID: <5db3658a-2594-45db-b76a-4aa40950ebd5@kadam.mountain>
References: <ZLnoBYlsTiLixTah@terra>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLnoBYlsTiLixTah@terra>

On Fri, Jul 21, 2023 at 06:05:57AM +0400, Sergey Rozhnov wrote:
> Extract masked value to improve readability, apply fix suggested by checkpatch.
> ---

I like the new format, but you need to run checkpatch on your patches.

regards,
dan carpenter

