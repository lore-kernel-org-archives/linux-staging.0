Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5CD2901
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 16:00:56 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d15so11765552pll.10
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0Jr063i0klx2Xf+DxdwryXVYkOKKR7C7qzwKjJOubUc=;
        b=E7d6q8c927zlO7H5uGVvMXlb6oR+8gPYxP13oNm5AtCnNR7dObkrKGLUnWNUxOL3Vn
         JuYCViRvKvBKyl8bZuD1leC9l3tNgrFUi3ABtosqra9Gv69U0FZBBQQ8eJXdCeEU68rW
         bqxrvdYcAzNwgavsFxoxSbJ4GqHo0hRfKgNjHkl3vg4lQ3MNdp6pU5prUqjbyRbg8vKg
         4iNmIwU4DQnZo3TlImxSJw2TwLGyNZcF8Msx7Rx0I440VtFt0VVfsfQduNqA3Q5OoCr/
         51LIXZ3bToGmTMgtDYWZWNm1fHmlYb5DMYoJM6JVBvb/B3PqUcHAQn+lgotQtSrLViY0
         D+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Jr063i0klx2Xf+DxdwryXVYkOKKR7C7qzwKjJOubUc=;
        b=LRTJszstO5/Cn7quV7OM+3uLXrTD43zj6OzJjHbSdhXLsZw8tCs/0gajnCyf6TQdje
         4GLmB3PIR8kEaTyVGpmpGOrkCyxwFofBLA0lhGrLzMRbkgzYMLRGhrHfToOAMsvXPrsG
         W2ncDzjkWAX8PpTK6PK5fvAJE5wjFpZ/9oeOiQnI6HuM4R7qfYTc5GmoxA1fjdZY645m
         32v4EwCa8pltjn9ouhQooxkVLZJYFVzo5xRS9m8a2cZ5UQWyZbtX2mmiHRuyhFzyj1nO
         dgNcudUzmcAbam7nHQEfw2jyuKfIEHaiNNgic5lLlQXcE0p96EPZnUGtS2KBn05z/QTc
         WRhA==
X-Gm-Message-State: AOAM532Q2H5FkrClUfRse/AOizDuGcc4Lwh0n/B1q30MY2GL9n21wLju
	3ZY1YIzlMtu42SRNJ3WwAj26N5Hl1vE=
X-Google-Smtp-Source: ABdhPJydWu7pspaNY7825xrOie1vXOxkb5n2Pcl0JNcNUUvFiubss+muggHCMHarv73tBZZ4x5F3mQ==
X-Received: by 2002:a17:902:f545:b0:15b:e7f6:710a with SMTP id h5-20020a170902f54500b0015be7f6710amr4026889plf.71.1650643255757;
        Fri, 22 Apr 2022 09:00:55 -0700 (PDT)
Received: from ArchDesktop ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id b2-20020a056a000a8200b004f1111c66afsm3365172pfl.148.2022.04.22.09.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 09:00:55 -0700 (PDT)
Date: Sat, 23 Apr 2022 00:00:52 +0800
From: Solomon Tan <wjsota@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Remove space after cast
Message-ID: <YmLRNNOKYpBQBDf+@ArchDesktop>
References: <20220419124318.8028-1-wjsota@gmail.com>
 <20220422150912.GJ2462@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422150912.GJ2462@kadam>

On Fri, Apr 22, 2022 at 06:09:12PM +0300, Dan Carpenter wrote:
> 
> The & should go on the other line actually.
> This cast is unnecessary.  Just delete it.  In a separate patch.
> Same thing delete.
> Same thing.
> Delete this cast.
> 
Hi dan. Thanks. I will work on these and see if there are similar lines
that need amending as well. I will submit a new patch for the cast and
another one for the &.

Thanks you
Cheers,
Solomon
