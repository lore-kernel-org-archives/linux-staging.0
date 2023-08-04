Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA50CBA3A
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 12:01:29 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31759e6a4a1so1638330f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691150488; x=1691755288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CrrKUb5R1khXxLb9w+qBkaZIlY39FTIXag0yGDMb0Wk=;
        b=Pg7WigGOuh9ISdbbaSi/scURASDzGTaGW1zriZEN+jDMHpfwmPgQS61UOOSU+5QQY1
         zfTnERQ5v1qSMwkvtJUnb2R3NtaSHLmJGIvhtRZ5/qca0+kSUB0tZF9SSFNdYdtpQJpO
         9mNDc/ysZvqcvVamiuehtbqTB8op4XP/L21e/BcmCtuTeS5ERviFeKQwQSRdKIhFYDqT
         NCAys6ApigUs66OmHDy8pqEOuDzD8DnxOlKx8m9ox4KaXF3bMj/gwnPTptO3BM9YMjzK
         klCN2AQbzBurGrZBmOuT27cDV2XpXwPOT2RjWt7gZXiOUk7FZ9VzHglwnaj1E/z8CJ9G
         Db2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691150488; x=1691755288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrrKUb5R1khXxLb9w+qBkaZIlY39FTIXag0yGDMb0Wk=;
        b=ct4omMlnfWv+6VsCyXSfBfm94WBCURZwJBOz8dXDDWYhDhx2ONjGcTd602eMw4fKo6
         iMTT+jSE89bny+crTl/DWhEF/SUMmld5TXQHjbvDwTFp4zzrxr+cgFvt4kHuOoVSx9pG
         drpdImILvX72m9/yMvGaauW9b7X0WcrUiu/HTIVBtKBGLQWGDvyvfiyKvaGllgkpwhWa
         PTHVIas29YgR9kEM0UscphFap1nWjB1FYahclctakXtslo0aTyE3eeBaRcTnHUXQB03p
         vhTqhFh2v2UrsrVOulkq188DIF+LA3LmjfGJBzv/TUblBeTiSay1e9RDhWJMk4I9D70f
         tnFg==
X-Gm-Message-State: AOJu0Yy1xVYHJOoo+6ai1CxTwGNBuGCqKHNyhxYmgFq7yPiyVNhABXE+
	V9jcmN5a6I43sGLzafVnOKz92g==
X-Google-Smtp-Source: AGHT+IEkLQBk32FHJkNpDRz7LLcG2dqZIbgShhe747V7D9nwd7GrK+hNxIELUnnyo6fG8ftgHo6z2w==
X-Received: by 2002:a05:6000:1b07:b0:317:65b5:f584 with SMTP id f7-20020a0560001b0700b0031765b5f584mr1010678wrz.39.1691150486193;
        Fri, 04 Aug 2023 05:01:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0031753073abcsm2339092wru.36.2023.08.04.05.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 05:01:25 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:01:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavan Bobba <opensource206@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linuxkernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: replace camel case by snake case
Message-ID: <e547d641-9c5e-413a-8f57-4a19bcc56dea@kadam.mountain>
References: <ZMpZixfZ4WQgpzF1@ubuntu.myguest.virtualbox.org>
 <f967a1d0-639c-4cab-8fa0-e04ccde4ed5f@kadam.mountain>
 <ZMzmrADhbNCZFm5f@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMzmrADhbNCZFm5f@ubuntu.myguest.virtualbox.org>

Obviously this is the wrong patch in the wrong format.  But it looks
like you tried to resend it as part of the same thread.  There is no
need to do that.  Just resend it as a new thread.

regards,
dan carpenter


