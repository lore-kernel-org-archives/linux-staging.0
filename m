Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1008072
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 09:47:15 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so11345045wmz.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Yd+6d9rV/jwVQTnJUI4OXG6oZzc52v/02f336NZqpBQ=;
        b=ESR8ImqDefVwdNZn36vjzxKy9cfDJwpjgvG7tncJRYpKBqxF98ptBevmJntsYy36mf
         83ES21LRyQIK39LEfbldGPUh4Ex0Qh80ZLDZOe+AH9qqjRzHZmqr9q5FQVnL3nqgHGPa
         UmynCX04VLmp0yDaev53yxrO6DjVykuNLlHSpuxiKzWVxjctCg99Uofy8xntaMPLoMy5
         61Cxt9w6QiNuWzyLMsGS47i/jmYBsAPgdxSDPzl4wIGGpE4qNvKmHbtVQhncJdz128R7
         KW93uvHy5XuedUQKgcEk+VqzivNh6QiNgtmn7e1eBTxSdQdLOrWlueOM4ugfnG2WCkjS
         H1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Yd+6d9rV/jwVQTnJUI4OXG6oZzc52v/02f336NZqpBQ=;
        b=pP6ZIytMrRuN1qd+Sn5AyQRcu9AqEXngTWFhY4zXh9RWFXbuVpK1epKETSJo2Cf8vj
         gh9leHXMP/J699Na+X/Che9r3Oabs8n9Rfr8OMbwWUlQfHvDBpwP5CQ5FhtSLT7NwWV0
         MjsS/1dlgmYmXHsUzGJ6szYkPCd8B5sT4N7nBhTW90ppN8UHNFWdgWGHcOHlwxlnMW0K
         Got8hbcYJxfPnIR9z7jOqVeix38uxmVBSu64b3kbWRIOxJgx3qdOVVBW0j+H9aU6yzT/
         idqz7gfmzs6+8c4idVcnCcXIPhHvUTF1jz9g4RrDG310WX910tGN9iOI907+wiawA8ol
         oLdg==
X-Gm-Message-State: AOAM530xXVbD0GG+AhQmNEMyAh44uiVJ/V6uOsKfSb60B1m0XyiJJ87U
	ubHLeW0JWSEhwX4hFzvAHsM=
X-Google-Smtp-Source: ABdhPJxfesZ16q2ywi0soXOKRKcF0O6lzpxtOdvfW1gHPGwVTNKed3cH5uVxIzx4pDEaVeZ+Vh5+Bg==
X-Received: by 2002:a05:600c:4303:: with SMTP id p3mr27583945wme.128.1635760033466;
        Mon, 01 Nov 2021 02:47:13 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62? ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id q1sm11696229wmj.20.2021.11.01.02.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 02:47:13 -0700 (PDT)
Message-ID: <edf5d0899f13414b2e5c1a6f1b6da08291e26e95.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH 2/7] staging: vt6655: Use
 incrementation in `idx`
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: Praveen Kumar <kpraveen.lkml@gmail.com>, 
	outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org, forest@alittletooquiet.net, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 01 Nov 2021 09:47:07 +0000
In-Reply-To: <edfd74c7-9b6d-f8f5-65c4-c1bae3015247@gmail.com>
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
	 <c569952d92ba51f32679c2fd87fd48ad8e49e3fc.1635415820.git.karolinadrobnik@gmail.com>
	 <3dfc45e5-12bc-72da-a260-5551a483fe6e@gmail.com>
	 <edfd74c7-9b6d-f8f5-65c4-c1bae3015247@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Praveen,

On Fri, 2021-10-29 at 21:11 +0530, Praveen Kumar wrote:
> However, as mentioned in previous patch, we can also make *i* as
> unsigned short and that should IMO remove the requirement of cast.

I agree, it should remove the cast but I think I'll leave `idx` as it
is.

> But again, this works as well. I'm fine with either. Thanks and sorry
> for the confusion.

No worries, thanks for looking at my changes. It's good to double check
everything :)


Thanks,
Karolina

