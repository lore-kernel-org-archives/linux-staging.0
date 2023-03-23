Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC4B8F6D
	for <linux-staging@lists.linux.dev>; Thu, 23 Mar 2023 13:34:18 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso1213173wmb.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Mar 2023 06:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679578457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uqF0ANcEeubBIPy3fcclIhfrDjvysj0GkmGUcwq4B7Q=;
        b=PQtIgwkOSXXI/LcqPzYcutQY0b0TLChaDvDfX3cvNmIBwod6mDaVMAyta1vGNqP53S
         H4FKPtQN9jLWxKa/BI0cKXK1q0/QirPNfEF9lnXcLlbzbC07YLLitg5YNby9DTmgKuHk
         5fa03hDP5Nj/KjzN8xlQd0wwm5lQ/GK7JHmBPduGA/qDOHtbQ/xYkRCVxmQUGT5AWoHG
         Jv2HjNwWDBsabjM023HuUhHx4kcJ2tluqQ5x2pjaAUjJRs0TTztwtbO7X+P37nU/MwR4
         O96Altx/eFeFZcNLZJ6pjjMFf81wekG/FkA+WeNsK7kyBOKVhyvgYbU+LOiWmHXmcyb9
         p2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679578457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqF0ANcEeubBIPy3fcclIhfrDjvysj0GkmGUcwq4B7Q=;
        b=Wqe8LWvZZhkZ6UH3AEvF7f63DVlX8Rn+mnpsJ1Y3JpjR4bC+xwZI5M5YJJCqr0WqCo
         dHOJbbRg2tGejgoMWZFCfCXmdYjvkD7tSbJpqroSJy3AiS03bY3xTK8+9NicrKRhBIjN
         e4FKL7ePSQJeE06jqo31lezC9+CGM+l4bZNnTMsEa3rrtBy7Ml7bZ1EtELKakVIiz0de
         ECzIvZa+kaV3D2tTowjniMvYC2NMo/FhAFIFyyP7gquAnyWz4tSVu0ruyRvILTt9CKac
         K2NTn0H6or4R6ZEB9JggjuOhVwzBypM7MWYE1wsjK+XlJPEU4wUsEKjrqxvh+ms1mopr
         a9og==
X-Gm-Message-State: AO0yUKWeW28beUArWAx3Qv72ivOeSZKV68xCBkCNAPaYRlE9A4/WHwjo
	QPE/MidAmi0kUFpcI/FngrI=
X-Google-Smtp-Source: AK7set8tWZ+c9CDrcNYZ6FFbHJdBnTyggT1lvYMQcU2SQ4u1U2OEi7JTfgURGFmj8DYaP370Crz0zA==
X-Received: by 2002:a05:600c:285:b0:3ee:5a48:5b54 with SMTP id 5-20020a05600c028500b003ee5a485b54mr2326861wmk.16.1679578457139;
        Thu, 23 Mar 2023 06:34:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j36-20020a05600c1c2400b003ebf73acf9asm6571831wms.3.2023.03.23.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 06:34:16 -0700 (PDT)
Date: Thu, 23 Mar 2023 16:34:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 RESEND] staging: vme_user: Replace "<<" with BIT macro
Message-ID: <9375f16c-5040-4355-8bd0-54c07763d6b3@kili.mountain>
References: <ZBxOdihP+mygNsuS@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBxOdihP+mygNsuS@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>

On Thu, Mar 23, 2023 at 06:34:54PM +0530, Abhirup Deb wrote:
> Replace the "<<" operator with BIT macro, in accordance to the
> checkpatch.pl script and Linux kernel coding-style guidelines.
> 
> Signed-off-by: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
> ---
> Changes in v2:
>     - Refactor the patch & Replace the erroneous BIT macro in --
>        "#define TSI148_PCFS_STAT_SELTIM        BIT(9)"
>       with --
>        "#define TSI148_PCFS_STAT_SELTIM        (3<<9)"
> 

Why did you resend this?

regards,
dan carpenter

