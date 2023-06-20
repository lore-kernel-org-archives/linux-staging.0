Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D81FA9
	for <linux-staging@lists.linux.dev>; Tue, 20 Jun 2023 05:36:52 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3112d202363so2654181f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 22:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687239410; x=1689831410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEJS5FDAzqAe3hnBpeiuUW3f6dfzzQgkQXzYDyGWP6k=;
        b=vKl4SAwdH844fLlarALw0CD55H61Q37HVekcCTMIdtWag1xnb57pDchz0T1QscLot2
         gRkZQbLHj7ZLiJ7TvF/SZxdGZ/R/5rZr0iAsgmi65cc98FVVxr4F0VLIGXvA2DWzXqWH
         hWKXfK+t1cFxnAGy8BHnxv8kMb8By2aUKV2i+nnT1hhjCHK/n5JV1FDm0iuB3i+8kl0d
         Eo+w5dwlUFbAazOql/zJk8xu1eE5ujI/JKBp/1/8mpuXE4//zcrFtoDLndGTnbEiRpiW
         al2fJNSDDRyEawJx71vYqSBxBnvw/bbl1j+sqnZT0GkPwjKSn0tEQtkaJWxKVfU4LnGH
         lq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687239410; x=1689831410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEJS5FDAzqAe3hnBpeiuUW3f6dfzzQgkQXzYDyGWP6k=;
        b=XhdEyII1SZCCmOeu2MzEk3xQQOkxP92M9kPNBlP0iFcsmBBNf/vC6ZrXSbGQQnw90k
         OLynu4HZ05aa4b+zvghdjGiSKJttu7De8spyonUNK9OIiz7/jpfqZjyNeiHYBVI3BA/u
         isS9x7PO9sgQvCVQ+IM33fkQKnAaSRc91lVWJQzZotU11JccpPhIehea++90weuNyO3t
         IR9Iuq/WS3LFo6rDWJUfuI3FdJxsCiQZUfBg/sC1F+hZl8+9v7gydefTTBs/4CNhbNqz
         si1kBc3qWQInUIEXlaN9xhOSC8+rismchmgLdI5VWj4I8MJd+vZqCSJLnSPAXxHWdaEb
         xj4Q==
X-Gm-Message-State: AC+VfDwwwRTZNZaboquv9ta0dCSxac2CipkheUvXq4cqV2qlkvKu/pjO
	+GNARuO2uwm9dYK62lG0AvUJ8Q==
X-Google-Smtp-Source: ACHHUZ6X5zSuSbEf0b7XgWiyaWPgrAOwv271mDvGsWifmc8ZvlnQX7WqwDN3BBHuX7ds5yT7bl17nw==
X-Received: by 2002:a5d:4a0e:0:b0:30a:e6d2:3ce3 with SMTP id m14-20020a5d4a0e000000b0030ae6d23ce3mr7096325wrq.16.1687239410522;
        Mon, 19 Jun 2023 22:36:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x6-20020adff0c6000000b00307972e46fasm1070682wro.107.2023.06.19.22.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 22:36:49 -0700 (PDT)
Date: Tue, 20 Jun 2023 08:36:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	t4rmin@zohomail.com, colin.i.king@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/staging/rtl8192e Fix camelcased function name
Message-ID: <e4986b37-0b22-43ff-a07c-4f15f8c71add@kadam.mountain>
References: <ZJDnetEcwdG1ffrK@tacos.darkphysics>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJDnetEcwdG1ffrK@tacos.darkphysics>

You can't send a patch as an attachment.  The subject isn't right.
Do `git log --oneline drivers/staging/rtl8192e/` to see what to use.

Read my blog about how to send a second version of a patch.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter


